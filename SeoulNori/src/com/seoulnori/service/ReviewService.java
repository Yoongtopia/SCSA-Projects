package com.seoulnori.service;

import java.util.List;

import com.seoulnori.vo.Review;


public interface ReviewService {

	boolean addReview(Review review);
	boolean updateReview(Review review);
	boolean removeReview(int reviewNum);
	Review findReviewByReviewNum(int reviewNum);
	List<Review> findReviewList();
	List<Review> findReviewListByEventIdRegDate(String eventId);
	List<Review> findReviewListByEventIdStamp(String eventId);
	List<Review> findReviewListByUserId(String userId);
	Review findReviewByEventIdAndUserId(String eventId, String userId);

}
