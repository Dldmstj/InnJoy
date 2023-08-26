<!-- bsn_res.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
	<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
	<link rel="stylesheet" href="${path}/buser/buser.css?after" >
	<link rel="stylesheet" href="${path}/calendar/css/style.css">
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>InnJoy</title>
   
	<script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>


    <script src='${path}/calendar/fullcalendar/packages/core/main.js'></script>
    <script src='${path}/calendar/fullcalendar/packages/interaction/main.js'></script>
    <script src='${path}/calendar/fullcalendar/packages/daygrid/main.js'></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    
    <link rel="stylesheet" href="${path}/calendar/fonts/icomoon/style.css">
  
    <link href='${path}/calendar/fullcalendar/packages/core/main.css' rel='stylesheet' />
    <link href='${path}/calendar/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
    
    <script src="${path}/calendar/js/main.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
    	  
	    var calendarEl = document.getElementById('calendar');
	    var currentDate = new Date(); // 현재날짜
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      locale: 'ko',
	      plugins: [ 'interaction', 'dayGrid' ],
	      defaultDate: currentDate,
	      editable: true,
	      eventLimit: true,
	      
	      eventClick: function(info) {
	          var modalBody = document.getElementById('eventModalBody');

	          $('#eventModal').modal('show'); // 모달창 열기
	        },
	      
	      events: [
	        {
	          title: '예약확정(234576)',
	          start: '2023-08-07',
	          end: '2023-08-10'
	        },{
	        	title: '예약문의(456238)',
	        	start: '2023-08-22',
	        	end: '2023-08-25'
	        }
	      ]
	    });	
	    calendar.render();
	    
        const closebtn1 = document.getElementById('closebtn1');
        closebtn1.addEventListener('click', function() {
            $('#eventModal').modal('hide'); // 모달창 닫기
        });

        const closebtn2 = document.getElementById('closebtn2');
        closebtn2.addEventListener('click', function() {
            $('#eventModal').modal('hide'); // 모달창 닫기
        });
	  });

    </script>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../header/buser_header.jsp" flush="true"/>
	<c:set var="bsn_id" value="${sessionScope.bsn_id}" />
	<div class = "middle">
		<p class = "middle_p">예약관리</p>
	</div>
	<div class = "log_sel">
		<div>
			<P class = "type_n">숙소</P>
		</div>
		<div  class = "log_type">
		<select class="log_type2" id="roomList" name="room">
		    <c:forEach items="${rooms}" var="room">
		        <option value="${room.product.pro_id}">${room.room.room_name}</option>
		    </c:forEach>
		</select>

		
		</div>
	</div>
	<div class = "cal">
		<div id='calendar'></div>
	</div>
	
	<!-- 모달창 -->
	<div class="modal fade" id="eventModal" tabindex="-1" 
		role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="eventModalLabel">예약문의</h5>
			<button type="button" id="closebtn1" 
				class="close" data-dismiss="modal" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			</button>
	      </div>
	      <div class="modal-body" id="eventModalBody">
	      	<div>
	      		<div>예약일</div>
	      		<p>check-in : 2023-08-22</p>
	      		<p>check-out : 2023-08-24</p>
	      	</div>
	      	<div>
	      		<div>예약번호</div>
	      		<p>456238</p>
	      	</div>
	      	<div>
	      		<div>예약자 명</div>
	      		<p>정다은</p>
	      	</div>	      	
	      	<div>
	      		<div>예약자 전화번호</div>
	      		<p>010-5645-6555</p>
	      	</div>
	      	<div>
	      		<div>사용인원</div>
	      		<p>3명</p>
	      	</div>	      		      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="res_con_btn" 
	        	data-dismiss="modal">예약확정</button>
			<button type="button" id="closebtn2" class="res_can_btn" 
				data-dismiss="modal">예약취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="../header/footer.jsp" flush="true"/>
</body>
</html>