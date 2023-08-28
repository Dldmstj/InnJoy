package com.web.innjoy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.innjoy.model.Ij_User;
import com.web.innjoy.model.Reservation;

public interface ResRepository extends JpaRepository<Reservation, Integer>{
	
	// userId로 내 예약 리스트 가져오기
//	@Query(value="SELECT * FROM reservation r  JOIN room rm ON r.room_id = rm.room_id JOIN product p ON rm.pro_id = p.pro_id  WHERE r.user_id = :userId",nativeQuery = true)
	
	List<Reservation> findByIjUser(Ij_User user);
	
	Reservation findByReservationId(int resId);
}
