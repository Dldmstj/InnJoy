package com.web.innjoy.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.innjoy.dto.CommDto;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.service.BoardService;
import com.web.innjoy.service.Product_headService;
import com.web.innjoy.vo.Product_roomfilter;
import com.web.innjoy.vo.Product_roomfilter2;

@Controller
public class Product_headController {
	
	@Autowired
	private Product_headService service;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("product_detail")
	public String product_headdetail(@RequestParam("pro_id") int pro_id, @RequestParam("start_dt") 
			String start_dt, @RequestParam("end_dt") String end_dt, @RequestParam("user_cnt") String user_cnt, Model model) {
	    System.out.println("pro_id찍히나???: " + pro_id); // 로깅 추가
	    
	    if(start_dt != null) {
	    	start_dt = start_dt.replaceAll("-", "");
	    }
	    if(end_dt != null) {
	    	end_dt = end_dt.replaceAll("-", "");
	    }
	    
	    List<Product_roomfilter> a = service.ProductDetail(pro_id, start_dt, end_dt, user_cnt);
	    
	    model.addAttribute("prhd", service.ProductheadDetail(pro_id));
	    model.addAttribute("prReview", service.ProductreviewDetail(pro_id));
	    model.addAttribute("blist", service.getRecommByProId(pro_id));
	    
	    model.addAttribute("proDetail", a);
	    
	    return "user/product_detail";
	}
//	@RequestMapping("viewComms")
//	public ResponseEntity<List<CommDto>> viewComms(@RequestParam("recomId") int recomId, Model model) {
//	    System.out.println("recomId: " + recomId);
//	    List<CommDto> commList = boardService.getCommList(recomId);
//	    model.addAttribute("commList",commList);
//	    return ResponseEntity.ok(commList);
//	}
	
	@RequestMapping("product_detail3")
	public String product_headdetail3(@RequestParam("pro_id") int pro_id, @RequestParam("room_id")int room_id,@RequestParam("start_dt") String start_dt, 
			@RequestParam("end_dt") String end_dt, @RequestParam("user_cnt") String user_cnt, Model model2) {
	   
		System.out.println("product_headdetail3 controller - pro_id: " + pro_id); // 로깅 추가
		System.out.println("product_headdetail3 controller - room_id: " + room_id); // 로깅 추가
		System.out.println("product_headdetail3 controller - start_dt: " + start_dt); // 로깅 추가
		System.out.println("product_headdetail3 controller - end_dt: " + end_dt); // 로깅 추가

		Product_roomfilter2 prf2 = service.ProductDetail2(pro_id, start_dt, end_dt, user_cnt, room_id);
		model2.addAttribute("proDetail2", prf2);
	    
	    return "user/product_detail2";
	} 	

}