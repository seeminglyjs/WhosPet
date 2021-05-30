package com.one.whospet.controller.board;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
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
			try { // 숫자가 아닌 문자열 이나 공백문자를 받을 경우 리스트로 보내버림
				boardNo = Integer.parseInt(param);
			} catch (NumberFormatException e) {
				return "redirect:/board/list";
			}	
		}
		//게시글 정보를 가져오는 메소드
		boardService.updateHit(boardNo);
		Board board = boardService.detailBoard(boardNo);
		
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
		
		//조회된 게시글 존재 여부 체크
		if(board == null) {
			return "redirect:/board/list";
		}else {
			// 게시글 작성 유저의 정보를 가져오는 메소드
			User user = boardService.getBoardWriterInfo(board.getuNo());

			// 게시판 정보/ 작성유저 정보 객체 전달/파일 정보 저장
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

		String param = request.getParameter("boardNo");

		//요청 파라미터가 null 이거나 빈문자열이면 돌려보냄
		if(param == null || param.equals("")) {
			return "redirect:/board/list";
		}
		
		int boardNo = 0;
		try { // 예외 발생시 리스트로 보내버림
			boardNo = Integer.parseInt(param);
		} catch (Exception e) {
			return "redirect:/board/list";
		}
		
		// 게시글 작성 유저의 정보를 가져오는 메소드
		int uNo = boardService.getBoardWriterUno(boardNo);
		
		//로그인 유저 정보 가져온다.
		User loginUser = (User) session.getAttribute("user");

		//로그인 유저와 삭제유저가 같지 않으면 리스트로 돌려보낸다.
		if(loginUser.getuNo() != uNo) {
			return "redirect:/board/list";
		}else {
			boardService.deleteBoard(boardNo);
			//삭제 진행후 다시 리스트로 보낸다.
			return "redirect:/board/list";
		}
	}

}
