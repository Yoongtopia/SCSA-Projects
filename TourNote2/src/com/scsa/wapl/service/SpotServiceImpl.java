package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.SpotDAO;
import com.scsa.wapl.entity.Photo;
import com.scsa.wapl.entity.TravelSpot;

@Service("SpotService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly=true)
public class SpotServiceImpl implements SpotService {

	private SpotDAO spotDao;

	@Autowired
	public void setSpotDao(SpotDAO spotDao) {
		this.spotDao = spotDao;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly=false)
	public void createSpot(TravelSpot spot) {
		spotDao.insertSpot(spot);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly=false)
	public void createPhoto(Photo photo, int recordNum, int spotNum) {
		spotDao.insertPhoto(photo, recordNum, spotNum);
	}
	
	@Override
	public List<Photo> findPhotoBySpotNumAndRecordNum(int recordNum, int spotNum) {
		return spotDao.selectPhotoBySpotNumAndRecordNum(recordNum, spotNum);
	}
	
	@Override
	public List<Photo> findPhotoWithGps(int recordNum, int spotNum) {
		return spotDao.selectPhotoWithGps(recordNum, spotNum);
	}

	@Override
	public void modifySpot(TravelSpot spot) {
		spotDao.updateSpot(spot);
	}
	
	@Override
	public void modifySpotNum(TravelSpot spot) {
		spotDao.updateSpotNum(spot);
	}

	@Override
	public void removeSpot(int recordNum, int spotNum) {
		spotDao.deleteSpot(recordNum, spotNum);
	}

	@Override
	public void removePhoto(String photoName, int recordNum, int spotNum) {
		spotDao.deletePhoto(photoName, recordNum, spotNum);
	}
	
	@Override
	public Photo findPhoto(String photoName, int recordNum, int spotNum) {
		return spotDao.selectPhoto(photoName, recordNum, spotNum);
	}

	@Override
	public int countRecordNum(int recordNum) {
		return spotDao.countRecordNum(recordNum);
	}

	@Override
	public TravelSpot findSpot(int recordNum, int spotNum) {
		return spotDao.selectSpot(recordNum, spotNum);
	}

	@Override
	public List<TravelSpot> findSpotListByRecordNum(int recordNum) {
		return spotDao.selectSpotListByRecordNum(recordNum);
	}

	@Override
	public void removePhotoBySpotNumAndRecordNum(int recordNum, int spotNum) {
		spotDao.deletePhotoBySpotNumAndRecordNum(recordNum, spotNum);
	}

	@Override
	public List<TravelSpot> timeLineList(int recordNum) {
		return spotDao.timeLineList(recordNum);
	}

	@Override
	public int listCount(int recordNum) {
		return spotDao.listCount(recordNum);
	}
	
}//end class