package com.web.innjoy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.ProductDao;
import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductSch;
import com.web.innjoy.vo.Room;

@Service
public class ProductService {
	@Autowired
	private ProductDao dao;
	
	 public List<Product> bsnuser(String bsn_id){
	    	return dao.bsnuser(bsn_id);
	    }
	
	public List<Product> productList(ProductSch sch) {
		if(sch.getPro_name()==null) sch.setPro_name("");
		if(sch.getPro_loc()==null) sch.setPro_loc("");
		return dao.productList(sch);
	}
	public List<Room> roomList(Room sch) {
		if(sch.getRoom_name()==null) sch.setRoom_name("");
		if(sch.getMin_cnt()==0) sch.setMin_cnt(0);
		if(sch.getMax_cnt()==0) sch.setMax_cnt(0);
		if(sch.getRoom_price()==0) sch.setRoom_price(0);
		return dao.roomList(sch);
	}
	public Room roomDetail(int room_id) {
		Room r = dao.roomDetail(room_id);
		return r;
	}
	public List<BsnReviewMng> reviewList(BsnReviewMng sch){
		return dao.reviewList(sch);
	}
	public List<BsnReviewMng> reviewDetail(int pro_id) {
		return dao.reviewDetail(pro_id);
	}
//	@Transactional
//    public String insertProductAndRoom(Product insertProduct, Room insertRoom) {
//        // Insert product
//        int pro_id = dao.getPro_id();
//        insertProduct.setPro_id(pro_id);
//
//        int productInsertResult = dao.insertProduct(insertProduct);
//
//        if (productInsertResult <= 0) {
//            // Handle insertion failure
//            return "숙소 등록 실패";
//        }
//그
//        // Insert room
//        int room_id = dao.getRoom_id();
//        insertRoom.setRoom_id(room_id);
//
//        int roomInsertResult = dao.insertRoom(insertRoom);
//
//        if (roomInsertResult <= 0) {
//            // Handle insertion failure
//            return "방 등록 실패";
//        }
//
//        return "등록 성공";
//    }
	
	
	public String insertProduct(Product insert) {
		int pro_id = dao.getPro_id();
		insert.setPro_id(pro_id);
		
		return dao.insertProduct(insert)>0?
				"등록성공":"등록되지않았습니다";
	}
	public String insertRoom(Room insert) {
		int room_id = dao.getRoom_id();
		insert.setRoom_id(room_id);
		
		return dao.insertRoom(insert)>0?
				"등록성공":"등록되지않았습니다";
	}
	
//	public Room getDetail(int pro_id) {
//		Room r = dao.getRoom(pro_id);
//		return r;
//	}
	
}
