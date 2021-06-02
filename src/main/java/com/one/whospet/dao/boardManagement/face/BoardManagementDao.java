package com.one.whospet.dao.boardManagement.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
import com.one.whospet.dto.User;

public interface BoardManagementDao {

	/**
	 *  검색한 내용 기준 게시글 수 체크하는 메소드
	 *  
	 * @param map
	 * @return
	 */
	public int selectSearchCntBoard(HashMap<String, Object> map);

	/**
	 *  검색없는 게시글의 수를 체크하는 메소드
	 * 
	 * @param bType
	 * @return
	 */
	public int selectCntBoard(String bType);

	/**
	 * 페이징에 맞는 게시글 리스트를 가져오는 메소드
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> selectAll(HashMap<String, Object> map);

	/**
	 * 게시글 상세 조회 정보를 가져오는 메소드
	 * 
	 * @param bNo
	 * @return
	 */
	public Board selectBoardInfo(int bNo);

	/**
	 * 댓글 정보를 가져오는 메소드
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> selectCommentAll(HashMap<String, Object> map);

	/**
	 * 총 댓글 수를 가져오는 메소드
	 * 
	 * @param bNo
	 * @return
	 */
	public int selectCommentTotalCount(int bNo);

	/**
	 * 게시글의 이미지 정보를 가져오는 메소드
	 * 
	 * @param getbNo
	 * @return
	 */
	public List<BoardImg> selectBoardImgInfo(int getbNo);

	/**
	 * 게시글 작성 유저의 정보를 가져오는 메소드
	 * 
	 * @param getuNo
	 * @return
	 */
	public User selectBoardWriterInfo(int getuNo);

	/**
	 * 댓글을 작성하는 메소드
	 * 
	 * @param map
	 */
	public void writeComment(HashMap<String, Object> map);

	/**
	 * 댓글을 삭제하는 메소드
	 * 
	 * @param cNo
	 */
	public void deleteComment(int cNo);

}
