package com.one.whospet.service.shop.face;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.Order;
import com.one.whospet.dto.Payment;
import com.one.whospet.dto.Shop;
import com.one.whospet.dto.ShopImg;
import com.one.whospet.dto.User;
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

	
	/**
	 * 로그인한 유저정보 얻기
	 * 
	 * @param uNo 세션에 있는 유저번호
	 * @return 
	 */
	public User selectUserInfo(int uNo);

	
	/**
	 * 결제테이블에 결제정보 추가하기
	 * 
	 * @param payment 추가할 결제정보
	 */
	public void addPayment(Payment payment);

	
	/**
	 * 주문테이블에 주문정보 추가하기
	 * 
	 * @param orderdata 추가할 주문정보
	 */
	public void addOrder(Order orderdata);
	
	/**
	
	 * 유저번호에 해당하는 결제번호 찾기
	 * 
	 * @param uNo 유저번호
	 * @return 결제번호
	 */
	public Payment getPyNo(int uNo);

	
	/**
	 * 주문정보 조회하기
	 * 
	 * @param uNo 유저번호
	 * @return 주문정보
	 */
	public Order getOrder(int pyNo);

	
	/**
	 * 결제정보 조회하기
	 * 
	 * @param pyNo 결제번호
	 * @return 결제정보
	 */
	public Payment getPayment(int pyNo);

	
	/**
	 * 상품번호에 해당하는 상품정보 찾기
	 * 
	 * @param sNo 상품번호
	 * @return 상품정보
	 */
	public Shop getShop(int sNo);

	
	/**
	 * 유저번호에 해당하는 유저정보 찾기
	 * 
	 * @param uNo 유저번호
	 * @return 유저번호
	 */
	public User getUser(int uNo);

	
	/**
	 * 장바구니에 정보가 담겨져있는지 체크
	 * 
	 * @param basketInfo sNo이 담겨져있는 장바구니정보
	 * @return 있으면 1 없으면 0
	 */
	public int checkSNo(Shop basketInfo);

	
	/**
	 * 장바구니 정보 업데이트
	 * 
	 * @param basketInfo 장바구니정보
	 */
	public int basketUpdate(Shop basketInfo);

	
	/**
	 * 상품번호 해당하는 상품 장바구니에서 삭제하기
	 * 
	 * @param sNo 상품번호
	 */
	public void deleteBasket(int sNo);

	
	/**
	 * 결제정보의 결제상태를 'F' -> 'C' 
	 * 
	 * @param imp_uid 
	 */
	public void updatePayment(String imp_uid);

	



	


}
