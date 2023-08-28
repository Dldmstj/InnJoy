package com.web.innjoy.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="RECOMM")
public class Recomm {
	
	@Id
	@Column(name="recom_id", unique=true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "recomm_seq_generator")
	@SequenceGenerator(name = "recomm_seq_generator", sequenceName = "recomm_seq", allocationSize = 1)
	private int recomId;
	
	@Column(name="title")
	private String title;
	
	@Column(name="detail")
	private String detail;
	
	@Column(name="recomLoc")
	private String recomLoc;
	
	@Column(name="recom_time")
	private Date recomTime;
	
	@ManyToOne	// many recomms, one reservation
	@JoinColumn(name="reservation_id")
	private Reservation reservation;
	
	@OneToMany(mappedBy="recomm")	// one recomm, many comments
	private List<Recomm_comm> recomm_comm;
	
	// 생성자
	public Recomm() {}

}
