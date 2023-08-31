package com.web.innjoy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Recomm;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.model.Review;
import com.web.innjoy.model.Review_Img;
import com.web.innjoy.repository.RecommRepository;
import com.web.innjoy.repository.Recomm_CommRepository;
import com.web.innjoy.repository.ReviewRepository;

@Service
public class BoardService {

	@Autowired
	private ReviewRepository revRepository;
	@Autowired
	private RecommRepository recommRepository;
	@Autowired
	private Recomm_CommRepository commRepository;
	
	// 리뷰 작성
	public Review writeReview(Review review) {
		return revRepository.save(review);
	}
	// 리뷰 삭제
	public void deleteReview(int reviewId) {
		revRepository.deleteById(reviewId);
	}
	// 리뷰 수정
    public void updateReview(Review review) {
    	System.out.println(review.getReviewId());
    	System.out.println(review.getReservationId());
    	Review rev = revRepository.findById(review.getReviewId()).orElseThrow(() -> {
            return new IllegalArgumentException("리뷰 찾기 실패");
        });
    	rev.setStar(review.getStar());
    	rev.setReviewDet(review.getReviewDet());
    	revRepository.save(rev);
    }
	
	// 게시물 작성
	public Recomm writeRecomm(Recomm recomm) {
		return recommRepository.save(recomm);
	}
	// 게시물 삭제
	public void deleteRecomm(int recommId) {
		recommRepository.deleteById(recommId);
	}
	// 게시물 수정
    public void updateRecomm(Recomm recomm) {
    	System.out.println(recomm.getRecomId());
    	System.out.println(recomm.getReservationId());
    	Recomm rec = recommRepository.findById(recomm.getRecomId()).orElseThrow(() -> {
            return new IllegalArgumentException("게시물 찾기 실패");
        });
    	rec.setTitle(recomm.getTitle());
    	rec.setDetail(recomm.getDetail());
    	rec.setRecomLoc(recomm.getRecomLoc());
    	rec.setRecommType(recomm.getRecommType());
    	rec.setLatitude(recomm.getLatitude());
    	rec.setLongitude(recomm.getLongitude());
    	recommRepository.save(rec);
    }
    
	// 댓글 작성
	public Recomm_comm writeComm(Recomm_comm comm) {
		return commRepository.save(comm);
	}
	// 댓글 삭제
	public void deleteComm(int commId) {
		commRepository.deleteById(commId);
	}
}
