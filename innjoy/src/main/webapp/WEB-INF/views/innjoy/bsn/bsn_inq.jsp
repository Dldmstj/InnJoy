<!-- bsn_inq.jsp -->
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
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>InnJoy</title>
   
	<script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $('.cha_list_btn').click(function() {
	        var nickname = $(this).find('.cha_ni').text();
	        var lastMessage = $(this).find('.cha_last').text();
	        var myname = '나';

	        $('#chatModal .modal-title').text('보내신 사람 : ' + nickname);
	        $('#chatModal .modal-body').html('<div class = "chat-message-received"><div>'+ nickname +'</div><p class = "sent2">'+ lastMessage + '</p></div>');


	        $('#chatInput').val('');
	        $('#sendButton').off('click').on('click', sendMessage);
	        $('#chatInput').off('keypress').on('keypress', function(event) {
	            if (event.keyCode === 13) { // Enter key
	                sendMessage();
	            }
	        });

	        function sendMessage() {
	            var newMessage = $('#chatInput').val();
	            if (newMessage.trim() !== '') {
	                var currentDate = new Date();
	                var formattedDate = (currentDate.getMonth() + 1) + '/' + currentDate.getDate() + ' ' +
	                                    (currentDate.getHours() < 10 ? '0' : '') + currentDate.getHours() + ':' + 
	                                    (currentDate.getMinutes() < 10 ? '0' : '') + currentDate.getMinutes();
	               $('#chatModal .modal-body').append('<div class="chat-message-sent"><div>' + myname + '</div><p class="received2">' + newMessage + '</p></div>');
	               $('#chatModal .modal-body').append('<div class="rec_date">' + formattedDate + '</div>');

	               $('#chatInput').val('');
	            }
	        }
	    });
	});
	</script>
	
	
	<style>
	.chat-message-sent {
		  text-align: right;
		  padding: 5px 10px;
		  border-radius: 10px;
		  margin: 5px 0;
	}
	.sent2{
		background-color: #EBEBEB;
		padding: 5px 10px;
		border-radius: 10px;
		margin: 5px 0;
	}
		
	.chat-message-received {
		  text-align: left;
		  padding: 5px 10px;
		  border-radius: 10px;
		  margin: 5px 0;
	}
	.received2{
		background-color: rgba(176, 204, 105,0.5);
		padding: 5px 10px;
		border-radius: 10px;
		margin: 5px 0;
	}
	.rec_date{
		color: #585858;
		text-align: right;
		margin-top:-10px;
		margin-right:13px;
	}
	</style>


</head>
<body>
	<jsp:include page="../header/buser_header.jsp" flush="true"/> <%-- 공통 상단바 --%>
	<div class = "middle">
		<p class = "middle_p">마이페이지</p>
	</div>
	<div class = "middle">
		<ul>
			<li class = "middle_p2">계정정보</li>
			<li class = "middle_p3">이용확인</li>
			<li class = "middle_p3">문의관리</li>
		</ul>
	</div>
	
	<div class = "cha_box">
		<div class = "cha_list">
			<div class = "cha_list_t">
				<p class = "cha_list_tp">문의 실시간 채팅</p>
			</div>
			<div>
				<div class="cha_list_btn" data-toggle="modal" data-target="#chatModal">
					<p class = "cha_ni">정다은</p>
					<p class = "cha_last">이러저러해서 문의드립니다.</p>
					<p class = "cha_cnt">3개</p>
					<p class = "cha_date">2023.06.20</p>
				</div>
				<div class="cha_list_btn" data-toggle="modal" data-target="#chatModal">
				  <p class="cha_ni">닉네임</p>
				  <p class="cha_last">마지막 메세지 내용</p>
				  <p class="cha_cnt">n개</p>
				  <p class="cha_date">작성일자</p>
				</div>
				<div class="cha_list_btn" data-toggle="modal" data-target="#chatModal">
					<p class = "cha_ni">닉네임</p>
					<p class = "cha_last">마지막 메세지 내용</p>
					<p class = "cha_cnt">n개</p>
					<p class = "cha_date">작성일자</p>
				</div>
						
			</div>
		</div>
	</div>	
	
	<div id="chatModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="chatModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="chatModalLabel">Chat Modal</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <!-- Add chat content here -->
	      </div>
		 <div class="modal-footer">
		    <div class="input-group">
		      <input type="text" class="form-control" placeholder="보내실 메세지를 입력하세요." id="chatInput">
		      <div class="input-group-append">
		        <button class="btn btn-outline-secondary" type="button" id="sendButton">
		          <i class="fas fa-paper-plane"></i>
		        </button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	</div>
		
	<jsp:include page="../header/footer.jsp" flush="true"/>

</body>
</html>