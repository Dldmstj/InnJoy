<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
.bsn_image-container {
   width: 300px;
   height: 300px;
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 20px 0;
   box-sizing: border-box;
   overflow: hidden;
 }

 .bsn_image-container img {
   width: auto;
   height: 300px;
 }
</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../header/buser_header.jsp" flush="true"/> <%-- 공통 상단바 --%>    
<div class="bsn_regi_form">
   <div class="bsn_header_title">
      <h2> 숙소 등록 현황 </h2>
   </div>
</div>
<div class="bsn_regi_row">
   <div class="bsn_regi_columm">
      <span>1.</span>
       <div class="bsn_image-container">
		  <img src="${path}/assets/img/bsn/숙소1.jpg" onclick="location.href='/bsnListDetail'" alt="숙소 이미지">
		</div>
      <span>숙소명</span>
      <span>위치</span>
   </div>
   <div class="bsn_regi_columm">
      <span>2.</span>
      <div class="bsn_image-container">
		  <img src="${path}/assets/img/bsn/숙소2.jpg" alt="숙소 이미지">
		</div>
      <span>숙소명</span>
      <span>위치</span>
   </div>
   <div class="bsn_regi_columm">
      <span>3.</span>
      <div class="bsn_image-container">
		  <img src="${path}/assets/img/bsn/숙소3.png" alt="숙소 이미지">
		</div>
      <span>숙소명</span>
      <span>위치</span>
   </div>
</div>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>