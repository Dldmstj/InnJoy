package com.web.innjoy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.AdmDao;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.MailSender;
import com.web.innjoy.vo.User;

@Service
public class AdminService {
	@Autowired
	private AdmDao dao;
	@Autowired(required = false)
	private JavaMailSender sender;

	//일반회원
	//회원 목록
	
	public List<User> getAllUsers() {
		return dao.ijList();
	}

	// 특정 회원 정보
	public User getId(String ij_user) {
		return dao.getId(ij_user);
	}
	//메일링
	public void sendMail(MailSender mailForm) {

		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

		simpleMailMessage.setTo(mailForm.getReceiver());
		simpleMailMessage.setSubject(mailForm.getTitle());
		simpleMailMessage.setText(mailForm.getContent());

		sender.send(simpleMailMessage);
	}
	//회원 탈퇴
	public String ijuserDelete(String user_id) {
		return dao.ijuserDelete(user_id) > 0 ? "탈퇴 처리되었습니다." : "탈퇴되지 않았습니다.";
	}

	//사업자회원
	// 회원 목록
	public List<Bsn_user> getBsnUsers() {
		return dao.bsnList();
	}

	// 특정 회원 정보
	public Bsn_user getBsnId(String bsn_id) {
		return dao.getBsnId(bsn_id);
	}
/*
	public void sendMail(MailSender mailForm) {

		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

		simpleMailMessage.setTo(mailForm.getReceiver());
		simpleMailMessage.setSubject(mailForm.getTitle());
		simpleMailMessage.setText(mailForm.getContent());

		sender.send(simpleMailMessage);
	}
*/
	public String bsnuserDelete(String bsn_id) {
		return dao.bsnuserDelete(bsn_id) > 0 ? "탈퇴 처리되었습니다." : "탈퇴되지 않았습니다.";
	}
}
