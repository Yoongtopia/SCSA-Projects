package com.scsa.wapl.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.Photo;
import com.scsa.wapl.entity.TravelSpot;

@Repository
public class SpotDAOImpl implements SpotDAO {

	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void insertSpot(TravelSpot spot) {
		sqlSessionTemplate.insert("TravelSpot.insertTravelSpot", spot);
	}
	
	@Override
	public List<Photo> selectPhotoBySpotNumAndRecordNum(int recordNum,
			int spotNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum",recordNum);
		map.put("spotNum",spotNum);
		return sqlSessionTemplate.selectList("TravelSpot.selectPhotoBySpotNumAndRecordNum",map);
	}
	
	@Override
	public List<Photo> selectPhotoWithGps(int recordNum,int spotNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum",recordNum);
		map.put("spotNum",spotNum);
		return sqlSessionTemplate.selectList("TravelSpot.selectPhotoWithGps",map);
	}

	@Override
	public void insertPhoto(Photo photo, int recordNum, int spotNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("photoName", photo.getPhotoName());
		map.put("recordNum", recordNum);
		map.put("spotNum", spotNum);
		map.put("latitude", photo.getLatitude());
		map.put("longitude", photo.getLongitude());
		sqlSessionTemplate.insert("TravelSpot.insertPhoto", map);
	}

	@Override
	public void updateSpot(TravelSpot spot) {
		sqlSessionTemplate.update("TravelSpot.updateTravelSpot", spot);
	}
	
	@Override
	public void updateSpotNum(TravelSpot spot) {
		sqlSessionTemplate.update("TravelSpot.updateSpotNum", spot);
	}

	@Override
	public void deleteSpot(int recordNum, int spotNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum",recordNum);
		map.put("spotNum",spotNum);
		sqlSessionTemplate.delete("TravelSpot.deleteTravelSpot", map);
	}
	
	@Override
	public void deletePhoto(String photoName, int recordNum, int spotNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("photoName", photoName);
		map.put("recordNum", recordNum);
		map.put("spotNum", spotNum);
		sqlSessionTemplate.delete("TravelSpot.deletePhoto",map);
	}
	
	@Override
	public Photo selectPhoto(String photoName, int recordNum, int spotNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("photoName", photoName);
		map.put("recordNum", recordNum);
		map.put("spotNum", spotNum);
		if (sqlSessionTemplate.selectOne("TravelSpot.selectPhoto", map) != null){
			return sqlSessionTemplate.selectOne("TravelSpot.selectPhoto", map);
		} else {
			return null;
		}
		
	}

	
	@Override
	public int countRecordNum(int recordNum) {
		if (sqlSessionTemplate.selectOne("TravelSpot.countRecordNum", recordNum) != null){
			return sqlSessionTemplate.selectOne("TravelSpot.countRecordNum", recordNum);
		} else {
			return 0;
		}
	}

	@Override
	public TravelSpot selectSpot(int recordNum, int spotNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum",recordNum);
		map.put("spotNum",spotNum);
		if (sqlSessionTemplate.selectOne("TravelSpot.selectSpot", map) != null){
			return sqlSessionTemplate.selectOne("TravelSpot.selectSpot", map);
		} else {
			return null;
		}
	}

	@Override
	public List<TravelSpot> selectSpotListByRecordNum(int recordNum) {
		return sqlSessionTemplate.selectList("TravelSpot.selectSpotListByRecordNum", recordNum);
	}
	
	@Override
	public void deletePhotoBySpotNumAndRecordNum(int recordNum, int spotNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum",recordNum);
		map.put("spotNum",spotNum);
		sqlSessionTemplate.delete("TravelSpot.deletePhotoBySpotNumAndRecordNum", map);

	}

	@Override
	public List<TravelSpot> timeLineList(int recordNum) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("recordNum", recordNum);
		return sqlSessionTemplate.selectList("TravelSpot.timeLineList", map);
	}

	@Override
	public int listCount(int recordNum) {
		return sqlSessionTemplate.selectOne("TravelSpot.timeLineCount", recordNum);
	}


}//end class