package com.web.innjoy.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="REVIEW")
public class Review {

	@Id
	@Column(name="review_id", unique = true)
	private int reviewId;
	
	@Column(name="star")
	private int star;
	
	@Column(name="review_det")
	private String reviewDet;
	
	@Column(name="rev_time")
	private Date revTime;
	
	@OneToOne	// one review, one reservation
	@JoinColumn(name="reservation_id")
	private Reservation reservation;
	
	// 생성자
	public Review() {}
}
