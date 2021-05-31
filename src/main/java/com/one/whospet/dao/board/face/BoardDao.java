package com.one.whospet.dao.board.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
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
	 * @param boardNo
	 * @return
	 */
	public List<BoardImg> deleteFileInfo(int boardNo);

	/**
	 * 파일 정보를 DB에서 지운다.
	 * 
	 * @param boardNo
	 */
	public void deleteBoardFile(int boardNo);

	/**
	 * 게시판 정보를 DB에서 지운다.
	 * 
	 * @param boardNo
	 */
	public void deleteBoard(int boardNo);

	/**
	 * 게시판 작성 유저의 번호를 가져온다.
	 * 
	 * @param boardNo
	 * @return
	 */
	public int selectBoardUno(int boardNo);

	/**
	 * 게시판의 등록된 이미지 정보를 가져온다.
	 * 
	 * @param getbNo
	 * @return
	 */
	public List<BoardImg> selectBoardImgInfo(int getbNo);

}
