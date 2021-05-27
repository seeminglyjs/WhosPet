package com.one.whospet.service.board.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.one.whospet.dto.Board;
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

}
