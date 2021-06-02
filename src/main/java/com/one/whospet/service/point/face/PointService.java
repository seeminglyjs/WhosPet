package com.one.whospet.service.point.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Point;

public interface PointService {

	/**
	 * 유저번호에 따른 포인트 리스트 가져오기
	 * @param uNo
	 * @return
	 */
	public List<Point> getPointByUno(int uNo);

	/**
	 * 유저포인트에 따른 현재 포인트 총합
	 * @param uNo
	 * @return
	 */
	public Point getCurpointByUno(int uNo);

	/**
	 * 포인트 추가
	 * @param uNo
	 * @param poPlus
	 */
	public void addPoint(HashMap<String, Object> map);

	/**
	 * 포인트 총합 추가
	 * @param map
	 */
	public void addSum(HashMap<String, Object> map);

}
