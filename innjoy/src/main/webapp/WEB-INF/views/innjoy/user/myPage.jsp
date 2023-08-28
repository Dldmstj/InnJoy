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

#title_join {
	margin-bottom: 150px;
	font-size: 20pt;
}

.joinForm {
	padding-top: 20px;
}
</style>

<script type="text/javascript">
	var uptModal = document.getElementById('uptModal')
	var myInput = document.getElementById('myInput')

	uptModal.addEventListener('shown.bs.modal', function() {
		myInput.focus()
	})
</script>
<%@include file="../header/user_header.jsp"%>
</head>

<body>
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-8 col-lg-12 col-md-9 col-mt-10" id="joinBox">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block" style="diplay: flex;">
								<img src="${path}/upload/짱구.jpg" style="width: 100%;" />
							</div>
							<div class="col-lg-6">
								<div class="p-4">
									<div class="text-center"></div>
									<h5>나의 정보</h5>
									<br>
									<p id="profile_info">아이디 : ${userInfo.userId}</p>
									<p id="profile_info">이름 : ${userInfo.userName}</p>
									<p id="profile_info">닉네임 : ${userInfo.nName}</p>
									<p id="profile_info">전화번호 : ${userInfo.userPhone}</p>
									<p id="profile_info">이메일 : ${userInfo.email}</p>
									<br>
									<button type="button" class="float-left "
										data-bs-toggle="modal" data-bs-target="#uptModal">정보수정</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav>
				<div class="nav nav-tabs nav-justified" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-res-tab"
						data-toggle="tab" href="#nav-res" role="tab"
						aria-controls="nav-res" aria-selected="true">예약내역</a> <a
						class="nav-item nav-link" id="nav-wish-tab" data-toggle="tab"
						href="#nav-wish" role="tab" aria-controls="nav-wish"
						aria-selected="false">❤️찜</a> <a class="nav-link"
						href="/myboardlist" aria-controls="nav-contact"
						aria-selected="false">활동내역</a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-res" role="tabpanel"
					aria-labelledby="nav-wish-tab">
					<div class="card-deck">
						<div class="container px-4 px-lg-5 mt-5">
							<div
								class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
								<c:forEach var="reservation" items="${rlist}">
									<div class="col mb-5">
										<div class="card h-100">
											<!-- Product image-->
											<img class="card-img-top"
												src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg"
												alt="..." />
											<!-- Product details-->
											<div class="card-body p-4">
												<div class="text-center">
													<!-- Product name-->
													<h5 class="fw-bolder">${reservation.room.product.proName}</h5>
													<h6 class="fw-bolder">${reservation.room.roomName}</h6>
													<!-- Product price-->
													${reservation.startDt} ~ ${reservation.endDt}
												</div>
											</div>
											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<a class="btn btn-outline-dark mt-auto" onclick="viewDetail(${reservation.reservationId})"
														data-bs-toggle="modal" data-bs-target="#reservationInfo">예약정보</a>
												</div>
											</div>
										</div>
									</div>

								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-wish" role="tabpanel"
					aria-labelledby="nav-res-tab">
					<div class="card-deck">
						<div class="container px-4 px-lg-5 mt-5">
							<div
								class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Product image-->
										<img class="card-img-top"
											src="https://image.goodchoice.kr/resize_490x348/affiliate/2023/06/21/11/68f9e4f1694a45948b2d4b8140a02328.jpg"
											alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">썬리치 주문진</h5>
												<!-- Product price-->
												130,000 원
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto"
													href="/product_detail">View Details</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Product image-->
										<img class="card-img-top"
											src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/06/30/5efaee66a9fdb.jpg"
											alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">신라스테이</h5>
												<!-- Product price-->
												266,750 원
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto" href="#">View
													Details</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Product image-->
										<img class="card-img-top"
											src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg"
											alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">펠릭스 by STX</h5>
												<!-- Product price-->
												167,000 원
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto" href="#">View
													Details</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Sale badge-->
										<div class="badge bg-dark text-white position-absolute"
											style="top: 0.5rem; right: 0.5rem">Sale</div>
										<!-- Product image-->
										<img class="card-img-top"
											src="https://image.goodchoice.kr/resize_490x348/affiliate/2022/06/09/62a19394cdf9c.jpg"
											alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">파라다이스 부산</h5>
												<!-- <!-- Product reviews-->
												<div
													class="d-flex justify-content-center small text-warning mb-2">
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
													<div class="bi-star-fill"></div>
												</div>
												-->
												<!-- Product price-->
												<span class="text-muted text-decoration-line-through">400,000
													원</span> 375,000원
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto" href="#">View
													Details</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="d-flex justify-content-around mb-3 pt-3">
			<span>예약 내역</span>
			<span>❤️찜</span>
			<span>활동 내역</span>
		</div> -->
		<hr>
	</div>
	<script type="text/javascript">
		// 유효성
		function modify_check() {
			var userName = $("#userName").val()
			var nName = $("#nName").val()
			var userId = $("#userId").val()
			var userPass = $("#userPass").val()
			var repass = $("#repass").val()
			var email = $("#email").val()
			var userPhone = $("#userPhone").val()

			if (userName == "") {
				$("#ck_userName").text("이름을 입력하세요.")
				$("#userName").focus()
			} else if (nName == "") {
				$("#ck_nName").text("닉네임을 입력하세요.")
				$("#nName").focus()
			} else if (userPass == "") {
				$("#ck_userPass").text("비밀번호를 입력하세요.")
				$("#userPass").focus()
			} else if (userPass != repass) {
				$("#ck_rePass").text("비밀번호가 일치하지 않습니다.")
				$("#repass").val("").focus()
			} else if (email == "") {
				// 이메일 유효성 검사
				$("#email").focus()
			} else if (userPhone == "") {
				// 전화번호 유효성 검사
				$("#userPhone").focus()
			} else {
				modify();
				console.log("수정 함수 실행")
			}
		}

		// 회원 정보 수정
		function modify() {
			var userData = {
				userId : $("#userId").val(),
				userName : $("#userName").val(),
				nName : $("#nName").val(),
				userPass : $("#userPass").val(),
				email : $("#email").val(),
				userPhone : $("#userPhone").val(),
			}; // 폼 데이터를 배열 형태로 직렬화
			$.ajax({
				type : "put",
				url : "/try/update",
				data : JSON.stringify(userData), // 직렬화된 데이터를 JSON 문자열로 변환
				contentType : "application/json; charset=utf-8", // JSON
				success : function(rs) {
					alert("개인정보 수정 성공")
					location.href = "/mypage";
				},
				error : function(err) {
					console.log(err)
				}

			})
		}
	</script>
	<!-- 수정하기 modal  -->
	<div class="modal fade" id="uptModal" tabindex="-1"
		aria-labelledby="uptModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">나의 정보 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<!-- Outer Row -->
						<div class="row justify-content-center">
							<div class="col-xl-12 col-lg-12 col-md-9" id="joinBox">
								<div class="card o-hidden border-0 my-5">
									<div class="card-body p-0">
										<div class="pl-5 pr-5">
											<form class="modifForm">
												<input type="hidden" name="userId" id="userId"
													value="${userInfo.userId}">
												<div class="form-group">
													<label>이름</label> <input type="text"
														class="form-control form-control-user"
														value="${userInfo.userName}" id="userName" name="userName"
														readonly>
												</div>
												<div class="form-group">
													<label>닉네임</label> <input type="text"
														class="form-control form-control-user" id="nName"
														value="${userInfo.nName}" name="nName"
														placeholder="닉네임을 입력하세요."> <small id="ck_nName"></small>
												</div>
												<div class="form-group">
													<label>비밀번호</label> <input type="password"
														class="form-control form-control-user" id="userPass"
														name="userPass"
														placeholder="비밀번호를 입력해주세요. (특수문자를 포함한 8~10자)"> <small
														id="ck_userPass"></small>
												</div>
												<div class="form-group">
													<label>비밀번호 재입력</label> <input type="password"
														class="form-control form-control-user" id="repass"
														placeholder="비밀번호 재입력"> <small id="ck_rePass"></small>
												</div>
												<div class="form-group">
													<label>이메일</label> <input type="text"
														class="form-control form-control-user" id="email"
														name="email" value=" ${userInfo.email}"> <small
														id="ck_userEmail"></small>
												</div>
												<div class="form-group">
													<label>전화번호</label> <input type="text"
														class="form-control form-control-user" id="userPhone"
														name="userPhone" value=" ${userInfo.userPhone}">
													<button type="button" class="float-right" id="idCheck">인증</button>
													<small id="ck_userPhone"></small>
												</div>
												<div class="form-group"></div>
												<button type="button" onclick="modify_check()"
													class="btn btn-outline-success btn-block mt-5" id="modBtn">수정하기</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
 		function viewDetail(id){
			console.log(id);
			$.ajax({
				type : "post",
				url : "/read/resDetail",
				data : "resId="+id,
				dataType : "text",
				success : function(rs) {
					console.log(rs);
					// 문자열로 받은 json 데이터 -> json 형태로 parse
					var rsJson = JSON.parse(rs);	
					var resDate = rsJson.startDt +" ~ "+rsJson.endDt
					$("#proName").val(rsJson.proName);
					$("#roomName").val(rsJson.roomName);
					$("#resDate").val(resDate);
					$("#resName").val(rsJson.userName);
					$("#resPhone").val(rsJson.userPhone);
					$("#status").val(rsJson.status);
					$("#payment").val(rsJson.payment);
				},
				error : function(err) {
					console.log(err)
				}

			})
		}
	</script>
	<!--  예약 상세 modal -->
	<div class="modal fade" id="reservationInfo" tabindex="-1"
		aria-labelledby="findIdModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">예약 정보</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<!-- Outer Row -->
						<div class="row justify-content-center">
							<div class="col-xl-12 col-lg-12 col-md-9" id="joinBox">
								<div class="card o-hidden border-0 my-5">
									<div class="card-body p-0">
										<div class="pl-5 pr-5">
											<div class="form-group">
												<label>숙소명</label> <input type="text"
													class="form-control form-control-user" id="proName"
													value="">
											</div>
											<div class="form-group">
												<label>객실명</label> <input type="text"
													class="form-control form-control-user" id="roomName"
													value="">
											</div>
											<div class="form-group">
												<label>예약일자</label> <input type="text"
													class="form-control form-control-user" id="resDate"
													value="">
											</div>
											<div class="form-group">
												<label>예약자명</label> <input type="text"
													class="form-control form-control-user" id="resName"
													value="">
											</div>
											<div class="form-group">
												<label>예약자 연락처</label> <input type="text"
													class="form-control form-control-user" id="resPhone"
													value="">
											</div>
											<div class="form-group">
												<label>예약상태</label> <input type="text"
													class="form-control form-control-user" id="status"
													value="">
											</div>
											<div class="form-group">
												<label>결제금액</label> <input type="text"
													class="form-control form-control-user" id="payment"
													value="">
											</div>
											<div class="form-group"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../header/footer.jsp"%>
</body>
</html>