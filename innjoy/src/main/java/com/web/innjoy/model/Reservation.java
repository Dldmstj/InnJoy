package com.web.innjoy.model;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name="RESERVATION")
public class Reservation {
	
	@Id
	@Column(name="reservation_id", unique = true)
	private int reservationId;

	@ManyToOne		//  many Reservations, one user
	@JoinColumn(name="user_id", insertable = false, updatable = false)
	private Ij_User ijUser;
	
	@ManyToOne // many reservations, one room
	@JoinColumn(name="room_id", insertable = false, updatable = false)
	private Room room;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="room_id")
	private int roomId;
	
	@Column(name="user_cnt")
	private int userCnt;
	
	@Column(name="start_dt")
	@Temporal(TemporalType.DATE)
	private Date startDt;
	
	@Column(name="end_dt")
	@Temporal(TemporalType.DATE)
	private Date endDt;
	
	@Column(name="payment")
	private int payment;
	
	@Column(name="status")
	private int status;
	
	@OneToOne(mappedBy="reservation")		// one reservation, one review
	private Review review;

	@OneToMany(mappedBy="reservation")	// one reservation, many recomms
	private List<Recomm> recomm;
	
	// 생성자
	public Reservation() {}
	
}
