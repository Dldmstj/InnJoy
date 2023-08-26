package com.web.innjoy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.innjoy.model.Bsn_User;
import com.web.innjoy.service.BsnService;
import com.web.innjoy.service.UserService;
import com.web.innjoy.vo.ProRoom;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BsnController {

	@Autowired
	private UserService userService;

	@RequestMapping("bsnMypage")
	public String bstMyPage() {
		return "bsn/bsn_myPage";
	}

	@RequestMapping("regiAll")
	public String regiAll() {
		return "bsn/accommodation_registration_all";
	}

	@RequestMapping("regi1")
	public String regi1() {
		return "bsn/accommodation_registration";
	}

	@RequestMapping("regi2")
	public String regi2() {
		return "bsn/accommodation_registration2";
	}

	@RequestMapping("regi3")
	public String regi3() {
		return "bsn/accommodation_registration3";
	}

	@RequestMapping("bsnList")
	public String bsnList() {
		return "bsn/accommodation_list";
	}

	@RequestMapping("bsnListDetail")
	public String bsnListDetail() {
		return "bsn/accommodation_list_detail";
	}

	@RequestMapping("bsnListRoomDetail")
	public String bsnListRoomDetail() {
		return "bsn/accommodation_list_roomDetail";
	}

	@RequestMapping("bsnReviewMng")
	public String bsnReviewMng() {
		return "bsn/accommodation_reviewMng";
	}

	@RequestMapping("bsnReviewDetail")
	public String bsnReviewDetail() {
		return "bsn/accommodation_reviewDetail";
	}

	
    @Autowired
    private BsnService bsnService;

    @GetMapping("/bsn_res")
    public String bsn_res(Model model, HttpSession session) {
        String bsn_id = (String) session.getAttribute("bsnId");

        List<ProRoom> rooms = bsnService.getRoomsByBsnId(bsn_id);
        model.addAttribute("rooms", rooms);

        return "bsn/bsn_res";
    }

	// 사업자페이지 > 마이페이지 > 계정확인
	@GetMapping("bsn_acc")
	public String bsn_acc(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String bsnId = (String) session.getAttribute("bsnId");
		
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		
		return "bsn/bsn_acc";
	}

	// 사업자페이지 > 마이페이지 > 계정수정
	@GetMapping("bsn_acc_corr")
	public String bsn_acc_corr(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String bsnId = (String) session.getAttribute("bsnId");
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		return "bsn/bsn_acc_corr";
	}

	// 사업자페이지 > 마이페이지 > 이용확인
	// http://localhost:5050/bsn_con
	@GetMapping("bsn_con")
	public String bsn_con() {
		return "bsn/bsn_con";
	}

	// 사업자페이지 > 마이페이지 > 문의
	// http://localhost:s/bsn_inq
	@GetMapping("bsn_inq")
	public String bsn_inq() {
		return "bsn/bsn_inq";
	}

}
