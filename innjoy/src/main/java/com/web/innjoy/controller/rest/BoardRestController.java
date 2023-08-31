package com.web.innjoy.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Recomm;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.model.Review;
import com.web.innjoy.repository.ReviewRepository;
import com.web.innjoy.service.BoardService;
import com.web.innjoy.service.FileUploadService;

import ch.qos.logback.core.model.Model;

@RestController
public class BoardRestController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private FileUploadService fileUploadService;
	
	// 후기 작성
	@PostMapping("try/write/review")
	public String writeReview(Review review, 
										@RequestPart("report") List<MultipartFile> mfs,
										Model model){
		String rs= "";
		System.out.println("후기 작성 시도");
		try {
			// 리뷰 작성, 작성한 리뷰 객체로 저장
			Review thisReview = boardService.writeReview(review);
			int reviewId= thisReview.getReviewId();
			System.out.println("reviewId: " +reviewId);
			System.out.println(fileUploadService.uploadReviewFile(mfs, reviewId));
	        rs = "Y";
		} catch (Exception e) {	// 실패시
			rs = "N";
		}
		return rs;
	}
	// 후기 삭제
	@DeleteMapping("try/delete/review")
	public ResponseEntity<String> deleteReview(@RequestParam("reviewId") int reviewId){
		String rs ="";
		try {
			boardService.deleteReview(reviewId);
			rs="success";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			rs="fail";
		}
		return ResponseEntity.ok(rs);
	}
	// 후기 수정
	@PutMapping("try/update/review")
	public ResponseEntity<String> uptReview(@RequestBody Review review){
		String rs ="";
		try {
			boardService.updateReview(review);
			rs = "success";
		} catch (Exception e) {
			System.out.println("updateReview error : "+ e.getMessage());
			rs = "fail";
		}
		return ResponseEntity.ok(rs);
	}
	
	// 게시물 작성
	@RequestMapping("try/write/recomm")
	public String writeRecomm(Recomm recomm,
										@RequestPart("report") List<MultipartFile> mfs,
										Model model){
		String rs= "";
		System.out.println("게시물 작성 시도");
		try {
			// 게시물 작성, 작성한 게시물 객체로 저장
			Recomm thisRecomm = boardService.writeRecomm(recomm);
			int recomId= thisRecomm.getRecomId();
			System.out.println("recomId: " +recomId);
			System.out.println(fileUploadService.uploadRcomFile(mfs, recomId));
	        rs = "Y";
		} catch (Exception e) {	// 실패시
			rs = "N";
		}
		return rs;
	}
	// 게시물 삭제
	@DeleteMapping("try/delete/recomm")
	public ResponseEntity<String> deleteRecomm(@RequestParam("recommId") int recommId){
		String rs ="";
		try {
			boardService.deleteRecomm(recommId);
			rs="success";
		} catch (Exception e) {
			rs="fail";
		}
		return ResponseEntity.ok(rs);
	}
	// 게시물 수정
		@PutMapping("try/update/recomm")
		public ResponseEntity<String> uptRecomm(@RequestBody Recomm recomm){
			String rs ="";
			try {
				boardService.updateRecomm(recomm);
				rs = "success";
			} catch (Exception e) {
				System.out.println("updateRecomm error : "+ e.getMessage());
				rs = "fail";
			}
			return ResponseEntity.ok(rs);
		}
	
	// 댓글 작성
	@RequestMapping("try/write/comm")
	public ResponseEntity<Recomm_comm> writeComm(Recomm_comm comm){
		return ResponseEntity.ok(boardService.writeComm(comm));
	}
	// 댓글 삭제
	@DeleteMapping("try/delete/comm")
	public ResponseEntity<String> deleteComm(@RequestParam("commId") int commId){
		String rs ="";
		try {
			boardService.deleteComm(commId);
			rs="success";
		} catch (Exception e) {
			rs="fail";
		}
		return ResponseEntity.ok(rs);
	}
	
}
