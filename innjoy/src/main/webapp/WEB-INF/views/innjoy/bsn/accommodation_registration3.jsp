<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="../header/buser_header.jsp" %>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
   value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function resetInputs() {
	var confirmation = confirm("모든 입력값을 초기화하시겠습니까?");
	if (confirmation) {
   var textareas = document.querySelectorAll('.bsn_regi_textareaStyle');
   
   for (var i = 0; i < textareas.length; i++) {
      textareas[i].value = ''; // 해당 textarea의 내용을 초기화
   }
	}
}
</script>

<link rel="stylesheet" href="${path}/assets/css/bsn_regi.css">
<style type="text/css">
.backBtn{
	width:100px;
	height:50px;
	padding:10px;
	font-weight: bold;
	border-radius:5px;
	font-size: 18px;
	margin:20px;
}
.nextBtn{
	width:100px;
	height:50px;
	padding:10px;
	font-weight: bold;
	border-radius:5px;
	font-size: 18px;
}
</style>
</head>
<body>
<div class="bsn_regi_form">
   <div class="bsn_header_title">
      <h2> 숙소 등록 </h2>
      <div class="bsn_header_num">
        <span class="bsn_order_num">1</span>
        <span class="bsn_order_num">2</span>
        <span class="bsn_order_num pre">3</span>
      </div>
   </div>
</div>
   <div class="bsn_regi_columm">
      <span>기본정보</span>
      <textarea class="bsn_regi_textareaStyle"></textarea>
   </div>
   <div class="bsn_regi_columm">
      <span>예약공지</span>
      <textarea class="bsn_regi_textareaStyle"></textarea>
   </div>
   <div class="bsn_regi_columm">
      <span>서비스</span>
      <textarea class="bsn_regi_textareaStyle"></textarea>
   </div>
   <div class="bsn_regi_columm">
   <div class="bsn_regi_row" style="justify-content: flex-end">
   <p><button class="backBtn" id="backBtn">이전</button></p>
   <p><button class="nextBtn" id="nextBtn" onclick="location.href='/bsnList'">등록하기</button></p>
   </div>
   </div>
<script type="text/javascript">
//버튼 요소를 가져옵니다.
var backBtn = document.getElementById('backBtn');

// 버튼 클릭 이벤트 핸들러를 정의합니다.
backBtn.addEventListener('click', function() {
  // http://localhost:5050/regi1로 이동합니다.
  window.location.href = 'http://localhost:5050/regi2';
});
</script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>