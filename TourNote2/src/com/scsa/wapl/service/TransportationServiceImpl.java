package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.TransportationDAO;
import com.scsa.wapl.entity.Transportation;
import com.scsa.wapl.entity.TravelTransportation;

@Service("TransportationSevice")
@Transactional(propagation = Propagation.SUPPORTS, readOnly=true)
public class TransportationServiceImpl implements TransportationService {

	private TransportationDAO transportationDao;

	@Autowired
	public void setTransportationDao(TransportationDAO transportationDao) {
		this.transportationDao = transportationDao;
	}
	@Override
	public void createTransportation(Transportation transportaion) {
		transportationDao.insertTransportation(transportaion);
	}
	
	@Override
	public void createTransportationByAdmin(Transportation transportaion) {
		transportationDao.insertTransportationByAdmin(transportaion);
	}

	@Override
	public void modifyTransportation(Transportation transportaion) {
		transportationDao.updateTransportation(transportaion);
	}

	@Override
	public void removeTransportation(String transportationType,
			String transportationName, String countryName) {
		transportationDao.deleteTransportation(transportationType, transportationName, countryName);
	}

	@Override
	public List<Transportation> findTransportationListByTypeAndCountry(
			String transportationType, String countryName) {
		return transportationDao.selectTransportationListByTypeAndCountry(transportationType, countryName);
	}

	@Override
	public int countTransportationListByName(String transportationName) {
		return transportationDao.countTransportationListByName(transportationName);
	}
	
	@Override
	public List<Transportation> findTransportationList(int startNo, int endNo) {
		return transportationDao.selectTransportationList(startNo, endNo);
	}

	@Override
	public void createTravelTransportation(
			TravelTransportation travelTransportaion, int recordNum) {
		transportationDao.insertTravelTransportation(travelTransportaion, recordNum);
		
	}

	@Override
	public void modifyTravelTransportation(
			TravelTransportation travelTransportaion) {
		
	}

	@Override
	public void removeTravelTransportation(int spotNum,
			int transportationOrder, int recordNum) {
		
	}

	@Override
	public List<TravelTransportation> findTravelTransportationList() {
		return null;
	}

	@Override
	public List<Transportation> findTransportationListbyLink() {
		return null;
	}
	
	@Override
	public void removeTravelTransportationBySpotNumAndRecordNum(int spotNum,
			int recordNum) {
		transportationDao.deleteTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
	}
	
	@Override
	public List<TravelTransportation> findTravelTransportationListBySpotNumAndRecordNum(
			int spotNum, int recordNum) {
		return transportationDao.selectTravelTransportationListBySpotNumAndRecordNum(spotNum, recordNum);
	}
	
	@Override
	public int listCount() {
		return transportationDao.listCount();
		
	}
	
}//end class