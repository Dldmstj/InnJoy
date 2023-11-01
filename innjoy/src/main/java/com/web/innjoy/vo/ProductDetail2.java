package com.web.innjoy.vo;

public class ProductDetail2 {
	private Pro_type_id pro_type_id;
	private Pro_img pro_img;
	private Product product;
	private Reservation reservation;
	private Room room;

	public ProductDetail2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDetail2(Pro_type_id pro_type_id, Pro_img pro_img, Product product, Reservation reservation,
			Room room) {
		super();
		this.pro_type_id = pro_type_id;
		this.pro_img = pro_img;
		this.product = product;
		this.reservation = reservation;
		this.room = room;
	}

	public Pro_type_id getPro_type_id() {
		return pro_type_id;
	}

	public void setPro_type_id(Pro_type_id pro_type_id) {
		this.pro_type_id = pro_type_id;
	}

	public Pro_img getPro_img() {
		return pro_img;
	}

	public void setPro_img(Pro_img pro_img) {
		this.pro_img = pro_img;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	
}