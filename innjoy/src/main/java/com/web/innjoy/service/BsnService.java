package com.web.innjoy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.BsnDao;
import com.web.innjoy.vo.ProRoom;
import com.web.innjoy.vo.ResUser;
import com.web.innjoy.vo.Reservation;

@Service
public class BsnService {
    @Autowired
    private BsnDao dao;
    
    public List<ProRoom> bsn_res(String bsn_id){
    	return dao.bsn_res(bsn_id);
    }
    // 캘린더
    public List<Reservation> calList(int room_id) {
        return dao.calList(room_id);
    } 
    
    // 캘린더 모달창
    public Map<String, Object> resDetModal(int reservation_id) {
        Map<String, Object> resDetModal = new HashMap<>();
        
        ResUser resUser = dao.resDetModal(reservation_id);
        resDetModal.put("user", resUser.getUser());
        resDetModal.put("reservation", resUser.getReservation());

        // Check if the reservation status is "예약취소(사용자)" and fetch the cancellation reason
        if (resUser.getReservation().getStatus() == 2) {
            String cancleReason = dao.getCancleReason(reservation_id);
            resDetModal.put("cancle_reason", cancleReason);
        }

        return resDetModal;
    }
    
    // 캘린더 예약취소
    public void resCancle(int reservation_id) {
        dao.resCancle(reservation_id);
    }
    // 캘린더 예약확정
    public void resConf(int reservation_id) {
        dao.resConf(reservation_id);
    }
    // 캘린더 이용완료
    public void resUse(int reservation_id) {
        dao.resUse(reservation_id);
    }
}