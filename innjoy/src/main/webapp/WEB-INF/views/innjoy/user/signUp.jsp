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
</style>
<script type="text/javascript">
</script>
<%@include file="../header/all_header.jsp"%>
</head>
<body>

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-5 col-lg-12 col-md-9 col-mt-10" id="joinBox">

				<div class="card o-hidden border-0 shadow-sm my-5">
					<div class="card-body p-0">
						<div class="p-5">
							<div class="text-center">
								<span id="title_join">회원 가입</span>
							</div>
							<br>
							<div class="d-flex justify-content-center pb-2"
								id="userTypeRadio">
								<input type="radio" id="user" name="userType" value="user">
								<label for="user">일반회원</label> <input type="radio" id="bsn_user"
									name="userType" value="bsn_user"> <label for="bsn_user">사업자회원</label><br>
							</div>

							<!-- 일반회원 회원가입 폼 -->
							<form id="user_joinForm"  method="post">
								<div class="form-group">
									<label>이름</label>
									<input type="text" class="form-control form-control-user" id="userName"
										name="userName" placeholder="이름을 입력하세요.">
									<small id="ck_userName"></small>
								</div>
								<div class="form-group">
									<label>닉네임</label>
									<input type="text" class="form-control form-control-user" id="nName"
										name="nName" placeholder="닉네임을 입력하세요.">
									<small id="ck_nName"></small>
								</div>
								<div class="form-group">
									<label>아이디</label> <input type="text" class="form-control form-control-user" id="userId"
										name="userId" placeholder="아이디를 입력해주세요.">
									<button type="button" class="float-right" id="idCheckBtn">중복확인</button>
									<small id="ck_userId"></small>
								</div>
								<div class="form-group">
									<label>비밀번호</label>
									<input type="password" class="form-control form-control-user" id="userPass"
										name="userPass" placeholder="비밀번호를 입력해주세요. (특수문자를 포함한 8자 이상)">
									<small id="ck_userPass"></small>
								</div>
								<div class="form-group">
									<label>비밀번호 재입력</label>
									<input type="password" class="form-control form-control-user" id="repass"
										placeholder="비밀번호 재입력">
									<small id="ck_rePass"></small>
								</div>
								<div class="form-group">
									<label>이메일</label>
									<input type="text" class="form-control form-control-user" id="email"
										name="email" placeholder="xxx@xxx.com">
									<small id="ck_userEmail"></small>
								</div>
								<div class="form-group">
									<label>전화번호</label>
									<input type="text" class="form-control form-control-user" id="userPhone"
										name="userPhone" placeholder="전화번호" maxlength="13">
									<button type="button" class="float-right" id="phoneCheck">인증</button>
									<small id="ck_userPhone"></small>
								</div>
								<div class="form-group"></div>
								<button type="button" onclick="user_joinCheck()" class="btn btn-outline-success btn-block mt-5" id="joinBtn">
									SignUp</button>
							</form>
							<script type="text/javascript">
								// 회원가입 유효성
								function user_joinCheck() {
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
									} else if (userId == "") {
										$("#ck_userId").text("아이디를 입력하세요.")
										$("#userId").focus()
									} else if (userPass == "") {
										$("#ck_userPass").text("비밀번호를 입력하세요.")
										$("#userPass").focus()
									} else if (userPass != repass) {
										$("#ck_rePass")
												.text("비밀번호가 일치하지 않습니다.")
										$("#repass").val("").focus()
									} else if (email == "") {
										// 이메일 유효성 검사
										$("#email").focus()
									} else if (userPhone == "") {
										// 전화번호 유효성 검사
										$("#userPhone").focus()
									} else {
										join();
										console.log("회원가입 함수 실행")
									}
								}

								// 회원가입
								function join() {
									$.ajax({
										type : "post",
										url : "/try/join",
										data : $("#user_joinForm").serialize(),
										dataType : "text",
										success : function(rs) {
											alert("회원가입 성공. 로그인 후 이용가능합니다.")
											location.href="/login";
										},
										error : function(err) {
											console.log(err)
										}

									})
								}
								
								function ck_pass(){
									var reg = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
									if( !reg.test($("#user_pass")) ) {
										$("#ck_userPass").text("@$!%*#?&를 포함한 8글자로 작성하세요.")
									    return false;
									}
								}
							</script>

							<!-- 사업자 회원 회원가입 폼 -->
							<form id="bsn_joinForm" method="post">
								<div class="form-group">
									<label>아이디</label> <input type="text"
										class="form-control form-control-user" id="bsnId"
										name="bsnId" placeholder="아이디를 입력해주세요.">
									<button type="button" class="float-right" id="idCheck">중복확인</button>
									<small id="ck_bsnId"></small>
								</div>
								<div class="form-group">
									<label>비밀번호</label> <input type="password"
										class="form-control form-control-user" id="bsnPass"
										name="bsnPass" placeholder="비밀번호를 입력해주세요. (특수문자를 포함한 8자 이상)">
									<small id="ck_bsnPass"></small>
								</div>
								<div class="form-group">
									<label>비밀번호 재입력</label> <input type="password"
										class="form-control form-control-user" id="bsn_rePass"
										placeholder="비밀번호 재입력"> <small id="ck_bsnrRepw"></small>
								</div>
								<div class="form-group">
									<label>상호명</label> <input type="text"
										class="form-control form-control-user" id="bsnName"
										name="bsnName" placeholder="상호명을 입력하세요."> <small
										id="ck_bsnName"></small>
								</div>
								<div class="form-group">
									<label>사업자번호</label> <input type="text"
										class="form-control form-control-user" id="bsnNumber"
										name="bsnNumber" placeholder="사업자번호를 입력하세요.">
									<small id="ck_bsnNum"></small>
								</div>
								<div class="form-group">
									<label>대표자명</label> <input type="text"
										class="form-control form-control-user" id="ceoName"
										name="ceoName" placeholder="대표자명을 입력하세요."> <small
										id="ck_ceoName"></small>
								</div>
								<div class="form-group">
									<label>이메일</label> <input type="text"
										class="form-control form-control-user" id="bsnEmail"
										name="bsnEmail" placeholder="xxx@xxx.com"> <small
										id="ck_userEmail"></small>
								</div>
								<div class="form-group">
									<label>전화번호</label> <input type="text"
										class="form-control form-control-user" id="bsnPhone"
										name="bsnPhone" placeholder="전화번호" maxlength="13">
									<button type="button" class="float-right" id="phoneCheck">인증</button>
									<small id="ck_userPhone"></small>
								</div>
								<div class="form-group"></div>
								<button type="button" onclick="bsn_joinCheck()"
									class="btn btn-outline-success btn-block mt-5" id="bsn_joinBtn">
									SignUp</button>
							</form>

							<script type="text/javascript">
								// 회원가입 유효성
								function bsn_joinCheck() {
									var bsnId = $("#bsnId").val()
									var bsnPass = $("#bsnPass").val()
									var bsn_rePass = $("#bsn_rePass").val()
									var bsnName = $("#bsnName").val()
									var bsnNumber = $("#bsnNumber").val()
									var ceoName = $("#ceoName").val()
									var bsnEmail = $("#bsnEmail").val()
									var bsnPhone = $("#bsnPhone").val()

									if (bsnId == "") {
										$("#ck_bsnId").text("아이디를 입력하세요.")
										$("#bsnId").focus()
									} else if (bsnPass == "") {
										$("#ck_bsnPass").text("비밀번호를 입력하세요.")
										$("#bsnPass").focus()
									} else if (bsnPass != bsn_rePass) {
										$("#ck_bsnrRepw").text(
												"비밀번호가 일치하지 않습니다.")
										$("#bsn_rePass").val("").focus()
									} else if (bsnName == "") {
										$("#ck_bsnName").text("상호명을 입력하세요.")
										$("#bsnName").focus()
									} else if (bsnNumber == "") {
										$("#ck_bsnNum").text("사업자번호를 입력하세요.")
										$("#bsnNumber").focus()
									} else if (ceoName == "") {
										$("#ck_ceoName").text("대표자명을 입력하세요.")
										$("#ceoName").focus()
									} else if (bsnEmail == "") {
										// 이메일 유효성 검사
										$("#bsnEmail").focus()
									} else if (bsnPhone == "") {
										// 전화번호 유효성 검사
										$("#bsnPhone").focus()
									} else {
										joinBsn();
										console.log("회원가입 함수 실행")
									}
								}
								// 회원가입
								function joinBsn() {
									$.ajax({
										type : "post",
										url : "try/join_bsn",
										data : $("#bsn_joinForm").serialize(),
										dataType : "text",
										success : function(rs) {
											alert("회원가입 성공. 로그인 후 이용가능합니다.")
											location.href="/login";
										},
										error : function(err) {
											console.log(err)
										}

									})
								}
							</script>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#idCheckBtn").on("click", function() {
			var userId = $("#userId").val()
			$.ajax({
					type : "post",
					url : "/try/idCk",
					data : "userId="+userId,
					dataType : "text",
					success : function(rs) {
						if(rs=="false"){
							console.log(rs)
							$("#ck_userId").text("이미 사용중인 아이디입니다.")
							$("#userId").focus()
						}else if(rs=="true"){
							$("#ck_userId").text("사용할 수 있는 아이디입니다.")
							$("#userId").focus()
						}else{
							alert("error: 관리자에게 문의하세요.")
						}
					},
					error : function(err) {
						console.log(err)
					}
				})
			})
			$("#user_joinForm").hide()
			$("#bsn_joinForm").hide()

			$("#user").on("click", function() {
				$("#user_joinForm").show()
				$("#bsn_joinForm").hide()
			})

			$("#bsn_user").on("click", function() {
				$("#user_joinForm").hide()
				$("#bsn_joinForm").show()
			})
			
	})
	</script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>