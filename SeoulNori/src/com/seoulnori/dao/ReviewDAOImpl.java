package com.seoulnori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seoulnori.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertReview(Review review) {
		return sqlSessionTemplate.insert("Review.insertReview", review)>0;
	}

	@Override
	public boolean updateReview(Review review) {
		return sqlSessionTemplate.update("Review.updateReview", review)>0;
	}

	@Override
	public boolean deleteReview(int reviewNum) {
		return sqlSessionTemplate.delete("Review.deleteReview", reviewNum)>0;
	}

	@Override
	public Review selectReviewByNoticeNum(int reviewNum) {
		return sqlSessionTemplate.selectOne("Review.selectReviewByNoticeNum", reviewNum);
	}

	@Override
	public List<Review> selectReviewListByEventIdRegDate(String eventId) {
		return sqlSessionTemplate.selectList("Review.selectReviewListByEventIdRegDate", eventId);
	}
	
	@Override
	public List<Review> selectReviewListByEventIdStamp(String eventId) {
		return sqlSessionTemplate.selectList("Review.selectReviewListByEventIdStamp", eventId);
	}

	@Override
	public List<Review> selectReviewListByUserId(String userId) {
		return sqlSessionTemplate.selectList("Review.selectReviewListByUserId", userId);
	}

	@Override
	public List<Review> selectReviewList() {
		return sqlSessionTemplate.selectList("Review.selectReviewList");
	}

	@Override
	public Review selectReviewByEventIdAndUserId(String eventId, String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eventId", eventId);
		map.put("userId", userId);
		return sqlSessionTemplate.selectOne("Review.selectReviewByEventIdAndUserId", map);
	}

}
