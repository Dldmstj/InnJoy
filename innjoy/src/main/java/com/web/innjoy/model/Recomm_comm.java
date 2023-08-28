package com.web.innjoy.model;
// 댓글

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="RECOMM_COMM")
public class Recomm_comm {
	
	@Id
	@Column(name="rc_com_id", unique=true)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_rc_com_id_generator")
	@SequenceGenerator(name = "seq_rc_com_id_generator", sequenceName = "seq_rc_com_id", allocationSize = 1)
	private int rcComId;
	
	@ManyToOne	// many comments, one recomm
	@JoinColumn(name="recom_id")
	private Recomm recomm;
	
	@ManyToOne	// many commets, one user
	@JoinColumn(name="user_id")
	private Ij_User ijUser;
	
	@Column(name="rc_com_det")
	private String rcComDet;
	
	@Column(name="rc_com_time")
	private Date rcComTime;
	
	// 생성자
	public Recomm_comm() {}
	 
}
