package com.seoulnori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.seoulnori.dao.ReviewDAO;
import com.seoulnori.vo.Review;

@Service
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class ReviewServiceImpl implements ReviewService {

	private ReviewDAO reviewDao;
	
	@Autowired
	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean addReview(Review review) {
		return reviewDao.insertReview(review);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean updateReview(Review review) {
		return reviewDao.updateReview(review);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean removeReview(int reviewNum) {		
		return reviewDao.deleteReview(reviewNum);
	}

	@Override
	public Review findReviewByReviewNum(int reviewNum) {
		return reviewDao.selectReviewByNoticeNum(reviewNum);
	}


	@Override
	public List<Review> findReviewListByEventIdRegDate(String eventId) {
		return reviewDao.selectReviewListByEventIdRegDate(eventId);
	}
	
	@Override
	public List<Review> findReviewListByEventIdStamp(String eventId) {
		return reviewDao.selectReviewListByEventIdStamp(eventId);
	}


	@Override
	public List<Review> findReviewListByUserId(String userId) {
		return reviewDao.selectReviewListByUserId(userId);
	}

	
	@Override
	public List<Review> findReviewList() {
		return reviewDao.selectReviewList();
	}

	@Override
	public Review findReviewByEventIdAndUserId(String eventId, String userId) {
		return reviewDao.selectReviewByEventIdAndUserId(eventId, userId);
	}
}
