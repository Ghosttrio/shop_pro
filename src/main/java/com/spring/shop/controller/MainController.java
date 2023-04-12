package com.spring.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.LoginDTO;
import com.spring.shop.dto.ManagerDTO;
import com.spring.shop.service.LoginService;
import com.spring.shop.service.ManagerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	public ManagerService managerService;
	@Autowired
	public LoginService loginService;
	@Autowired
	public LoginDTO loginDTO;
	
	@Autowired
	public ManagerDTO managerDTO;
	
//	메인화면
	@GetMapping("/main")
	public String home(Model model, HttpSession session){
		System.out.println("메인 출력");
		
		
		
		List product_type = managerService.selectProduct_type();
		model.addAttribute("product_type",product_type);
		
		
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		
		
//		전체 상품 정보 출력
		List productList_all = managerService.selectProduct();
		model.addAttribute("productList_all",productList_all);
		
//		랭킹 출력
		List product_ranking = managerService.product_ranking();
		model.addAttribute("product_ranking",product_ranking);
		
		
		
		
		
		return "main/main";
	}
	
//	로그인
	@GetMapping("/login")
	public String login(){
		System.out.println("로그인 출력");
		return "login/login";
	}
	
//	회원가입
	@GetMapping("/signup")
	public String signup(){
		System.out.println("회원가입 출력");
		return "signup/signup";
	}
	
//	관리자페이지
	@GetMapping("/manager")
	public String manager_main(Model model){
		System.out.println("관리자페이지 메인 출력");	
		List productList = managerService.selectProduct();
		model.addAttribute("productList",productList);
		
		return "manager/manager";
	}
	 
//	관리자페이지 상품 추가
	@GetMapping("/add")
	public String manager_add(){
		System.out.println("관리자페이지 추가창 출력");
		return "manager/add";
	}
	
//	관리자페이지 상품 수정
	@GetMapping("/update")
	public String manager_update(Model model,
			@RequestParam("product_code") String product_code){
		System.out.println("관리자페이지 수정창 출력");
		
		List productList = managerService.selectProduct_update(product_code);
		model.addAttribute("productList",productList);
		return "manager/update";
	}

//	마이페이지(계정마다 출력)
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session){
		System.out.println("마이페이지 출력");
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		return "mypage/mypage";
	}
	
	
	
	
	
	
	
	
	
	
//	제품리스트(제품카테고리마다 출력)
	@GetMapping("/product")
	public String product(Model model, HttpSession session,
			@RequestParam("product_type") String product_type,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum
			){
		System.out.println("카테고리 : " + product_type + "출력");
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
//		페이징
		int section_ = Integer.parseInt(((section==null) ? "1" : section));
		int pageNum_ = Integer.parseInt(((pageNum==null) ? "1" : pageNum));
		
		int total_product = managerService.selectProduct_type(product_type);
		Map map = new HashMap();
		map.put("total_product", total_product);
		map.put("section", section_);
		map.put("pageNum", pageNum_);
		map.put("product_type", product_type);
		
		
		managerDTO.setSection(section_);
		managerDTO.setPageNum(pageNum_);
		managerDTO.setProduct_type(product_type);
		
		
		List productList = managerService.selectProduct_paging(managerDTO);
		/*
		 * articlesMap.put("section", section_); articlesMap.put("pageNum", pageNum_);
		 * model.addAttribute("articlesMap", articlesMap);
		 * model.addAttribute("memberList",session.getAttribute("id"));
		 */
		
		
		model.addAttribute("mapNum", map);
		model.addAttribute("productList", productList);
		
		return "product/product";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	제품상세(제품마다출력)
	@GetMapping("/info")
	public String info(Model model, HttpSession session,
			@RequestParam("product_code") String product_code,
//			리뷰페이징용 페이징 넘버
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum
			){
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		model.addAttribute("code", product_code);
		
		System.out.println("코드번호 : " + product_code + " 제품상세 출력");
		List productList = managerService.selectProduct(product_code);
		model.addAttribute("productList",productList);
		
		
//		리뷰창
		int section_ = Integer.parseInt(((section==null) ? "1" : section));
		int pageNum_ = Integer.parseInt(((pageNum==null) ? "1" : pageNum));
		managerDTO.setSection(section_);
		managerDTO.setPageNum(pageNum_);
		managerDTO.setProduct_code(product_code);
		
		List reviewList = managerService.selectReview(managerDTO);
		model.addAttribute("reviewList",reviewList);
		
		Double avg_rate = managerService.avg_rate(product_code);
		model.addAttribute("avg_rate", avg_rate);
		
		
		
		
		
		int total_review = managerService.total_review(product_code);
		Map map = new HashMap();
		map.put("total_review", total_review);
		map.put("section", section_);
		map.put("pageNum", pageNum_);
		map.put("product_code", product_code);
		model.addAttribute("mapNum", map);
		
		
		
		
		
		
		
		
		return "product/info";
	}
	
	
//	주문창
	@GetMapping("/order")
	public String order(Model model, HttpSession session,
			@RequestParam("code") String product_code,
			@RequestParam("total_price") String total_price,
			@RequestParam("product_num") String product_num,
			@RequestParam("size") String size
			){
		System.out.println("결제창출력");
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		
		List productList = managerService.selectProduct(product_code);
		model.addAttribute("productList", productList);
		
		
		List userInfo = loginService.selectMembers(sessionId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("total_price", total_price);
		model.addAttribute("product_num", product_num);
		model.addAttribute("size", size);
		
		return "pay/order";
	}
	
	
	
	
	
//	결제완료창
    @RequestMapping("/complete")
	public String complete(Model model, HttpSession session,
			@RequestParam Map<String, Object> map,
			@RequestParam(value="command", required=false) String command,
			@RequestParam(value="id", required=false) String id
			){
		
    	int leftLimit = 97; // letter 'a'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 10;
	    Random random = new Random();
	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	                                   .limit(targetStringLength)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    System.out.println(generatedString);
	    
	    map.put("order_id", generatedString);
    	
    	
		if(command==null) {
			System.out.println("결제완료창 출력");
			String sessionId = (String) session.getAttribute("id");
			model.addAttribute("loginInfo", sessionId);
			model.addAttribute("result", map);
			System.out.println(map.toString());
			List productList = managerService.selectProduct(map.get("product_code").toString());
			model.addAttribute("productList",productList);
//			주문내역 테이블에 인서트하기
			loginService.insert_order(map);
			return "pay/complete";
		}else {
			System.out.println("주문내역 출력");
			String sessionId = (String) session.getAttribute("id");
			model.addAttribute("loginInfo", sessionId);
			model.addAttribute("result", map);
			
			List orderInfo = loginService.order_list(id);
			model.addAttribute("orderInfo", orderInfo);
			return "mypage/mypage";
		}
		
	}
	
	
	

//	리뷰폼
	@GetMapping("/reviewForm")
	public String reviewForm(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code
			){
		System.out.println("리뷰작성창 출력");
		
		model.addAttribute("loginInfo", loginInfo);
		model.addAttribute("code", code);
		
		
		return "product/reviewForm";
	}
//	리뷰작성실행
	@GetMapping("/review.do")
	public String reviewDo(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code,
			@RequestParam("textarea") String textarea,
			@RequestParam("command") String command,
			@RequestParam(value="writer_rate", required=false) Integer writer_rate,
			@RequestParam(value="review_parentNum", required=false) Integer review_parentNum
			
			){
		System.out.println("리뷰작성실행");
		int review_max = loginService.review_max();
		
		if(command.equals("parent_review")) {
			loginDTO.setReview_max(review_max+1);
			loginDTO.setReview_parentNum(0);
			loginDTO.setReview_productId(code);
			loginDTO.setReview_userId(loginInfo);
			loginDTO.setReview_content(textarea);
			loginDTO.setReview_rate(writer_rate);
		} else if(command.equals("child_review")) {
			System.out.println(review_max);
			System.out.println(review_parentNum);
			System.out.println(code);
			System.out.println(loginInfo);
			System.out.println(textarea);
			
			
			loginDTO.setReview_max(review_max+1);
			loginDTO.setReview_parentNum(review_parentNum);
			loginDTO.setReview_productId(code);
			loginDTO.setReview_userId(loginInfo);
			loginDTO.setReview_content(textarea);
			loginDTO.setReview_rate(0);
		}
		
		
		loginService.insertReview(loginDTO);
		
		
		return "redirect:/info?product_code="+code;
	}

	
	
	
//	부모리뷰 업데이트창 실행
	@GetMapping("/reviewForm_update")
	public String reviewForm_update(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code,
			@RequestParam("review_num") int review_num
			){
		System.out.println("부모리뷰작성창 출력");
		
		model.addAttribute("loginInfo", loginInfo);
		model.addAttribute("code", code);
		
		List selectReview = loginService.selectReview(review_num);
		
		model.addAttribute("selectReview", selectReview);
		
		return "product/reviewUpdate";
	}
	


//	부모리뷰 업데이트창 실행
	@GetMapping("/reviewUpdate.do")
	public String parent_review_update(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code,
			@RequestParam("textarea") String textarea,
			@RequestParam("review_num") int review_num,
			@RequestParam(value="writer_rate", required=false) Integer writer_rate
			){
		System.out.println("부모리뷰 업데이트창 실행");
		
		loginDTO.setReview_num(review_num);
		loginDTO.setReview_parentNum(0);
		loginDTO.setReview_productId(code);
		loginDTO.setReview_userId(loginInfo);
		loginDTO.setReview_content(textarea);
		loginDTO.setReview_rate(writer_rate);
		loginService.updateReview(loginDTO);
		
		
		
		return "redirect:/info?product_code="+code;
	}

	
	
	
	//	리뷰삭제
	@GetMapping("/review_delete")
	public String reviewDo(Model model, HttpSession session,
			@RequestParam("code") String code,
			@RequestParam("review_num") int review_num
			){
		System.out.println("리뷰삭제");
		
		loginService.reviewDelete(review_num);
		return "redirect:/info?product_code="+code;
	}
	

}
