package com.web.innjoy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.BsnDao;
import com.web.innjoy.vo.ProRoom;

@Service
public class BsnService {
    @Autowired(required=false)
    private BsnDao dao;
    
    public List<ProRoom> getRoomsByBsnId(String bsn_id) {
        return dao.getRoomsByBsnId(bsn_id);
    }

}