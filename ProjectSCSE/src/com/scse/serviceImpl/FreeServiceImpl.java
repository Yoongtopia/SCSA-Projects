package com.scse.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scse.dao.FreeDAO;
import com.scse.entity.FreeCode;
import com.scse.service.FreeService;

@Component("free")
public class FreeServiceImpl implements FreeService {

	FreeDAO freeDao;
	
	@Autowired	
	public void setFreeDao(FreeDAO freeDao) {
		this.freeDao = freeDao;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addMyFree(FreeCode freeCode) throws Exception {
		return freeDao.insertMyFree(freeCode);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean removeMyFree(int codeNum) throws Exception {
		return freeDao.deleteMyFree(codeNum);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyMyFree(FreeCode freeCode) throws Exception {
		return freeDao.updateMyFree(freeCode);
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public FreeCode viewMyFree(String userId, int codeNum)
			throws Exception {
		freeDao.updateFreeHit(codeNum);
		return freeDao.selectMyFree(userId, codeNum);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyFreeHit(int codeNum) throws Exception {
		return freeDao.updateFreeHit(codeNum);
	}

	@Override
	public List<FreeCode> allMyFree(String userId) throws Exception {
		return freeDao.listMyFree(userId);
	}

	@Override
	public List<FreeCode> allFreeByDate() throws Exception {
		return freeDao.listFree();
	}

	@Override
	public List<FreeCode> viewFreeCodeOrderByHit() throws Exception {
		return freeDao.listFreeOrderByHit();
	}

	@Override
	public List<FreeCode> viewMyGroupFreeCode(String groupNum) throws Exception {
		return freeDao.listFreeMyGroup(groupNum);
	}

	@Override
	public List<FreeCode> viewFreeCodeOrderByLike() throws Exception {
		return freeDao.listFreeOrderByLike();
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyRecommend(int codeNum) throws Exception {
		return freeDao.updateRecommend(codeNum);
	}

	@Override
	public List<FreeCode> findFreeByCodeName(String codeName)
			throws Exception {
		return freeDao.searchFreeByCodeName(codeName);
	}

	@Override
	public List<FreeCode> findFreeBySname(String sName) throws Exception {
		return freeDao.searchFreeBySname(sName);
	}

	@Override
	public List<FreeCode> findFreeBySnameAndCodeName(String sName,
			String codeName) throws Exception {
		return freeDao.selectFreeBySnameAndCodeName(sName, codeName);
	}
}