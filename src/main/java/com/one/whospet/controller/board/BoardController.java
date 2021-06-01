package com.one.whospet.controller.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
import com.one.whospet.dto.Comment;
import com.one.whospet.dto.User;
import com.one.whospet.service.board.face.BoardService;
import com.one.whospet.util.BoardPaging;

@Controller
public class BoardController {

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// board Service 의존성주입
	@Autowired
	BoardService boardService;

	// 게시판 리스트 뷰 컨트롤러
	@RequestMapping(value = "/board/list")
	public void list(HttpServletRequest request, Model model) {
		logger.info("board/view");

		// 페이징을 얻어온다.
		BoardPaging paging = boardService.getPaging(request);

		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("paging", paging);	
		String search = request.getParameter("search");
		if(search != null && !search.equals("")) {
			String searchCategory = request.getParameter("searchCategory");

			
			//카테고리가 없으면
			if(searchCategory == null || !searchCategory.equals("b_title") && !searchCategory.equals("b_content")) {
				searchCategory = "b_title";
			}
			
			map.put("search", search);
			map.put("searchCategory", searchCategory);
		}else {
			// 게시판 카테고리 체크
			String param2 = "";
			param2 = request.getParameter("bType");
			logger.info("게시글 카테고리 " + param2);
			String bType = "F";

			//기본게시판은 자유게시판(F)
			if(param2 != null && param2.equals("R")) {
				bType = param2;
			}else if(param2 != null && param2.equals("T")) {
				bType = param2;
			}		
			map.put("bType", bType);
		}

		// 페이지의 해당 하는 게시글 목록을 얻어온다.
		list = boardService.getList(map);

		//페이징/ 게시글과 게시글갯수를 넘긴다.
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);		
		model.addAttribute("listSize", list.size());
	}


	// 게시판 상세 화면을 보여주는 컨트롤러
	@RequestMapping(value = "/board/detail")
	public String detail(HttpServletRequest request, Model model) {

		String param = request.getParameter("bNo");
		int bNo = -1;
		if(param != null && !param.equals("")) { // 파라미터 체크
			try { // 숫자가 아닌 문자열 이나 공백문자를 받을 경우 리스트로 보내버림
				bNo = Integer.parseInt(param);
			} catch (NumberFormatException e) {
				return "redirect:/board/list";
			}	
		}
		//게시글 정보를 가져오는 메소드
		boardService.updateHit(bNo);
		Board board = boardService.detailBoard(bNo);

		//조회된 게시글 존재 여부 체크
		if(board == null) {
			return "redirect:/board/list";
		}else {
			//게시글 이미지 정보를 담을 리스트
			List<BoardImg> imgList = new ArrayList<BoardImg>();

			//댓글 리스트를 담을 리스트
			List<HashMap<String, Object>> listC = new ArrayList<HashMap<String, Object>>();

			//댓글 리스트를 가져오는 메소드
			listC = boardService.getComment(request);

			//댓글의 총 갯수
			int listCSize = listC.size();
			
			int totalCSize = 0;
			totalCSize = boardService.getCommentTotalCount(request);

			//게시판에 등록된 이미지 정보를 리스트에 담는
			imgList = boardService.getBoardImgInfo(board);

			//게시판의 등록된 이미지 정보가 있으면
			List<String> fileList = new ArrayList<String>();
			if(imgList != null && !imgList.isEmpty()) {
				//등록된 이미지 만큼 반복한다.
				for(int i = 0; i < imgList.size(); i++) {
					//파일 경로 지정
					fileList.add(imgList.get(i).getBiStoredFilename());					
				}
			}
			// 게시글 작성 유저의 정보를 가져오는 메소드
			User user = boardService.getBoardWriterInfo(board.getuNo());

			// 게시판 정보/ 작성유저 정보 객체 전달/파일 정보/댓글정보 저장
			model.addAttribute("listC", listC);
			model.addAttribute("listCSize", listCSize);			
			model.addAttribute("totalCSize", totalCSize);//총댓글 수		
			model.addAttribute("fileList", fileList);
			model.addAttribute("board", board);
			model.addAttribute("user", user);
			return "/board/detail";
		}	
	}

	//게시판 글쓰기 뷰 컨트롤러
	@RequestMapping(value = "/board/write")
	public void write(HttpSession session) {}

	//게시판 글쓰기 구현 컨트롤러
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String writeRes(HttpSession session, MultipartHttpServletRequest fileRequest) {	
		User user = (User) session.getAttribute("user");

		boardService.writeBoard(fileRequest, user);

		return "redirect:/board/list";	
	}

	//게시판 삭제 구현
	@RequestMapping(value = "/board/delete")
	public String deleteBoard(HttpServletRequest request, HttpSession session) {

		String param = request.getParameter("bNo");

		//요청 파라미터가 null 이거나 빈문자열이면 돌려보냄
		if(param == null || param.equals("")) {
			return "redirect:/board/list";
		}

		int bNo = 0;
		try { // 예외 발생시 리스트로 보내버림
			bNo = Integer.parseInt(param);
		} catch (Exception e) {
			return "redirect:/board/list";
		}

		// 게시글 작성 유저의 정보를 가져오는 메소드
		int uNo = boardService.getBoardWriterUno(bNo);

		//로그인 유저 정보 가져온다.
		User loginUser = (User) session.getAttribute("user");

		//로그인 유저와 삭제유저가 같지 않으면 리스트로 돌려보낸다.
		if(loginUser.getuNo() != uNo) {
			return "redirect:/board/list";
		}else {
			boardService.deleteBoardComment(bNo);// 댓글삭제
			boardService.deleteBoard(bNo); // 게시글 삭제
			//삭제 진행후 다시 리스트로 보낸다.
			return "redirect:/board/list";
		}
	}

	// 게시글 수정 화면을 보여주는 view [Get] 
	@RequestMapping(value="/board/update")
	public String updateBoard(HttpServletRequest request, HttpSession session, Model model) {
		String param = request.getParameter("bNo");

		//요청 파라미터가 null 이거나 빈문자열이면 돌려보냄
		if(param == null || param.equals("")) {
			return "redirect:/board/list";
		}

		int bNo = 0;
		try { // 예외 발생시 리스트로 보내버림
			bNo = Integer.parseInt(param);
		} catch (Exception e) {
			return "redirect:/board/list";
		}

		//게시글 정보를 가져오는 메소드
		Board board = boardService.detailBoard(bNo);

		//조회된 게시글 존재 여부 체크
		if(board == null) {
			return "redirect:/board/list";
		}else {
			List<BoardImg> imgList = new ArrayList<BoardImg>();

			//게시판에 등록된 이미지 정보를 리스트에 담는
			imgList = boardService.getBoardImgInfo(board);

			//게시판의 등록된 이미지 정보가 있으면
			List<String> fileList = new ArrayList<String>();
			if(imgList != null && !imgList.isEmpty()) {
				//등록된 이미지 만큼 반복한다.
				for(int i = 0; i < imgList.size(); i++) {
					//파일 경로 지정
					fileList.add(imgList.get(i).getBiStoredFilename());
				}
			}
			// 게시글 작성 유저의 정보를 가져오는 메소드
			User user = boardService.getBoardWriterInfo(board.getuNo());

			// 게시판 정보/ 작성유저 정보 객체 전달/파일 정보 저장
			model.addAttribute("fileList", fileList);
			model.addAttribute("board", board);
			model.addAttribute("user", user);
			return "/board/update";
		}	
	}

	// 게시글 수정이 이루어지는 메소드
	@RequestMapping(value="/board/update", method = RequestMethod.POST)
	public String updateBoardRes(HttpSession session, MultipartHttpServletRequest fileRequest) {
		User user = (User) session.getAttribute("user");

		boardService.updateBoard(fileRequest, user);

		return "redirect:/board/list";	
	}


	// 댓글쓰기 컨트롤러
	@RequestMapping(value = "/board/comment", method = RequestMethod.POST)
	public void writeComment(HttpServletRequest request, Model model) {

		//게시글의 댓글을 작성하는 메소드
		boardService.writeComment(request);

		//댓글 리스트를 담을 리스트
		List<HashMap<String, Object>> listC = new ArrayList<HashMap<String, Object>>();

		//댓글 작성 후 댓글 리스트를 가져오는 메
		listC = boardService.getComment(request);

		// 댓글리스트가 null이거나 비어있으면 null 할당
		if(listC == null || listC.isEmpty()) {
			listC = null;
		}else {
			model.addAttribute("listCSize", listC.size());
		}

		logger.info("listC {}", listC);
		//댓글의 총 갯수
		int listCSize = -1;
		
		if(listC != null) {
			listCSize = listC.size();
		}
		
		int totalCSize = 0;
		totalCSize = boardService.getCommentTotalCount(request);
		
		model.addAttribute("listC", listC);
		model.addAttribute("listCSize", listCSize);
		model.addAttribute("totalCSize", totalCSize);
	}

	//댓글삭제 컨트롤러
	@RequestMapping(value = "/board/commentDelete", method = RequestMethod.POST)
	public void deleteComment(HttpServletRequest request, Model model) {
		String param = request.getParameter("cNo");
		
		int cNo = 0;
		try { //파라미터 값 체크
			cNo = Integer.parseInt(param);
		} catch (Exception e) {
			logger.info("****");
			logger.info("**** 댓글 삭제 형변환 오류 발생");
		}

		//댓글을 삭제한다. 
		boardService.deleteComment(cNo);

		//댓글 리스트를 담을 리스트
		List<HashMap<String, Object>> listC = new ArrayList<HashMap<String, Object>>();

		//댓글 작성 후 댓글 리스트를 가져오는 메
		listC = boardService.getComment(request);

		// 댓글리스트가 null이거나 비어있으면 null 할당
		if(listC == null || listC.isEmpty()) {
			listC = null;
		}else {
			model.addAttribute("listCSize", listC.size());
		}

		logger.info("listC {}", listC);
		//댓글의 총 갯수
		int listCSize = -1;
		
		if(listC != null) {
			listCSize = listC.size();
		}
		
		int totalCSize = 0;
		totalCSize = boardService.getCommentTotalCount(request);
		
		model.addAttribute("listC", listC);
		model.addAttribute("listCSize", listCSize);
		model.addAttribute("totalCSize", totalCSize);
	}
	
	//댓글 더보기 컨트롤러
	@RequestMapping(value = "/board/moreComment", method = RequestMethod.POST)
	public void moreComment(HttpServletRequest request, Model model) {
		
		//댓글 리스트를 담을 리스트
		List<HashMap<String, Object>> listC = new ArrayList<HashMap<String, Object>>();

		//댓글 리스트를 가져오는 메소드
		listC = boardService.getComment(request);

		//댓글의 총 갯수
		int listCSize = listC.size();	
		
		int totalCSize = 0;
		totalCSize = boardService.getCommentTotalCount(request);
		
		
		model.addAttribute("listC", listC);
		model.addAttribute("listCSize", listCSize);
		model.addAttribute("totalCSize", totalCSize);
	}
	
	
}
