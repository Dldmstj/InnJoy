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

#joinBox input, #joinBox button, #profile_info {
	font-size: 10pt;
}

#joinBox button {
	background-color: #869c51;
	color: #fff;
}

#title {
	margin-bottom: 150px;
	font-size: 18pt;
}

.joinForm {
	padding-top: 20px;
}

.card-img-top{
	height: 110px !important;
	width: 110px !important;
}

a.list-group-item{
	border: none;
}

#delBtn{
	width: 80px !important;
}

#nav-review-tab.active, #nav-board-tab.active, #nav-reple-tab.active{
	color: #fff !important;
	background-color: #869c51 !important;
}

#sidenav{
	width: 20rem;
}
.list-group-item{
	width: 764px !important;
	height: 86px !important;
}
</style>

<script type="text/javascript">
	var uptModel = document.getElementById('uptModel')
	var myInput = document.getElementById('myInput')

	uptModel.addEventListener('shown.bs.modal', function() {
		myInput.focus()
	})
</script>
<%@include file="../header/user_header.jsp"%>
</head>

<body>
	<div class="d-flex align-items-start justify-content-center">
		<div class="p-5" id="sidenav">
			<div class="pb-2">
				<span id="title">활동내역</span>
			</div>
			<nav id="nav" class="w-100">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a class="nav-item nav-link active" id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab"
						aria-controls="nav-review" aria-selected="true">나의 후기</a>
					<a class="nav-item nav-link" id="nav-board-tab" data-toggle="tab" href="#nav-board" role="tab"
						aria-controls="nav-board" aria-selected="true">나의 게시물</a>
					<a class="nav-item nav-link" id="nav-reple-tab" data-toggle="tab" href="#nav-reple" role="tab"
						aria-controls="nav-reple" aria-selected="true">나의 댓글</a>
				</div>
			</nav>
		</div>
		<!-- Outer Row -->
		<div class="tab-content mt-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
						<div class="container px-4 px-lg-5">
							<div class="row justify-content-center">
							<c:forEach var="review" items="${rlist.review}">
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product image-->
										<img class="card-img-top" src="https://image.goodchoice.kr/resize_490x348/affiliate/2023/06/21/11/68f9e4f1694a45948b2d4b8140a02328.jpg" alt="..." />
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-3 mb-1">4{review.reservation.product.proName}</h5>
										      <small>3 days ago</small>
										    </div>
										    <p class="mb-1">${review.reviewDet}</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" href="#">삭제</a>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product image-->
										<img class="card-img-top" src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/06/30/5efaee66a9fdb.jpg" alt="..." />
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-3 mb-1">신라 스테이</h5>
										      <small>5 days ago</small>
										    </div>
										    <p class="mb-1">good</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" href="#">삭제</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product image-->
										<img class="card-img-top" src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg" alt="..." />
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-3 mb-1">펠릭스 by STX</h5>
										      <small>13 days ago</small>
										    </div>
										    <p class="mb-1">접근성이 좋아요</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" href="#">삭제</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="tab-pane fade" id="nav-board" role="tabpanel" aria-labelledby="nav-board-tab">
					<div class="container px-4 px-lg-5">
							<div class="row justify-content-center">
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product image-->
										<img class="card-img-top" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA3MThfMjE1%2FMDAxNjg5NjgyMjkyNjEy.qh04MF1RCBnjzl9YXLIzp6W3xbD9thiVZSpfH9_UO2gg.XN6FKZzrYnEzvxB8vDN-noqQZbY4f-Lr03vXINiLJsog.JPEG.kkan9000%2FKakaoTalk_20230718_193348736_06.jpg&type=sc960_832" alt="..." />
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action pl-5 ml-3" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-3 mb-1">[맛집추천] 남이섬 꼬꼬닭갈비</h5>
										      <small>3 days ago</small>
										    </div>
										    <p class="mb-1">남이섬에 놀러갔다가 먹었어요.</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" href="#">삭제</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product image-->
										<img class="card-img-top" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MjVfODkg%2FMDAxNjg3NjE5MDIyNzg2.I37-OrXRRG8rDzcSA-uWbdW1AjUHjSyABZs8vAr3evQg.EkIxtZlPHCw1eQa4KNup-WVRGoacOThZBQy-0QSo5yUg.JPEG.redch22ks%2F20230618%25A3%25DF110058.jpg&type=sc960_832" alt="..." />
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action pl-5 ml-3" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-3 mb-1">[명소추천] 남이섬</h5>
										      <small>3 days ago</small>
										    </div>
										    <p class="mb-1">ㅁㅁ숙소 근처 남이섬 재미있었어요.</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" href="#">삭제</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="tab-pane fade" id="nav-reple" role="tabpanel" aria-labelledby="nav-reple-tab">
					<div class="container px-4 px-lg-5">
							<div class="row justify-content-center">
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action pl-5 ml-3" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-2 mb-1">[명소추천] 남이섬</h5>
										      <small>3 days ago</small>
										    </div>
										    <p class="mb-1">재밌었겠네요!!</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" href="#">삭제</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col mb-3">
									<div class="d-flex flex-row card w-100">
										<!-- Product details-->
										<a href="#" class="list-group-item list-group-item-action pl-5 ml-3" aria-current="true">
										    <div class="d-flex w-100 justify-content-between">
										      <h5 class="fw-bolder pt-2 mb-1">[맛집추천] 남이섬 꼬꼬닭갈비</h5>
										      <small>3 days ago</small>
										    </div>
										    <p class="mb-1">맛있었겠네요 !!</p>
										</a>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center pt-2">
												<a id="delBtn" class="btn btn-outline-success mt-auto" href="#">삭제</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>