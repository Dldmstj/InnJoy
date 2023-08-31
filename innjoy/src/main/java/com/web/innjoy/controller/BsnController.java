package com.web.innjoy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.innjoy.model.Bsn_User;
import com.web.innjoy.service.BsnService;
import com.web.innjoy.service.ProductService;
import com.web.innjoy.service.UserService;
import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.ProRoom;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.Reservation;
import com.web.innjoy.vo.Room;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BsnController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	// 사업자 로그인 > 숙소 등록 현황
	@RequestMapping("/sec/bsnuser")
    public String bsnuser(Model d, HttpSession s,
    					  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
        bsn_id = (String) s.getAttribute("bsnId");
        List<Product> bsnuser = productService.bsnuser(bsn_id);
        d.addAttribute("bsnuser", bsnuser);
        return "bsn/bsn_acc_list";
    }
	// 사업자 로그인 > 숙소 등록 현황 > 숙소 정보
	@RequestMapping("/sec/roomList")
	public String roomList(@ModelAttribute("sch") Room sch, Model d) {
		d.addAttribute("roomList", productService.roomList(sch));
		return "bsn/bsn_acc_list_detail";
	}
	// 사업자 로그인 > 숙소 등록 현황 > 숙소 정보 > 객실 정보
	@GetMapping("/sec/roomDetail")
	public String roomDetail(@RequestParam("room_id") int room_id, 
								Model d) {
		d.addAttribute("roomDetail", productService.roomDetail(room_id));
		return "bsn/bsn_acc_list_detail_roomDetail";
	}
	// 사업자 로그인 > 후기관리메인
	@RequestMapping("/sec/reviewList")
	public String reviewList(Model d, HttpSession s,
			  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
		bsn_id = (String) s.getAttribute("bsnId");
        List<Product> bsnuser = productService.bsnuser(bsn_id);
        d.addAttribute("bsnuser", bsnuser);
		return "bsn/bsn_review_list";
	}
	// 	사업자 로그인 > 후기관리메인 > 후기상세
	@GetMapping("/sec/reviewDetail")
	public String reviewDetail(@RequestParam("pro_id") int pro_id, 
			Model d) {
		List<BsnReviewMng> reviewDetail = productService.reviewDetail(pro_id);
		d.addAttribute("reviewDetail", reviewDetail);
		return "bsn/bsn_review_list_detail";
	}
	
	
	
	
	
	
	@RequestMapping("/sec/productInsertFrm")
	public String productInsertFrm(Product ins) {
		return "bsn/bsn_acc_regi";
	}
	@RequestMapping("productInsertFrm2")
	public String productInsertFrm2(Room ins) {
		return "bsn/bsn_acc_regi2";
	}
	
	// 숙소등록 DB 처리
	@RequestMapping("/sec/productInsert")
	public String productInsert(Product ins, Model d) {
		d.addAttribute("msg", productService.insertProduct(ins));
		return "bsn/bsn_acc_regi2";
	}
	// 숙소등록 DB 처리
	@RequestMapping("/sec/productInsert2")
	public String productInsert2(Room ins, Model d) {
		d.addAttribute("msg", productService.insertRoom(ins));
		return "bsn/bsn_acc_regi2";
	}
//	@RequestMapping("productInsert")
//    public String productInsert(Product insertProduct, Room insertRoom, Model d) {
//        String insertResult = productService.insertProductAndRoom(insertProduct, insertRoom);
//        
//        // Handle insertion result here and add appropriate message to the model
//        
//        return "bsn/bsn_acc_regi";
//    }
	
	@RequestMapping("/sec/bsnMypage")
	public String bstMyPage() {
		return "bsn/bsn_myPage";
	}

	
    @Autowired
    private BsnService bsnService;
    
    // 사업자페이지 > 메인페이지 > 예약관리
    @RequestMapping("/sec/bsn_res")
    public String bsn_res(Model d, HttpSession s,
    					  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
        bsn_id = (String) s.getAttribute("bsnId");
        List<ProRoom> bsn_res = bsnService.bsn_res(bsn_id);
        d.addAttribute("bsn_res", bsn_res);
        return "bsn/bsn_res";
    }
    
    // 캘린더 예약 리스트
    @RequestMapping("/sec/calList")
    public ResponseEntity<List<Map<String, Object>>> calList(
        @RequestParam(name = "room_id", required = false) int room_id) {
        List<Reservation> reservations = bsnService.calList(room_id);
        List<Map<String, Object>> calendarEvents = new ArrayList<>();

        for (Reservation reservation : reservations) {
            Map<String, Object> event = new HashMap<>();
            event.put("title", getStatusText(reservation.getStatus()));
            event.put("start", reservation.getStart_dt());
            event.put("end", reservation.getEnd_dt());
            event.put("reservation_id", reservation.getReservation_id());
            
            calendarEvents.add(event);
        }
        return ResponseEntity.ok(calendarEvents);
    }

    private String getStatusText(int status) {
        switch (status) {
            case 0:
                return "예약문의";
            case 1:
                return "예약확정";
            case 2:
                return "예약취소(사용자)";
            case 3:
                return "예약취소(사업자)";
            case 4:
                return "이용완료";
            default:
                return "상태없음";
        }
    }

    @GetMapping("/sec/resDetModal")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> resDetModal
    						(@RequestParam("reservation_id") int reservation_id) {
        Map<String, Object> resDetModal = bsnService.resDetModal(reservation_id);
        return ResponseEntity.ok(resDetModal);
    }
    
    // 예약 취소
    @PostMapping("/sec/resCancle")
    @ResponseBody
    public String resCancle(@RequestBody Map<String, Integer> requestData) {
        int reservation_id = requestData.get("reservation_id");
        // Call your service method to update the reservation status
        bsnService.resCancle(reservation_id);
        
        return "예약 취소 성공";
    }
    
    // 예약 확정
    @PostMapping("/sec/resConf")
    @ResponseBody
    public String resConf(@RequestBody Map<String, Integer> requestData) {
        int reservation_id = requestData.get("reservation_id");
        // Call your service method to update the reservation status
        bsnService.resConf(reservation_id);
        
        return "예약 확정 성공";
    }
    
    // 이용 완료
    @PostMapping("/sec/resUse")
    @ResponseBody
    public String resUse(@RequestBody Map<String, Integer> requestData) {
        int reservation_id = requestData.get("reservation_id");
        // Call your service method to update the reservation status
        bsnService.resUse(reservation_id);
        
        return "이용 완료 성공";
    }
    
    
	// 사업자페이지 > 마이페이지 > 계정확인
	// http://localhost:5050/login
	// http://localhost:5050/bsn_acc
	@GetMapping("/sec/bsn_acc")
	public String bsn_acc(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String bsnId = (String) session.getAttribute("bsnId");
		
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		
		return "bsn/bsn_acc";
	}

	// 사업자페이지 > 마이페이지 > 계정수정
	// http://localhost:5050/bsn_acc_corr
	@GetMapping("/sec/bsn_acc_corr")
	public String bsn_acc_corr(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String bsnId = (String) session.getAttribute("bsnId");
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		return "bsn/bsn_acc_corr";
	}

	// 사업자페이지 > 마이페이지 > 이용확인
	// http://localhost:5050/bsn_con
	@GetMapping("/sec/bsn_con")
	public String bsn_con() {
		return "bsn/bsn_con";
	}

	// 사업자페이지 > 마이페이지 > 문의
	// http://localhost:s/bsn_inq
	@GetMapping("/sec/bsn_inq")
	public String bsn_inq() {
		return "bsn/bsn_inq";
	}

}
