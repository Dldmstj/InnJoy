package com.web.innjoy.dto;

import java.sql.Clob;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReservationDto {

	private int reservationId;
	private String userName;
	private String userPhone;
	private String proName;
//	private Clob proLoc;
	private String roomName;
	private int userCnt;
	private Date startDt;
	private Date endDt;
	private int payment;
	private int status;
}
