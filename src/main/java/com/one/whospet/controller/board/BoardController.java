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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.one.whospet.dto.Board;
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
		
		// 페이지의 해당 하는 게시글 목록을 얻어온다.
		list = boardService.getList(paging);
		
		//페이징/ 게시글과 게시글갯수를 넘긴다.
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);		
		model.addAttribute("listSize", list.size());
	}
	
	
	// 게시판 상세 화면을 보여주는 컨트롤러
	@RequestMapping(value = "/board/detail")
	public String detail(HttpServletRequest request, Model model) {
		
		String param = request.getParameter("boardNo");
		int boardNo = -1;
		if(param != null && !param.equals("")) { // 파라미터 체크
			boardNo = Integer.parseInt(param);
		}
		
		//게시글 정보를 가져오는 메소드
		boardService.updateHit(boardNo);
		Board board = boardService.detailBoard(boardNo);
		
		//조회된 게시글 존재 여부 체크
		if(board == null) {
			return "redirect:/board/list";
		}else {
			// 게시글 작성 유저의 정보를 가져오는 메소드
			User user = boardService.getBoardWriterInfo(board.getuNo());
			
			// 게시판 정보/ 작성유저 정보 객체 전달
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
	public void writeRes(HttpSession session, HttpServletRequest request, MultipartHttpServletRequest fileRequest) {
		logger.info(fileRequest.getParameter("title"));
		logger.info(fileRequest.getParameter("content"));
		List<MultipartFile> fileList = fileRequest.getFiles("file");
		for (MultipartFile mf : fileList) {
			System.out.println(mf.getOriginalFilename());
			System.out.println(mf.getSize());
		}
	}
	
}
