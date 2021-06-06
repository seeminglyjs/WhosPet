package com.one.whospet.service.shop.face;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.Shop;
import com.one.whospet.dto.ShopImg;
import com.one.whospet.util.ShopPaging;

public interface ShopService {

	
	/**
	 * 쇼핑몰 목록을 위한 페이징 객체를 생성한다
	 * 파라미터 객체의 curPage(현재 페이지)와 DB에서 조회한 totalCount(총 게시글 수)를 이용한다
	 * 
	 * @param indata - curPage(현제페이지)를 저장하고 있는 Paging 객체
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	public ShopPaging getPaging(ShopPaging inData);

	/**
	 * 페이징 처리된 쇼핑몰 목록
	 * 
	 * @param paging 페이징 처리 객체
	 * @return 페이징 처리된 쇼핑몰 목록
	 */
	public List<Shop> list(ShopPaging paging);

	/**
	 * 상품번호를 통해 상품상세정보 객체 얻기
	 * 
	 * @param shop 쿼리스트링으로 게시글 번호를 전달받은 객체
	 */
	public Shop view(Shop viewShop);

	/**
	 * 상품번호에 맞는 상품이미지 정보 얻기
	 * 
	 * @param sNo 상품번호
	 * @return 상품번호에 맞는 이미지 정보
	 */
	public List<ShopImg> getAttachFile(int sNo);

	/**
	 * 상품번호에 맞는 섬네일 객체 정보 얻기
	 * 
	 * @param sNo 상품번호
	 * @return 상품번호에 맞는 이미지 정보
	 */
	public ShopImg getAttachThumbnailFile(int sNo);


	
	/**
	 * 리스트의 상품번호들을 이용해 사용자 목록에 보일 섬네일 얻기
	 * 
	 * @param sNo 리스트의 상품번호들
	 * @return 상품번호들에 해당하는 섬네일
	 */
	public List<ShopImg> getAttachThumbnailFiles(List<Integer> sNo);
	
	/**
	 * 상품등록하기
	 * 
	 * @param uNo 로그인정보의 유저번호
	 */
	public void register(Shop shop, List<MultipartFile> fileList);

	
	/**
	 * 수정페이지에서 전달받은 정보들 DB에 저장하기
	 * 
	 * @param shop 수정될 상품정보
	 */
	public void updateShop(Shop shop);

	/**
	 * 수정페이지에서 전달받은 정보들 DB에 저장하기
	 * 
	 * @param newFileList 수정시 추가될 첨부파일 정보
	 */
	public void updateNewFileList( Shop shop , List<MultipartFile> newFileList);

	/**
	 * 수정페이지에서 전달받은 정보들 DB에 저장하기
	 * 
	 * @param delFileList 수정시 삭제될 첨부파일 siNo
	 */
	public void updateDelFileList(ArrayList<String> delFileList);

	/**
	 * 상품을 삭제하는메소
	 * 
	 * @param shop sNo 상품의 상품번호
	 */
	public void deleteShop(Shop shop);

	
	/**
	 * 변경된 수량 + 상품정보가 담긴 장바구니 정보 DB에 삽입하기
	 * 
	 * @param basketInfo 장바구니 정보
	 */
	public int basketAdd(Shop basketInfo);

	


}
