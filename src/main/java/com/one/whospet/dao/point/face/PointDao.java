package com.one.whospet.dao.point.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Point;

public interface PointDao {

	/**
	 * 포인트 리스트 가져오기
	 * @param uNo
	 * @return
	 */
	public List<Point> getPointList(int uNo);

	/**
	 * 포인트목록 마지막 행
	 * @param uNo
	 * @return
	 */
	public Point selectLPoint(int uNo);

	/**
	 * 추가 포인트 삽입
	 * @param map
	 */
	public void insertPoint(HashMap<String, Object> map);

	/**
	 * 포인트 총합 삽입
	 * @param map
	 */
	public void insertSum(HashMap<String, Object> map);

}
