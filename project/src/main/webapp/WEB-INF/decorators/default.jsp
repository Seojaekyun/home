<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>title</title>
<!-- Flatpickr(달력 라이브러리) CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Gugi&family=Hahmlet:wght@100..900&display=swap');
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	body {
		margin: auto;
		font-family: Arial, sans-serif;
	}
	header {
		width: 100%;
		margin: auto;
	}
	#section1 {
		width: 100%;
		height: 80px;
		margin: auto;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	#section1 #logo {
		width: 200px;
		height: 75px;
		margin-left: 50px;
	}
	#section1 #loginMenu {
		display: flex;
		align-items: center;
		font-size: 20px;
		font-weight: 600;
		margin-right: 60px;
	}
	#section1 #loginMenu a {
		text-decoration: none;
		color: black;
	}
	#section1 #loginMenu a:hover {
		text-decoration: none;
		color: #00467F;
	}
	#section1 #loginMenu ul {
		list-style-type: none;
		margin: 0;
		padding: 10px;;
		display: flex;
		align-items: center;
	}
	#section1 #loginMenu ul li {
		position: relative;
		margin-right: 10px;
	}
	#section1 #loginMenu .cmenu, #section1 #loginMenu .mmenu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 28px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
	}
	#section1 #loginMenu .cmenu > li, #section1 #loginMenu .mmenu > li {
		list-style-type: none;
		width: 130px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		border-bottom: 1px solid #ddd;
	}
	#section1 #loginMenu .cmenu > li:hover,	#section1 #loginMenu .mmenu > li:hover {
		text-decoration: none;
		color: #00467F;
	}
	#section1 #loginMenu #supMenu, #section1 #loginMenu #myInfo {
		position: relative;
	}
	header > nav {
		width: 1200px;
		height: 70px;
		margin: auto;
		line-height: 50px;
		font-family: Arial, sans-serif;
		font-size: 18px;
	}
	header > nav a {
		text-decoration: none;
		color: black;
	}
	header > nav a:hover {
		text-decoration: none;
		color: #00467F;
		
	}
	header > nav #main {
		padding-left: 0px;
		margin-left: 100px;
	}
	header > nav #main > li {
		display: inline-block;
		list-style-type: none;
		width: 200px;
		height: 50px;
		line-height: 30px;
		text-align: center;
		font-weight: 900;
		position: relative;
		z-index: 5;
	}
	header > nav #main > li > .menu {
		padding-left: 0px;
		position: absolute;
		left: 0px;
		top: 33px;
		background: white;
		visibility: hidden;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	header > nav #main > li > .menu > li {
		list-style-type: none;
		width: 200px;
		height: 35px;
		line-height: 35px;
		border-bottom: 1px solid #ddd;
	}
	footer {
			padding-top: 10px;
			padding-bottom: 5px;
			width: 100%;
			height: auto;
			margin: auto;
			font-family: 'Hahmlet';
			margin-top: 30px;
			font-size: 13px;
			background: gray;
			color: white;
			text-align: center;
		}
		.footer-container {
			width: 100%;
			max-width: 1000px;
			margin: auto;
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			align-items: flex-start;
		}
		.footer-logo {
			flex: 0 0 200px;
			margin-bottom: 10px;
		}
<!-- hj -->
	}
	.air_service {
		position: relative;
		background-image: url('../static/resources/background.jpg');
		background-size: cover;
		width: 100%;
		height: 450px;
		background-repeat: no-repeat;
		z-index: 0;
	}
	.air_align {
		margin-left: 73px;
		margin-right: 73px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.air_contentbox {
		position: relative;
		top: 5.3rm;
		left: 0;
		width: 90%;
		height: 70%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		z-index: 2;
	}
	.air_widget {
		position: absolute;
		top: 7.4rem;
		display: block;
		width: 100%;
		height: 54px;
		content: "";
		z-index: 1;
		margin: auto;
	}
	.booking_widget_list {
		list-style-type: none;
		padding: 0;
		margin: 0;
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 100%;
		height: 55px;
		position: relative;
	}
	.booking_widget_list li {
		flex: 1;
		text-align: center;
		border: 1px solid #65728a;
		padding-block: 15px;
		border-top-left-radius: 15px;
		border-top-right-radius: 15px;
		margin: 0.5px;
		background-color: #65728a;
		z-index: 2;
	}
	.booking_widget_list li.active {
		background-color: white;
		border: 3px solid white;
	}
	.booking_widget_list li.active span {
		color: #65728a;
		font-weight: 900;
	}
	#booking_menu {
		display: inline-block;
	}
	.booking_widget_list button {
		width: 100%;
		height: 100%;
		background: none;
		border: none;
		font-size: 16px;
		cursor: pointer;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.booking_widget_list button span {
		font-size: 16px;
		color: white;
		position: relative;
		top: -5px;
	}
/* booking_contents의 기본 스타일 */
.booking_contents {
    display: flex;
    flex-direction: column; /* 자식 요소들을 세로로 배치 */
    align-items: center;
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 15px;
    width: 100%;
    height: 220px;
	padding-left: 40px;
	padding-top: 30px;
	padding-right: 40px;
	padding-bottom: 10px;
}

/* 예약 방법과 왕복/편도 선택 버튼을 한 줄에 나열 */
.booking_methods {
    display: absolute;
    align-items: center;
    width: 100%;
    height: 170px;

}
	.select_contents, .check-in_contents, .schedule_contents {
		position: relative;
		width: 100%;
		height: 220px;
		z-index: 3;
		background-color: white;
		border: 2px solid white;
		border-radius: 15px;
		margin-top: -10px;
		padding-left: 40px;
		padding-top: 30px;
		padding-right: 40px;
		padding-bottom: 10px;
		display: none;
	}
	.b_methodbox {
		float: left;
		width: auto;
		margin-top: 0;
		margin-right: 3.5rem;
		margin-bottom: 1rem;
		text-align: left;
	}

	/* 예매와 마일리지 예매 버튼 스타일 */
.booking_types {
    display: flex;
    list-style-type: none;
    padding: 0;
    		border: 1px solid #ccc;
		border-radius: 25px;
}
	
	.booking_types li {
		display: inline-block;
		list-style-list: none;
}
	}
	.booking_types li button {
    padding: 10px 20px;
    border: none;
    border-radius: 25px;
    color: white;
    background-color: #65728a; /* 기본 배경색 */
    cursor: pointer;
    transition: background-color 0.3s ease; /* 배경색 전환 효과 */

	}
	
	.booking_types li button.active {
	font-size: 16px;
	font-weight: bold; 
	border-radius: 25px;
    background-color: #1f0c59;
    color: white;
    width: 80px;
    height: 40px;
    
}

.booking_types li button.inactive {
font-size: 16px;
background-color: white;
    color: #65728a;
    border: 1px solid #65728a;
    width: 140px;
    border-radius: 25px;
    height: 40px;
    border: none;
}
	
	#quick_booking {
		display: flex;
		justify-content: space-between;
		align-items: center;
		align-self: flex-start;
		width: 270px;
		height: 80px;
	}
	.quick_booking_button {
		flex: 1;
		text-align: center;
		margin: 0 5px;
		padding: 10px;
		border: none;
		background-color: white;
		cursor: pointer;
		font-size: 16px;
		color: #333;
		border-radius: 15px;
	}
	.circle_button {
		flex-grow: 1;
		width: 40px;
		height: 40px;
		border-radius: 50%;
		padding: 0px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.quick_booking_button:first-child {
		flex-grow: 2;
	}
	.quick_booking_button:last-child {
		flex-grow: 2;
	}
	.quick_booking_button:hover {
		background-color: #ddd;
	}
	#from-text, #departure-text {
		display: block;
		margin: 0;
	}
	#from-text, #to-text {
		font-size: 40px;
		font-weight: bold;
	}
	#departure-text, #arrival-text {
		font-size: 14px;
		color: #666;
	}
	.popup {
		display: none;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		z-index: 1000;
	}
	.popup-content {
		position: relative;
		margin: 15% auto;
		padding: 20px;
		width: 80%;
		max-width: 600px;
		background-color: #fff;
		border-radius: 5px;
	}
	.close-btn {
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 24px;
		cursor: pointer;
	}
	.quick_booking_aligner {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 10px;
		width: 100%; 
   		max-width: 1150px; 
		margin-left: -10px;
		margin-top: 55px;
	}
	
	
	
	p {
		font-size: 14px;
		color: #333;
	}
	#date_selection button, #passenger_selection button, #seats_selection button {
		padding-top: 20px;
		padding-bottom: 5px;
		background-color: transparent;
		border: none;
		border-bottom: 1px solid #333;
		font-size: 16px;
		color: #333;
		cursor: pointer;
		text-align: left;
		outline: none;
	}
	#date_selection button {
		width: 310px;
	}
#passenger_selection button {
	width: 150px;
}


#seats_selection button {
   width: 150px;
    padding-top: 20px;
    padding-bottom: 5px;
    background-color: transparent; /* 배경색을 투명하게 설정 */
    border: none; /* 기본 테두리를 제거 */
    border-bottom: 1px solid #333; /* 하단에만 테두리 추가 */
    font-size: 14px; /* 글자 크기 조정 */
    color: #333; /* 텍스트 색상 */
    cursor: pointer; /* 마우스 포인터를 손 모양으로 변경 */
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
    outline: none; /* 클릭 시 기본 아웃라인 제거 */
}

/* 좌석 선택 팝업 스타일 */
.seat-popup {
    position: absolute;
    top: 100px;
    left: 50px; /* 원하는 위치로 변경 가능 */
    width: 400px;
    padding: 20px;
    background-color: white;
    border: 1px solid #ccc;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    z-index: 1000;
}

.seat-options {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}

.seat-options button {
    flex: 1;
    margin: 5px;
    padding: 15px;
    cursor: pointer;
    background-color: white;
    border: 1px solid #ccc;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.seat-options button:hover {
    background-color: #f0f0f0;
}




</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
// 페이지가 로드되면 실행될 함수
document.addEventListener('DOMContentLoaded', function () {
    // 공항 목록을 불러오는 함수 호출
    loadAirports();
});

function loadAirports() {
    // 서버에 요청을 보내는 함수
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/flights/airports'); // 서버에 GET 요청

    xhr.onload = function() {
        var data = JSON.parse(xhr.responseText); // JSON 데이터 파싱
        var airportList = document.getElementById('airport-list');
        airportList.innerHTML = ''; // 기존 목록 비우기

        // 공항 목록을 HTML에 추가하기
        data.forEach(function(airport) {
            var li = document.createElement('li');
            if(airport.detailed_city=='null')
            	{ li.textContent = airport.airport_code+'   '+airport.city+','+ airport.country;}
            else{li.textContent = airport.airport_code+'   '+airport.city+ '/' +airport.detailed_city+','+ airport.country;}
            li.onclick = function() {
            	
            	// 'From' 텍스트를 클릭된 공항 코드로 업데이트
                document.getElementById('from-text').textContent = airport.airport_code;
            	
            	if(airport.detailed_city=='null')
                {document.getElementById('departure-text').textContent = airport.city}
            	else{document.getElementById('departure-text').textContent = airport.city+'/'+airport.detailed_city;}
                // 팝업 닫기
                closePopup('departure');
            };

            airportList.appendChild(li); // 리스트에 항목 추가
        });
    };

    xhr.send(); // 요청 전송
}

function loadAirports() {
    // 서버에 요청을 보내는 함수
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/flights/airports'); // 서버에 GET 요청

    xhr.onload = function() {
        var data = JSON.parse(xhr.responseText); // JSON 데이터 파싱
        var airportList = document.getElementById('airport-list');
        airportList.innerHTML = ''; // 기존 목록 비우기

        // 공항 목록을 HTML에 추가하기
        data.forEach(function(airport) {
            var li = document.createElement('li');
            if(airport.detailed_city=='null')
            	{ li.textContent = airport.airport_code+'   '+airport.city+','+ airport.country;}
            else{li.textContent = airport.airport_code+'   '+airport.city+ '/' +airport.detailed_city+','+ airport.country;}
            li.onclick = function() {
            	
            	// 'From' 텍스트를 클릭된 공항 코드로 업데이트
                document.getElementById('from-text').textContent = airport.airport_code;
            	
            	if(airport.detailed_city=='null')
                {document.getElementById('departure-text').textContent = airport.city}
            	else{document.getElementById('departure-text').textContent = airport.city+'/'+airport.detailed_city;}
                // 팝업 닫기
                closePopup('departure');
            };

            airportList.appendChild(li); // 리스트에 항목 추가
        });
    };

    xhr.send(); // 요청 전송
}

document.addEventListener('DOMContentLoaded', function () {
	
    // 기본 콘텐츠를 '항공권예매'로 설정
    showContent('booking');

    // activateMenu 함수 정의
    function activateMenu(event) {
        // 모든 li 요소에서 active 클래스 제거
        document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
            el.classList.remove('active');
        });

        // 클릭된 li 요소에 active 클래스 추가
        event.currentTarget.parentNode.classList.add('active');
    }

    // 버튼 클릭 시 activateMenu 함수 호출
    document.querySelectorAll('.booking_widget_list li button').forEach(function(button) {
        button.addEventListener('click', activateMenu);
    });


    // 예매 버튼 기본 선택 설정
    const reserveButton = document.querySelector('.booking_types li:first-child button');
    const mileageButton = document.querySelector('.booking_types li:nth-child(2) button');
    
    // 초기 상태 설정 (예매 버튼은 기본 선택, 마일리지 버튼은 비활성화)
    reserveButton.classList.add('active');
    mileageButton.classList.add('inactive');

    // 버튼 클릭 시 상태 변경 함수
    function toggleBookingType(event) {
        if (event.target === reserveButton) {
            reserveButton.classList.add('active');
            reserveButton.classList.remove('inactive');
            mileageButton.classList.add('inactive');
            mileageButton.classList.remove('active');
        } else if (event.target === mileageButton) {
            mileageButton.classList.add('active');
            mileageButton.classList.remove('inactive');
            reserveButton.classList.add('inactive');
            reserveButton.classList.remove('active');
        }
    }

    // 각 버튼에 클릭 이벤트 추가
    reserveButton.addEventListener('click', toggleBookingType);
    mileageButton.addEventListener('click', toggleBookingType);

    // Flatpickr 설정
    var tripMethod = "round"; // 기본값: 왕복
    var calendar = flatpickr("#date-btn", {
        mode: "range", // 두 날짜 선택을 위한 range 모드 (왕복일 때)
        dateFormat: "Y-m-d", // 날짜 형식
        showMonths: 2, // 두 달치 달력 표시
        onChange: function(selectedDates, dateStr, instance) {
            if (tripMethod === "round" && selectedDates.length === 2) {
                // 왕복일 경우: 두 날짜가 선택되면 버튼에 표시
                document.getElementById('date-btn').innerHTML = 
                    "가는 날: " + selectedDates[0].toLocaleDateString() + 
                    " - 오는 날: " + selectedDates[1].toLocaleDateString();
            } else if (tripMethod === "one-way" && selectedDates.length === 1) {
                // 편도일 경우: 하루만 선택되면 버튼에 표시
                document.getElementById('date-btn').innerHTML = 
                    "가는 날: " + selectedDates[0].toLocaleDateString();
            }
        }
    });

    // 왕복 또는 편도 선택 시 달력 모드 변경
    var tripMethods = document.querySelectorAll('input[name="t_methods"]');
    tripMethods.forEach(function (radio) {
        radio.addEventListener('change', function () {
            if (this.value === "round") {
                tripMethod = "round";
                calendar.set("mode", "range"); // 왕복일 때는 두 날짜 선택
                document.getElementById('date-btn').innerHTML = "가는날 ~ 오는날"; // 텍스트 변경
            } else if (this.value === "one-way") {
                tripMethod = "one-way";
                calendar.set("mode", "single"); // 편도일 때는 한 날짜 선택
                document.getElementById('date-btn').innerHTML = "가는날"; // 텍스트 변경
            }
        });
    });
});




function showContent(type) {
    // 모든 콘텐츠 숨기기
    document.querySelectorAll('.booking_contents, .select_contents, .check-in_contents, .schedule_contents').forEach(function(el) {
        el.style.display = 'none';
    });

    // 선택된 콘텐츠만 표시하기
    if (type === 'booking') {
        document.querySelector('.booking_contents').style.display = 'block';
    } else if (type === 'select') {
        document.querySelector('.select_contents').style.display = 'block';
    } else if (type === 'check-in') {
        document.querySelector('.check-in_contents').style.display = 'block';
    } else if (type === 'schedule') {
        document.querySelector('.schedule_contents').style.display = 'block';
    }
}

function openPopup(type) {
    if (type === 'departure') {
        document.getElementById('popup').style.display = 'block';  // 출발지 팝업
    } else if (type === 'arrival') {
        document.getElementById('arrival-popup').style.display = 'block';  // 도착지 팝업
    }
    else if (type === 'passenger') {
        document.getElementById('passenger-selection-popup').style.display = 'block';  // 탑승객 팝업
    }
}

function closePopup(type) {
    if (type === 'departure') {
        document.getElementById('popup').style.display = 'none';  // 출발지 팝업 닫기
    } else if (type === 'arrival') {
        document.getElementById('arrival-popup').style.display = 'none';  // 도착지 팝업 닫기
    } else if (type === 'passenger') {
        document.getElementById('passenger-selection-popup').style.display = 'none';  // 탑승객 팝업 닫기
    }
}

function setLocation(type) {
    const value = document.getElementById(type + '-input').value;
    if (type === 'departure') {
        document.getElementById('departure-text').textContent = value;
    } else if (type === 'arrival') {
        document.getElementById('arrival-text').textContent = value;
    }
    closePopup(type); // 선택 후 팝업 닫기
}



function increase(type) {
    var adultCount = parseInt(document.getElementById('adult-count').textContent);
    var childCount = parseInt(document.getElementById('child-count').textContent);
    var infantCount = parseInt(document.getElementById('infant-count').textContent);

    var totalPassengers = adultCount + childCount; // 성인과 소아 합산

    if (type === 'adult' && totalPassengers < 10) {
        document.getElementById('adult-count').textContent = adultCount + 1;
    } else if (type === 'child' && totalPassengers < 10) {
        document.getElementById('child-count').textContent = childCount + 1;
    } else if (type === 'infant') {
        // 유아는 성인 숫자만큼만 선택 가능
        if (infantCount < adultCount) {
            document.getElementById('infant-count').textContent = infantCount + 1;
        }
    }
}

function decrease(type) {
    var adultCount = parseInt(document.getElementById('adult-count').textContent);
    var childCount = parseInt(document.getElementById('child-count').textContent);
    var infantCount = parseInt(document.getElementById('infant-count').textContent);

    if (type === 'adult' && adultCount > 0) {
        document.getElementById('adult-count').textContent = adultCount - 1;
        if (infantCount > adultCount - 1) {
            document.getElementById('infant-count').textContent = adultCount - 1; // 성인이 줄면 유아도 함께 줄어야 함
        }
    } else if (type === 'child' && childCount > 0) {
        document.getElementById('child-count').textContent = childCount - 1;
    } else if (type === 'infant' && infantCount > 0) {
        // 성인 숫자가 0명일 때 유아는 0명으로 고정
        if (adultCount > 0) {
            document.getElementById('infant-count').textContent = infantCount - 1;
        }
    }
}

function confirmPassengers() {
    var adultCount = document.getElementById('adult-count').textContent;
    var childCount = document.getElementById('child-count').textContent;
    var infantCount = document.getElementById('infant-count').textContent;

    var passengerText = '';

    // 성인 정보 추가
    if (adultCount > 0) {
        passengerText = '성인 ' + adultCount + '명';
    }

    // 추가 승객 분류 (소아 및 유아)를 배열에 저장
    var additionalPassengers = [];

    if (childCount > 0) {
        additionalPassengers.push('소아');
    }
    if (infantCount > 0) {
        additionalPassengers.push('유아');
    }

    // 추가 승객이 있는 경우 처리
    if (additionalPassengers.length > 0) {
        if (additionalPassengers.length === 1) {
            // 추가 승객이 한 종류일 경우에도 말줄임표 붙이기
            passengerText += ', ' + additionalPassengers[0] + '···';
        } else {
            // 추가 승객이 두 종류일 경우, 첫 번째 분류만 이름만 표시하고 말줄임표 붙이기
            passengerText += ', ' + additionalPassengers[0] + '···';
        }
    }

    document.getElementById('passenger-btn').innerHTML = passengerText;

    closePopup(); // 팝업 닫기
}



document.addEventListener('DOMContentLoaded', function () {
    const seatSelectBtn = document.getElementById('seats-btn');
    const seatPopup = document.getElementById('seat-popup');

    // 좌석 등급 버튼을 클릭하면 팝업 표시/숨김
    seatSelectBtn.addEventListener('click', function(event) {
        event.stopPropagation(); // 이벤트 버블링 방지 (외부 클릭 이벤트에 영향 받지 않도록)
        seatPopup.style.display = seatPopup.style.display === 'block' ? 'none' : 'block';
    });

    // 좌석 선택 시 팝업을 닫음
    window.selectSeat = function(seatType) {
        document.querySelector('#seats-btn span').innerText = seatType;
        seatPopup.style.display = 'none';  // 좌석 선택 시 팝업 닫기
    }

    // 팝업 외부를 클릭하면 팝업 닫기
    document.addEventListener('click', function(event) {
        if (seatPopup.style.display === 'block' && !seatPopup.contains(event.target) && event.target !== seatSelectBtn) {
            seatPopup.style.display = 'none'; // 팝업 외부 클릭 시 팝업 닫기
        }
    });
});
<!-- hj -->
<!-- jk -->
		.footer-content {
			flex: 1;
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
		}
		.footer-row {
			width: 100%;
			display: flex;
			justify-content: space-between;
			margin-bottom: 5px;
		}
		.footer-column {
			flex: 1;
			text-align: left;
			padding: 0 10px;
		}
		@media (max-width: 768px) {
			header, #outer #first, nav ul {
				flex-direction: column;
				text-align: center;
			}
			nav ul li {
				display: block;
				margin: 10px 0;
			}
			footer .footer-container, .footer-content, .footer-row {
				flex-direction: column;
				align-items: center;
			}
			.footer-column {
				text-align: center;
				padding: 5px 0;
			}
		}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function viewCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "block";
	}
	function hideCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "none";
	}
	function viewMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "block";
	}
	function hideMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "none";
	}
	function viewMenu(n) {
		document.getElementsByClassName("menu")[n].style.visibility = "visible";
	}
	function hideMenu(n) {
		document.getElementsByClassName("menu")[n].style.visibility = "hidden";
	}
<!-- jk -->



</script>

<sitemesh:write property="head" />

</head>

<body>
	<header>
		<div id="section1">
			<div id="logo">
				<a href="../main/index">
					<img src="../static/resources/eltlogo.png" width="200px" height="75px">
				</a>
			</div>
			<div id="loginMenu">
				<c:if test="${userid!=null&&userid=='admin'}">
					<a href="../admin/index" style="color: orange;"> 관리자 홈 </a>&nbsp;|&nbsp;
				</c:if>
				<c:if test="${userid==null}">
					<a href="../member/member"> 회원가입 </a>&nbsp;|&nbsp;
					<a href="../login/login"> 로그인 </a>&nbsp;|&nbsp;
				</c:if>
				<c:if test="${userid!=null}">
					<span id="myInfo" onmouseover="viewMmenu(0)" onmouseout="hideMmenu(0)"> ${name}님 &nbsp;|&nbsp;
						<ul class="mmenu">
							<li> 회원정보 </li>
							<li> 예약정보 </li>
							<li> 나의문의 </li>
						</ul>
					</span>
					<a href="../login/logout"> 로그아웃 </a>&nbsp;|&nbsp;
				</c:if>
				<span id="supMenu" onmouseover="viewCmenu(0)" onmouseout="hideCmenu(0)"> 고객센터
					<ul class="cmenu">
						<li><a href="../gongji/list"> 공지사항 </a></li>
						<li><a href="../inquiry/list"> Q & A </a></li>
						<li> 이벤트 </li>
					</ul>
				</span>
			</div>
		</div>
		<nav>
			<ul id="main">
				<li onmouseover="viewMenu(0)" onmouseout="hideMenu(0)"> 예약
					<ul class="menu">
						<li><a href="../reserve/reservation">항공권 예약</a></li>
						<li><a href="../menu/index2">예약 조회</a></li>
						<li><a href="../menu/index3">체크인</a></li>
						<li><a href="../menu/index3">운항정보</a></li>
					</ul>
				</li>
				<li onmouseover="viewMenu(1)" onmouseout="hideMenu(1)">
					<a href="../guide/checkinGuide">여행준비</a>
					<ul class="menu">
						<li><a href="../guide/checkinGuide">체크인</a></li>
						<li><a href="../guide/seatGuide">좌석배정</a></li>
						<li><a href="../guide/baggageGuide">수하물</a></li>
					</ul>
				</li>
				<li onmouseover="viewMenu(2)" onmouseout="hideMenu(2)"> 최저가
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(3)" onmouseout="hideMenu(3)"> 여행지
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(4)" onmouseout="hideMenu(4)">
					<a href="https://kr.hotels.com/en/?locale=en_US&siteid=300000041&semcid=HCOM-KR.B.GOOGLE.BT-c-EN.GT&semdtl=a118251106649.b1141783171757.g1kwd-324456688060.e1c.m1CjwKCAjwxY-3BhAuEiwAu7Y6s7KXpMTsJnHn5PuW6d4K1hEF5a4bjaFUpneW0s8fNCtDXFCZlBGXtRoCHvEQAvD_BwE.r1006f90a2301371776d11c8cc22069d38bd13a4cf95a9f802dfa68907dc4069d6.c18NrPiYS3BbMcb8bv0o2xPA.j11030718.k1.d1624808917252.h1e.i1.l1.n1.o1.p1.q1.s1.t1.x1.f1.u1.v1.w1&gad_source=1&gclid=CjwKCAjwxY-3BhAuEiwAu7Y6s7KXpMTsJnHn5PuW6d4K1hEF5a4bjaFUpneW0s8fNCtDXFCZlBGXtRoCHvEQAvD_BwE" target="_blank">
					 호텔
					</a>
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
<!-- hj -->

    <div class="main_content">
	<div class="air_service"> 
	<div class="air_align">
	
	<div class="air_contentbox"> 
	<div id="air_alert"></div>
	<div class="air_widget">
	
	<ul class="booking_widget_list">
	<li class="booking_menu"> 
		<button type="button" onclick="showContent('booking')">
		<span> 항공권예매 </span> 
		</button>
	</li>
	<li class="booking_menu"> 
		<button type="button" onclick="showContent('select')">
		<span> 예약조회 </span>
		</button>
	</li>
	
	<li class="booking_menu">
		<button type="button" onclick="showContent('check-in')">
	 	<span> 체크인 </span>
	 	</button>
	</li>
	
	<li class="booking_menu"> 
		<button type="button" onclick="showContent('schedule')">
		<span> 출도착/스케쥴 </span>
		</button>
	</li>
	</ul>
	<div class="booking_contents">
		<div class="booking_methods">
			<div class="b_methodbox"> 
				<ul class="booking_types"> 
				 	<li>
				 	<button type="button">예매</button>
					</li>
					<li>
					<button type="button">마일리지 예매</button>
				</ul>
				</div>
		
<!-- 왕복/편도 선택 버튼 -->
<div id="trip-methods">
    <input type="radio" name="t_methods" value="round" id="round-trip" checked> 
    <label for="round-trip">왕복</label>
    <input type="radio" name="t_methods" value="one-way" id="one-way"> 
    <label for="one-way">편도</label>
</div>

<div class="quick_booking_aligner">		
<div id="quick_booking">
<!-- 출발지 버튼 -->
<button type="button" class="quick_booking_button" onclick="openPopup('departure')">
    <span id="from-text">From</span>
    <span id="departure-text">&nbsp;출발지</span>
</button>
    
    <button type="button" class="quick_booking_button circle_button">
        <img src="../static/resources/booking_reverse.png" width="40px" height="40px">
    </button>
    
 <!-- 도착지 버튼 -->
<button type="button" class="quick_booking_button" onclick="openPopup('arrival')">
    <span id="to-text">To</span>
    <span id="arrival-text">&nbsp;도착지</span>
</button>
</div>

	 

<!-- 출발지 div 팝업 -->
<div id="popup" class="popup" style="display: none;">
    <div class="popup-content">
        <h2>출발지 선택</h2>
        <ul id="airport-list"></ul> <!-- 공항 목록이 표시될 리스트 -->
    </div>
</div>

    

    <!-- 도착지 팝업 -->
    <div id="arrival-popup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup('arrival')">&times;</span>
            <h2>도착지 검색</h2>
            <input type="text" id="arrival-input" placeholder="도착지 입력" onkeyup="autocomplete('arrival')">
            <ul id="arrival-list"></ul>
            <button onclick="setLocation('arrival')">선택</button> <!-- 선택 버튼 -->
        </div>
    </div>

<!-- 날짜 선택 버튼 -->
<div id="date_selection">
	<p>출발일&nbsp;</p>
    <button type="button" id="date-btn"><span>가는날 ~ 오는날</span></button>
</div>

<!-- 탑승객 선택 버튼 -->
<div id="passenger_selection">
	<p>탑승객&nbsp;</p>
    <button type="button" id="passenger-btn" onclick="openPopup('passenger')"><span>인원수</span></button>
</div>

<!-- 승객 선택 팝업 -->
<div id="passenger-selection-popup" class="popup">
    <div class="popup-content">
        <span class="close-btn" onclick="closePopup('passenger')">&times;</span>
        <h2>승객 선택</h2>
        <div class="passenger-counter">
            <div class="passenger-type">
                <p>성인</p>
                <button class="decrease-btn" onclick="decrease('adult')">-</button>
                <span id="adult-count">1</span>
                <button class="increase-btn" onclick="increase('adult')">+</button>
            </div>
            <div class="passenger-type">
                <p>소아</p>
                <button class="decrease-btn" onclick="decrease('child')">-</button>
                <span id="child-count">0</span>
                <button class="increase-btn" onclick="increase('child')">+</button>
            </div>
            <div class="passenger-type">
                <p>유아</p>
                <button class="decrease-btn" onclick="decrease('infant')">-</button>
                <span id="infant-count">0</span>
                <button class="increase-btn" onclick="increase('infant')">+</button>
            </div>
        </div>
        <button type="button" onclick="confirmPassengers()">선택 완료</button>
    </div>
</div>



<!-- 좌석등급 선택 버튼 -->
<div id="seats_selection">
    <p>좌석등급&nbsp;</p>
    <button type="button" id="seats-btn"><span>선택하세요</span></button>
</div>

<!-- 좌석 등급 DIV -->
<div id="seat-popup" class="seat-popup" style="display: none;">
    <h2>좌석 등급 선택</h2>
    <div class="seat-options">
        <button onclick="selectSeat('일반석')">일반석</button>
        <button onclick="selectSeat('프레스티지석')">프레스티지석</button>
        <button onclick="selectSeat('일등석')">일등석</button>
    </div>
</div>




<!-- 항공편 선택 버튼 -->
<div id="search_airline">
    <a href="/flight/flightSearchResults">
        <button type="button" id="search_button"><span>항공편 검색</span></button>
         </a>
</div>


 </div>
</div>	 
	</div>	 
	 	<div class="select_contents">
		<div id="select methods">
		 <input type="radio" name="t_methods" value="0">
		 <label>왕복</label> 
		 <input type="radio" name="t_methods" value="1">
		 <label>편도</label>
		</div>
		<div id="quick_booking">
		<button type="button">
			<span>rom</span>
			<span>$nbsp;출발지</span></button>
		</div>
	 </div>
	 
	 	<div class="check-in_contents">
		<div id="check-in methods">
		 <input type="radio" name="t_methods" value="0">
		 <label>왕복</label> 
		 <input type="radio" name="t_methods" value="1">
		 <label>편도</label>
		</div>
		<div id="quick_booking">
		<button type="button">
			<span>om</span>
			<span>$nbsp;출발지</span></button>
		</div>
	 </div>
	 
	 	<div class="schedule_contents">
		<div id="schedule methods">
		 <input type="radio" name="t_methods" value="0">
		 <label>왕복</label> 
		 <input type="radio" name="t_methods" value="1">
		 <label>편도</label>
		</div>
		<div id="quick_booking">
		<button type="button">
			<span>From</span>
			<span>$nbsp;출발지</span></button>
		</div>
	 </div>
	 

	</div>
	</div> 
</div>
</div>
</div>
<!-- hj -->
	
<!-- 채팅 스타일 -->

<style>
	#chat-console {
		width: 320px;
		height: 450px;
		border: 2px solid #2DD1C5;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		position: fixed;
		bottom: 20px;
		right: 20px;
		background-color: #fff;
		display: none;
		flex-direction: column;
		overflow: hidden;
		font-family: Arial, sans-serif;
		z-index: 9999;
	}
	#chat-header {
		background-color: #2DD1C5;
		color: white;
		padding: 15px;
		text-align: center;
		font-weight: bold;
		cursor: pointer;
		position: relative;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		z-index: 9999;
	}
	#chat-header button {
		position: absolute;
		top: 50%;
		right: 15px;
		transform: translateY(-50%);
		background-color: #E74C3C;
		color: white;
		border: none;
		padding: 5px 10px;
		cursor: pointer;
		font-size: 12px;
		border-radius: 5px;
		transition: background-color 0.3s;
		z-index: 9999;
	}
	#chat-header button:hover {
		background-color: #C0392B;
	}
	#chat-body {
		flex: 1;
		padding: 15px;
		overflow-y: auto;
		background-color: #F8F9FA;
		display: flex;
		flex-direction: column;
	}
	#chat-body .message {
		margin-bottom: 12px;
		display: flex;
		width: 100%;
	}
	#chat-body .user-message {
		color: white;
		text-align: right;
		background-color: #2DD1C5;
		padding: 10px;
		border-radius: 15px;
		max-width: 80%;
		display: block;
		align-self: flex-end; /* 오른쪽 정렬 */
		clear: both;
	}	
	#chat-body .admin-message {
		color: black;
		text-align: left;
		background-color: #E3F2FD;
		padding: 10px;
		border-radius: 15px;
		max-width: 80%;
		display: block;
		align-self: flex-start; /* 왼쪽 정렬 */
		clear: both;
	}
	#chat-input {
		display: flex;
		padding: 10px;
		background-color: #F1F1F1;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	#chat-input input[type="text"] {
		flex: 1;
		padding: 10px;
		border: 1px solid #CCC;
		border-radius: 20px;
		outline: none;
		margin-right: 10px;
	}
	#chat-input button {
		padding: 8px 15px;
		background-color: #2DD1C5;
		color: white;
		border: none;
		cursor: pointer;
		border-radius: 20px;
		transition: background-color 0.3s;
	}
	#chat-input button:hover {
		background-color: #1A9987;
	}
	#chat-toggle {
		position: fixed;
		width: 60px;
		height: 60px;
		bottom: 20px;
		right: 30px;
		background-color: #00467F;
		color: yellow;
		padding: 5px;
		cursor: pointer;
		border-radius: 30px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		transition: background-color 0.3s;
		font-family: Arial, sans-serif;
		font-size: 30px;
	}
	#chatbot {
		width: 95%;
		height: 95%;
	}
	#chat-toggle:hover {
		background-color: #1A9987;
	}

</style>
<script>
	// 상담 종료 시
	function endChat() {
		sendMessage("상담이 종료되었습니다.");
		var endButton = document.getElementById('endChatButton');
		endButton.innerText = '닫기';
		endButton.onclick = closeAndResetChat;
	}
	// 닫기 버튼
	function closeAndResetChat() {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/resetChatHistory", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var chatBody = document.getElementById('chat-body');
				chatBody.innerHTML = '';
				var chatConsole = document.getElementById('chat-console');
				chatConsole.style.display = 'none';
				var chatToggle = document.getElementById('chat-toggle');
				chatToggle.style.display = 'block';
				var endButton = document.getElementById('endChatButton');
				endButton.innerText = '끝내기';
				endButton.onclick = endChat;
			}
		};
		xhr.send();
	}
	// 메시지 전송 함수
	function sendMessage(message) {
		var messageInput = message || document.getElementById('chat-message').value;
		var chatBody = document.getElementById('chat-body');
		if (messageInput.trim() === "") return;
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/sendMessage", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var newMessage = document.createElement('div');
				newMessage.className = "user-message";
				newMessage.textContent = messageInput;
				chatBody.appendChild(newMessage);
				document.getElementById('chat-message').value = "";
			}
		};
		xhr.send("message=" + encodeURIComponent(messageInput) + "&isAdmin=false");
	}
	// Enter 키로 메시지 전송
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById('chat-message').addEventListener('keydown', function(event) {
			if (event.key === "Enter") {
				event.preventDefault();
				sendMessage();
			}
		});
	});

	// 채팅 창 토글
	function toggleChat() {
		var chatConsole = document.getElementById('chat-console');
		var chatToggle = document.getElementById('chat-toggle');
		if (chatConsole.style.display === 'none' || chatConsole.style.display === '') {
			chatConsole.style.display = 'flex';
			chatToggle.style.display = 'none';
		} else {
			chatConsole.style.display = 'none';
			chatToggle.style.display = 'block';
		}
	}
	// 메시지 갱신
	function pollMessages() {
	    var xhr = new XMLHttpRequest();
	    xhr.open("GET", "/main/getMessages", true);
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            var chatBody = document.getElementById('chat-body');
	            var messages = JSON.parse(xhr.responseText);
	            chatBody.innerHTML = '';
	            messages.forEach(function(msg) {
	                var newMessage = document.createElement('div');
	                if (msg.startsWith('팅커벨:')) {
	                    newMessage.className = 'admin-message';
	                    newMessage.textContent = '‍💻'+ msg.replace(/^팅커벨:\s*/, '');
	                } else {
	                    newMessage.className = 'user-message';
	                    // "손님: " 접두사를 제거하고 메시지만 출력
	                    newMessage.textContent = msg.replace(/^손님:\s*/, '');
	                }
	                chatBody.appendChild(newMessage);
	            });
	            pollMessages();
	        }
	    };
	    xhr.send();
	}
	// 페이지 로드 후 메시지 요청 시작
	pollMessages();

</script>

	<!-- 채팅 상담 버튼 -->
	<div id="chat-toggle" onclick="toggleChat()"><img src="../static/resources/cb.png" id="chatbot"></div>
	
	<!-- 채팅 창 -->
	<div id="chat-console">
		<div id="chat-header">
		채팅 상담
		<button id="endChatButton" onclick="endChat()">끝내기</button>

		</div>
		<div id="chat-body"></div>
		<div id="chat-input">
			<input type="text" id="chat-message" placeholder="메시지를 입력하세요">
			<button onclick="sendMessage()">보내기</button>
		</div>
	</div>
	
<sitemesh:write property="body" />

	<footer>
		<div class="footer-container">
			<div class="footer-logo">
				<img alt="logo" src="../static/resources/eltlogo.png" width="80" align="middle">
			</div>
			<div class="footer-content">
				<div class="footer-row">
					<div class="footer-column">eLTA(주)</div>
					<div class="footer-column">365고객센터</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">대표이사 주인장</div>
					<div class="footer-column">080-888-1234(무료)</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">경기도 파주시 야당동</div>
					<div class="footer-column">email : Tmaster@air.co.kr</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">사업자 등록번호 444-44-44444</div>
					<div class="footer-column">전화번호 010-1234-5678</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">통신판매업 신고 제 24-1233</div>
					<div class="footer-column"></div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>