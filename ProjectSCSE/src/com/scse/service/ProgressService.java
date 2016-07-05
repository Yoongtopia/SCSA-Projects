package com.scse.service;

import java.util.HashMap;
import java.util.List;

import com.scse.entity.Mission;
import com.scse.entity.Mission5Progress;
import com.scse.entity.Progress;

public interface ProgressService {

	List<Mission> viewAllMission() throws Exception;

	boolean addProgress(Progress progress) throws Exception;

	boolean modifyTryNumAndTime(Progress progress) throws Exception;

	Progress viewProgressByUserIdAndChapNumAndQuizNum(String userId,
			int chapNum, int quizNum) throws Exception;

	Mission viewMaxMissionIndexOfStudent(String userId) throws Exception;

	/*
	 * Progress viewProgressByUserIdAndChapNumAndQuizNum(String userId, int
	 * chapNum, int quizNum) throws Exception; Mission
	 * viewMissionByChapNumAndQuizNum(int chapNum, int quizNum) throws
	 * Exception;
	 */

	// ���뵵�м� ����

	// �ѽð�
	int viewTotalTime(String userId) throws Exception;

	// ǥ�Ѹ���
	List<Progress> viewPerformanceTable(String userId, int chapNum)
			throws Exception;

	// �õ�Ƚ��
	int viewTryNum(String userId, int chapNum, int quizNum) throws Exception;

	int viewSchoolTryNum(String schoolNum, int chapNum, int quizNum)
			throws Exception;

	int viewClassTryNum(int groupNum, int chapNum, int quizNum)
			throws Exception;

	// �õ�Ƚ�� ��â ������
	HashMap<String, Object> allTry(String userId, int chapNum, int quizNum,
			int groupNum, String schoolNum) throws Exception;

	// ���ΰ� �ʿ��� ����
	List<Progress> viewNeedToStudy(String userId, int chapNum) throws Exception;
	// ���뵵�м� ��
	
	Mission viewMissionByChapNumAndQuizNum(int chapNum, int quizNum)
			throws Exception;

	Mission viewMissionByMissionIndex(int missionIndex) throws Exception;

	HashMap<String, Integer> viewFailQuestCheck(String userId, int missionIndex);

	HashMap<String, Integer> viewSuccessQuestCheck(String userId);

	int vewSuccessConanQuestCheck(String userId, int missionIndex);
	
	Mission5Progress viewMission5(String userId, int missionIndex);
	boolean addMission5Progress(Mission5Progress mission);
	boolean editMission5Progress(Mission5Progress mission);

}
