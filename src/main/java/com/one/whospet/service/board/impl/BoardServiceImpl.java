package com.one.whospet.service.board.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.whospet.dao.board.face.BoardDao;
import com.one.whospet.dto.Board;
import com.one.whospet.dto.BoardImg;
import com.one.whospet.dto.User;
import com.one.whospet.service.board.face.BoardService;
import com.one.whospet.util.BoardPaging;

@Service
public class BoardServiceImpl implements BoardService {

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	// board Dao 의존성 주입
	@Autowired
	BoardDao boardDao;
	
	//서블릿 컨텍스트 객체
	// 의존성주입으로 바로 사용가능한 상태로 얻어온다
	@Autowired 
	ServletContext context;
	
	@Override // 페이징을 구하는 메소드
	public BoardPaging getPaging(HttpServletRequest request) {
		
		String param = request.getParameter("curPage");
		int curPage = 0;
		
		// 파라미터 정보가 있는지 없는지 체크
		if(param != null && !param.equals("")) {
			curPage = Integer.parseInt(param);
		};
		
		// 전체 게시글 수를 가져오는 메소드
		int totalCount = boardDao.selectCntBoard();
		
		BoardPaging paging = new BoardPaging(totalCount, curPage);
		
		return paging;
	}
	
	@Override // 게시글 리스트를 가져오는 메소드
	public List<HashMap<String, Object>>  getList(BoardPaging paging) {
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>> ();

		list = boardDao.selectAll(paging);

		return list;
	}
	
	@Override // 게시글 상세조회 정보를 가져오는 메소드
	public Board detailBoard(int boardNo) {
		
		Board board = boardDao.selectBoardInfo(boardNo);
		
		return board;
	}
	
	
	@Override // 게시글 작성 유저의 정보를 가져오는 메소드
	public User getBoardWriterInfo(int getuNo) {
		
		User user = boardDao.selectBoardWriterInfo(getuNo);
		
		return user;
	}
	
	@Override //게시글 조회수를 증가시키는 메소드
	public void updateHit(int boardNo) {
		
		boardDao.updateHit(boardNo);
	}
	
	@Override // 게시글을 작성하는 메소드
	@Transactional // 트랜섹션
	public void writeBoard(MultipartHttpServletRequest fileRequest, User user) {
		
		// 파라미터 정보 보드에 저장
		Board board = new Board();
		board.setbTitle(fileRequest.getParameter("title"));
		board.setbContent(fileRequest.getParameter("content"));
		board.setbType(fileRequest.getParameter("category"));
		board.setuNo(user.getuNo());
		
		// 만약에 내용을 등록하지 않았으면 제목과 동일하게 지정
		if(board.getbContent() == null || board.getbContent().equals("<p><br></p>") ) {
			board.setbContent(board.getbTitle());
		}
		
		//게시글 작성
		boardDao.writeBoard(board);
		
		//첨부 파일 정보 리스트로 받는다.
		List<MultipartFile> fileList = fileRequest.getFiles("file");
		logger.info("{}",fileList.isEmpty());
		
		//첨부파일이 null이거나 없으면 게시글 파일이 없으면 작성 끝
		if(fileList == null || fileList.isEmpty()) {
			return;
		}else {
			//첨부 파일 숫자 만큼 반복한다.
			for(int i = 0; i < fileList.size(); i++) {
				
				if(fileList.get(i).getOriginalFilename() == null || fileList.get(i).getOriginalFilename().equals("")) {
					return;
				}
				
				//파일이 있는 경우

				//파일의 저장될 경로 지정
				String storePath = context.getRealPath("upload");

				//파일경로가 만들어져 있는지 체크
				File stored = new File(storePath);
				if(!stored.exists()) {
					stored.mkdir(); //없으면 파일 생성
				}

				//저장될 파일이름 설정
				String filename = fileList.get(i).getOriginalFilename(); // 원본이름 가져오기

				//컨텐츠타입저장(문자열 뒤에서 자르기)
				String contentType = filename.substring(filename.lastIndexOf("."));

				//uuid 값 가져온다.
				String uid = UUID.randomUUID().toString().split("-")[4];

				//파일이름에 uuid 값을 더한다.
				filename += uid;
				
				//확장자 명을 더한다.
				filename += contentType;

				//저장될 파일 정보객체
				File dest = new File(stored, filename); // 저장 경로와 저장파일 설정
				

				try {// 업로드된 파일을 저장(변환)한다
					fileList.get(i).transferTo(dest); 
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				int boardNo = boardDao.lastBoardNo();


				//파일 정보 객체 저장
				BoardImg boardImg = new BoardImg();

				boardImg.setBiOriginFilename(fileList.get(i).getOriginalFilename());
				boardImg.setBiStoredFilename(filename);
				boardImg.setbNo(boardNo);
				boardImg.setBiContentType(contentType);
				boardImg.setBiSize(fileList.get(i).getSize());
				
				//파일 정보 저장
				boardDao.insertImgInfo(boardImg);

			}
		}
	}
	
	
	@Override // 게시글을 삭제하는 메소드
	@Transactional // 
	public void deleteBoard(int boardNo) {
		
		//게시글을 조회 한다.
		Board board = boardDao.selectBoardInfo(boardNo);
		
		//만약에 게시글이 없으면 리턴
		if(board == null) {
			return;
		}
		
		//삭제할 파일 정보를 가져온다.
		List<BoardImg> list = boardDao.deleteFileInfo(boardNo);
		
		//저장된 파일정보가 null이 아니고 리스트가 비어있지 않으면 실행
		if(list != null && !list.isEmpty()) {
			for(int i = 0; i < list.size(); i++) {
				//파일 경로 지정
				String path = context.getRealPath("upload");
				
				//현재 게시판에 존재하는 파일객체를 만듬
				File file = new File(path + "\\" + list.get(i).getBiStoredFilename());
				
				if(file.exists()) { // 파일이 존재하면
					file.delete(); // 파일 삭제	
				}
			}
			
			//저장된 파일을 모두 제거한 후 DB 에서도 지운다.
			boardDao.deleteBoardFile(boardNo);
		}	
			
		//파일 정보가 모두 삭제되면 게시판 정보도 지운다.	
		boardDao.deleteBoard(boardNo);
		
	}
	
	@Override // 게시글 작성유저의 번호를 가져온다.
	public int getBoardWriterUno(int boardNo) {		
		int uNo = 0;	
		uNo = boardDao.selectBoardUno(boardNo);
		return uNo;
	}
	
	@Override // 게시글에 포함된 이미지 정보를 가져온다.
	public List<BoardImg> getBoardImgInfo(Board board) {
		
		List<BoardImg> imgList = new ArrayList<BoardImg>();
		
		imgList = boardDao.selectBoardImgInfo(board.getbNo());
		
		
		return imgList;
	}
	
	
}
