package com.scse.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scse.dao.FreeDAO;
import com.scse.entity.FreeCode;
import com.scse.entity.User;

@Repository("freeDao")
public class FreeDAOImpl implements FreeDAO {

	private SqlSessionTemplate sqlSessionTemplate;
		
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertMyFree(FreeCode freeCode) throws Exception {
		return sqlSessionTemplate.insert("FreeCode.insertFreeCode", freeCode)>0;
	}

	@Override
	public boolean deleteMyFree(int codeNum) throws Exception {
		return sqlSessionTemplate.delete("FreeCode.deleteFreeCode",codeNum)>0;
	}

	@Override
	public boolean updateMyFree(FreeCode freeCode) throws Exception {
		return sqlSessionTemplate.update("FreeCode.updateFreeCode",freeCode)>0;
	}

	@Override
	public FreeCode selectMyFree(String userId, int codeNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("codeNum", codeNum);
		
		return sqlSessionTemplate.selectOne("FreeCode.selectFreeCodeByUserIdAndCodeNum", map);
	}

	@Override
	public boolean updateFreeHit(int codeNum) throws Exception {
		return sqlSessionTemplate.update("FreeCode.updateCodeHit", codeNum)>0;
	}

	@Override
	public List<FreeCode> listMyFree(String userId) throws Exception {
		return sqlSessionTemplate.selectList("FreeCode.selectMyFreeCodeList", userId);
	}

	@Override
	public List<FreeCode> listFree() throws Exception {
		return sqlSessionTemplate.selectList("FreeCode.selectFreeCodeOrderByDate");
	}

	@Override
	public List<FreeCode> listFreeOrderByHit() throws Exception {
		return sqlSessionTemplate.selectList("FreeCode.selectFreeCodeOrderByHit");
	}

	@Override
	public List<FreeCode> listFreeMyGroup(String groupNum) throws Exception {
		return sqlSessionTemplate.selectList("FreeCode.selectMySchoolFreeCode",groupNum);
	}

	@Override
	public List<FreeCode> listFreeOrderByLike() throws Exception {
		return sqlSessionTemplate.selectList("FreeCode.selectFreeCodeOrderByLike");
	}

	@Override
	public boolean updateRecommend(int codeNum) throws Exception {
		return sqlSessionTemplate.update("FreeCode.updateCodeLike",codeNum)>0;
	}

	@Override
	public List<FreeCode> searchFreeByCodeName(String codeName)
			throws Exception {
		return sqlSessionTemplate.selectList("FreeCode.selectFreeCodeByCodeName", codeName);
	}

	@Override
	public List<FreeCode> searchFreeBySname(String sName) throws Exception {
		return sqlSessionTemplate.selectList("FreeCode.selectFreeCodeBySname", sName);
	}

	@Override
	public List<FreeCode> selectFreeBySnameAndCodeName(String sName,
			String codeName) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sName", sName);
		map.put("codeName", codeName);
		return sqlSessionTemplate.selectList("FreeCode.selectFreeCodeBySnameAndCodeName", map);
	}

	
}