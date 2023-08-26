<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
	value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>숙소 상세 페이지</title>
<!-- jQuery 라이브러리 임포트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- daterangepicker 라이브러리 임포트 -->
<link rel="stylesheet" type="text/css" href="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css}" />
<script type="text/javascript" src="@{https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js}"></script>
<script type="text/javascript" src="@{https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js}"></script>

<link rel="stylesheet" href="${path}/assets/css/product_detail.css">
<style>
.a {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  width: 70%;
  margin: 50px auto; /* Center align the container */
  padding: 0 20px; /* Add 20px padding on both sides */
  }
</style>

</head>
<body>
<%@include file="../header/user_header.jsp"%>
<div class ="a">
<div class="container1">
    <div class="slider-container1">
      <div class="slider">
        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg" alt="숙소 이미지 1">
        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/06/30/5efaee66a9fdb.jpg"alt="숙소 이미지 2">
        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2023/06/21/11/68f9e4f1694a45948b2d4b8140a02328.jpg" alt="숙소 이미지 3">
      </div>
      <button class="arrow left">&#8249;</button>
      <button class="arrow right">&#8250;</button>
    </div>
    
    <div class="description1">
		<div class="d-flex justify-content-between">
	    <div class="mb-3">
	        <span class="product-availability">호텔</span>
	    </div>
	    
	    <div class="message-popup d-flex align-items-center">
	        <span class="message-popup-icon1">
	            <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
	                <path d="M1.5 4.25V16.25H4.5V20.0703L5.71875 19.0859L9.25781 16.25H16.5V4.25H1.5ZM3 5.75H15V14.75H8.74219L8.53125 14.9141L6 16.9297V14.75H3V5.75ZM18 7.25V8.75H21V17.75H18V19.9297L15.2578 17.75H9.63281L7.75781 19.25H14.7422L19.5 23.0703V19.25H22.5V7.25H18Z" fill="black"/>
	            </svg>
	        </span>
	        <span class="message-popup-text ms-2">Message </span>
	        
	        <button class="heart-button">
	            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 9.229c.234-1.12 1.547-6.229 5.382-6.229 2.22 0 4.618 1.551 4.618 5.003 0 3.907-3.627 8.47-10 12.629-6.373-4.159-10-8.722-10-12.629 0-3.484 2.369-5.005 4.577-5.005 3.923 0 5.145 5.126 5.423 6.231zm-12-1.226c0 4.068 3.06 9.481 12 14.997 8.94-5.516 12-10.929 12-14.997 0-7.962-9.648-9.028-12-3.737-2.338-5.262-12-4.27-12 3.737z"/></svg>
	            <span class="heart-text">찜하기</span>
	        </button>
	    </div>
	</div>


      <div class="description_name">숙소 이름</h1>
      
      <div class="product-rating d-flex align-items-center mb-3">
      	<span class="star-rating">
      	<svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#FFAE00"/>
        </svg>
        <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.168 5.77344L10.082 5.23633L8 0.566406L5.91797 5.23633L0.832031 5.77344L4.63086 9.19727L3.57031 14.1992L8 11.6445L12.4297 14.1992L11.3691 9.19727L15.168 5.77344Z" fill="#B2B2B2"/>
        </svg>
        </span>
        <span class="rating-count ms-2">(22)</span>
        </div>
      <p class="s_content">숙소에 관한 설명이 이곳에 들어갑니다.</p>
    </div>
    
    
    <div class="info">
      <div class="css-11sbcds">
	      <div class="css-1ju036a">
	      	<h2 class="css-3todla">인기시설 및 서비스</h2>
	      </div>
	      <section class="css-1u38mgg">
	      	<ul class="css-17yp1q4">
	      		<div class="css-t9n8kv">
	      			<img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c313ce9fecc4.22775147.png" alt="스파/월풀/욕조 아이콘" class="css-19xh2rn">
	      			<div class="css-9cehu5">스파/월풀<br>/욕조</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31409836037.64820304.png" alt="주차가능 아이콘" class="css-19xh2rn"><div class="css-9cehu5">주차가능</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c30fb58581a7.11803213.png" alt="조식운영 아이콘" class="css-19xh2rn"><div class="css-9cehu5">조식운영</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311e5e615d3.11619749.png" alt="수영장 아이콘" class="css-19xh2rn"><div class="css-9cehu5">수영장</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311543917c0.43365861.png" alt="야외수영장 아이콘" class="css-19xh2rn"><div class="css-9cehu5">야외수영장</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3138a5e2ea4.38579968.png" alt="와이파이 아이콘" class="css-19xh2rn"><div class="css-9cehu5">와이파이</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3130bbecc55.51674550.png" alt="사우나 아이콘" class="css-19xh2rn"><div class="css-9cehu5">사우나</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3144caafc60.78284341.png" alt="클럽라운지 아이콘" class="css-19xh2rn"><div class="css-9cehu5">클럽라운지</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312d25b7881.48044241.png" alt="흡연구역 아이콘" class="css-19xh2rn"><div class="css-9cehu5">흡연구역</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312ab2a3a54.21397941.png" alt="객실금연 아이콘" class="css-19xh2rn"><div class="css-9cehu5">객실금연</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31181bebd23.39062499.png" alt="레스토랑 아이콘" class="css-19xh2rn"><div class="css-9cehu5">레스토랑</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311e9670a08.27489301.png" alt="바 아이콘" class="css-19xh2rn"><div class="css-9cehu5">바</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3109dda4352.22209168.png" alt="연회장 아이콘" class="css-19xh2rn"><div class="css-9cehu5">연회장</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31127b01603.92499001.png" alt="피트니스 아이콘" class="css-19xh2rn"><div class="css-9cehu5">피트니스</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c311ae467a30.99886411.png" alt="뷔페 아이콘" class="css-19xh2rn"><div class="css-9cehu5">뷔페</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c310d3afaa03.83388501.png" alt="어메니티 아이콘" class="css-19xh2rn"><div class="css-9cehu5">어메니티</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c31036778734.93239827.png" alt="24시간
					데스크 아이콘" class="css-19xh2rn"><div class="css-9cehu5">24시간<br>데스크</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3125bc08791.41470069.png" alt="유료세탁 아이콘" class="css-19xh2rn"><div class="css-9cehu5">유료세탁</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c312167373b2.34805205.png" alt="커피숍 아이콘" class="css-19xh2rn"><div class="css-9cehu5">커피숍</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c310fa539846.88150499.png" alt="비즈니스 아이콘" class="css-19xh2rn"><div class="css-9cehu5">비즈니스</div></div><div class="css-t9n8kv"><img width="43" height="31" src="https://yaimg.yanolja.com/v5/2022/07/04/16/62c3107116d3e8.32646858.png" alt="수화물보관 아이콘" class="css-19xh2rn"><div class="css-9cehu5">수화물보관</div>
				</div>
			</ul>
		</section>
		</div>
    </div>
   
	<article class="article">
		<div class="grid__item--1of1 text-center">
			<div class="tabs">
				 <input type="radio" name="tabs" id="tab1" checked >
				 <label for="tab1">
					  <i class="icon1 email-cal"></i><span>숙소 상세</span>
				 </label>
				 <input type="radio" name="tabs" id="tab2">
				 <label for="tab2">
					  <i class="icon1 snapshot"></i><span>위치</span>
				 </label>
				 <input type="radio" name="tabs" id="tab3">
				 <label for="tab3">
					  <i class="icon1 inbox-apps"></i><span>후기</span>
				 </label>
				 <input type="radio" name="tabs" id="tab4">
				 <label for="tab4">
					  <i class="icon1 log-calls"></i><span>WeJoy</span>
				 </label>
		
				
				 <hr class="divider">
				 
				 <div id="tab__content--1" class="tab__content">
				 <div class="container2">
					 <div id="booking" class="section">
						<div class="section-center">
								<div class="row">
									<div class="booking-form">
									    <form>
									        <div class="row no-margin">
											    <div class="col-md-2">
											        <div class="form-group">
											            <span class="form-label">Check In</span>
											            <input class="form-control" type="date">
											        </div>
											    </div>
											    <div class="col-md-2">
											        <div class="form-group">
											            <span class="form-label">Check out</span>
											            <input class="form-control" type="date">
											        </div>
											    </div>
											    <div class="col-md-2">
											        <div class="form-group">
											            <span class="form-label">Guests</span>
											            <select class="form-control">
											                <option>1</option>
											                <option>2</option>
											                <option>3</option>
											            </select>
											        </div>
											    </div>
											    <div class="col-md-2">
											        <div class="form-group">
											            <span class="form-label">Kids</span>
											            <select class="form-control">
											                <option>0</option>
											                <option>1</option>
											                <option>2</option>
											            </select>
											        </div>
											    </div>
											    <div class="col-md-2">
											        <div class="form-btn">
											            <button class="submit-btn">선택</button>
											        </div>
											    </div>
											</div>

									        
									        <!-- 객실 목록 출력 -->
				                            <div class="room-list">
				                                <div class="room-item">
												    <div class="room-image-container">
												        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg" alt="Room 1">
												        <button class="select-room-btn" onclick="goToCreditPage()">객실 선택</button>
												    </div>
												    <div class="room-info">
												        <h3>스탠다드 룸</h3>
												        <p>객실 인원: 2명</p>
												    </div>
												</div>
				                                <div class="room-item">
												    <div class="room-image-container">
												        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg" alt="Room 1">
												        <button class="select-room-btn" onclick="goToCreditPage()">객실 선택</button>
												    </div>
												    <div class="room-info">
												        <h3>스탠다드 룸</h3>
												        <p>객실 인원: 2명</p>
												    </div>
												</div>
				                                <div class="room-item">
												    <div class="room-image-container">
												        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg"alt="Room 1">
												        <button class="select-room-btn" onclick="goToCreditPage()">객실 선택</button>
												    </div>
												    <div class="room-info">
												        <h3>패밀리 룸</h3>
												        <p>객실 인원: 5명</p>
												    </div>
												</div>
				                                <div class="room-item">
												    <div class="room-image-container">
												        <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2020/07/01/5efc420c3609d.jpg"alt="Room 1">
												        <button class="select-room-btn" onclick="goToCreditPage()">객실 선택</button>
												    </div>
												    <div class="room-info">
												        <h3>디럭스 룸</h3>
												        <p>객실 인원: 3명</p>
												    </div>
												</div>
				                                <!-- 추가 객실 정보는 여기에 계속 추가 -->
				                            </div>
												        
									    </form>
									</div>
	
								</div>
							</div>
						</div>
					</div>
			    
				 </div>
				 
				 
				 <div id="tab__content--2" class="tab__content">
					  <div class="desc-content">
					  	<div id="map" style="width:100%;height:600px;"></div>
					  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c7f24d1d2999a56f70827b2234f8442"></script>
					  	<script>
					  	var container = document.getElementById('map');
						  	var options = {
						  			center: new kakao.maps.LatLng(33.450701, 126.570667),
						  			level: 3
						  			};
					  		var map = new kakao.maps.Map(container, options);
					  	</script>
					  	</div>
				 </div>
				 
				 
				 <div id="tab__content--3" class="tab__content">
				    <div class="review-list">
				        <div class="review-item">
				            <div class="review-image">
				                <img src="${path}/upload/짱구.jpg"alt="User 1">
				            </div>
				            <div class="review-content">
				                <div class="user-nickname">사용자43</div><br>
				                <div class="review-text">여기 정말 좋아요! 다음에 또 방문하고 싶어요.</div>
				            </div>
				            <div class="report-button">
				                <button class="report-btn">신고하기</button>
				            </div>
				        </div>
				        
				        <div class="review-item">
				            <div class="review-image">
				                <img src="${path}/upload/짱구.jpg" alt="User 1">
				            </div>
				            <div class="review-content">
				                <div class="user-nickname">사용자1</div><br>
				                <div class="review-text">여기 별로에요;;</div>
				            </div>
				            <div class="report-button">
				                <button class="report-btn">신고하기</button>
				            </div>
				        </div>
				        <div class="review-item">
				            <div class="review-image">
				                <img src="${path}/upload/짱구.jpg" alt="User 1">
				            </div>
				            <div class="review-content">
				                <div class="user-nickname">사용자2</div><br>
				                <div class="review-text">갖주이 맛쉐요, 역이서 쮜뫈한 빠뀌볼래 봔어요;;</div>
				            </div>
				            <div class="report-button">
				                <button class="report-btn">신고하기</button>
				            </div>
				        </div>
				    </div>
				</div>
	
				 
				 
				<div id="tab__content--4" class="tab__content">
				<div class="container">
				    <div class="section-title">명소 추천</div>
				    <div class="recommendation">
				        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA3MThfMjE1%2FMDAxNjg5NjgyMjkyNjEy.qh04MF1RCBnjzl9YXLIzp6W3xbD9thiVZSpfH9_UO2gg.XN6FKZzrYnEzvxB8vDN-noqQZbY4f-Lr03vXINiLJsog.JPEG.kkan9000%2FKakaoTalk_20230718_193348736_06.jpg&type=sc960_832" alt="명소 이미지" class="place-image">
				        <hr class="divider">
				        <p class="recommendation-text">
				            여기에 명소 추천 내용을 작성하세요.
				            추천 마구마구 하고 하슈...
				        </p>
				        <hr class="divider">
				    </div>
				    
				    <div class="comment-section">
				        <div class="comment">
				            <span class="user-nickname">사용자1</span>
				            <span class="comment-text">첫 번째 댓글입니다.</span>
				        </div>
				        <div class="comment">
				            <span class="user-nickname">사용자2</span>
				            <span class="comment-text">두 번째 댓글입니다.</span>
				        </div>
				        <!-- 이 부분에 댓글들이 추가될 수 있습니다. -->
				        <div class="comment">
				            <input type="text" class="comment-input" placeholder="댓글 입력">
				            <button class="comment-button">댓글</button>
				        </div>
				    </div>
				    
				    <div style="margin: 200px 0;"></div>
				    
				    
				    <div class="container">
				    <div class="section-title">명소 추천</div>
				    <div class="recommendation">
				        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MjVfODkg%2FMDAxNjg3NjE5MDIyNzg2.I37-OrXRRG8rDzcSA-uWbdW1AjUHjSyABZs8vAr3evQg.EkIxtZlPHCw1eQa4KNup-WVRGoacOThZBQy-0QSo5yUg.JPEG.redch22ks%2F20230618%25A3%25DF110058.jpg&type=sc960_832"alt="명소 이미지" class="place-image">
				        <hr class="divider">
				        <p class="recommendation-text">
				            여기에 명소 추천 내용을 작성하세요.
				            추천 마구마구 하고 하슈...
				        </p>
				        <hr class="divider">
				    </div>
				    
				    <div class="comment-section">
				        <div class="comment">
				            <span class="user-nickname">사용자1</span>
				            <span class="comment-text">첫 번째 댓글입니다.</span>
				        </div>
				        <div class="comment">
				            <span class="user-nickname">사용자2</span>
				            <span class="comment-text">두 번째 댓글입니다.</span>
				        </div>
				        <!-- 이 부분에 댓글들이 추가될 수 있습니다. -->
				        <div class="comment">
				            <input type="text" class="comment-input" placeholder="댓글 입력">
				            <button class="comment-button">댓글</button>
				        </div>
				    </div>
				</div>
				
				</div>
				
				 
			</div>
		 </div>
		</div>
	</article>
</div>
</div>
</div>
  

<script src="${path}assets/js/product_detail.js"></script>
<%@ include file="../header/footer.jsp" %>  
</body>
</html>
