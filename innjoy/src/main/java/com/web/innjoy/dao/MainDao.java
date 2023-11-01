package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.innjoy.vo.MainProduct_p;
import com.web.innjoy.vo.MainReview_r;
import com.web.innjoy.vo.MainRecomm_r;

@Mapper
public interface MainDao {
	//com.web.innjoy.dao.MainDao.getMainproductList
	
	// product List 불러오기
	public List<MainProduct_p> getMainproductList();
	// review List 불러오기
	public List<MainRecomm_r> getMainreviewList();
	// Recomments List 불러오기
	public List<MainReview_r> getMainrecommList();
}
