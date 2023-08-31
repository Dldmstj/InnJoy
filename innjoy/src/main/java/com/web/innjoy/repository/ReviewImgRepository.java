package com.web.innjoy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Review_Img;

public interface ReviewImgRepository extends JpaRepository<Review_Img, Integer>{
	
	Review_Img save(Review_Img ri);
}
