package com.one.whospet.dao.board.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Board;
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

}
