<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
   value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>숙소 상세 페이지</title>
<!-- jQuery -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- daterangepicker 라이브러리 임포트 -->
<link rel="stylesheet" type="text/css" href="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css}" />
<script type="text/javascript" src="@{https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js}"></script>
<script type="text/javascript" src="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js}"></script>

<link rel="stylesheet" href="${path}/assets/css/product_detail.css">
<style>
.a {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  width: 70%;
  margin: 50px auto; /* Center align the container */
  padding: 0 20px; /* Add 20px padding on both sides */
  margin-bottom: 10px;
  }
</style>

</head>
<body>
<%@include file="../header/user_header.jsp"%>
<div class ="a">
<div class="container1">
    <a>예약하기</a>
    <hr class="divider2">
    <div class="description1">
      <p class="reservaion-info-head">예약정보</p>
      <hr class="divider">
      <form id="reservInfo" method="post">
         <div class="reservation-info-list">숙소명</div>
         <div class="reservation-infos">머시깽이 호텔</div>
         <div class="reservation-info-list">객실명</div>
         <div class="reservation-infos">B룸</div>
         <input class="reservation-input" type="hidden" id="roomId" name="roomId" value="11">
         <input class="reservation-input" type="hidden" id="productName" value="머시깽이 호텔 B룸">
         <div class="reservation-info-list">예약날짜</div>
         <div class="reservation-infos">2023-09-14 - 2023-09-15</div>
         <input class="reservation-input" type="hidden" id="startDt" name="startDt" value="2023-09-14">
         <input class="reservation-input" type="hidden" id="endDt" name="endDt" value="2023-09-15">
         <div class="reservation-info-list">인원수</div>
         <div class="reservation-infos">3명</div>
         <input class="reservation-input" type="hidden" id="userCnt" name="userCnt"  value="3">
         <div class="reservation-info-list">가격</div>
         <div class="reservation-infos">340,000</div>
         <input class="reservation-input" type="hidden" id="payment" name="payment"  value="500">
         <div class="reservation-info-list">예약자 이름</div>
         <div class="reservation-infos">${userInfo.userName }</div>
         <input class="reservation-input" type="hidden" id="userId" name="userId" value="${userInfo.userId}">
         <div class="reservation-info-list">예약자 연락처</div>
         <div class="reservation-infos">${userInfo.userPhone }</div>
    </form>
    </div>
    <hr class="divider">
 
      <button class="reservation-button" onclick="requestPay()">결제하기</button>
      
   
   <script>
		   var productName = $("#productName").val()
		   var payment = $("#payment").val()
		   
		   function requestPay() {
		       var IMP = window.IMP;
		       IMP.init("imp32553024");
		       // 원포트 관리자 페이지 -> 내정보 -> 가맹점식별코드
		       // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		       IMP.request_pay({
		           pg: 'html5_inicis',  // 실제 계약 후에는 실제 상점아이디로 변경
		           pay_method: 'card', // 'card'만 지원됩니다.
		           merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
		           name: productName,
		           amount: payment,
		           buyer_email: 'iamport@siot.do',
		           buyer_name: '구매자이름',
		           buyer_tel: '010-1234-5678',
		           buyer_addr: '서울특별시 강남구 삼성동',
		           buyer_postcode: '123-456',
		           m_redirect_url: 'https://www.myservice.com/payments/complete/mobile'
		       }, function (rsp) {
		           if (rsp.success) {  // 결제가 성공했을 떄
		               // 결제가 완료되었을 떄 결제 정보를 뜨게 만듬
		          	console.log("success")
		              reservation();
		           } else {    // 결제가 실패했을 때
		               // 결제에 실패했을떄 실패메세지와 실패사유를 출력
		               var msg = '결제에 실패하였습니다.';
		               msg += '실패 사유 : ' + rsp.error_msg;
		           }
		           alert(msg);
		       });
		   }
        
        function reservation() {
            var resData = {
           		 reservationId: 11,
           		 payment: $("#payment").val(),
           	     userId: $("#userId").val(),
           	     roomId: $("#roomId").val(),
           	     userCnt: $("#userCnt").val(),
           	     startDt: convertToDate($("#startDt").val()),
           	     endDt: convertToDate($("#endDt").val())
   			}; // 폼 데이터를 배열 형태로 직렬화
        	$.ajax({
				type : "post",
				url :"try/reservation",
				data : JSON.stringify(resData),
				contentType : "application/json; charset=utf-8",
				success : function(rs) {
					console.log(resData);
					console.log(userId);
					console.log(roomId);
					alert("예약 성공")
					location.href="/mypage";
				},
				error : function(err) {
					console.log(err)
				}
			})
        }
        function convertToDate(dateString) {
            // dateString은 "YYYY-MM-DD" 형식으로 전달되어야 함
            var parts = dateString.split('-');
            var year = parseInt(parts[0], 10);
            var month = parseInt(parts[1], 10) - 1; // JavaScript에서 월은 0부터 시작함
            var day = parseInt(parts[2], 10);

            var convertedDate = new Date(year, month, day);
            return convertedDate;
        }
     </script>
     <script type="text/javascript">
	    
     </script>
   
   
</div>
</div>
  

<%@ include file="../header/footer.jsp" %>  
</body>
</html>