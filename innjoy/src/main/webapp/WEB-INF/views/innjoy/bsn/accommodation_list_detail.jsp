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
</head>
<body>
<div class="bsn_regi_form">
   <div class="bsn_header_title">
      <h2> 숙소 등록 세부 정보 </h2>
   </div>
</div>
   <div class="bsn_regi_columm">
   <div class="bsn_align_center">
      <div style="width:800px; height:300px; border:1px solid black;"></div>
   </div>
      <span style="padding-left:100px;">숙소명</span>
      <span style="padding-left:100px;">위치</span>
   </div>
   <div class="bsn_regi_row">
   <div class="bsn_regi_columm">
		<div style="width:300px; height:300px; border:1px solid black;" onclick="location.href='/bsnListRoomDetail'"></div>
		<span>객실명</span>
		<span>기준인원/최대인원</span>
		<span>가격</span>
	</div>
   <div class="bsn_regi_columm">
		<div style="width:300px; height:300px; border:1px solid black;"></div>
		<span>객실명</span>
		<span>기준인원/최대인원</span>
		<span>가격</span>
	</div>
   <div class="bsn_regi_columm">
		<div style="width:300px; height:300px; border:1px solid black;"></div>
		<span>객실명</span>
		<span>기준인원/최대인원</span>
		<span>가격</span>
	</div>
   </div>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
