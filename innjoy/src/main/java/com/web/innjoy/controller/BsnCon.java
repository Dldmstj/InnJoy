package com.web.innjoy.controller;

import java.util.List;

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
import com.web.innjoy.service.ProductService;
import com.web.innjoy.service.UserService;
import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.Pro_img;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductIns;
import com.web.innjoy.vo.Review_comm;
import com.web.innjoy.vo.Room;
import com.web.innjoy.vo.RoomIns;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class BsnCon {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	// 사업자 로그인 > 숙소 등록 현황
	@RequestMapping("bsnuser")
    public String bsnuser(Model d, HttpSession s,
    					  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
		bsn_id = (String) s.getAttribute("bsnId");
        List<Product> bsnuser = productService.bsnuser(bsn_id);
        d.addAttribute("bsnuser", bsnuser);
        return "bsn/bsn_acc_list";
    }
	// 사업자 로그인 > 숙소 등록 현황 > 숙소 정보
	@RequestMapping("roomList")
	public String roomList(@ModelAttribute("sch") Room sch,
							@RequestParam("pro_id") int pro_id,
							Model d) {
		d.addAttribute("roomList", productService.roomList(sch));
		d.addAttribute("bsnprdInfo", productService.bsnprdInfo(pro_id));
		return "bsn/bsn_acc_list_detail";
	}
//	@RequestMapping("roomList")
//	public String roomList(@ModelAttribute("sch") Room sch, Model d,
//			HttpSession s, @RequestParam(name = "bsn_id",required = false)String bsn_id) {
//		bsn_id = (String) s.getAttribute("bsnId");
//        List<Product> bsnuser = productService.bsnuser(bsn_id);
//        d.addAttribute("bsnuser", bsnuser);
//		d.addAttribute("roomList", productService.roomList(sch));
//		return "bsn/bsn_acc_list_detail";
//	}
	// 사업자 로그인 > 숙소 등록 현황 > 숙소 정보 > 객실 정보
	@GetMapping("roomDetail")
	public String roomDetail(@RequestParam("room_id") int room_id,
							
								Model d) {
		d.addAttribute("roomDetail", productService.roomDetail(room_id));
		return "bsn/bsn_acc_list_detail_roomDetail";
	}
	// 사업자 로그인 > 후기관리메인
	@RequestMapping("reviewList")
	public String reviewList(Model d, HttpSession s,
			  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
		bsn_id = (String) s.getAttribute("bsnId");
        List<Product> bsnuser = productService.bsnuser(bsn_id);
        d.addAttribute("bsnuser", bsnuser);
		return "bsn/bsn_review_list";
	}
	// 사업자 로그인 > 후기관리메인 > 숙소별 후기 리스트 
	@RequestMapping("prdReviewList")
	public String prdReviewList(@ModelAttribute("sch") BsnReviewMng sch, Model d
			, @RequestParam("pro_id") int pro_id
			) {
		d.addAttribute("prdReviewList", productService.prdReviewList(sch));
		d.addAttribute("bsnprdInfo", productService.bsnprdInfo(pro_id));
		return "bsn/bsn_review_list_detail";
	}
	// 사업자 로그인 > 후기관리메인 > 숙소별후기리스트 > 답글입력
	@RequestMapping("insertBsnReview")
	public String insertBsnReview(Review_comm ins, Model d) {
		d.addAttribute("msg", productService.insertBsnReview(ins));
		return "bsn/bsn_review_list_detail";
	}

	
	// 숙소 등록
	@RequestMapping("showRegiForm")
	public String showRegiForm(HttpServletRequest r,Model d, HttpSession s,
			  @RequestParam(name = "bsn_id",required = false)String bsn_id) {
		bsn_id = (String) s.getAttribute("bsnId");
        Bsn_user bsn_user = productService.bsn_user(bsn_id);
        d.addAttribute("bsn_user", bsn_user);
		return "bsn/bsn_acc_regi";
	}

	
	// 숙소 등록
	@RequestMapping("insertProduct")
	public String insertProduct(ProductIns ins, Model d) {
		String rs ="";
		System.out.println("pro_type_id:"+ins.getPro_type_id());
		System.out.println("pro_id:"+ins.getPro_id());
		System.out.println("숙소명:"+ins.getPro_name());
		System.out.println("숙소위치:"+ins.getPro_loc());
		System.out.println("기본정보:"+ins.getBasic_info());
		System.out.println("예약공지:"+ins.getRes_ann());
		System.out.println("서비스내용:"+ins.getSer_conts());
		System.out.println("파일명:"+ins.getFname());
		System.out.println(productService.insertProduct(ins));
		
		return "";
	}
	
	@RequestMapping("insertRoomForm")
	public String insertRoomForm() {
		return "bsn/bsn_acc_regi2";
	}
	
	// 객실 등록
	@PostMapping("insertRoom")
	public ResponseEntity<String> insertRoom(@RequestBody List<RoomIns> rooms, Model d) {
		String rs="";
		System.out.println("insertRoom controller: "+rooms );
		System.out.println("room List size: "+rooms.size() );
		for(RoomIns ins:rooms) {
			System.out.println(ins.getRoom_price());
			try {
				System.out.println(productService.insertRoom(ins));
				rs="suc";
			} catch (Exception e) {
				rs="fail";
				System.out.println("insertRoomError: " + e.getMessage());
			}
		}
		return ResponseEntity.ok(rs);
	}
	
//	@RequestMapping("insertPrdForm")
//	public String insertPrd(ProductIns ins) {
//		
//		System.out.println("# 등록할 정보 #");
//		System.out.println(ins.getBsn_id());
//		System.out.println(ins.getPro_type_id());
//		System.out.println(ins.getPro_name());
//		System.out.println(ins.getPro_loc());
//		System.out.println(ins.getBasic_info());
//		System.out.println(ins.getRes_ann());
//		System.out.println(ins.getSer_conts());
////		for(int idx=0; idx<ins.getFname().length;idx++) {
////			System.out.println(ins.getFname()[idx]);
////		}
////		System.out.println("방의갯수:"+ins.getRoom_name().length);
////		for(int idx=0;idx<ins.getRoom_name().length;idx++) {
////			System.out.print(ins.getRoom_name()[idx]+"\t");
////			System.out.print(ins.getBed_cnt()[idx]+"\t");
////			System.out.print(ins.getRoom_price()[idx]+"\t");
////			System.out.print(ins.getSmoking()[idx]+"\t");
////			System.out.print(ins.getMin_cnt()[idx]+"\t");
////			System.out.print(ins.getMax_cnt()[idx]+"\t");
////		//	System.out.println(ins.getRfname()[idx]);
////		}
//		
//		return "bsn/bsn_acc_regi";
//	}
	@RequestMapping("productInsertFrm")
	public String productInsertFrm(Product ins) {
		return "bsn/bsn_acc_regi";
	}
	@RequestMapping("productInsertFrm2")
	public String productInsertFrm2(Room ins) {
		return "bsn/bsn_acc_regi2";
	}
	@RequestMapping("bsnMypage")
	public String bstMyPage() {
		return "bsn/bsn_myPage";
	}

	// 사업자페이지 > 메인페이지 > 예약확인
	// http://localhost:4050/bsn_res
	@GetMapping("bsn_res")
	public String bsn_res() {
		return "bsn/bsn_res";
	}

	// 사업자페이지 > 마이페이지 > 계정확인
	// http://localhost:4050/bsn_acc
	@GetMapping("bsn_acc")
	public String bsn_acc(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String bsnId = (String) session.getAttribute("bsnId");
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		return "bsn/bsn_acc";
	}

	// 사업자페이지 > 마이페이지 > 계정수정
	// http://localhost:4050/bsn_acc_corr
	@GetMapping("bsn_acc_corr")
	public String bsn_acc_corr(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String bsnId = (String) session.getAttribute("bsnId");
		Bsn_User bsn = userService.getBsnProfile(bsnId);
		model.addAttribute("bsnInfo", bsn);
		return "bsn/bsn_acc_corr";
	}

	// 사업자페이지 > 마이페이지 > 이용확인
	// http://localhost:4050/bsn_con
	@GetMapping("bsn_con")
	public String bsn_con() {
		return "bsn/bsn_con";
	}

	// 사업자페이지 > 마이페이지 > 문의
	// http://localhost:4050/bsn_inq
	@GetMapping("bsn_inq")
	public String bsn_inq() {
		return "bsn/bsn_inq";
	}

}
