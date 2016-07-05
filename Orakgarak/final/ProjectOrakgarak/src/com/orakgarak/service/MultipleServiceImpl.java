package com.orakgarak.service;

import java.util.HashMap;
import java.util.List;










import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.MultipleDAO;
import com.orakgarak.util.ParseUtil;
import com.orakgarak.vo.Industry;
import com.orakgarak.vo.Multiple;

@Service
public class MultipleServiceImpl implements MultipleService {

	private MultipleDAO multipleDao;
	@Autowired	
	public void setMultipleDao(MultipleDAO multipleDao) {
		this.multipleDao = multipleDao;
	}

	@Override
	public Multiple findMultiple(String stockCode) {
		Multiple multiple=multipleDao.selectMultiple(stockCode);
		String industryCode=multiple.getIndustryCode();
		String stockName=multiple.getStockName();
		String industryName=multiple.getIndustryName();
		
		float industryMultiple=multipleDao.selectIndustryMultiple(Integer.parseInt(industryCode));
		long debt=multiple.getDebt();
		long cash=multiple.getCash();
		long netDebt=multiple.getNetDebt();
		long marketValue=ParseUtil.getCurrentMarketValue(stockCode);
		long ev=netDebt+marketValue;
		long ebitda=multiple.getEbitda();
		float multipleResult=ev/ebitda;
		
		
		int score = 0;
		if(multipleResult>=1){
		float num=(multipleResult/industryMultiple);
		if(num>=2){
			score=3;
		}else if(num>=1){
			score=Math.round((50*(1-(num-1))));
		}else if(1>num||num>0){
			score=Math.round((50*(1+(1-num))));
		}else if(num<0){
			num=-num;
			
		}
		
		//score에 대한 조정을 합니다.
		if(score>=500){
			score = 100;
		}else if(score>=200){
			score = 99;
		}else if(score>=180){
			score = 98;
		}else if(score>=160){
			score = 97;
		}else if(score>=100){
			score = 96;
		}else if(score>=96){
			score = 95;
		}else if(score<=21){
			score = 21;
		}
		
		}else{
			if(multipleResult<=-210){
				score = 20;
			}else if(multipleResult<=-190){
				score = 19;
			}else if(multipleResult<=-170){
				score = 18;
			}else if(multipleResult<=-150){
				score = 17;
			}else if(multipleResult<=-130){
				score = 16;
			}else if(multipleResult<=-110){
				score = 15;
			}else if(multipleResult<=-90){
				score = 14;
			}else if(multipleResult<=-70){
				score = 13;
			}else if(multipleResult<=-60){
				score = 12;
			}else if(multipleResult<=-50){
				score = 11;
			}else if(multipleResult<=-40){
				score = 10;
			}else if(multipleResult<=-30){
				score = 9;
			}else if(multipleResult<=-20){
				score = 8;
			}else if(multipleResult<=-10){
				score = 7;
			}else if(multipleResult<=-5){
				score = 6;
			}else if(multipleResult<=-4){
				score = 5;
			}else if(multipleResult<=-3){
				score = 4;
			}else if(multipleResult<=-2){
				score = 3;
			}else if(multipleResult<=-1){
				score = 2;
			}
		}//end if(else
		
		
		
		
		Multiple newMultiple=new Multiple(stockCode,industryCode,stockName,industryName,debt,cash,netDebt,marketValue,ev,ebitda,multipleResult,score);
		
		multipleDao.updateMultiple(newMultiple);
		return newMultiple;
	}

	@Override
	public List<Multiple> multipleList(String industryCode) {
		return multipleDao.multipleList(industryCode);
	}

	@Override
	public String findIndustryCodebyStockCode(String stockCode) {
		
		return multipleDao.selectIndustryCodebyStockCode(stockCode);
	}

	@Override
	public List<HashMap<String, String>> selectCategory(String kindustryCode) {
		return multipleDao.selectCategory(kindustryCode);
	}

	@Override
	public List<Multiple> selectMultipleCodeOrName(String searchStock) {
		return multipleDao.selectMultipleCodeOrName(searchStock);
	}


	@Override
	public List<Multiple> selectMultipleList() {
		return multipleDao.selectMultipleList();
	}

	@Override
	public Industry selectIndustry(String industryCode) {
		return multipleDao.selectIndustry(industryCode);
	}

	@Override
	public String findStockName(String code) {
		return multipleDao.selectStockName(code);
	}
	
	

}
