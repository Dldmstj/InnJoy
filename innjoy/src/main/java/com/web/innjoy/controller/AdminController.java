package com.web.innjoy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.innjoy.service.AdminService;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.MailSender;
import com.web.innjoy.vo.User;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@GetMapping("/sec/header")
	public String head() {
		return "header/adm_header";
	}
	@GetMapping("/sec/adm_faq")
	public String adn4() {
		return "admin/adm_faq";
	}
	
	@GetMapping("user_faq")
	public String user4() {
		return "user/user_faq";
	}

	// 일반회원 목록
	@GetMapping("/sec/adm_user")
	public String adm_user(Model model) {
		List<User> userList = service.getAllUsers();
		model.addAttribute("userList", userList);
		return "admin/adm_ijuser";
	}

	// 일반회원 메일링 초기화면 로딩
	@GetMapping("/sec/ijuser_mailForm")
	public String mailForm(@RequestParam("user_id") String user_id, Model d) {
		d.addAttribute("user", service.getId(user_id));
		return "admin/adm_ijuser_mailForm";
	}
	// 일반회원 메일발송 처리
	@PostMapping("/sec/ijuser_mailSend")
	public String mailSend(MailSender mailForm, Model model) {
		service.sendMail(mailForm);
		model.addAttribute("successMessage", "메일 전송 성공");
		return "admin/adm_ijuser_mailForm";
	}

	// 일반회원 신고목록..
	@GetMapping("/sec/adm_ijuser_report")
	public String adm_ijreport(Model model) {
		List<User> userList = service.getAllUsers();
		model.addAttribute("userList", userList);
		return "admin/adm_ijuser_report";
	}

	// 탈퇴
	@GetMapping("/sec/userBan")
	public String userBan(@RequestParam("user_id") String user_id, Model d) {
		d.addAttribute("msg", service.ijuserDelete(user_id));
		return "redirect:/adm_ijuser_report";
	}

	// 사업자회원!!
	// 사업자회원 목록
	@GetMapping("/sec/adm_bsnuser")
	public String adm_bsnuser(Model model) {
		List<Bsn_user> bsnList = service.getBsnUsers();
		model.addAttribute("bsnList", bsnList);
		return "admin/adm_bsnuser";
	}

	// 일반회원 메일링 초기화면 로딩
	@GetMapping("/sec/bsnuser_mailForm")
	public String bsnmailForm(@RequestParam("bsn_id") String bsn_id, Model d) {
		d.addAttribute("bsnuser", service.getBsnId(bsn_id));
		return "admin/adm_bsnuser_mailForm";
	}

	// 메일발송 처리
	@PostMapping("/sec/bsnuser_mailSend")
	public String bsnmailSend(MailSender mailForm, Model model) {
		service.sendMail(mailForm);
		model.addAttribute("successMessage", "메일 전송 성공");
		return "admin/adm_bsnuser_mailForm";
	}

	// 사업자회원 신고목록..
	@GetMapping("/sec/adm_bsnuser_report")
	public String adm_bsnreport(Model model) {
		List<Bsn_user> bsnList = service.getBsnUsers();
		model.addAttribute("bsnList", bsnList);
		return "admin/adm_bsnuser_report";
	}

	// 사업자회원 탈퇴
	@GetMapping("/sec/bsnuserBan")
	public String bsnuserBan(@RequestParam("bsn_id") String bsn_id, Model d) {
		d.addAttribute("msg", service.bsnuserDelete(bsn_id));
		return "redirect:/adm_bsnuser_report";
	}
}
