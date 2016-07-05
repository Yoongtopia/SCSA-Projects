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

	//�̳��� ������ �̿����� �ʰ� �ڵ����� �� ������. ������
	@Override
	public DCFCalculate getFullCalculatedDCF(String code) {
		
		//dcf�⺻������ �� �ҷ���.
		
		List<DCF> dcfList = DCFDao.selectDCFByCode(code);
		List<DCFCalculateData> dcfCalculateDataList = new ArrayList<DCFCalculateData>();
		DCFCalculate dc = new DCFCalculate();
		DCF dcf = dcfList.get(4);
		
		dc.setCode(code); //code����
		dc.setName(dcf.getName());
		
		
		
		//DCFCalculate�� ��ü�� �ٽ� �־��ݴϴ�. ����� ������ ����..�׸��� ������� �����ֱ� ���� ���� �����մϴ�.
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
			dcd.setEbit(dcd.getRevenue()-dcd.getCogs()-dcd.getSga()); //����� �ʿ��� �κ�
			dcd.setTax(dcfList.get(i).getTax());
			dcd.setNoplat(dcd.getEbit()-dcd.getTax()); //����� �ʿ��� �κ�
			dcd.setCapex(dcfList.get(i).getCapex());
			dcd.setFcf(dcd.getNoplat()-dcd.getCapex()); //capex��ü�� -�̱⶧���� �ٽ� -�� ���ָ� �ܷ�������
			
			dcfCalculateDataList.add(dcd);
			
			//���⼭ ���ʹ� ��ռ������ �����ַ�����
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
		dc.setRm(9); //1984~2014����� ���ͷ�
		dc.setRp(dc.getRm()-dc.getRf());
		
		dc.setDebt(dcf.getDebt());
		dc.setEquity(dcf.getEquity());
		dc.setAsset(dcf.getAsset());
		
		dc.setGrowth(DCFDao.selectGrowth(dc.getIndName()));
		dc.setBeta(dcf.getBeta());
		dc.setCapm(dc.getRf() + dc.getBeta()*(dc.getRm() - dc.getRf()));
		dc.setRfAfterTax(dc.getRf() * (1-0.22));
		dc.setWacc(dc.getCapm()*(dc.getEquity()/dc.getAsset())+dc.getRfAfterTax()*(dc.getDebt()/dc.getAsset()));
		
		//���⼭���ʹ� �̷� �����帧�� �����.
		
		for(int i = 5 ; i <= 8 ; i++) { //5�⵵ 6�⵵ 7�⵵ 8�⵵�� ���� ������ ��
		
			DCFCalculateData dcd = new DCFCalculateData();
			
			dcd.setYear((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getYear()) + 1);
			dcd.setRevenue((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getRevenue()) * dc.getAvgRevenueGrowth());
			dcd.setCogs((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getCogs()) * dc.getAvgCogsGrowth());
			dcd.setSga((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getSga()) * dc.getAvgSgaGrowth());
			dcd.setEbit(dcd.getRevenue()-dcd.getCogs()-dcd.getSga()); //����� �ʿ��� �κ�
			dcd.setTax((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getTax()) * dc.getAvgTaxGrowth());
			dcd.setNoplat(dcd.getEbit()-dcd.getTax()); //����� �ʿ��� �κ�
			dcd.setCapex((dcfCalculateDataList.get(dcfCalculateDataList.size()-1).getCapex()) * dc.getAvgCapexGrowth());
			dcd.setFcf(dcd.getNoplat()-dcd.getCapex()); //capex��ü�� -�̱⶧���� �ٽ� -�� ���ָ� �ܷ�������
			
			dcfCalculateDataList.add(dcd);
			
		}
		
		double discountFactor = 1/Math.sqrt((1+(dc.getWacc()/100))); //�������� ���� �������. sqrt�� middle���� ������� ��...��¿������
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
		
		long tempPrice = dc.getEquityValue()/dc.getOutstanding(); //-���� ���ü��� �ִ�!! �����������
		
		//���⼭ ������ ������.. ���������� �ʿ���
		/////////////////////////////////////
		////////////////////////////////
		//////////////////////////////////
		
		
		dc.setPrice(tempPrice);
		System.out.println(dc);
		return dc;
		
	}//end getFullC..()

	
	
}
