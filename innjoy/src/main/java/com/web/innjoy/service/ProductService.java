package com.web.innjoy.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.innjoy.dao.ProductDao;
import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.Pro_img;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductIns;
import com.web.innjoy.vo.ProductSch;
import com.web.innjoy.vo.Review_comm;
import com.web.innjoy.vo.Room;
import com.web.innjoy.vo.RoomIns;

@Service
public class ProductService {
	@Autowired
	private ProductDao dao;
	
	
	
	 public List<Product> bsnuser(String bsn_id){
	    	return dao.bsnuser(bsn_id);
	    }
	 public Bsn_user bsn_user(String bsn_id){
		 
		 return dao.bsn_user(bsn_id);
	 }
	
	public List<Product> productList(ProductSch sch) {
		if(sch.getPro_name()==null) sch.setPro_name("");
		if(sch.getPro_loc()==null) sch.setPro_loc("");
		return dao.productList(sch);
	}
	
	public List<Room> roomList(Room sch) {
		if(sch.getRoom_name()==null) sch.setRoom_name("");
		if(sch.getRoom_id()==0) sch.setRoom_id(0);
		if(sch.getMin_cnt()==0) sch.setMin_cnt(0);
		if(sch.getMax_cnt()==0) sch.setMax_cnt(0);
		if(sch.getRoom_price()==0) sch.setRoom_price(0);
		if(sch.getPro_id()==0) sch.setPro_id(0);
		if(sch.getFname()==null) sch.setFname("");
		return dao.roomList(sch);
	}
	public Product bsnprdInfo(int pro_id) {
		Product p = dao.bsnprdInfo(pro_id);
		return p;
	}
	public List<BsnReviewMng> prdReviewList(BsnReviewMng sch) {
		return dao.prdReviewList(sch);
	}
	
	public Room roomDetail(int room_id) {
		Room r = dao.roomDetail(room_id);
		return r;
	}
	public BsnReviewMng productInfo(int pro_id) {
		BsnReviewMng p = dao.productInfo(pro_id);
		return p;
	}
	
//	public Bsn_user bsn_user(String bsn_id) {
//		Bsn_user p = dao.bsn_user(bsn_id);
//		return p;
//	}
	public BsnReviewMng reviewDetail(String room_id) {
		BsnReviewMng brm = dao.reviewDetail(room_id);
		return brm;
	}
//	public BsnReviewMng reviewDetail(int pro_id) {
//		BsnReviewMng brm = dao.reviewDetail(pro_id);
//		return brm;
//	}
	public List<BsnReviewMng> reviewList(BsnReviewMng sch){
		return dao.reviewList(sch);
	}


	public String insertBsnReview(Review_comm insert) {
		return dao.insertBsnReview(insert)>0?
				"등록성공":"등록되지 않았습니다";
	}	
//	public String insertProduct(ProductIns insert, Pro_img insert2) {
//		int pro_id = dao.getPro_id();
//		insert.setPro_id(pro_id);
//		int no = dao.getNo();
//		insert2.setNo(no);
//		return dao.insertProduct(insert, insert2)>0?
//				"등록성공":"등록되지 않았습니다";
//	}	
//	public String insertProduct(ProductIns insert) {
//		int pro_id = dao.getPro_id();
//		insert.setPro_id(pro_id);
//		return dao.insertProduct(insert)>0?
//				"등록성공":"등록되지 않았습니다";
//	}	
	@Value("${upload}")
	private String path;
	public String insertProduct(ProductIns insert) {
		int pro_id = dao.getPro_id();
		insert.setPro_id(pro_id);
		String msg = "업로드 성공";
		for(MultipartFile mf:insert.getFname() ) {
			String fname = mf.getOriginalFilename();
			if(fname!=null && !fname.trim().equals("")) {
				File f = new File(path+fname);
				try {
					mf.transferTo(f);
					
				} catch (IllegalStateException e) {
					msg = "예외발생1:"+e.getMessage();
				} catch (IOException e) {
					msg = "예외발생2:"+e.getMessage();
				}
				if(msg.equals("업로드 성공")) {
					dao.insertProduct(insert);
//					dao.insertProductImg(new Pro_img(pro_id,fname));
				}
			}
		}
		System.out.println("파일첨부내용:"+msg);
		return msg;
	}	
	
	public String insertRoom(RoomIns insert) {
//		int room_id = dao.getRoom_id();
//		insert.setRoom_id(room_id);
		return dao.insertRoom(insert)>0?
				"등록성공":"등록되지않았습니다";
	}
//	public String insertProduct(ProductIns insert) {
//        int pro_type_id = insert.getPro_type_id();
//
//        // pro_type_id에 따라 적절한 시퀀스 값을 설정
//        int pro_id;
//        if (pro_type_id == 10000) {
//            pro_id = getNextValForType10000Sequence();
//        } else if (pro_type_id == 20000) {
//            pro_id = getNextValForType20000Sequence();
//        } else if (pro_type_id == 30000) {
//            pro_id = getNextValForType30000Sequence();
//        } else {
//            // 예외 처리 혹은 기본값 설정
//            pro_id = 0;
//        }
//
//        insert.setPro_id(pro_id);
//        int rowsInserted = dao.insertProduct(insert);
//        return rowsInserted > 0 ? "등록성공" : "등록되지 않았습니다";
//    }
//	public int getNextValForType10000Sequence() {
//        int nextVal = dao.getNextValForType10000Sequence();
//        return nextVal;
//    }
//	public int getNextValForType20000Sequence() {
//		int nextVal = dao.getNextValForType20000Sequence();
//		return nextVal;
//	}
//	public int getNextValForType30000Sequence() {
//		int nextVal = dao.getNextValForType30000Sequence();
//		return nextVal;
//	}
	
	
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
	
	
//	public String insertProduct(Product insert) {
//		int pro_id = dao.getPro_id();
//		insert.setPro_id(pro_id);
//		
//		return dao.insertProduct(insert)>0?
//				"등록성공":"등록되지않았습니다";
//	}
	
	
//	public Room getDetail(int pro_id) {
//		Room r = dao.getRoom(pro_id);
//		return r;
//	}
	public Bsn_user login(Bsn_user bsnS) {
		return dao.login(bsnS);
	}
	
	
}
