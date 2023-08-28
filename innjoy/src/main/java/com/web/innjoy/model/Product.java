package com.web.innjoy.model;

import java.sql.Clob;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="PRODUCT")
public class Product {

	@Id
	@Column(name="pro_id", unique = true)
	private int proId;
	
	@ManyToOne	// Many products, one bsn_user
	@JoinColumn(name="bsn_id")
	private Bsn_User bsnUser;
	
	@ManyToOne // Many products, one product type
	@JoinColumn(name="pro_type_id")
	private Pro_Type_Id proTypeId;
	
	@Column(name="pro_name")
	private String proName;
	
	@Column(name="pro_loc")
	private Clob proLoc;
	
	@Column(name="basic_info")
	private Clob basicInfo;
	
	@Column(name="res_ann")
	private Clob resAnn;
	
	@Column(name="ser_conts")
	private Clob serConts;

	@OneToMany(mappedBy="product")	// one Product, many rooms
	private List<Room> room;

	public Product() {}
	
	
	
}
