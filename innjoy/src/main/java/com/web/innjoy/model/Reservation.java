package com.web.innjoy.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="RESERVATION")
public class Reservation {
	
	@Id
	@Column(name="reservation_id", unique = true)
	private int reservationId;

	@ManyToOne		// 
	@JoinColumn(name="user_id")
	private Ij_User ijUser;
	
	@ManyToOne // many reservations, one room
	@JoinColumn(name="room_id")
	private Room room;
	
	@Column(name="user_cnt")
	private int userCnt;
	
	@Column(name="start_dt")
	private Date startDt;
	
	@Column(name="end_dt")
	private Date endDt;
	
	@Column(name="payment")
	private int payment;
	
	@Column(name="status")
	private int status;
	
	@OneToOne(mappedBy="reviewId")		// one reservation, one review
	private Review review;
	
	// 생성자
	public Reservation() {}
	
}
