package com.web.innjoy.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductIns {
	private int pro_id;
	private String bsn_id;
	private int pro_type_id;
	private String pro_name;
	private String pro_loc;
	private String basic_info;
	private String res_ann;
	private String ser_conts;
	
	private List<String> fnames;
	private MultipartFile[] fname;
	
	
	
	public ProductIns() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductIns(int pro_id, String bsn_id, int pro_type_id, String pro_name, String pro_loc, String basic_info,
			String res_ann, String ser_conts) {
		super();
		this.pro_id = pro_id;
		this.bsn_id = bsn_id;
		this.pro_type_id = pro_type_id;
		this.pro_name = pro_name;
		this.pro_loc = pro_loc;
		this.basic_info = basic_info;
		this.res_ann = res_ann;
		this.ser_conts = ser_conts;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getBsn_id() {
		return bsn_id;
	}
	public void setBsn_id(String bsn_id) {
		this.bsn_id = bsn_id;
	}
	public int getPro_type_id() {
		return pro_type_id;
	}
	public void setPro_type_id(int pro_type_id) {
		this.pro_type_id = pro_type_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_loc() {
		return pro_loc;
	}
	public void setPro_loc(String pro_loc) {
		this.pro_loc = pro_loc;
	}
	public String getBasic_info() {
		return basic_info;
	}
	public void setBasic_info(String basic_info) {
		this.basic_info = basic_info;
	}
	public String getRes_ann() {
		return res_ann;
	}
	public void setRes_ann(String res_ann) {
		this.res_ann = res_ann;
	}
	public String getSer_conts() {
		return ser_conts;
	}
	public void setSer_conts(String ser_conts) {
		this.ser_conts = ser_conts;
	}
	public List<String> getFnames() {
		return fnames;
	}
	public void setFnames(List<String> fnames) {
		this.fnames = fnames;
	}
	public MultipartFile[] getFname() {
		return fname;
	}
	public void setFname(MultipartFile[] fname) {
		this.fname = fname;
	}
	
	
	
}
