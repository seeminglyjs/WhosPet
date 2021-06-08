package com.one.whospet.controller.shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.whospet.dto.Order;
import com.one.whospet.dto.Payment;
import com.one.whospet.dto.Shop;
import com.one.whospet.dto.ShopImg;
import com.one.whospet.dto.User;
import com.one.whospet.service.shop.face.ShopService;
import com.one.whospet.util.ShopPaging;

@Controller
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired ShopService shopService;
	
	//상품목록 [GET]
	@RequestMapping(value="/admin/shopList", method=RequestMethod.GET)
	public String adminShopList( ShopPaging inData, Model model ) {
		logger.info("/admin/shopList [GET]");
		logger.info("indata cccc {}", inData.getCurPage());
		
		//페이징 계산
		ShopPaging paging = shopService.getPaging( inData );
		logger.info("pagingbdhdhdghgdhgd: {}",paging);
		
		List<Shop> list = shopService.list( paging );
		logger.info(list.toString());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "admin/shopList";
	}
	
	//상품상세보기
	@RequestMapping(value="/admin/shopView")
	public void adminShopView(Shop viewShop, Model model) {
		logger.info("/admin/shopView	[GET]");
		
		//게시글 번호를 통해 상세페이지 띄우기
		logger.info("전달파라미터 shop : {}", viewShop);
		Shop view = shopService.view(viewShop);
		logger.info("view 정보 : {}", view);
		
		model.addAttribute("shop", view);
		
		int sNo = view.getsNo();
		//첨부파일 조회하기 (siThumbnail = "N" 인 부분)
		List<ShopImg> shopImg = (List<ShopImg>) shopService.getAttachFile( sNo );
		
		//썸네일 첨부파일 조회하기 ( siThumbnail = "Y" 인 부분)
		ShopImg thumbnail = (ShopImg) shopService.getAttachThumbnailFile(sNo);
		
		logger.info("shopImg 정보 : {}", shopImg);
		logger.info("thumbnail 정보 : {}", thumbnail);
		model.addAttribute("shopImg",  shopImg);
		model.addAttribute("thumbnail", thumbnail);
	}
	
	
	//상품등록 [GET]
	@RequestMapping(value="/admin/shopRegister", method=RequestMethod.GET )
	public void adminShopRegister() {
		logger.info("/admin/shopRegister [GET]");
	}
	
	//상품등록 [POST]
	@RequestMapping(value="/admin/shopRegister", method=RequestMethod.POST)
	public String adminShopRegisterProc(Shop shop, MultipartHttpServletRequest mtfRequest,HttpSession session) {
		logger.info("/admin/shopRegister [POST]");
		
		logger.info("전달파라미터 shop : {}", shop);
		logger.info("받아오는 file 정보 : {}", mtfRequest);
		logger.info("session 정보 : {}", session.getAttribute("login"));
		logger.info("session 정보 : {}", (User) session.getAttribute("user"));
			
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		MultipartFile thumbnail = mtfRequest.getFile("thumbnail");
		fileList.add(thumbnail);
		logger.info("fileList : {}", fileList);
		logger.info("thumbnail : {}", thumbnail);
		
		int uNo = ( (User) (session.getAttribute("user")) ).getuNo();
		shop.setuNo(uNo);
		
		logger.info("삽입할 shop : {}", shop);
		shopService.register(shop,fileList);
		
		return "redirect:/admin/shopList";
	}
	
	//수정
	@RequestMapping(value="/admin/shopUpdate", method=RequestMethod.GET)
	public void adminShopUpdate( Shop shop, Model model) {
		logger.info("/admin/shopUpdate [GET]");
		logger.info("전달 파라미터 shop : {}",shop);
		
		//상품 수정 정보
		Shop updateView = shopService.view(shop);
		logger.info("updateView 정보 : {}", updateView);
		
		model.addAttribute("updateView", updateView);
		
		//상품 다중 첨부파일
		List<ShopImg> shopImg = shopService.getAttachFile(shop.getsNo());
		logger.info("Update shopImg 정보 : {}",shopImg);
		model.addAttribute("shopImg", shopImg);
		
		//상품 섬네일 첨부파일
		ShopImg thumbnail = shopService.getAttachThumbnailFile(shop.getsNo());
		logger.info("Update thumbnail 정보 : {}",thumbnail);
		model.addAttribute("thumbnail", thumbnail);
		
	}
	
	//상품 수정  
	@RequestMapping(value="/admin/shopUpdate", method=RequestMethod.POST)
	public String adminShopUpdateProc( Shop shop, MultipartHttpServletRequest mtfRequest, @RequestParam(required=false) ArrayList<String> delFileList ) {
		logger.info("/admin/shopUpdate [POST]");
		logger.info("update.jsp에서 전달받은 shop : {}", shop);
		logger.info("update.jsp에서 전달받은 mtfRequest : {}", mtfRequest);
		
		//리스트타입으로 siNo 받아옴 (삭제할 이미지 데이터의 siNo값)
		logger.info("update.jsp에서 전달받은 delFileList {}", delFileList);
		
		//shopUpdate.jsp 에서 받은 파일들
		List<MultipartFile> newFileList = mtfRequest.getFiles("file");
		MultipartFile newThumbnail = mtfRequest.getFile("thumbnail");
		logger.info("newThumbnail : {}", newThumbnail);
		
		//새로운 섬네일 파일이 있으면 추가, 없으면 다중첨부파일만
		if( newThumbnail.getSize() != 0) {
			logger.info("if안 newThumbnail : {}", newThumbnail);
			
			newFileList.add(newThumbnail);
		}
		
		logger.info("추가할 fileList : {}", newFileList);
		logger.info("삭제할 fileList : {}", delFileList);
		
		//상품 수정
		shopService.updateShop( shop );
		shopService.updateNewFileList( shop , newFileList );
		if(delFileList != null) {
			shopService.updateDelFileList( delFileList );
		}
		
		return "redirect:/admin/shopList";
	}
	
	//상품 삭제 (선 파일 삭제 후, 상품정보 삭제)
	@RequestMapping(value="/admin/shopDelete", method=RequestMethod.GET)
	public String deleteShop(Shop shop) {
		logger.info("/admin/shopDelete [GET]");
		logger.info("shopDelete, shop : {}", shop);
		
		//sNo을 매개변수로 한 상품을 삭제하는 메소드
		shopService.deleteShop(shop);
		
//		shopService.delete
		
		return "redirect:/admin/shopList";
	}
	
	
	
	
	
	
	
	
	
	//------------------------------------------------------------
	//------------------------------------------------------------
	// 사용자
	
	//상품목록
	@RequestMapping(value="/shop/list", method=RequestMethod.GET)
	public void shopList( ShopPaging inData, Model model ) {
		logger.info("/shop/list [GET]");
		
		//페이징 계산
		ShopPaging paging = shopService.getPaging(inData);
		
		//상품 목록
		List<Shop> list = shopService.list(paging);
		logger.info("사용자 list : {}", list);
		
		//리스트, 페이징 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		//사용자 목록의 섬네일
		List<Integer> sNo = new ArrayList<Integer>();
		
		for( Shop i : list ) {
			sNo.add(i.getsNo());
		}
		logger.info("sNo만 뽑아낸 리스트 : {}", sNo);
		
		//사용자 목록의 섬네일 메소드
		List<ShopImg> userListThumbnail = shopService.getAttachThumbnailFiles( sNo );
		logger.info("UserListThumbnail만 뽑아낸 리스트 : {}", userListThumbnail);
		
		model.addAttribute("userListThumbnail", userListThumbnail);
		
	}
	
	
	//상품 상세보기
	@RequestMapping(value="/shop/view", method=RequestMethod.GET)
	public void shopView( Shop shop, Model model ) {
		logger.info("/shop/view [GET]");
		logger.info("/shop/view 에서 shop : {}", shop);

		Shop view = shopService.view(shop);
		logger.info("/shop/view 에서 view : {}", view	);
		
		int i = shop.getsNo();
		ShopImg thumbnail = shopService.getAttachThumbnailFile(i);
		List<ShopImg> shopImg = shopService.getAttachFile(i);
		
		model.addAttribute("shop", view);
		model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("shopImg", shopImg);
	}
	
	
	//------------------------------------------------------------
	//------------------------------------------------------------
	//장바구니
	
	@RequestMapping(value="/shop/basket", method=RequestMethod.POST)
	@ResponseBody
	public String basketAdd( Shop shop, HttpSession session ) {
		logger.info("/shop/basket [POST]");
		logger.info("/shop/basket, shop : {} ", shop);
		logger.info("/shop/basket, shop.getQuantity() : {} ", shop.getQuantity());
		logger.info("/shop/basket, session.getAttribute : {}", session.getAttribute("user"));
		User user = (User) session.getAttribute("user");
		int uNo = user.getuNo();
		
		//상품번호에 맞는 상품정보 받아오기
		Shop basketInfo = shopService.view(shop);
		//세션의 uNo을 장바구니에 담기
		basketInfo.setuNo(uNo);
		//장바구니에 담고자하는 수량을 장바구니 정보에 입력하기
		basketInfo.setQuantity(shop.getQuantity());
		logger.info("/shop/basket, basketInfo : {} ", basketInfo);
		
		int res = shopService.basketAdd(basketInfo);
		logger.info("res : {}",res);

		if( res > 0) {
			return "success";
		} 
		return "sss";
	}
	
	
	//------------------------------------------------------------
	//------------------------------------------------------------
	//주문하기 (상세페이지에서 구매하기 버튼 클릭시 해당 상품의 주문페이지로 이동)
	@RequestMapping(value="/shop/order", method=RequestMethod.GET)
	public void order( Shop shop, HttpSession session, Model model ) {
		logger.info("/shop/order [GET]");
		logger.info("/shop/order, shop : {}", shop);
		
		User user = (User) session.getAttribute("user");
		logger.info("/shop/order, user : {}", user);
		int uNo = user.getuNo();
		
		//주문시 자동으로 주문자정보에 사용자정보 얻어오기
		User userOrder = shopService.selectUserInfo(uNo); //주문자 정보
		logger.info("userOrder : {}", userOrder);
		
		//주문자 정보 전달
		model.addAttribute("userOrder", userOrder);
		
		
		logger.info("/shop/order, user : {}", user);
		//------- 구매하기 버튼 클릭시 장바구니에 자동으로 담기 -------------------------------------
		//
		//상품번호에 맞는 상품정보 받아오기
		Shop basketInfo = shopService.view(shop);	//주문 정보
		//세션의 uNo을 장바구니에 담기
		basketInfo.setuNo(uNo);
		//장바구니에 담고자하는 수량을 장바구니 정보에 입력하기
		basketInfo.setQuantity(shop.getQuantity());
		
		int totalAmount = basketInfo.getsAmount() * Integer.parseInt(basketInfo.getQuantity());
		basketInfo.setTotalAmount(Integer.toString(totalAmount));
		logger.info("/shop/basket, basketInfo : {} ", basketInfo);
		
		shopService.basketAdd(basketInfo);
		
		//주문정보 전달
		model.addAttribute("basketInfo", basketInfo);
		
	}
	
	
	//결제 후 로직
	@RequestMapping(value="/payments/complete", method=RequestMethod.POST)
	public String payment( Payment payment, Order orderdata, HttpSession session ) {
		logger.info("/payments/complete [POST]");
		logger.info("payment : {}", payment);
		
		//세션에서 유저번호 찾기
		User user = (User) session.getAttribute("user");
		logger.info("/shop/order, user : {}", user);
		int uNo = user.getuNo();
		
		//결제정보에 유저번호 저장
		payment.setuNo(uNo);
		
		//결제정보 추가
		shopService.addPayment(payment);
		logger.info("payment, pyNo : {}", payment.getPyNo());
		
		//주문정보에 pyNo(결제번호) 저장
		orderdata.setPyNo(payment.getPyNo());
		//주문정보에 유저번호 저장
		orderdata.setuNo(uNo);
		//주문정보
		logger.info("payment, orderData : {}",orderdata );
		//주문정보 주문테이블에 추가
		shopService.addOrder(orderdata);
		
		
		return "redirect:/shop/paymentCompleted";
	}
	
	@RequestMapping(value="/shop/paymentCompleted", method=RequestMethod.GET)
	public String paymentCompleted() {
		logger.info("/shop/paymentCompleted [GET]");
		
		return "shop/paymentCompleted2";
	}

	
	
	
	
	
	
}













