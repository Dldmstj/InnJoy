package com.web.innjoy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	   @GetMapping("/sec/adm_user")
	   public String adn() {
	      return "admin/adm_user";
	   }
	   @GetMapping("/sec/adm_userreport")
	   public String adn3() {
	      return "admin/adm_userreport";
	   }
	   @GetMapping("/sec/adm_faq")
	   public String adn4() {
	      return "admin/adm_faq";
	   }
}
