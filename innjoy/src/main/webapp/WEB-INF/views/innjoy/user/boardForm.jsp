<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<!-- meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="meta description">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sbudeobyvn&submodules=geocoder"></script>

<!-- fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${path}/assets/css/vendor.css">
<link rel="stylesheet" href="${path}/assets/css/style.css">
<style type="text/css">
input[type=radio] {
	display: none;
}

input[type=radio]+label {
	display: inline-block;
	cursor: pointer;
	height: 50px;
	width: 130px;
	border: 1px solid #869c51;
	line-height: 50px;
	text-align: center;
	font-weight: bold;
	font-size: 13px;
}

input[type=radio]+label {
	background-color: #fff;
	color: #869c51;
}

input[type=radio]:checked+label {
	background-color: #869c51;
	color: #fff;
}

#joinBox {
	margin-top: 100px;
}

#joinBox input, #joinBox button {
	font-size: 10pt;
}

#joinBox button {
	background-color: #869c51;
	color: #fff;
}

#title_join {
	margin-bottom: 150px;
	font-size: 20pt;
}

.joinForm {
	padding-top: 20px;
}

form small {
	color: #869c51;
}

#detail {
	height: 17rem;
	resize: none;
}
</style>
<script type="text/javascript">
	
</script>
<%@include file="../header/user_header.jsp"%>
</head>
<body>

	<div class="container">
		<div class="pl-3 pt-5">
			<h2>게시물 작성</h2>
		</div>
		<hr>
		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-12 col-lg-12 col-lg-9 col-mt-10" id="boardForm">
				<div class="card o-hidden border-0 shadow-sm my-5">
					<div class="card-body p-4 justify-content-center">
						<form method="post" enctype="multipart/form-data" id="RecommFrm">
							<div class="form-group">
								<div
									class="card o-hidden m-3 border-0 shadow-sm my-5 rounded-pill">
									<div class="ml-5 mt-4 mb-3">
										<h3 class="justify-content-center">숙소명</h3>
									</div>
								</div>
							</div>
							<div class="form-group p-0 d-flex justify-content-center">
								<div>
									<label>유형</label>
									<select class="form-select" aria-label="Default select example" name="recommType">
										<option selected>선택</option>
										<option value="맛집">맛집</option>
										<option value="관광명소">관광명소</option>
										<option value="사진명소">사진명소</option>
									</select>
								</div>
								<div class="pl-2 pr-5 w-75">
									<label>제목</label> <input type="text"
										class="form-control form-control-user" id="title" name="title"
										value="" placeholder="제목을 입력하세요.">
								</div>
							</div>

							<div class="pl-5 ml-1 d-flex w-50 justify-content-center">
								<input type="text" class="form-control form-control-user w-75"
									id="search" placeholder="위치를 입력하세요."> 
								<input type="button" class="btn btn-outline-success ml-3"
									id="searchBtn" value="검색">
							</div>
							<div class="pt-2 pb-2 ml-3 d-flex w-50 justify-content-center">
								<input type="text" class="form-control form-control-user w-75" id="address" value="" readonly/>
							</div>
							<div class="pl-5 pr-5 pb-5 pt-2 d-flex justify-content-center">
								<br>
								<div id="map" style="width: 50%; height: 400px;"></div>
								<div class="d-block">
									<input type="hidden" id="recomLoc" value="" />
									<input type="hidden" id="latitude" value="" />
									<input type="hidden" id="longitude" value="" />
								</div>

								<div class="pl-5 pr-5">

									<input type="hidden" id="reservationId" name="reservationId"
										value="" /> <input type="hidden" id="roomId" name="roomId"
										value="" />

									<div class="form-group">
										<label>게시물 내용</label>
										<textarea class="form-control form-control-user" id="detail"
											name="detail"></textarea>
									</div>
									<div class="form-group">
										<label>사진첨부</label> <input type="file"
											class="form-control form-control-user" id="img" name="report"
											multiple="multiple">
									</div>
									<div class="form-group"></div>
									<button type="button" onclick="wirteRecomm()"
										class="btn btn-outline-success btn-block mt-5" id="modBtn">게시물 작성</button>
								</div>
								<script type="text/javascript">
									//지도를 그려주는 함수 실행
									selectMapList();

									//검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
									function searchAddressToCoordinate(search) {
										naver.maps.Service.geocode({
															query : search
										},
										function(status, response) {
											if (status === naver.maps.Service.Status.ERROR) {
												return alert('Something Wrong!');
											}
											if (response.v2.meta.totalCount === 0) {
												return alert('올바른 주소를 입력해주세요.');
											}
											var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(item.x,item.y);
											if (item.roadAddress) {
												htmlAddresses.push('[도로명 주소] '+ item.roadAddress);
											}
											if (item.jibunAddress) {
												htmlAddresses.push('[지번 주소] '+ item.jibunAddress);
											}
											if (item.englishAddress) {
												htmlAddresses.push('[영문명 주소] '+ item.englishAddress);
											}
											insertAddress(
												item.roadAddress,item.x,item.y);
										});
									}
									// 주소 검색의 이벤트
									$('#address').on('keydown',function(e) {
										var keyCode = e.which;
										if (keyCode === 13) { // Enter Key
											searchAddressToCoordinate($('#search').val());
										}
									});
									$('#searchBtn').on('click',function(e) {
										e.preventDefault();
										searchAddressToCoordinate($('#search').val());
									});
									naver.maps.Event.once(map, 'init_stylemap', initGeocoder);

									//검색정보를 테이블로 작성해주고, 지도에 마커를 찍어준다.
									function insertAddress(address, latitude,longitude) {
										$('#address').val(address);
										$('#recomLoc').val(address);
										$('#latitude').val(latitude);
										$('#longitude').val(longitude);

										var map = new naver.maps.Map('map', {
											center : new naver.maps.LatLng(
													longitude, latitude),
											zoom : 14
										});
										var marker = new naver.maps.Marker({
											map : map,
											position : new naver.maps.LatLng(
													longitude, latitude),
										});
									}

									//지도를 그려주는 함수
									function selectMapList() {

										var map = new naver.maps.Map('map', {
											center : new naver.maps.LatLng(
													37.3595704, 127.105399),
											zoom : 10
										});
									}

									// 지도를 이동하게 해주는 함수
									function moveMap(len, lat) {
										var mapOptions = {
											center : new naver.maps.LatLng(len,
													lat),
											zoom : 15,
											mapTypeControl : true
										};
										var map = new naver.maps.Map('map',
												mapOptions);
										var marker = new naver.maps.Marker({
											position : new naver.maps.LatLng(
													len, lat),
											map : map
										});
									}
									function wirteRecomm(){
									    var formData = new FormData($('#RecommFrm')[0]);
									    $.ajax({
									      type: "POST",
									      url: "/try/write/recomm",
									      data: formData,
									      processData: false,
									      contentType: false,
									      success: function (rs) {
									        // 서버에서 반환한 응답을 처리
									        if (rs == "Y") {
									          alert("게시물 작성이 완료되었습니다.");
									          location.href = "/sec/mypage";
									        } else {
									          alert("작성 실패");
									        }
									      },
									      error: function (err) {
									        console.log(err);
									        alert("error: 관리자에게 문의해주세요.");
									      }
									    })
								   }
								</script>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../header/footer.jsp"%>
</body>
</html>