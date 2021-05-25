package com.one.whospet.dao.hospital.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.whospet.dto.Booking;
import com.one.whospet.dto.Hospital;
import com.one.whospet.dto.Review;
import com.one.whospet.util.HospitalPaging;

public interface HospitalDao {

	public List<Map<String, Object>> selectAll(HospitalPaging paging);

	public int selectCntAll();

	public List<HashMap<String, Object>> selectKeyword(HashMap<String,Object> map);

	public HashMap<String, Object> selectCntKeyword(HashMap<String,Object> map);

	public void updateHit(int hNo);

	public Hospital selectByhNo(int hNo);

	public List<HashMap<String, Object>> selectReview(int hNo);

	public int selectCntAllKeyword(HashMap<String,Object> map);

	public int insertBook(HashMap<String, Object> map);

	public int insertReview(HashMap<String, Object> map);


	

}
