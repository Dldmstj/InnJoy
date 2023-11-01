package com.web.innjoy.vo;

public class ProductDetail {
	private Pro_img pro_img;
	private Product product;
	private Room room;

	public ProductDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDetail(Pro_img pro_img, Product product, Room room) {
		super();
		this.pro_img = pro_img;
		this.product = product;
		this.room = room;
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

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

}