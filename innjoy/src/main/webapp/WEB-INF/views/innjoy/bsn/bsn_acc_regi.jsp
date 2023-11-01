<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%-- <%@ include file="../header/buser_header.jsp"%> --%>

<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
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
//    var form = document.createElement('form');
//    form.id = 'addForm';

    var resultDiv = document.createElement('div');
    resultDiv.id = 'resultDiv';
    form.appendChild(resultDiv);

    var fileboxDiv = document.createElement('div');
    fileboxDiv.className = 'filebox';
    fileboxDiv.style.display = 'inline';

    // 이미지 업로드를 위한 input 생성  
    var inputFile = document.createElement('input');
    inputFile.type = 'file';
    inputFile.name = 'rfname' + roomTypeCounter; // 고유한 이름 생성
    inputFile.id = 'rfname' + roomTypeCounter; // 고유한 ID 생성
    inputFile.style.display = 'none';
    inputFile.multiple = 'multiple';
    inputFile.className = 'upload-name';
    inputFile.setAttribute('onchange', 'previewImage(this, "View_area_roomPhoto_' + roomTypeCounter + '")');

    var uploadLabel = document.createElement('label');
    uploadLabel.setAttribute('for', 'rfname' + roomTypeCounter);
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
.resetButton {
	width: 100px;
	height: 50px;
	padding: 10px;
	font-weight: bold;
	border-radius: 5px;
	font-size: 18px;
}

.regBtn {
	width: 100px;
	height: 50px;
	padding: 10px;
	font-weight: bold;
	border-radius: 5px;
	font-size: 18px;
}

input {
	height: 35px;
}

select {
	height: 35px;
	width: 150px;
	padding-left: 5px;
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
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="bsn_regi_form">
		<div class="bsn_header_title">
			<h2>숙소등록</h2>
		</div>
	</div>
	<%
	String bsn_id = (String)session.getAttribute("bsnId");
	%>
	<form method="post" action="${path}/insertProduct"
	enctype="multipart/form-data" novalidate>
		<input name="bsn_id" value="<%=bsn_id %>" readonly type="hidden">
 		<div class="bsn_regi_columm">
			<label class="bsn_regi_bold" for="pro_type_id">숙소타입</label>
			<select name="pro_type_id">
				<option value="">숙소 타입 선택</option>
				<option value="10000" ${param.pro_type_id == '10000' ? '10000' : ''}>모텔</option>
				<option value="20000" ${param.pro_type_id == '20000' ? '20000' : ''}>호텔/리조트</option>
				<option value="30000" ${param.pro_type_id == '30000' ? '30000' : ''}>펜션</option>
			</select> 
		</div>

		<div class="bsn_regi_columm">
			<label class="bsn_regi_bold" for="pro_name">숙소명</label> <input
				style="width: 100%;" name="pro_name" id="pro_name"
				value="${param.pro_name }" type="text">
		</div>
		<div class="bsn_regi_columm">
			<label class="bsn_regi_bold" for="pro_loc">위치</label>
			<div class="bsn_regi_row">
				<select name="sido1" id="sido1" onchange="updateProLoc()"></select>
				<select name="gugun1" id="gugun1" onchange="updateProLoc()"></select>
				<input placeholder="상세 주소 입력" name="detail1" id="detail1" oninput="updateProLoc()">
				<input type="hidden" name="pro_loc" id="pro_loc">
			</div>
		</div>
<!-- 		
		<div class="bsn_regi_columm">
			<input type="file" name="fname" class="file-input" multiple="multiple" id="fname">
	        <label class="file-label" for="fname"></label>
		</div>
		
		<div class="bsn_regi_columm">
	<span class="bsn_regi_bold">메인숙소사진</span>
	<form id="addForm">
		<div id="resultDiv">
			<p th:text="${log}"></p>
		</div>
		<div style="display: inline;" class="filebox">
			<input type="file" name="fname" id="fname" 
			onchange="previewImage(this,'View_area')"
			style="display: none;" multiple class="upload-name" value="${param.fname}">
			<div class="bsn_regi_columm">
				<span id='View_area'/></span>
				<label for="fname">이미지 업로드</label>
			</div>
		</div>
	</form>
</div>
-->
<div class="bsn_regi_columm">
	<span class="bsn_regi_bold">메인숙소사진</span>
		<div id="resultDiv">
			<p th:text="${log}"></p>
		</div>
		<div style="display: inline;" class="filebox">
			<input type="file" name="fname" id="fname" 
			onchange="previewImage(this,'View_area')"
			style="display: none;" multiple class="upload-name" value="${param.fname}">
			<div class="bsn_regi_columm">
				<span id='View_area'/></span>
				<label for="fname">이미지 업로드</label>
			</div>
		</div>
</div>		

		<div class="bsn_regi_columm">
			<label class="bsn_regi_bold" for="basic_info ">기본정보</label>
			<textarea class="bsn_regi_textareaStyle" name="basic_info"
				id="basic_info">${param.basic_info }</textarea>
		</div>
		<div class="bsn_regi_columm">
			<label class="bsn_regi_bold" for="res_ann ">예약공지</label>
			<textarea class="bsn_regi_textareaStyle" name="res_ann"
				id="res_ann ">${param.res_ann }</textarea>
		</div>
		<div class="bsn_regi_columm">
			<label class="bsn_regi_bold" for="ser_conts ">서비스</label>
			<textarea class="bsn_regi_textareaStyle" name="ser_conts"
				id="ser_conts ">${param.ser_conts }</textarea>
		</div>
<!-- 	<div id="room_content">
			<div class="bsn_regi_columm" id="bsn_roomtype">
				<span id="roomTypeName" class="bsn_regi_bold">객실유형1</span>
				<div class="bsn_regi_row" style="padding-bottom: 20px;">
					<label style="padding-right: 1%;" for="room_name">객실명</label> <input
						style="width: 25%;" value="${param.room_name }" name="room_name"> <label
						style="padding-right: 1%; padding-left: 1%;" for="bed_cnt">베드구성</label>
					<input style="width: 25%" name="bed_cnt" value="${param.bed_cnt}"
						type="number" id="bed_cnt"> <label
						style="padding-right: 1%; padding-left: 1%;" for="pro_price">객실가격</label>
					<input style="width: 25%" name="room_price"
						value="${param.room_price }" type="number" id="pro_price">
				</div>
				<div class="bsn_regi_row">
					<select style="width: 25%">
						<option>객실 구조</option>
					</select> <label for="smoking" style="display: none;">흡연유무</label> <select
						style="width: 25%" name="smoking">
						<option>흡연유무</option>
						<option value="흡연" ${param.smoking == '흡연' ? '흡연' : ''}>흡연객실</option>
						<option value="금연" ${param.smoking == '금연' ? '금연' : ''}>금연객실</option>
					</select> <label for="min_cnt" style="display: none;">기준인원</label> <input
						style="width: 25%" name="min_cnt" value="${param.min_cnt}"
						type="number" id="min_cnt"> <label for="max_cnt"
						style="display: none;">최대인원</label> <input style="width: 25%"
						name="max_cnt" value="${param.max_cnt}" type="number" id="max_cnt">
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
		<input type="file" name="rfname" id="rfname" 
		onchange="previewImage(this,'View_area_roomPhoto')"
		style="display: none;" multiple class="upload-name" value="${param.fname}">
			<div class="bsn_regi_columm">
				<div class="bsn_regi_row">
					<span id='View_area_roomPhoto'></span>
				</div>
				<label for="rfname">이미지 업로드</label>
			</div>
		</div>
	</form>
</div>

		</div>
		<div class="bsn_regi_columm" id="bsn_RT_plusBtn">
			<p>
				<button type="button" class="bsn_roomtype_plus" value="createDiv"
					onclick="createDiv()">+ 객실 유형 추가</button>
			</p>
		</div>
-->
		<div class="bsn_regi_columm" id="bsn_resetBtn">
			<div class="bsn_regi_row" style="justify-content: flex-end">
			<!-- 	<p>
					<button class="resetButton" id="resetButton"
						onclick="resetInputs()" style="margin-right: 20px;">초기화</button>
				</p>
			-->
				<p>
					<button class="regBtn" id="regBtn" type="submit">다음</button>
				</p>
			</div>
		</div>
	</form>
	<jsp:include page="../header/footer.jsp" flush="true" />
	<script type="text/javascript">
	$(".file-input").on("change",function(){
     	$(this).next(".file-label").text($(this).val())
      })
	
	
$('document').ready(function() {
	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	 

	 // 시/도 선택 박스 초기화

	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });

	 

	// 시/도 선택시 구/군 설정
	    $("select[name^=sido]").change(function() {
	        var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	        var $gugun = $(this).next(); // 선택영역 군구 객체
	        $("option",$gugun).remove(); // 구군 초기화

	        if(area == "area0")
	            $gugun.append("<option value=''>구/군 선택</option>");
	        else {
	            $.each(eval(area), function() {
	                $gugun.append("<option value='"+this+"'>"+this+"</option>");
	            });
	        }
	        
	        updateConsoleLog();
	    });

	    // 구/군 선택시 console.log 값 업데이트
	    $("select[name^=gugun]").change(function() {
	        updateConsoleLog();
	    });

	    function updateConsoleLog() {
	        var selectedSido = $("select[name^=sido] option:selected").val();
	        var selectedGugun = $("select[name^=gugun] option:selected").val();
	        console.log("선택된 시/도:", selectedSido);
	        console.log("선택된 구/군:", selectedGugun);
	    }
	    
	    
	});
function updateProLoc() {
    // Get selected values from the dropdowns
    var selectedSido = document.querySelector('#sido1').value;
    var selectedGugun = document.querySelector('#gugun1').value;
    var detailInput = document.querySelector('#detail1').value;

    // Concatenate the values
    var proLocValue = selectedSido + ' ' + selectedGugun + ' ' + detailInput;

    // Update the value of pro_loc input
    var proLocInput = document.querySelector('#pro_loc');
    proLocInput.value = proLocValue;
}
	
</script>
</body>
</html>