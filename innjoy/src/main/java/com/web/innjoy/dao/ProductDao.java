package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.innjoy.vo.BsnReviewMng;
import com.web.innjoy.vo.Product;
import com.web.innjoy.vo.ProductSch;
import com.web.innjoy.vo.Room;
// com.web.innjoy.dao.ProductDao
@Mapper
public interface ProductDao {
	
	public List<Product> bsnuser(@Param("bsn_id") String bsn_id);
	
	public List<Product> productList(ProductSch sch);
	public List<Room> roomList(Room sch);
	public Room roomDetail(int room_id);
	public int getRoom_id();
	public List<BsnReviewMng> reviewList (BsnReviewMng sch);
	public List<BsnReviewMng> reviewDetail(int pro_id);
	
	public int insertProduct(Product insert);
	public int insertRoom(Room insert);
	public int getPro_id();
	
	
	
}
