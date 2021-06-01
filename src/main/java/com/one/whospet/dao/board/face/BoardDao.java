package com.one.whospet.dao.board.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
import com.one.whospet.dto.Comment;
import com.one.whospet.dto.User;
import com.one.whospet.util.BoardPaging;

public interface BoardDao {

	/**
	 *  게시글의 전체수를 조회한다
	 * @param bType 
	 *  
	 * @return
	 */
	public int selectCntBoard(String bType);

	/**
	 * 게시글 전체를 가져온다.
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> selectAll(HashMap<String, Object> map);

	/**
	 * 게시글의 상세 정보를 가져온다.
	 * 
	 * @param bNo
	 * @return
	 */
	public Board selectBoardInfo(int bNo);

	/**
	 * 게시글을 작성한 유저의 정보를 가져온다.
	 * 
	 * @param getuNo
	 * @return
	 */
	public User selectBoardWriterInfo(int getuNo);

	/**
	 * 게시글의 조회수를 증가시키는 메소드
	 * 
	 * @param bNo
	 */
	public void updateHit(int bNo);

	/**
	 * 게시글 작성하는 메소드
	 * 
	 * @param board
	 */
	public void writeBoard(Board board);

	/**
	 * 현재 작성된 게시글의 번호를 가져오는 메소드
	 * 
	 * @return
	 */
	public int lastBoardNo();

	/**
	 * 이미지 정보를 저장하는 메소드
	 * 
	 * @param boardImg
	 */
	public void insertImgInfo(BoardImg boardImg);

	/**
	 * 삭제할 파일 정보를 가져온다.
	 * 
	 * @param bNo
	 * @return
	 */
	public List<BoardImg> deleteFileInfo(int bNo);

	/**
	 * 파일 정보를 DB에서 지운다.
	 * 
	 * @param bNo
	 */
	public void deleteBoardFile(int bNo);

	/**
	 * 게시판 정보를 DB에서 지운다.
	 * 
	 * @param bNo
	 */
	public void deleteBoard(int bNo);

	/**
	 * 게시판 작성 유저의 번호를 가져온다.
	 * 
	 * @param bNo
	 * @return
	 */
	public int selectBoardUno(int bNo);

	/**
	 * 게시판의 등록된 이미지 정보를 가져온다.
	 * 
	 * @param getbNo
	 * @return
	 */
	public List<BoardImg> selectBoardImgInfo(int getbNo);

	/**
	 * 게시글을 업데이트 하는 메소드
	 * 
	 * @param board
	 */
	public void updateBoard(Board board);

	/**
	 * 댓글을 작성하는 메소드
	 * 
	 * @param map
	 */
	public void writeComment(HashMap<String, Object> map);

	/**
	 * 댓글 리스트를 가져오는 메소드
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> selectCommentAll(HashMap<String, Object> map);

	/**
	 * 댓글을 삭제하는 메소드
	 * 
	 * @param cNo
	 */
	public void deleteComment(int cNo);

	/**
	 * 게시글 삭제시 해당 게시글의 댓글을 삭제하는 메소드
	 * 
	 * @param bNo
	 */
	public void deleteBoardComment(int bNo);

	/**
	 * 검색된 항목으로 게시글을 조회하는 메소드
	 * 
	 * @param map
	 * @return
	 */
	public int selectSearchCntBoard(HashMap<String, Object> map);

	/**
	 * 현재 게시글의 총 댓글 수를 가져오는 메소드
	 * 
	 * @param bNo
	 * @return
	 */
	public int selectCommentTotalCount(int bNo);

}
