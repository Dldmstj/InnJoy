package com.web.innjoy.dao;

// com.web.innjoy.dao.BsnDao
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.innjoy.vo.ProRoom;
import com.web.innjoy.vo.ResUser;
import com.web.innjoy.vo.Reservation;

@Mapper
public interface BsnDao {
	
	public List<ProRoom> bsn_res(@Param("bsn_id") String bsn_id);
	
	// 캘린더
	public List<Reservation> calList(@Param("room_id") int room_id);
	
	// 캘린더 모달창
    public ResUser resDetModal(@Param("reservation_id") int reservation_id);
    
    // 취소 사유
    @Select("SELECT cancle_reason FROM res_cancle WHERE reservation_id = #{reservation_id}")
    String getCancleReason(@Param("reservation_id") int reservation_id);
    
    // 캘린더 예약 취소
    @Update("UPDATE RESERVATION SET STATUS = 3"
    		+ " WHERE RESERVATION_ID = #{reservation_id}")
    void resCancle(@Param("reservation_id") int reservation_id);
    
    // 캘린더 예약 확정
    @Update("UPDATE RESERVATION SET STATUS = 1"
    		+ " WHERE RESERVATION_ID = #{reservation_id}")
    void resConf(@Param("reservation_id") int reservation_id);
    
    // 캘린더 이용 완료
    @Update("UPDATE RESERVATION SET STATUS = 4"
    		+ " WHERE RESERVATION_ID = #{reservation_id}")
    void resUse(@Param("reservation_id") int reservation_id);


}
