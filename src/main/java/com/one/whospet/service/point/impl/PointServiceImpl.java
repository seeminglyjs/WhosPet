package com.one.whospet.service.point.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.point.face.PointDao;
import com.one.whospet.dto.Point;
import com.one.whospet.service.point.face.PointService;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointDao pointDao;
	@Override
	public List<Point> getPointByUno(int uNo) {
		
		return pointDao.getPointList(uNo);
	}
	@Override
	public Point getCurpointByUno(int uNo) {
		return pointDao.selectLPoint(uNo);
	}
	@Override
	public void addPoint(HashMap<String, Object> map) {
		pointDao.insertPoint(map);
		
	}
	@Override
	public void addSum(HashMap<String, Object> map) {
		pointDao.insertSum(map);
		
	}


}
