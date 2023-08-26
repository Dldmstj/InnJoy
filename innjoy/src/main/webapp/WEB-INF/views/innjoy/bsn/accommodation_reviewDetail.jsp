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
<style>
    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.4);
    }
    
    .bsn_modal-content {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 2px solid #B0CC69;
        width: 500px;
        max-height: 70%; /* 최대 높이 지정 */
        overflow-x: hidden; /* 가로 스크롤 숨김 */
        overflow-y: auto; /* 세로 스크롤만 표시 */
    }
    
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }
    .bsn_regi_row > div {
        width: 300px; /* 각 컨텐츠의 너비 조정 */
    }
    .warningButton{
		width:100px;
		height:50px;
		padding:10px;
		font-weight: bold;
		border-radius:5px;
		font-size: 18px;
		background-color:#8B0000;
		color:aliceblue;
	}
    .resetButton{
		width:100px;
		height:50px;
		padding:10px;
		font-weight: bold;
		border-radius:5px;
		font-size: 18px;
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
      <h2> 후기 관리 </h2>
   </div>
</div>
   <div class="bsn_regi_columm">
   <div class="bsn_align_center">
      <div style="width:800px; height:300px; border:1px solid black;"></div>
   </div>
      <span style="padding-left:100px;">숙소명</span>
      <span style="padding-left:100px;">위치</span>
      <span style="padding-left:100px;">★★★★★ 5.0 (150)</span>
   </div>
   <div class="bsn_regi_columm">
   	<div class="bsn_regi_row">
		<div style="width:300px; height:300px; border:1px solid black; margin-right:10px;"></div>
		<div style="width:300px; height:300px; border:1px solid black; margin-right:10px;"></div>
		<div style="width:300px; height:300px; border:1px solid black; margin-right:10px;"></div>
	</div>
		<span>★★★★★</span>
		<span>닉네임 | 등록날짜</span>
		<textarea class="bsn_regi_textareaStyle" style="width:300px; border:none;">후기내용</textarea>
	<div class="bsn_regi_row" style="justify-content: flex-start">
	<p>
	<button class="nextBtn" id="nextBtn" onclick="openModal()"
		style="margin-right:20px;">답글달기</button>
	</p>
	<p>
	<button class="warningButton" id="warningBtn">신고하기</button>
	</p>
	</div>
	</div>
   <div class="bsn_regi_columm">
   	<div class="bsn_regi_row">
		<div style="width:300px; height:300px; border:1px solid black; margin-right:10px;"></div>
		<div style="width:300px; height:300px; border:1px solid black; margin-right:10px;"></div>
		<div style="width:300px; height:300px; border:1px solid black; margin-right:10px;"></div>
	</div>
		<span>★★★★★</span>
		<span>닉네임 | 등록날짜</span>
		<textarea class="bsn_regi_textareaStyle" style="width:300px; border:none;">후기내용</textarea>
	<div class="bsn_regi_row" style="justify-content: flex-start">
	<p>
	<button class="nextBtn" id="nextBtn" onclick="openModal()"
		style="margin-right:20px;">답글달기</button>
	</p>
	<p>
	<button class="warningButton" id="warningBtn">신고하기</button>
	</p>
	</div>
	</div>
<!-- 모달 창 -->
<div id="myModal" class="modal">
    <div class="bsn_modal-content">
    <div style="display:flex; justify-content: flex-end;">
    	<span class="close" onclick="closeModal()">&times;</span>
    </div>
    <div class="bsn_regi_columm">
   	<div class="bsn_regi_row">
		<div style="width:100px; height:100px; border:1px solid black; margin-right:10px;"></div>
		<div style="width:100px; height:100px; border:1px solid black; margin-right:10px;"></div>
		<div style="width:100px; height:100px; border:1px solid black; margin-right:10px;"></div>
	</div>
		<span>★★★★★</span>
		<span>닉네임 | 등록날짜</span>
		<textarea class="bsn_regi_textareaStyle" style="width:300px; border:none;">후기내용</textarea>
		<textarea class="bsn_regi_textareaStyle" style="width:400px; border:1px solid black;">답글내용</textarea>
		<div class="bsn_regi_columm" id="bsn_resetBtn">
			<div class="bsn_regi_row" style="justify-content: flex-start">
			<p>
			<button class="nextBtn" id="nextBtn"
				style="margin-right:20px;">등록하기</button>
			</p>
			<p>
			<button class="resetButton" id="resetButton" onclick="closeModal()">취소</button>
			</p>
			</div>
		</div>
	</div>
    </div>
</div>
<script>
    // 모달 열기 함수
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    // 모달 닫기 함수
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }
</script>
<%@include file="../header/footer.jsp"%>
</body>
</html>