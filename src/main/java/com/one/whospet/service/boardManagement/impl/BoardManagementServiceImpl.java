package com.one.whospet.service.boardManagement.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.boardManagement.face.BoardManagementDao;
import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
import com.one.whospet.dto.User;
import com.one.whospet.service.boardManagement.face.BoardManagementService;
import com.one.whospet.util.BoardPaging;

@Service
public class BoardManagementServiceImpl implements BoardManagementService{

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(BoardManagementServiceImpl.class);

	// board Dao 의존성 주입
	@Autowired
	BoardManagementDao boardMD;
	
	
	@Override // 게시글 관리 페이징을 얻어오는 메소드
	public BoardPaging getPaging(HttpServletRequest request) {
		
		String param = request.getParameter("curPage");
		int curPage = 0;
		int totalCount = 0;
		
		// 파라미터 정보가 있는지 없는지 체크
		if(param != null && !param.equals("")) {
			curPage = Integer.parseInt(param);
		};
		
		//검색했는지 여부 체크
		String search = request.getParameter("search");
		if(search != null && !search.equals("")) {
			String searchCategory = request.getParameter("searchCategory");
			
			//카테고리가 없으면
			if(searchCategory == null || !searchCategory.equals("b_title") && !searchCategory.equals("b_content")) {
				searchCategory = "b_title";
			}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("search", search);
			map.put("searchCategory", searchCategory);
			
			//검색한 내용 기준으로 총 게시글 수 체크
			totalCount = boardMD.selectSearchCntBoard(map);
			
		}else {//검색안했음 카테고리만 체크해서 넘김
			
			// 게시판 카테고리 체크
			String param2 = "";
			param2 = request.getParameter("bType");
			logger.info("게시글 카테고리 " + param2);
			String bType = "F";
			
			if(param2 != null && param2.equals("R")) {
				bType = param2;
			}else if(param2 != null && param2.equals("T")) {
				bType = param2;
			}

			logger.info("게시글 카테고리 " + bType);
			// 카테고리에 맞는 전체 게시글 수를 가져오는 메소드
			totalCount = boardMD.selectCntBoard(bType);
		}

		BoardPaging paging = new BoardPaging(totalCount, curPage);
		
		return paging;
	}
	
	@Override // 게시글 리스트 조회
	public List<HashMap<String, Object>> getList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>> ();

		list = boardMD.selectAll(map);

		return list;
	}
	
	@Override // 게시글 상세보기
	public Board detailBoard(int bNo) {
		
		Board board = boardMD.selectBoardInfo(bNo);
		
		return board;
	}
	
	@Override // 게시글 댓글 정보를 가져오는 메소드
	public List<HashMap<String, Object>> getComment(HttpServletRequest request) {
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>(); 
		
		String param = request.getParameter("bNo");
		String param2 = request.getParameter("curCommentSize");
		
		//기본 댓글 값 최대 10개 까지
		int curCommentSize = 10;
		
		//더보기 버튼 눌렀는지 체크 눌렀으며 10개 더해줌
		if(param2 != null && !param2.equals("")) {
			curCommentSize = Integer.parseInt(param2);
			curCommentSize += 10;
		}
		
		logger.info("댓글의 가져올 게시판 번호" + param);
		
		int bNo = 0;
		try {
			bNo = Integer.parseInt(param);
		} catch (Exception e) {
			logger.info("댓글리스트를 불러오는 도중 형변환 오류 발생");
			e.printStackTrace();
		}
		
		//게시글 번호하고 댓글의 마지막 갯수  번호를 넣을 맵
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bNo", bNo);
		map.put("curCommentSize", curCommentSize);
		
		list = boardMD.selectCommentAll(map);
		
		return list;
	}

	
	@Override // 총 댓글 수를 가져오는 메소드
	public int getCommentTotalCount(HttpServletRequest request) {
		
		String param = request.getParameter("bNo");
		
		int bNo = 0;
		
		try {
			bNo = Integer.parseInt(param);
		}catch (Exception e) {
			logger.info("**** 총 댓글 수 더보기 오류");
		}
			
		int total = boardMD.selectCommentTotalCount(bNo);		
		return total;
	}
	
	@Override // 게시글의 이미지 정보를 가져오는 메소드
	public List<BoardImg> getBoardImgInfo(Board board) {
		List<BoardImg> imgList = new ArrayList<BoardImg>();
		
		imgList = boardMD.selectBoardImgInfo(board.getbNo());
		
		
		return imgList;
	}
	
	@Override // 게시글 작성 유저의 정보를 가져온다.
	public User getBoardWriterInfo(int getuNo) {
		
		User user = boardMD.selectBoardWriterInfo(getuNo);
		
		return user;
	}
	
	
	@Override // 게시글의 댓글을 작성하는 메소드
	public void writeComment(HttpServletRequest request) {
		String param1 = request.getParameter("uNo");
		String param2 = request.getParameter("bNo");
			
		int uNo = 0;
		int bNo = 0;
		try {// 파라미터 형변환 체크
			uNo = Integer.parseInt(param1);
			bNo = Integer.parseInt(param2);
		} catch (Exception e) {
			logger.info("-----게시글 댓글 달기 형변환 중 오류 발생");
			e.printStackTrace();
			return;
		}
		
		//전달받은 댓글 내용을 체크
		String content = "";
		content = request.getParameter("content");
		
		if(content == null || content.equals("")) {
			content = "Default";
		}
		
		// mapper 전달으 위해 hashmap에 담아준다.
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("uNo", uNo);
		map.put("bNo", bNo);
		map.put("content", content);
		
		// 댓글을 작성한다.
		boardMD.writeComment(map);
	}
	

	
	@Override //댓글을 삭제하는 메소드
	public void deleteComment(int cNo) {
		boardMD.deleteComment(cNo);
	}
		
}
