package com.one.whospet.service.board.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.board.face.BoardDao;
import com.one.whospet.dto.Board;
import com.one.whospet.dto.User;
import com.one.whospet.service.board.face.BoardService;
import com.one.whospet.util.BoardPaging;

@Service
public class BoardServiceImpl implements BoardService {

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	// board Dao 의존성 주입
	@Autowired
	BoardDao boardDao;
	
	@Override // 페이징을 구하는 메소드
	public BoardPaging getPaging(HttpServletRequest request) {
		
		String param = request.getParameter("curPage");
		int curPage = 0;
		
		// 파라미터 정보가 있는지 없는지 체크
		if(param != null && !param.equals("")) {
			curPage = Integer.parseInt(param);
		};
		
		// 전체 게시글 수를 가져오는 메소드
		int totalCount = boardDao.selectCntBoard();
		
		BoardPaging paging = new BoardPaging(totalCount, curPage);
		
		return paging;
	}
	
	@Override // 게시글 리스트를 가져오는 메소드
	public List<HashMap<String, Object>>  getList(BoardPaging paging) {
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>> ();

		list = boardDao.selectAll(paging);

		return list;
	}
	
	@Override // 게시글 상세조회 정보를 가져오는 메소드
	public Board detailBoard(int boardNo) {
		
		Board board = boardDao.selectBoardInfo(boardNo);
		
		return board;
	}
	
	
	@Override // 게시글 작성 유저의 정보를 가져오는 메소드
	public User getBoardWriterInfo(int getuNo) {
		
		User user = boardDao.selectBoardWriterInfo(getuNo);
		
		return user;
	}
	
	@Override //게시글 조회수를 증가시키는 메소드
	public void updateHit(int boardNo) {
		
		boardDao.updateHit(boardNo);
	}
}
