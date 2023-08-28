package com.web.innjoy.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="REVIEW")
public class Review {

	@Id
	@Column(name="review_id", unique = true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "review_seq_generator")
	@SequenceGenerator(name = "review_seq_generator", sequenceName = "review_seq", allocationSize = 1)
	private int reviewId;
	
	@Column(name="star")
	private int star;
	
	@Column(name="review_det")
	private String reviewDet;
	
	@Column(name="rev_time")
	private Date revTime;
	
	@OneToOne	// one review, one reservation
	@JoinColumn(name="reservation_id", insertable = false, updatable = false)
	private Reservation reservation;
	
	@Column(name="reservation_id")
	private int reservationId;
	
	// 생성자
	public Review() {}
}
