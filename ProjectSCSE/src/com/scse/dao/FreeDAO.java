package com.scse.dao;

import java.util.List;

import com.scse.entity.FreeCode;
import com.scse.entity.User;

public interface FreeDAO {

	boolean insertMyFree(FreeCode freeCode) throws Exception;
	boolean deleteMyFree(int codeNum) throws Exception;
	boolean updateMyFree(FreeCode freeCode) throws Exception;
	
	FreeCode selectMyFree(String userId, int codeNum) throws Exception;
	boolean updateFreeHit(int codeNum) throws Exception;
	List<FreeCode> listMyFree(String userId) throws Exception;
	
	List<FreeCode> listFree() throws Exception;
	List<FreeCode> listFreeOrderByHit() throws Exception;
	
	List<FreeCode> listFreeMyGroup(String groupNum) throws Exception;
	List<FreeCode> listFreeOrderByLike() throws Exception;
	
	boolean updateRecommend(int codeNum) throws Exception;
	List<FreeCode> searchFreeByCodeName(String codeName) throws Exception;
	List<FreeCode> searchFreeBySname(String sName) throws Exception;
	List<FreeCode> selectFreeBySnameAndCodeName(String sName, String codeName) throws Exception;
	
	
}
