package com.scse.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scse.dao.ProgressDAO;
import com.scse.entity.Mission;
import com.scse.entity.Mission5Progress;
import com.scse.entity.Progress;
import com.scse.service.ProgressService;

@Component("progress")
public class ProgressServiceImpl implements ProgressService {

	ProgressDAO progressDao;

	@Autowired
	public void setProgressDao(ProgressDAO progressDao) {
		this.progressDao = progressDao;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public boolean addProgress(Progress progress) throws Exception {
		return progressDao.insertMissionProgress(progress);
	}

	@Override
	public Mission viewMissionByMissionIndex(int missionIndex) throws Exception {

		return progressDao.selectMissionByMissionIndex(missionIndex);
	}

	@Override
	public Mission viewMissionByChapNumAndQuizNum(int chapNum, int quizNum)
			throws Exception {
		return progressDao.selectMission(chapNum, quizNum);
	}

	@Override
	public List<Mission> viewAllMission() throws Exception {
		return progressDao.listMission();
	}

	@Override
	public Mission viewMaxMissionIndexOfStudent(String userId) throws Exception {
		return progressDao.selectMaxMissionIndexOfStudent(userId);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyTryNumAndTime(Progress progress) throws Exception {
		return progressDao.updateMissionResult(progress);
	}

	@Override
	public Progress viewProgressByUserIdAndChapNumAndQuizNum(String userId,
			int chapNum, int quizNum) throws Exception {
		return progressDao.selectProgress(userId, chapNum, quizNum);
	}

	@Override
	public int viewTotalTime(String userId) throws Exception {
		return progressDao.selectTotalTime(userId);
	}

	@Override
	public List<Progress> viewPerformanceTable(String userId, int chapNum) throws Exception {
		return progressDao.selectPerformanceTable(userId, chapNum);
	}

	@Override
	public int viewTryNum(String userId, int chapNum, int quizNum)
			throws Exception {
		return progressDao.selectTryNum(userId, chapNum, quizNum);
	}

	@Override
	public int viewSchoolTryNum(String schoolNum, int chapNum, int quizNum)
			throws Exception {
		return progressDao.selectSchoolTryNum(schoolNum, chapNum, quizNum);
	}

	@Override
	public int viewClassTryNum(int groupNum, int chapNum, int quizNum)
			throws Exception {
		return progressDao.selectClassTryNum(groupNum, chapNum, quizNum);
	}

	@Override
	public List<Progress> viewNeedToStudy(String userId, int chapNum) throws Exception {
		return progressDao.selectNeedToStudy(userId, chapNum);
	}

	@Override
	public HashMap<String, Integer> viewFailQuestCheck(String userId,
			int missionIndex) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("failNum", progressDao.selectQuestFailNum(userId, missionIndex));
		map.put("totalNum", progressDao.selectTotalQuestTryNum(userId));
	
		return map;
	}

	@Override
	public HashMap<String, Integer> viewSuccessQuestCheck(String userId) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("todayNum", progressDao.selectTodayClearCount(userId));
		map.put("totalNum", progressDao.selectTotalQuestTryNum(userId));
		return map;
	}

	@Override
	public int vewSuccessConanQuestCheck(String userId, int missionIndex) {
		return progressDao.selectQuestTryNum(userId, missionIndex);
	}

	@Override
	public HashMap<String, Object> allTry(String userId, int chapNum,
			int quizNum, int groupNum, String schoolNum) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("viewTryNum", progressDao.selectTryNum(userId, chapNum, quizNum));
		map.put("viewSchoolTryNum", progressDao.selectSchoolTryNum(schoolNum, chapNum, quizNum));
		map.put("viewClassTryNum", progressDao.selectClassTryNum(groupNum, chapNum, quizNum));	
		return map;
	}

	@Override
	public Mission5Progress viewMission5(String userId, int missionIndex) {
		if(missionIndex != 50) {
			return progressDao.selectMission5(userId, missionIndex);
		}else {
			return progressDao.selectMission50();
		}
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addMission5Progress(Mission5Progress mission) {
		return progressDao.insertMission5Progress(mission);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean editMission5Progress(Mission5Progress mission) {
		return progressDao.updateMission5Progress(mission);
	}

}