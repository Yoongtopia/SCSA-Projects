package com.orakgarak.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.DCFDAO;
import com.orakgarak.util.ParseUtil;
import com.orakgarak.vo.DCF;
import com.orakgarak.vo.DCFCalculate;
import com.orakgarak.vo.DCFCalculateData;

@Service("DCFService")
public class DCFServiceImpl implements DCFService {


	private DCFDAO DCFDao;
	
	@Autowired
	public void setDCFDao(DCFDAO dCFDao) {
		DCFDao = dCFDao;
	}

	@Override
	public List<DCF> findDCFList() {
		return DCFDao.selectDCFList();
	}

	/*@Override
	public DCF findDCFByCode(String code) {
		return DCFDao.selectDCFByCode(code);
	}*/
	
	

	@Override
	public DCF findRfByDate(int date) {
		return DCFDao.selectRfByDate(date);
	}

	@Override
	public List<DCF> findDCFByCode(String code) {
		return DCFDao.selectDCFByCode(code);
	}

	@Override
	public long getPriceByCode(String code) {
		return ParseUtil.getCurrentPrice(code);
		
	}

	@Override
	public boolean updateScore(String code, int year, double score) {
		
		return DCFDao.updateScore(code, year, score);
	}

	@Override
	public Double findGrowth(String indName) {
		return DCFDao.selectGrowth(indName);
	}

	@Override
	public Double findCostOfDebt(String code, int year) {
	
		return DCFDao.selectCostOfDebt(code, year);
	}


	@Override
	public DCF findScoreByCode(String code) {
		return DCFDao.selectScoreByCode(code);
	}

	//이놈은 엑셀을 이용하지 않고 자동으로 막 구해줌. 꺌꺌꺌
	@Override
	public DCFCalculate getFullCalculatedDCF(String code) {
		
		//dcf기본정보를 막 불러옴.
		
		List<DCF> dcfList = DCFDao.selectDCFByCode(code);
		List<DCFCalculateData> dcfCalculateDataList = new ArrayList<DCFCalculateData>();
		DCFCalculate dc = new DCFCalculate();
		DCF dcf = dcfList.get(4);
		
		dc.setCode(code); //code세팅
		dc.setName(dcf.getName());
		
		
		
		//DCFCalculate란 객체에 다시 넣어줍니다. 계산의 편리성을 위해..그리고 성장률을 구해주기 위한 값을 지정합니다.
		double growthRevenue = 0;
		double growthCogs = 0;
		double growthSga = 0;
		double growthTax = 0;
		double growthCapex = 0;
		
		for(int i = 0 ; i < dcfList.size() ; i++) {
			
			DCFCalculateData dcd = new DCFCalculateData();
			
			dcd.setYear(dcfList.get(i).getYear());
			dcd.setRevenue(dcfList.get(i).getRevenue());
			dcd.setCogs(dcfList.get(i).getCogs());
			dcd.setSga(dcfList.get(i).getSga());
			dcd.setEbit(dcd.getRevenue()-dcd.getCogs()-dcd.getSga()); //계산이 필요한 부분
			dcd.setTax(dcfList.get(i).getTax());
			dcd.setNoplat(dcd.getEbit()-dcd.getTax()); //계산이 필요한 부분
			dcd.setCapex(dcfList.get(i).getCapex());
			dcd.setFcf(dcd.getNoplat()-dcd.getCapex()); //capex자체가 -이기때문에 다시 -를 해주면 쁠러스가됨
			
			dcfCalculateDataList.add(dcd);
			
			//여기서 부터는 평균성장률을 구해주려고함
			if(i>=1){
				
				growthRevenue += dcfList.get(i).getRevenue()/dcfList.get(i-1).getRevenue() - 1;
				growthCogs += dcfList.get(i).getCogs()/dcfList.get(i-1).getCogs() - 1;
				growthSga += dcfList.get(i).getSga()/dcfList.get(i-1).getSga() - 1;
				growthTax += dcfList.get(i).getTax()/dcfList.get(i-1).getTax() - 1;
				growthCapex += dcfList.get(i).getCapex()/dcfList.get(i-1).getCapex() - 1;
				
			}//end if
			
			if(i==4){
				
				dc.setAvgRevenueGrowth((growthRevenue)/4);
				dc.setAvgCogsGrowth((growthCogs)/4);
				dc.setAvgSgaGrowth((growthSga)/4);
				dc.setAvgTaxGrowth((growthTax)/4);
				dc.setAvgCapexGrowth((growthCapex)/4);
				
			}
			
		}//end exFor
		
		dc.setList(dcfCalculateDataList);
		dc.setIndCode(dcf.getIndCode());
		dc.setIndName(dcf.getIndName());
		dc.setDate(dcf.getDate());
		
		dc.setRf(DCFDao.selectRfByDate(201405).getRf());
		dc.setRm(9); //1984~2014연평균 수익률
		dc.setRp(dc.getRm()-dc.getRf());
		
		dc.setDebt(dcf.getDebt());
		dc.setEquity(dcf.getEquity());
		dc.setAsset(dcf.getAsset());
		
		dc.setGrowth(DCFDao.selectGrowth(dc.getIndName()));
		dc.setBeta(dcf.getBeta());
		dc.setCapm(dc.getRf() + dc.getBeta()*(dc.getRm() - dc.getRf()));
		dc.setRfAfterTax(dc.getRf() * (1-0.22));
		dc.setWacc(dc.getCapm()*(dc.getEquity()/dc.getAsset())+dc.getRfAfterTax()*(dc.getDebt()/dc.getAsset()));
		
		//여기서부터는 미래 현금흐름을 계산함.
		
		for(int i = 5 ; i <= 8 ; i++) { //5년도 6년도 7년도 8년도에 대한 예측을 함
		
			DCFCalculateData dcd = new DCFCalculateData();
			
			dcd.setYear((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getYear()) + 1);
			dcd.setRevenue((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getRevenue()) * dc.getAvgRevenueGrowth());
			dcd.setCogs((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getCogs()) * dc.getAvgCogsGrowth());
			dcd.setSga((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getSga()) * dc.getAvgSgaGrowth());
			dcd.setEbit(dcd.getRevenue()-dcd.getCogs()-dcd.getSga()); //계산이 필요한 부분
			dcd.setTax((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getTax()) * dc.getAvgTaxGrowth());
			dcd.setNoplat(dcd.getEbit()-dcd.getTax()); //계산이 필요한 부분
			dcd.setCapex((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getCapex()) * dc.getAvgCapexGrowth());
			dcd.setFcf(dcd.getNoplat()-dcd.getCapex()); //capex자체가 -이기때문에 다시 -를 해주면 쁠러스가됨
			
			dcfCalculateDataList.add(dcd);
			
		}
		
		double discountFactor = 1/Math.sqrt((1+(dc.getWacc()/100))); //할인율에 대한 계산을함. sqrt는 middle값을 잡기위해 함...어쩔수없음
		dc.setExpectedFlow1((long) (dcfCalculateDataList.get(5).getFcf()*discountFactor));
		
		discountFactor = discountFactor/(1+(dc.getWacc()/100));
		dc.setExpectedFlow2((long) (dcfCalculateDataList.get(6).getFcf()*discountFactor));
		
		discountFactor = discountFactor/(1+(dc.getWacc()/100));
		dc.setExpectedFlow3((long) (dcfCalculateDataList.get(7).getFcf()*discountFactor));
		
		discountFactor = discountFactor/(1+(dc.getWacc()/100));
		dc.setExpectedFlow4((long) (dcfCalculateDataList.get(8).getFcf()*discountFactor));
		
		dc.setExpectedFlow5((long) (dcfCalculateDataList.get(8).getFcf()/(dc.getWacc()/100-dc.getGrowth()/100)));
		
		dc.setOperatingValue(dc.getExpectedFlow1()+dc.getExpectedFlow2()+dc.getExpectedFlow3()+dc.getExpectedFlow4()+dc.getExpectedFlow5());
		dc.setEquityValue((long) (dc.getOperatingValue()-dc.getDebt()));
		dc.setOutstanding((long)dcf.getOutstanding());
		
		long tempPrice = dc.getEquityValue()/dc.getOutstanding(); //-값이 나올수도 있다!! 조정해줘야함
		
		//여기서 로직이 들어가야함.. 점수조정이 필요함
		/////////////////////////////////////
		////////////////////////////////
		//////////////////////////////////
		
		
		dc.setPrice(tempPrice);
		System.out.println(dc);
		return dc;
		
	}//end getFullC..()

	
	
}
