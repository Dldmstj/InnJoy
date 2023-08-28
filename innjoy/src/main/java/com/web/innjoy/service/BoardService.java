package com.web.innjoy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.model.Recomm;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.model.Review;
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
	
	// 게시물 작성
	public Recomm writeRecomm(Recomm recomm) {
		return recommRepository.save(recomm);
	}
	
	// 댓글 작성
	public Recomm_comm writeComm(Recomm_comm comm) {
		return commRepository.save(comm);
	}
}
