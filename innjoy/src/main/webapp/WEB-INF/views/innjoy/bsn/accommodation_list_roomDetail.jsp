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
      <span style="padding-left:100px;">객실명</span>
      <div class="bsn_regi_columm">
	      <span style="padding-left:100px;">가격</span>
	      <span style="padding-left:100px;">베드구성</span>
	      <span style="padding-left:100px;">객실구조</span>
	      <span style="padding-left:100px;">흡연/금연</span>
	      <span style="padding-left:100px;">기준인원/최대인원</span>
	      <span style="padding-left:100px;">체크인 시간</span>
	      <span style="padding-left:100px;">체크아웃 시간</span>
      </div>
   </div>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>