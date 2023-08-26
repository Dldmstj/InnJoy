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
// 객실 유형 추가 함수
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
	// 객실 유형 카운터 증가 및 객실 유형명 업데이트
	var roomTypeNameSpan = newDiv.querySelector('span[id="roomTypeName"]');
	roomTypeNameSpan.textContent = '객실유형' + roomTypeCounter;
	// 새로운 div 요소를 body에 추가
	document.body.appendChild(newDiv);
	// "createDiv()" button 박스를 찾아 이동
	var createDivButton1 = document.querySelector('div[id="bsn_RT_plusBtn"]');
	createDivButton1.parentNode.appendChild(createDivButton1);
	var createDivButton2 = document.querySelector('div[id="bsn_no_plus"]');
	createDivButton2.parentNode.appendChild(createDivButton2);
	var createDivButton3 = document.querySelector('div[id="bsn_resetBtn"]');
	createDivButton3.parentNode.appendChild(createDivButton3);
   
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
	
	// 객실유형사진 div를 bsn_regi_roomPhoto div에 추가
	var bsnRegiRoomPhotoDiv = document.getElementById('bsn_regi_roomPhoto');
	bsnRegiRoomPhotoDiv.appendChild(roomTypeImageDiv);
	
	// bsn_regi_roomPhoto_plus 버튼을 원하는 위치로 이동
	var createDivButton = document.querySelector('div[id="bsn_regi_roomPhoto_plus"]');
	bsnRegiRoomPhotoDiv.appendChild(createDivButton);
	
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
<div class="bsn_regi_form">
	<div class="bsn_header_title">
		<h2> 숙소등록 </h2>
		<div class="bsn_header_num">
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
		<input placeholder="상세 주소 입력">
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
	<p>
	<button class="bsn_roomtype_plus" value="createDiv"
		onclick="createDiv()">+ 객실 유형 추가</button>
	</p>
</div>
<div id="bsn_no_plus">
	<div class="bsn_regi_columm">
		<span class="bsn_regi_bold">메인숙소사진</span>
		<form id="addForm">
			<div id="resultDiv">
				<p th:text="${log}"></p>
			</div>
			<div style="display: inline;" class="filebox">
				<input type="file" name="img_upload" id="img_upload" 
				onchange="previewImage(this,'View_area')"
				style="display: none;" multiple class="upload-name">
				<div class="bsn_regi_columm">
					<span id='View_area'/></span>
					<label for="img_upload">이미지 업로드</label>
				</div>
			</div>
		</form>
	</div>
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
	<div id="bsn_regi_roomPhoto_plus">
		<div class="bsn_regi_columm">
			<span class="bsn_regi_bold">기본정보</span>
			<textarea class="bsn_regi_textareaStyle"></textarea>
		</div>
		<div class="bsn_regi_columm">
			<span class="bsn_regi_bold">예약공지</span>
			<textarea class="bsn_regi_textareaStyle"></textarea>
		</div>
		<div class="bsn_regi_columm">
			<span class="bsn_regi_bold">서비스</span>
			<textarea class="bsn_regi_textareaStyle"></textarea>
		</div>
		<div class="bsn_regi_columm" id="bsn_resetBtn">
			<div class="bsn_regi_row" style="justify-content: flex-end">
			<p>
			<button class="resetButton" id="resetButton" onclick="resetInputs()"
				style="margin-right:20px;">초기화</button>
			</p>
			<p>
			<button class="nextBtn" id="nextBtn">등록하기</button>
			</p>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">


</script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>