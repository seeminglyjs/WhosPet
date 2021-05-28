package com.one.whospet.dao.board.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.User;
import com.one.whospet.util.BoardPaging;

public interface BoardDao {

	/**
	 *  게시글의 전체수를 조회한다
	 *  
	 * @return
	 */
	public int selectCntBoard();

	/**
	 * 게시글 전체를 가져온다.
	 * 
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> selectAll(BoardPaging paging);

	/**
	 * 게시글의 상세 정보를 가져온다.
	 * 
	 * @param boardNo
	 * @return
	 */
	public Board selectBoardInfo(int boardNo);

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
	 * @param boardNo
	 */
	public void updateHit(int boardNo);

}
