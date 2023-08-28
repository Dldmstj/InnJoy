package com.web.innjoy.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.innjoy.model.Recomm;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.model.Review;
import com.web.innjoy.service.BoardService;

@RestController
public class BoardRestController {

	@Autowired
	private BoardService boardService;
	
	// 후기 작성
	@RequestMapping("try/write/review")
	public ResponseEntity<Review> writeReview(Review review){
		return ResponseEntity.ok(boardService.writeReview(review));
	}
	
	// 게시물 작성
	@RequestMapping("try/write/recomm")
	public ResponseEntity<Recomm> writeRecomm(Recomm recomm){
		return ResponseEntity.ok(boardService.writeRecomm(recomm));
	}
	
	// 댓글 작성
	@RequestMapping("try/write/comm")
	public ResponseEntity<Recomm_comm> writeComm(Recomm_comm comm){
		return ResponseEntity.ok(boardService.writeComm(comm));
	}
	
}
