package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Reservation;
import com.web.innjoy.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
	
	List<Review> findByReservation(Reservation res);
	
}
