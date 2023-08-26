package com.web.innjoy.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Reservation;
import com.web.innjoy.model.Review;
import com.web.innjoy.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// 메인
	@RequestMapping("main")
	public String main() {
		return "user/main";
	}

	// 로그인
	@RequestMapping("login")
	public String login() {
		return "user/login";
	}
	
	// 로그인
	@RequestMapping("login_auth")
	public String loginAuth() {
		return "user/login_auth";
	}
	
	// 회원가입
	@RequestMapping("signup")
	public String signUp() {
		return "user/signUp";
	}
	
	// 마이페이지
    @RequestMapping("/sec/mypage")
	public String signPage(HttpServletRequest request, Model model) {
    	HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    Ij_User user = (Ij_User) session.getAttribute("ij_user");
//	     model : user객체
	    Ij_User ij = userService.getProfile(userId);
	    model.addAttribute("userInfo", ij);
	    // model : 나의 예약 리스트
	    List<Reservation> rlist = userService.getMyResList(user);
	    model.addAttribute("rlist", rlist);	// model : reservation List
		return "user/myPage";
	}
    
    // 내 활동 내역
	@RequestMapping("/sec/myboardlist")
	public String myBoardList(HttpSession session, Model model) {
		Ij_User user = (Ij_User) session.getAttribute("ij_User");
		List<Reservation> rlist = userService.getMyResList(user);
		model.addAttribute("rlist",rlist);
		return "user/myBoardList";
	}
	
	// 예약내역 상세보기
	@RequestMapping("product_detail")
	public String product_detail() {
		return "user/product_detail";
	}

}