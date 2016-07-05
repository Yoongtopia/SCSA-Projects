package com.scse.service;

import java.util.List;

import com.scse.entity.FreeCode;


public interface FreeService {

	boolean addMyFree(FreeCode freeCode) throws Exception;
	boolean removeMyFree(int codeNum) throws Exception;
	boolean modifyMyFree(FreeCode freeCode) throws Exception;
	
	FreeCode viewMyFree(String userId, int codeNum) throws Exception;
	boolean modifyFreeHit(int codeNum) throws Exception;
	List<FreeCode> allMyFree(String userId) throws Exception;
	
	List<FreeCode> allFreeByDate() throws Exception;
	List<FreeCode> viewFreeCodeOrderByHit() throws Exception;
	
	List<FreeCode> viewMyGroupFreeCode(String groupNum) throws Exception;
	List<FreeCode> viewFreeCodeOrderByLike() throws Exception;
	
	boolean modifyRecommend(int codeNum) throws Exception;
	List<FreeCode> findFreeByCodeName(String codeName) throws Exception;
	List<FreeCode> findFreeBySname(String sName) throws Exception;
	List<FreeCode> findFreeBySnameAndCodeName(String sName, String codeName) throws Exception;
	
	
	
}
