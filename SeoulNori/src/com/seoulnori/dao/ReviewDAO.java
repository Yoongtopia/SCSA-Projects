package com.seoulnori.dao;

import java.util.List;

import com.seoulnori.vo.Review;


public interface ReviewDAO {
	
	boolean insertReview(Review review);
	boolean updateReview(Review review);
	boolean deleteReview(int reviewNum);
	Review selectReviewByNoticeNum(int reviewNum);
	List<Review> selectReviewListByEventIdRegDate(String eventId);
	List<Review> selectReviewListByEventIdStamp(String eventId);
	List<Review> selectReviewListByUserId(String userId);
	List<Review> selectReviewList();
	Review selectReviewByEventIdAndUserId(String eventId, String userId);
	
	
}
