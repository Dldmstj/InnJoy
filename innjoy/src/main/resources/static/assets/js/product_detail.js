    const slider = document.querySelector('.slider');
    const leftArrow = document.querySelector('.left');
    const rightArrow = document.querySelector('.right');
    let slideIndex = 0;

    // 좌우 화살표 버튼 클릭 이벤트 처리
    leftArrow.addEventListener('click', () => {
      if (slideIndex === 0) {
        slideIndex = slider.children.length - 1;
      } else {
        slideIndex--;
      }
      updateSlider();
    });

    rightArrow.addEventListener('click', () => {
      if (slideIndex === slider.children.length - 1) {
        slideIndex = 0;
      } else {
        slideIndex++;
      }
      updateSlider();
    });

    // 슬라이더 업데이트 함수
    function updateSlider() {
      slider.style.transform = `translateX(-${slideIndex * 100}%)`;
    }
    


 

    function filterAndShowRooms() {
        // 날짜 선택 제한 로직 구현
        const checkInDate = new Date(document.getElementById('check-in').value);
        const checkOutDate = new Date(document.getElementById('check-out').value);

        if (checkInDate >= checkOutDate) {
            alert('체크아웃 날짜는 체크인 날짜보다 뒤여야 합니다.');
            return;
        }

        // 객실 정보를 필터링하여 출력하는 로직 추가
        // ...

        // 객실 정보 출력
        showRoomInfo();
    }

    function goToCreditPage() {
        // credit.html 페이지로 이동하는 코드 추가
        window.location.href = 'credit.html';
    }

    function showRoomInfo() {
        // 객실 정보를 출력하는 로직 추가
        const roomList = document.querySelector('.room-list');
        // 객실 정보를 동적으로 생성하고 roomList에 추가하는 코드 작성
        // ...
    }
