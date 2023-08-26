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
        <span class="bsn_order_num">1</span>
        <span class="bsn_order_num pre">2</span>
        <span class="bsn_order_num">3</span>
      </div>
   </div>
</div>
   <div class="bsn_regi_columm">
      <span>메인숙소사진</span>
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
   <div class="bsn_regi_columm">
      <span>객실유형1사진</span>
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
   <div class="bsn_regi_columm">
   <div class="bsn_regi_row" style="justify-content: flex-end">
   <p><button class="backBtn" id="backBtn">이전</button></p>
   <p><button class="nextBtn" id="nextBtn">다음</button></p>
   </div>
   </div>
<script>
//버튼 요소를 가져옵니다.
var backBtn = document.getElementById('backBtn');

// 버튼 클릭 이벤트 핸들러를 정의합니다.
backBtn.addEventListener('click', function() {
  // http://localhost:5050/regi1로 이동합니다.
  window.location.href = 'http://localhost:5050/regi1';
});
//버튼 요소를 가져옵니다.
var nextBtn = document.getElementById('nextBtn');

// 버튼 클릭 이벤트 핸들러를 정의합니다.
nextBtn.addEventListener('click', function() {
  // http://localhost:5050/regi2로 이동합니다.
  window.location.href = 'http://localhost:5050/regi3';
});

var fileArr;
var fileInfoArr=[];

//썸네일 클릭시 삭제.
function fileRemove(index) {
	alert("이미지를 삭제하시겠습니까?")
    console.log("index: "+index);
    fileInfoArr.splice(index,1);
 
    var imgId="#img_id_"+index;
    $(imgId).remove();
    console.log(fileInfoArr);
}

//썸네일 미리보기.
function previewImage(targetObj, View_area) {
    var files=targetObj.files;
    fileArr=Array.prototype.slice.call(files);
    
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;
 
    //ie일때(IE8 이하에서만 작동)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
 
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
 
            var img = document.getElementById(View_area); //이미지가 뿌려질 곳
 
            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
        //ie가 아닐때(크롬, 사파리, FF)
    } else {
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {
            var file = files[i];
            fileInfoArr.push(file);
 
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;
            // var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
            // if (prevImg) {
            //     preview.removeChild(prevImg);
            // }
 
            var span=document.createElement('span');
            span.id="img_id_" +i;
            span.style.width = '200px';
            span.style.height = '200px';
            preview.appendChild(span);
 
            var img = document.createElement("img");
            img.className="addImg";
            img.classList.add("obj");
            img.file = file;
            img.style.width='inherit';
            img.style.height='inherit';
            img.style.cursor='pointer';
            const idx=i;
            img.onclick=()=>fileRemove(idx);   //이미지를 클릭했을 때.
            span.appendChild(img);
 
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                    + View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}

</script>
<%@ include file="../common/footer.jsp" %>  
</body>
</html>