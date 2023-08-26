package com.web.innjoy.dao;
// com.web.innjoy.dao.BsnDao
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.innjoy.vo.ProRoom;

@Mapper
public interface BsnDao {
    List<ProRoom> getRoomsByBsnId(@Param("bsn_id") String bsn_id);
}
