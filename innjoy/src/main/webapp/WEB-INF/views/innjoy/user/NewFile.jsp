package com.web.innjoy.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.service.BsnService;
import com.web.innjoy.service.UserService;
import com.web.innjoy.vo.WishProPimg;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
   
   @Autowired
   private UserService userService;
   @Autowired
   private BsnService bsnService;   
   
   @RequestMapping("login")
   public String login() {
      return "user/login";
   }
   @RequestMapping("signup")
   public String signUp() {
      return "user/signUp";
   }
    @RequestMapping("/sec/mypage")
   public String signPage(HttpServletRequest request, Model model) {
       HttpSession session = request.getSession();
       String userId = (String) session.getAttribute("userId");
       Ij_User ij = userService.getProfile(userId);
       model.addAttribute("userInfo", ij);
       
       // 마이페이지 찜 리스트
       List<WishProPimg> wishProList = bsnService.wishProList(userId);
       model.addAttribute("wishProList", wishProList);
       
      return "user/myPage";
   }
    
    @RequestMapping("/sec/wishList")
   public String signPage2(HttpServletRequest request, Model model) {
       HttpSession session = request.getSession();
       String userId = (String) session.getAttribute("userId");

       
       // 마이페이지 찜 리스트
       List<WishProPimg> wishProList = bsnService.wishProList(userId);
       model.addAttribute("wishProList", wishProList);
       
      return "user/wishList";
   }    
    
   @RequestMapping("/sec/myboardlist")
   public String myBoardList() {
      return "user/myBoardList";
   }

}