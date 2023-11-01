<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
//객실 유형 추가 함수
var roomTypeCounter = 2; // 객실 유형 카운터 변수

function createDiv() {
	
    // 복제할 div 요소 선택
    var originalDiv = document.querySelector('#bsn_roomtype');
    
    // 새로운 div 요소 생성
    var newDiv = originalDiv.cloneNode(true);
    
    // 기존 div의 내용 초기화
    var inputs = newDiv.querySelectorAll('input');
    inputs.forEach(function(input) {
        input.value = ''; // 입력 필드의 값을 초기화
    });
    // 기존 div의 내용 초기화
   	var inputn = newDiv.querySelectorAll('input[type="number"]');
    inputn.forEach(function(input) {
        input.value = ''; // 숫자 입력 필드의 값을 초기화
    });

    // 객실 유형 카운터 증가 및 객실 유형명 업데이트
    var roomTypeNameSpan = newDiv.querySelector('span[id="roomTypeName"]');
    roomTypeNameSpan.textContent = '객실유형' + roomTypeCounter;

    // 새로운 div 요소를 #room_content div 아래에 추가
    var roomContentDiv = document.getElementById('room_content');
    roomContentDiv.appendChild(newDiv);

    // 객실유형사진 div 생성
    var roomTypeImageDiv = document.createElement('div');
    roomTypeImageDiv.className = 'bsn_regi_columm';
    roomTypeImageDiv.id = 'bsn_regi_roomPhoto_' + roomTypeCounter;

    // 객실유형(숫자)사진 위한 제목(span) 추가
    var span = document.createElement('span');
    span.className = 'bsn_regi_bold';
    span.textContent = '객실유형' + roomTypeCounter + '사진';
    roomTypeImageDiv.appendChild(span);

    // 이미지 업로드를 위한 form 생성
    var form = document.createElement('form');
    form.id = 'addForm';

    var resultDiv = document.createElement('div');
    resultDiv.id = 'resultDiv';
    form.appendChild(resultDiv);

    var fileboxDiv = document.createElement('div');
    fileboxDiv.className = 'filebox';
    fileboxDiv.style.display = 'inline';

    // 이미지 업로드를 위한 input 생성  
    var inputFile = document.createElement('input');
    inputFile.type = 'file';
    inputFile.name = 'img_upload_roomPhoto_' + roomTypeCounter; // 고유한 이름 생성
    inputFile.id = 'img_upload_roomPhoto_' + roomTypeCounter; // 고유한 ID 생성
    inputFile.style.display = 'none';
    inputFile.multiple = 'multiple';
    inputFile.className = 'upload-name';
    inputFile.setAttribute('onchange', 'previewImage(this, "View_area_roomPhoto_' + roomTypeCounter + '")');

    var uploadLabel = document.createElement('label');
    uploadLabel.setAttribute('for', 'img_upload_roomPhoto_' + roomTypeCounter);
    uploadLabel.textContent = '이미지 업로드';

    fileboxDiv.appendChild(inputFile);

    var innerDiv = document.createElement('div');
    innerDiv.className = 'bsn_regi_columm';
    innerDiv.innerHTML = '<span id="View_area_roomPhoto_' + roomTypeCounter + '"></span>';
    innerDiv.appendChild(uploadLabel);

    fileboxDiv.appendChild(innerDiv);
    form.appendChild(fileboxDiv);
    roomTypeImageDiv.appendChild(form);

    roomContentDiv.appendChild(roomTypeImageDiv); // 객실유형사진 div를 roomContentDiv에 추가

    // "createDiv()" 버튼을 새로운 div 다음에 배치
    var createDivButton = document.querySelector('div[id="bsn_RT_plusBtn"]');
    roomContentDiv.appendChild(createDivButton);

    roomTypeCounter++; // 객실 유형 카운터 증가(새로 추가되는 2,3,4,...)
}
	

// 내용 초기화 js
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
	// 동적으로 추가된 객실유형 div 제거
	var roomTypeDivs = document.querySelectorAll('.bsn_regi_columm[id^="bsn_roomtype"]');
	for (var i = 1; i < roomTypeDivs.length; i++) {
	   roomTypeDivs[i].remove();
	}
	// 동적으로 추가된 객실유형사진 이미지업로드 div 제거
	var roomPhotoDivs = document.querySelectorAll('.bsn_regi_columm[id^="bsn_regi_roomPhoto"]');
	for (var i = 1; i < roomPhotoDivs.length; i++) {
	 roomPhotoDivs[i].remove();
	}
	// Reset textarea 요소
    var textareaElements = document.querySelectorAll('.bsn_regi_columm textarea');
    for (var i = 0; i < textareaElements.length; i++) {
        textareaElements[i].value = '';
    }
	// 모든 입력값 초기화 후 스크롤을 페이지 맨 위로 이동
	window.scrollTo({
	top: 0,
	behavior: 'smooth'
	});
   
	}
}

var fileArr = [];
var fileInfoArr = [];
var viewAreaIds = ['View_area', 'View_area_roomPhoto'];

function fileRemove(viewAreaIndex, fileIndex) {
    alert("이미지를 삭제하시겠습니까?");
    console.log("View Area Index: " + viewAreaIndex + ", File Index: " + fileIndex);
    fileInfoArr[viewAreaIndex].splice(fileIndex, 1);

    var imgId = "#img_id_" + viewAreaIndex + "_" + fileIndex;
    $(imgId).remove();
    console.log(fileInfoArr);
}

function previewImage(targetObj, viewAreaId) {
    var files = targetObj.files;
    var viewAreaIndex = viewAreaIds.indexOf(viewAreaId);

    fileInfoArr[viewAreaIndex] = Array.prototype.slice.call(files);

    var preview = document.getElementById(viewAreaId);

    while (preview.firstChild) {
        preview.removeChild(preview.firstChild);
    }

    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var imageType = /image.*/;

        if (!file.type.match(imageType)) continue;

        var span = document.createElement('span');
        span.id = "img_id_" + viewAreaIndex + "_" + i;
        span.style.width = '200px';
        span.style.height = '200px';
        span.style.display = 'inline-block';
        preview.appendChild(span);

        var img = document.createElement("img");
        img.className = "addImg";
        img.classList.add("obj");
        img.file = file;
        img.style.width = '100%';
        img.style.height = '100%';
        img.style.cursor = 'pointer';
        const fileIdx = i;
        img.onclick = () => fileRemove(viewAreaIndex, fileIdx);
        span.appendChild(img);

        var reader = new FileReader();
        reader.onload = (function (aImg) {
            return function (e) {
                aImg.src = e.target.result;
            };
        })(img);
        reader.readAsDataURL(file);
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
	.regBtn{
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
	/* 이미지 업로드 버튼 스타일 */
.filebox {
  position: relative;
  display: inline-block;
  margin-top: 10px;
}

.filebox input[type="file"] {
  position: absolute;
  opacity: 0;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  cursor: pointer;
}

.filebox label {
  display: inline-block;
  background-color: #B0CC69;
  color: #fff;
  padding: 8px 20px;
  border-radius: 5px;
  cursor: pointer;
  margin-top:10px;
}
	
</style>
</head>
<body>
<script type="text/javascript">
	$("#regBtn").click(function() {
	    var forms = $("#regForm");
	    var formDataArray = [];
	
	    forms.each(function() {
	    	var formData = $(this).serializeArray();
	        formDataArray.push(formData);
			console.log(formData)
	    });
	    
		console.log("콘솔 뜨나요")
		console.log(formDataArray)
	    // 서버로 데이터 전송
	    $.ajax({
	        type: "POST",
	        url: "/insertRoom",
	        data: JSON.stringify(formDataArray),
	        contentType: "application/json",
	        success: function(rs) {
	            // 서버 응답 처리
	            console.log(rs);
	            alert("result: "+rs)
	            location.href="/main";
	        },
	        error: function(error) {
	            console.error("에러 발생:", error);
	        }
	    });
	});
/* 	function regRoom() {
	    var forms = $("#regForm");
	    var formDataArray = [];
	
	    forms.each(function() {
	        var formData = forms.serializeArray();
	        formDataArray.push(formData);
	    });
        console.log(formDataArray);
	
	    // 서버로 데이터 전송
	    $.ajax({
	        type: "POST",
	        url: "/insertRoom",
	        data: JSON.stringify(formDataArray),
	        contentType: "application/json",
	        success: function(rs) {
	            // 서버 응답 처리
	            console.log(rs);
	            alert("result: "+rs)
	            location.href="/main";
	        },
	        error: function(error) {
	            console.error("에러 발생:", error);
	        }
	    });
	} */
</script>
<div class="bsn_regi_form">
	<div class="bsn_header_title">
		<h2> 객실 등록 </h2>
	</div>
</div>
<form id="regForm">
<div class="bsn_regi_columm">
	<span class="bsn_regi_bold">체크인/체크아웃 시간 선택</span>
	<div class="bsn_regi_row">
		<span style="width:100pt;">체크인 시간</span>
		<select style="width:130pt;" name="checkin">
			<option value="">체크인 시간 선택</option>
			<option value="13:00" ${param.checkin == '13:00' ? '13:00' : ''}>13:00</option>
			<option value="13:30" ${param.checkin == '13:30' ? '13:30' : ''}>13:30</option>
			<option value="14:00" ${param.checkin == '14:00' ? '14:00' : ''}>14:00</option>
			<option value="14:30" ${param.checkin == '14:30' ? '14:30' : ''}>14:30</option>
			<option value="15:00" ${param.checkin == '15:00' ? '15:00' : ''}>15:00</option>
			<option value="15:30" ${param.checkin == '15:30' ? '15:30' : ''}>15:30</option>
			<option value="16:00" ${param.checkin == '16:00' ? '16:00' : ''}>16:00</option>
			<option value="16:30" ${param.checkin == '16:30' ? '16:30' : ''}>16:30</option>
			<option value="17:00" ${param.checkin == '17:00' ? '17:00' : ''}>17:00</option>
			<option value="17:30" ${param.checkin == '17:30' ? '17:30' : ''}>17:30</option>
			<option value="18:00" ${param.checkin == '18:00' ? '18:00' : ''}>18:00</option>
		</select>
	</div>
	<div class="bsn_regi_row">
		<span style="width:100pt;">체크아웃 시간</span>
		<select style="width:130pt;" name="checkout">
			<option value="">체크아웃 시간 선택</option>
			<option value="09:00" ${param.checkout == '09:00' ? '09:00' : ''}>09:00</option>
			<option value="09:30" ${param.checkout == '09:30' ? '09:30' : ''}>09:30</option>
			<option value="10:00" ${param.checkout == '10:00' ? '10:00' : ''}>10:00</option>
			<option value="10:30" ${param.checkout == '10:30' ? '10:30' : ''}>10:30</option>
			<option value="11:00" ${param.checkout == '11:00' ? '11:00' : ''}>11:00</option>
			<option value="11:30" ${param.checkout == '11:30' ? '11:30' : ''}>11:30</option>
			<option value="12:00" ${param.checkout == '12:00' ? '12:00' : ''}>12:00</option>
			<option value="12:30" ${param.checkout == '12:30' ? '12:30' : ''}>12:30</option>
			<option value="13:00" ${param.checkout == '13:00' ? '13:00' : ''}>13:00</option>
			<option value="13:30" ${param.checkout == '13:30' ? '13:30' : ''}>13:30</option>
			<option value="14:00" ${param.checkout == '14:00' ? '14:00' : ''}>14:00</option>
		</select>
	</div>
</div>
<div id="room_content">
<div class="bsn_regi_columm" id="bsn_roomtype">
	<span id="roomTypeName" class="bsn_regi_bold">객실유형1</span>
	<div class="bsn_regi_row" style="padding-bottom:20px;">
		<label style="padding-right:1%;" for="room_name">객실명</label>
		<input style="width:25%;" name="room_name" value="${param.room_name }">
		<label style="padding-right:1%; padding-left:1%;" for="bed_cnt">베드구성</label>
		<input style="width:25%" name="bed_cnt" value="${param.bed_cnt}" type="text" id="bed_cnt">
		<label style="padding-right:1%; padding-left:1%;" for="pro_price">객실가격</label>
		<input style="width:25%" name="room_price" value="${param.room_price }" type="number" id="room_price">
	</div>
	<div class="bsn_regi_row">
		<select style="width:25%">
			<option>객실 구조</option>
		</select>
		<label for="smoking" style="display:none;">흡연유무</label>
		<select style="width:25%" name="smoking">
			<option>흡연유무</option>
			<option value="흡연" ${param.smoking == '흡연' ? '흡연' : ''}>흡연객실</option>
			<option value="금연" ${param.smoking == '금연' ? '금연' : ''}>금연객실</option>
		</select>
		<label for="min_cnt" style="display:none;">기준인원</label>
		<input style="width:25%" name="min_cnt" value="${param.min_cnt}" type="number" id="min_cnt">
		<label for="max_cnt" style="display:none;">최대인원</label>
		<input style="width:25%" name="max_cnt" value="${param.max_cnt}" type="number" id="max_cnt">
	</div>
</div>
<!--
<div class="bsn_regi_columm" id="bsn_regi_roomPhoto">
	<span class="bsn_regi_bold">객실유형1사진</span>
	<form id="addForm">
		<div id="resultDiv">
			<p th:text="${log}"></p>
	</div>
	<div style="display: inline;" class="filebox">
		<input type="file" name="img_upload_roomPhoto" id="img_upload_roomPhoto" 
		onchange="previewImage(this,'View_area_roomPhoto')"
		style="display: none;" multiple class="upload-name">
			<div class="bsn_regi_columm">
				<div class="bsn_regi_row">
					<span id='View_area_roomPhoto'></span>
				</div>
				<label for="img_upload_roomPhoto">이미지 업로드</label>
			</div>
		</div>
	</form>
</div>
-->
</div>
<div class="bsn_regi_columm" id="bsn_RT_plusBtn">
	<p>
	<button class="bsn_roomtype_plus" value="createDiv" type="button"
		onclick="createDiv()">+ 객실 유형 추가</button>
	</p>
</div>
<div class="bsn_regi_columm" id="bsn_resetBtn">
	<div class="bsn_regi_row" style="justify-content: flex-end">
<!-- 	<p>
	<button class="resetButton" id="resetButton" onclick="resetInputs()"
		style="margin-right:20px;">초기화</button>
	</p>
-->
	<p>
	<button class="regBtn" id="reBtn" onclick="redirectToPage()">이전</button>
	<button class="regBtn" id="regBtn">등록</button>
	</p>
	</div>
</div>
</form>
<script type="text/javascript">
function redirectToPage() {
    window.location.href = "${path}/insertRoom";
}
</script>
<jsp:include page="../header/footer.jsp" flush="true"/>

</body>
</html>