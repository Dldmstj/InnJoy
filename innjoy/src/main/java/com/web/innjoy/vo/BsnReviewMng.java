package com.web.innjoy.vo;


public class BsnReviewMng {
	private Product product;
    private Room room;
    private Review review;
    private Reservation reservation;
    
	public BsnReviewMng() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BsnReviewMng(Product product, Room room, Review review, Reservation reservation) {
		super();
		this.product = product;
		this.room = room;
		this.review = review;
		this.reservation = reservation;
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
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
    
	
}
