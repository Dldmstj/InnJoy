<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@include file="../header/buser_header.jsp"%> 
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
      <h2> 후기 관리 </h2>
   </div>
</div>
<div id="board-list" style="padding-top:30px;">
	<div class="container">
	    <table class="board-table">
	        <thead>
	        <tr>
	            <th scope="col" class="th-num">번호</th>
	            <th scope="col" class="th-title">숙소명</th>
	            <th scope="col" class="th-loc">위치</th>
	            <th scope="col" class="th-moveLink"></th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	            <td>2</td>
	            <th><a href="/bsnReviewDetail">그랜드하얏트</a></th>
	            <td>서울턱별시 어쩌고 저쩌고 무슨리 100</td>
	            <td>후기관리</td>
	        </tr>
	
	        <tr>
	            <td>1</td>
	            <th><a href="/bsnReviewDetail">가평펜션</a></th>
	            <td>경기도 가평군 어쩌고 저쩌고 무슨리 100</td>
	            <td>후기관리</td>
	        </tr>
	        </tbody>
	    </table>
	</div>
</div>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>