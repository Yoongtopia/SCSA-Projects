package com.scsa.wapl.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.TravelRecordReply;

@Repository
public class TravelRecordReplyDAOImpl implements TravelRecordReplyDAO {

	private SqlSessionTemplate sqlSessionTemplate;
		
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void insertTravelRecordReply(TravelRecordReply travelRecordReply) {
		sqlSessionTemplate.insert("TravelRecordReply.insertTravelRecordReply", travelRecordReply);
	}

	@Override
	public List<TravelRecordReply> selectTravelRecordReply(int recordNum) {
		return sqlSessionTemplate.selectList("TravelRecordReply.selectTravelRecordReply", recordNum);
	}

	@Override
	public void deleteTreavelRecordReply(int replyNum) {
		sqlSessionTemplate.update("TravelRecordReply.deleteTravelRecordReply", replyNum);
	}

}
