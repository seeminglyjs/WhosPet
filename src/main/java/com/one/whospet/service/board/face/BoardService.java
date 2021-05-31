package com.one.whospet.service.board.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
import com.one.whospet.dto.User;
import com.one.whospet.util.BoardPaging;

public interface BoardService {
	
	/**
	 * 게시글에 필요한 페이징을 가져오는 메소드
	 * 
	 * @param request
	 * @return
	 */
	public BoardPaging getPaging(HttpServletRequest request);

	/**
	 * 게시글 리스트를 가져오는 메소드
	 * 
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> getList(BoardPaging paging);

	/**
	 * 게시글 상세 조회를 가져오는 메소드
	 * 
	 * @param boardNo
	 * @return
	 */
	public Board detailBoard(int boardNo);

	/**
	 * 게시글 작성 유저의 정보를 가져오는 메소드
	 * 
	 * @param getuNo
	 * @return
	 */
	public User getBoardWriterInfo(int getuNo);

	/**
	 * 게시글 조회수를 증가시키는 메소드
	 * 
	 * @param boardNo
	 */
	public void updateHit(int boardNo);

	/**
	 * 게시글을 작성하는 메소드
	 * 
	 * @param fileRequest
	 * @param user
	 */
	public void writeBoard(MultipartHttpServletRequest fileRequest, User user);

	/**
	 * 게시글을 삭제하는 메소드
	 * 
	 * @param boardNo
	 */
	public void deleteBoard(int boardNo);

	/**
	 * 게시글 작성 유저 번호를 가져오는 메소드
	 * 
	 * @param boardNo
	 * @return
	 */
	public int getBoardWriterUno(int boardNo);

	/**
	 * 게시글의 이미지 정보를 가져오는 메소드
	 * 
	 * @param board
	 * @return
	 */
	public List<BoardImg> getBoardImgInfo(Board board);


}
