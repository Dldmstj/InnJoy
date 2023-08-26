package com.web.innjoy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	@GetMapping("chatting")
	public String chatting() {
		return "user/chatting";
	}
	@RequestMapping("header")
	public String header() {
		return "header/user_header";
	}
}