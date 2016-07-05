package com.orakgarak.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.orakgarak.admin.PentagonAdmin;
import com.orakgarak.vo.Pentagon;
@Repository("pentagonDao")
public class PentagonDAOImpl implements PentagonDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public Pentagon selectPentagon(String stockCode) {
	

		return sqlSessionTemplate.selectOne("Pentagon.selectPentagon", stockCode);
	}

	@Override
	public boolean insertPentagon(Pentagon pentagon) {
		return sqlSessionTemplate.insert("Pentagon.insertPentagon",pentagon)>0;
	}

	@Override
	public boolean updateDcfScore(String stockCode, int scoreDcf) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("stockCode", stockCode);
		map.put("scoreDcf", scoreDcf);

		
		return sqlSessionTemplate.update("Pentagon.updateDcfScore", map)>0;
	}

	@Override
	public boolean updateMultipleScore(HashMap<String, Integer> map) {
		return sqlSessionTemplate.update("Pentagon.updateMultipleScore", map)>0;
	}

	@Override
	public boolean updateTrendScore(HashMap<String, Integer> map) {
		return sqlSessionTemplate.update("Pentagon.updateTrendScore", map)>0;
	}

	@Override
	public boolean updateVarScore(HashMap<String, Integer> map) {
		return sqlSessionTemplate.update("Pentagon.updateVarScore", map)>0;
	}

	@Override
	public boolean updateBigdataScore(HashMap<String, Integer> map) {
		return sqlSessionTemplate.update("Pentagon.updateBigdataScore", map)>0;
	}

	@Override
	public boolean updateSumScore(HashMap<String, Integer> map) {
		return sqlSessionTemplate.update("Pentagon.updateSumScore", map)>0;
	}

	@Override
	public Pentagon selectAllByCode(String stockCode) {
		try{
		
			
			return sqlSessionTemplate.selectOne("Pentagon.selectScoreByCode", stockCode);
			}catch(Exception e){
				return null;
			}
		}
	


	@Override
	public boolean updatePentagon(Pentagon pentagon) {
		return sqlSessionTemplate.update("Pentagon.updatePentagon", pentagon)>0;
	}

	@Override
	public boolean insertPentagonAdmin(PentagonAdmin pentagonAdmin) {
			return sqlSessionTemplate.insert("PentagonAdmin.insertPentagonAdmin", pentagonAdmin)>0;
	}

	@Override
	public List<Pentagon> selectAll() {
		return sqlSessionTemplate.selectList("Pentagon.selectAllPentagon");
	}

	@Override
	public boolean updatePentagonWithoutDCF(Pentagon pentagon) {
		return sqlSessionTemplate.update("Pentagon.updatePentagonWithoutDCF", pentagon) >0;
	}

	@Override
	public List<Pentagon> selectAllPentagonOrderByDcf() {
		return sqlSessionTemplate.selectList("Pentagon.selectAllPentagonOrderByDcf");
	}

	@Override
	public List<Pentagon> selectAllPentagonOrderByMultiple() {
		return sqlSessionTemplate.selectList("Pentagon.selectAllPentagonOrderByMultiple");
	}

	@Override
	public List<Pentagon> selectAllPentagonOrderByRisk() {
		return sqlSessionTemplate.selectList("Pentagon.selectAllPentagonOrderByRisk");
	}

	@Override
	public List<Pentagon> selectAllPentagonOrderByBigData() {
		return sqlSessionTemplate.selectList("Pentagon.selectAllPentagonOrderByBigData");
	}

	@Override
	public List<Pentagon> selectAllPentagonOrderByTrend() {
		return sqlSessionTemplate.selectList("Pentagon.selectAllPentagonOrderByTrend");
	}

	@Override
	public List<Pentagon> selectCustomized(int limitDcf, int limitMultiple,
			int limitRisk, int limitBigdata, int limitTrend) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("limitDcf", limitDcf);
		map.put("limitMultiple", limitMultiple);
		map.put("limitRisk", limitRisk);
		map.put("limitBigdata", limitBigdata);
		map.put("limitTrend", limitTrend);
		
		return sqlSessionTemplate.selectList("Pentagon.selectCustomized",map);
	}

	@Override
	public List<Pentagon> selectCustomizedRange(int leastDcf, int mostDcf,
			int leastMultiple, int mostMultiple, int leastRisk, int mostRisk,
			int leastBigdata, int mostBigdata, int leastTrend, int mostTrend) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("leastDcf", leastDcf);
		map.put("mostDcf", mostDcf);
		map.put("leastMultiple", leastMultiple);
		map.put("mostMultiple", mostMultiple);
		map.put("leastRisk", leastRisk);
		map.put("mostRisk", mostRisk);
		map.put("leastBigdata", leastBigdata);
		map.put("mostBigdata", mostBigdata);
		map.put("leastTrend", leastTrend);
		map.put("mostTrend", mostTrend);
		
		return sqlSessionTemplate.selectList("Pentagon.selectCustomizedRange",map);
		
		
	}

	@Override
	public List<Pentagon> selectPreferTestResult(int leastDcf, int mostDcf,
			int leastMultiple, int mostMultiple, int leastRisk, int mostRisk,
			int leastBigdata, int mostBigdata, int leastTrend, int mostTrend) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("leastDcf", leastDcf);
		map.put("mostDcf", mostDcf);
		map.put("leastMultiple", leastMultiple);
		map.put("mostMultiple", mostMultiple);
		map.put("leastRisk", leastRisk);
		map.put("mostRisk", mostRisk);
		map.put("leastBigdata", leastBigdata);
		map.put("mostBigdata", mostBigdata);
		map.put("leastTrend", leastTrend);
		map.put("mostTrend", mostTrend);
		
		return sqlSessionTemplate.selectList("Pentagon.selectPreferTestResult",map);
		
		
	}

	
}
