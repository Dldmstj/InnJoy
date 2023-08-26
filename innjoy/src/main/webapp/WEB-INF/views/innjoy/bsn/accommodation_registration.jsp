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
var roomTypeCounter = 2; // 객실 유형 카운터 변수

function createDiv() {
   // 복제할 div 요소 선택
   var originalDiv = document.querySelector('#bsn_roomtype');

   // 새로운 div 요소 생성
   var newDiv = originalDiv.cloneNode(true);

   // 객실 유형 카운터 증가 및 객실 유형명 업데이트
   var roomTypeNameSpan = newDiv.querySelector('span[id="roomTypeName"]');
   roomTypeNameSpan.textContent = '객실유형' + roomTypeCounter;

   // 새로운 div 요소를 body에 추가
   document.body.appendChild(newDiv);

   // "createDiv()" button 박스를 찾아 이동
   var createDivButton1 = document.querySelector('div[id="bsn_RT_plusBtn"]');
   createDivButton1.parentNode.appendChild(createDivButton1);
   var createDivButton2 = document.querySelector('div[id="bsn_resetBtn"]');
   createDivButton2.parentNode.appendChild(createDivButton2);

   roomTypeCounter++; // 객실 유형 카운터 증가
}

function resetInputs() {
	var confirmation = confirm("모든 입력값을 초기화하시겠습니까?");
	if (confirmation) {
	   // Reset 숙소타입 dropdown to its default
	   var roomTypeDropdown = document.querySelector('.bsn_regi_columm select');
	   roomTypeDropdown.selectedIndex = 0;

	   // Reset 숙소명 input
	   var roomNameInput = document.querySelector('.bsn_regi_columm input');
	   roomNameInput.value = '';

	   // Reset 위치 inputs
	   var locationInputs = document.querySelectorAll('.bsn_regi_columm select + select + input');
	   for (var i = 0; i < locationInputs.length; i++) {
	      locationInputs[i].value = '';
	   }

	   // Reset 체크인/체크아웃 시간 selects
	   var checkinSelect = document.querySelector('.bsn_regi_row select');
	   var checkoutSelect = document.querySelector('.bsn_regi_row:last-child select');
	   checkinSelect.selectedIndex = 0;
	   checkoutSelect.selectedIndex = 0;

	   // Reset 객실 유형 inputs
	   var roomTypeInputs = document.querySelectorAll('.bsn_regi_columm input:not([type="hidden"])');
	   for (var i = 0; i < roomTypeInputs.length; i++) {
	      roomTypeInputs[i].value = '';
	   }

	   // Reset 객실 구조, 흡연유무, 기준인원, 최대인원 selects
	   var selects = document.querySelectorAll('.bsn_regi_columm select:last-child');
	   for (var i = 0; i < selects.length; i++) {
	      selects[i].selectedIndex = 0;
	   }

	   // Reset 객실 유형 카운터
	   roomTypeCounter = 2;
	   
	   // Remove dynamically created room type divs
	   var roomTypeDivs = document.querySelectorAll('.bsn_regi_columm[id^="bsn_roomtype"]');
	   for (var i = 1; i < roomTypeDivs.length; i++) {
	      roomTypeDivs[i].remove();
	   }
	   
	}
}
</script>

<link rel="stylesheet" href="${path}/assets/css/bsn_regi.css">
<style type="text/css">
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
	input{
		height:35px;
	}
	select{
		height:35px;
		width:150px;
		padding-left:5px;
	}
</style>
</head>
<body>
<div class="bsn_regi_form">
   <div class="bsn_header_title">
      <h2> 숙소등록 </h2>
      <div class="bsn_header_num">
      <!-- <ul class="colorcircle_list">
            <li class="colorcircle_item select"></li>
            <li class="colorcircle_item"></li>
            <li class="colorcircle_item"></li>
        </ul> -->
        <span class="bsn_order_num pre">1</span>
        <span class="bsn_order_num">2</span>
        <span class="bsn_order_num">3</span>
      </div>
   </div>
</div>
   <div class="bsn_regi_columm">
      <span class="bsn_regi_bold">숙소타입</span>
      <select>
         <option>숙소 타입 선택</option>
         <option>호텔/리조트</option>
         <option>모텔</option>
         <option>펜션</option>
      </select>
   </div>
   <div class="bsn_regi_columm">
      <span class="bsn_regi_bold">숙소명</span>
         <input style="width:100%;">
   </div>
   <div class="bsn_regi_columm">
      <span class="bsn_regi_bold">위치</span>
         <div class="bsn_regi_row">
            <select>
               <option>시/도 선택</option>
            </select>
            <select>
               <option>군/구 선택</option>
            </select>
            <input>
         </div>
   </div>
   <div class="bsn_regi_columm">
      <span class="bsn_regi_bold">체크인/체크아웃 시간 선택</span>
      <div class="bsn_regi_row">
         <span style="width:100pt;">체크인 시간</span>
	      <select style="width:120pt;">
	         <option>체크인 시간 선택</option>
	         <option>11:00</option>
	         <option>11:30</option>
	         <option>12:00</option>
	         <option>12:30</option>
	         <option>13:00</option>
	         <option>13:30</option>
	         <option>14:00</option>
	         <option>14:30</option>
	         <option>15:00</option>
	         <option>15:30</option>
	         <option>16:00</option>
	         <option>16:30</option>
	         <option>17:00</option>
	         <option>18:00</option>
	      </select>
	  </div>
      <div class="bsn_regi_row">
         <span style="width:100pt;">체크아웃 시간</span>
	      <select style="width:120pt;">
	         <option>체크아웃 시간 선택</option>
	         <option>08:00</option>
	         <option>08:30</option>
	         <option>09:00</option>
	         <option>09:30</option>
	         <option>10:00</option>
	         <option>10:30</option>
	         <option>11:00</option>
	         <option>11:30</option>
	         <option>12:00</option>
	         <option>12:30</option>
	         <option>13:00</option>
	         <option>13:30</option>
	         <option>14:00</option>
	      </select>
	  </div>
   </div>
   <div class="bsn_regi_columm" id="bsn_roomtype">
      <span id="roomTypeName" class="bsn_regi_bold">객실유형1</span>
         <div class="bsn_regi_row" style="padding-bottom:20px;">
            <span style="padding-right:1%;">객실명</span>
               <input style="width:25%;">
            <span style="padding-right:1%; padding-left:1%;">베드구성</span>
               <input style="width:25%">
            <span style="padding-right:1%; padding-left:1%;">객실가격</span>
               <input style="width:25%">
         </div>
      <div class="bsn_regi_row">
         <select style="width:25%">
            <option>객실 구조</option>
         </select>
         <select style="width:25%">
            <option>흡연유무</option>
         </select>
         <select style="width:25%">
            <option>기준인원</option>
         </select>
         <select style="width:25%">
            <option>최대인원</option>
         </select>
      </div>
   </div>
   <div class="bsn_regi_columm" id="bsn_RT_plusBtn">
   <p><button class="bsn_roomtype_plus" value="createDiv" onclick="createDiv()">+ 객실 유형 추가</button></p>
   </div>
   <div class="bsn_regi_columm" id="bsn_resetBtn">
   <div class="bsn_regi_row" style="justify-content: flex-end">
   <p><button class="resetButton" id="resetButton" onclick="resetInputs()" style="margin-right:20px;">초기화</button></p>
   <p><button class="nextBtn" id="nextBtn">다음</button></p>
   </div>
   </div>
<script type="text/javascript">
//버튼 요소를 가져옵니다.
var nextBtn = document.getElementById('nextBtn');

// 버튼 클릭 이벤트 핸들러를 정의합니다.
nextBtn.addEventListener('click', function() {
  // http://localhost:5050/regi2로 이동합니다.
  window.location.href = 'http://localhost:5050/regi2';
});

</script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>