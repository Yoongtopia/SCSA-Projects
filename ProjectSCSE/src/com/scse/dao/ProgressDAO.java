package com.scse.dao;

import java.util.List;

import com.scse.entity.Mission;
import com.scse.entity.Mission5Progress;
import com.scse.entity.Progress;

public interface ProgressDAO {

	boolean insertMissionProgress(Progress progress) throws Exception;
	Mission selectMission(int chapNum, int quizNum) throws Exception;
	Mission selectMissionByMissionIndex(int missionIndex) throws Exception;
	Mission selectMaxMissionIndexOfStudent(String userId) throws Exception;
	Mission selectMissionByUserId(String userId) throws Exception;
	
	List<Mission> listMission() throws Exception;
	boolean updateMissionResult(Progress progress) throws Exception;
	Progress selectProgress(String userId, int chapNum, int quizNum) throws Exception;
	
	int selectTotalTime(String userId) throws Exception;
	List<Progress> selectPerformanceTable(String userId, int chapNum) throws Exception;
	int selectTryNum(String userId, int chapNum, int quizNum) throws Exception;
	int selectSchoolTryNum(String schoolNum, int chapNum, int quizNum) throws Exception;
	int selectClassTryNum(int groupNum, int chapNum, int quizNum) throws Exception;
	List<Progress> selectNeedToStudy(String userId, int chapNum) throws Exception;
	
	int selectQuestTryNum(String userId, int missionIndex);
	int selectTodayClearCount(String userId);
	int selectQuestFailNum(String userId, int missionIndex);
	int selectTotalQuestTryNum(String userId);
	
	Mission5Progress selectMission5(String userId, int missionIndex);
	Mission5Progress selectMission50();
	boolean insertMission5Progress(Mission5Progress mission);
	boolean updateMission5Progress(Mission5Progress mission);
	
}
