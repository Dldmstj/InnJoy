package com.web.innjoy.vo;

public class ProRoom {
	private Product product;
	private Room room;
	public ProRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProRoom(Product product, Room room) {
		super();
		this.product = product;
		this.room = room;
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
