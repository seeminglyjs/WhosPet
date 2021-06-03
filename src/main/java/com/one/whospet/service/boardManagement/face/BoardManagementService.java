package com.one.whospet.service.boardManagement.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
import com.one.whospet.dto.User;
import com.one.whospet.util.BoardPaging;

public interface BoardManagementService {

	/**
	 * 관리자 게시판 관리 페이징을 얻어오는 메소드
	 * 
	 * @param request
	 * @return
	 */
	public BoardPaging getPaging(HttpServletRequest request);

	/**
	 * 관리자 게시글 리스트를 가져오는 메소드
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> getList(HashMap<String, Object> map);

	/**
	 * 관리자 게시글 상세보기
	 * 
	 * @param bNo
	 * @return
	 */
	public Board detailBoard(int bNo);

	/**
	 * 댓글 정보를 가져오는 메소드
	 * 
	 * @param request
	 * @return
	 */
	public List<HashMap<String, Object>> getComment(HttpServletRequest request);

	/**
	 * 총 댓글 수를 가져오는 메소드
	 * 
	 * @param request
	 * @return
	 */
	public int getCommentTotalCount(HttpServletRequest request);

	/**
	 * 게시글의 이미지 정보를 가져오는 메소드
	 * 
	 * @param board
	 * @return
	 */
	public List<BoardImg> getBoardImgInfo(Board board);

	/**
	 * 게시글 작성 유저의 정보를 가져오는 메소드
	 * 
	 * @param getuNo
	 * @return
	 */
	public User getBoardWriterInfo(int getuNo);

	/**
	 * 댓글을 작성하는 메소드
	 * 
	 * @param request
	 */
	public void writeComment(HttpServletRequest request);

	/**
	 * 댓글을 삭제하는 메소드
	 * 
	 * @param cNo
	 */
	public void deleteComment(int cNo);

	/**
	 * 게시글을 삭제하는 메소드
	 * 
	 * @param bNo
	 */
	public void deleteBoard(int bNo);

}
