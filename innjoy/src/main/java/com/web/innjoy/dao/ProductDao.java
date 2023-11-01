package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.Bsn_user;
import com.web.innjoy.vo.Pro_img;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductIns;
import com.web.innjoy.vo.ProductSch;
import com.web.innjoy.vo.Review_comm;
import com.web.innjoy.vo.Room;
import com.web.innjoy.vo.RoomIns;
// com.web.innjoy.dao.ProductDao
@Mapper
public interface ProductDao {
	
	public List<Product> bsnuser(@Param("bsn_id") String bsn_id);
	
	public List<Product> productList(ProductSch sch);
	
	// 객실 리스트 불러오는 dao
	public List<Room> roomList(Room sch);
	
	public Product bsnprdInfo(int pro_id); 
	public List<BsnReviewMng> prdReviewList(BsnReviewMng sch);
	
	public Room roomDetail(int room_id);
	public BsnReviewMng reviewDetail(String user_id);
	
	public List<BsnReviewMng> reviewList (BsnReviewMng sch);
	public int insertBsnReview(Review_comm insert);
	
	public BsnReviewMng productInfo(int pro_id); 
	
	public Bsn_user bsn_user(String bsn_id); 
	
	
//	public int insertProduct(Product insert);
	
	
	
	public Bsn_user login(Bsn_user bsnS);
	
//	@Select("SELECT pro_id_10000_seq.nextval FROM dual")
//    int getNextValForType10000Sequence();
//	@Select("SELECT pro_id_20000_seq.nextval FROM dual")
//	int getNextValForType20000Sequence();
//	@Select("SELECT pro_id_30000_seq.nextval FROM dual")
//	int getNextValForType30000Sequence();
	
	
	
	
	public int insertProductImg(Pro_img insert);
	public int insertProduct(ProductIns insert);
	public int getPro_id();
	public int getPImgNo();
	
	public int getNo();
	public int insertRoom(RoomIns insert);
	public int getRoom_id();
}
