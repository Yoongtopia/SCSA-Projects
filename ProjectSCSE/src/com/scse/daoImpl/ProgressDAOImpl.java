package com.scse.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scse.dao.ProgressDAO;
import com.scse.entity.Mission;
import com.scse.entity.Mission5Progress;
import com.scse.entity.Progress;

@Repository("progressDao")
public class ProgressDAOImpl implements ProgressDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertMissionProgress(Progress progress) throws Exception {
		return sqlSessionTemplate.insert("Progress.insertProgress", progress)>0;
	}
	
	@Override
	public Mission selectMission(int chapNum, int quizNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("chapNum", chapNum);
		map.put("quizNum", quizNum);
			
		return sqlSessionTemplate.selectOne("Progress.selectMissionByChapNumAndQuizNum", map);
	}
	
	@Override
	public Mission selectMissionByUserId(String userId) throws Exception {
		
		return sqlSessionTemplate.selectOne("Progress.selectMissionByUserId", userId);
		
	}
	
	@Override
	public Mission selectMissionByMissionIndex(int missionIndex)
			throws Exception {
		
		return sqlSessionTemplate.selectOne("Progress.selectMissionByMissionIndex", missionIndex);
	}

	@Override
	public List<Mission> listMission() throws Exception {
		return sqlSessionTemplate.selectList("Progress.selectAllMission");
	}

	@Override
	public boolean updateMissionResult(Progress progress)
			throws Exception {
		return sqlSessionTemplate.update("Progress.updateTryNumAndTime", progress)>0;
	}

	@Override
	public Progress selectProgress(String userId,
			int chapNum, int quizNum) throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chapNum", chapNum);
		map.put("quizNum", quizNum);		
		return sqlSessionTemplate.selectOne("Progress.selectProgressByUserIdAndChapNumAndQuizNum", map);
	}

	@Override
	public int selectTotalTime(String userId) throws Exception {
		return sqlSessionTemplate.selectOne("Progress.selectTotalTime", userId);
	}

	@Override
	public List<Progress> selectPerformanceTable(String userId, int chapNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chapNum", chapNum);
		return sqlSessionTemplate.selectList("Progress.selectPerformanceTable", map);
	}

	@Override
	public int selectTryNum(String userId, int chapNum, int quizNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chapNum", chapNum);
		map.put("quizNum", quizNum);		
		System.out.println(map);
		return sqlSessionTemplate.selectOne("Progress.selectPersonalTryNum", map);
	}

	@Override
	public int selectSchoolTryNum(String schoolNum, int chapNum, int quizNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("schoolNum", schoolNum);
		map.put("chapNum", chapNum);
		map.put("quizNum", quizNum);		
		return sqlSessionTemplate.selectOne("Progress.selectSchoolTryNum", map);
	}

	@Override
	public int selectClassTryNum(int groupNum, int chapNum, int quizNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("groupNum", groupNum);
		map.put("chapNum", chapNum);
		map.put("quizNum", quizNum);		
		return sqlSessionTemplate.selectOne("Progress.selectClassTryNum", map);
	}

	@Override
	public List<Progress> selectNeedToStudy(String userId, int chapNum) throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chapNum", chapNum);
		
		return sqlSessionTemplate.selectList("Progress.selectNeedToStudy", map);
	}

	@Override
	public Mission selectMaxMissionIndexOfStudent(String userId) throws Exception {

		return sqlSessionTemplate.selectOne("Progress.selectMaxMissionIndexOfStudent", userId);
	}

	@Override
	public int selectQuestTryNum(String userId, int missionIndex) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("missionIndex", missionIndex);
		return sqlSessionTemplate.selectOne("Progress.selectTryNum", map);
	}

	@Override
	public int selectTodayClearCount(String userId) {
		return sqlSessionTemplate.selectOne("Progress.selectTodayClear", userId);
	}

	@Override
	public int selectQuestFailNum(String userId, int missionIndex) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("missionIndex", missionIndex);
		if(sqlSessionTemplate.selectOne("Progress.selectFailNum", map)==null){
			return 0;
		}
		return sqlSessionTemplate.selectOne("Progress.selectFailNum", map);
	}

	@Override
	public int selectTotalQuestTryNum(String userId) {
		return sqlSessionTemplate.selectOne("Progress.selectTotalTryNum", userId);
	}

	@Override
	public Mission5Progress selectMission5(String userId, int missionIndex) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("missionIndex", missionIndex);
		return sqlSessionTemplate.selectOne("Progress.selectMission5", map);
	}

	@Override
	public boolean insertMission5Progress(Mission5Progress mission) {
		return sqlSessionTemplate.insert("Progress.insertMission5Progress", mission) > 0;
	}

	@Override
	public Mission5Progress selectMission50() {
		return sqlSessionTemplate.selectOne("Progress.selectMission50");
	}

	@Override
	public boolean updateMission5Progress(Mission5Progress mission) {
		return sqlSessionTemplate.update("Progress.updateMission5", mission) > 0;
	}




}