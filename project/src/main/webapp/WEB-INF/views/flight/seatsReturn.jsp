<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 선택</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
    .airplane {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .seat-container {
        display: flex;
        flex-direction: column;
        align-items: center; /* 좌석 번호를 중앙에 배치 */
    }
    .seatf {
        width: 100px;
        height: 120px;
        background-image: url('../static/resources/seata.png'); /* 좌석 이미지 경로 */
        background-size: cover; /* 이미지 크기를 좌석에 맞게 조정 */
        background-position: center;
        text-align: center;
        line-height: 80px;
        cursor: pointer;
        border: none; /* 테두리 제거 */
    }
    .seatb {
        width: 80px;
        height: 100px;
        background-image: url('../static/resources/seata.png'); /* 좌석 이미지 경로 */
        background-size: cover; /* 이미지 크기를 좌석에 맞게 조정 */
        background-position: center;
        text-align: center;
        line-height: 80px;
        cursor: pointer;
        border: none; /* 테두리 제거 */
    }
    .seat {
        width: 60px;
        height: 80px;
        background-image: url('../static/resources/seata.png'); /* 좌석 이미지 경로 */
        background-size: cover; /* 이미지 크기를 좌석에 맞게 조정 */
        background-position: center;
        text-align: center;
        line-height: 80px;
        cursor: pointer;
        border: none; /* 테두리 제거 */
    }
    .seat-number {
        font-weight: bold;
        margin-bottom: 1px; /* 좌석 이미지와 좌석 번호 사이 간격 */
    }
    .available {
        /* 사용 가능한 좌석일 경우 */
        opacity: 1;
    }
    .unavailable {
        /* 사용 불가능한 좌석일 경우 */
        opacity: 0.5; /* 투명도 조절 */
        cursor: not-allowed;
    }
    .selected {
        box-shadow: 0px 0px 15px 5px #90EE90; /* 선택된 좌석에 연두색 그림자 추가 */
        border: 2px solid #90EE90; /* 선택된 좌석에 연두색 테두리 */
    }
    .aisle {
        width: 40px; /* 복도 공간 */
        height: 80px;
        background-color: transparent;
    }
    .row {
        display: flex;
        gap: 10px; /* 좌석 간의 간격 추가 */
        justify-content: center;
        margin-bottom: 20px; /* 행 간의 간격 */
    }
    </style>

</head>
<body>
    <div class="container">
        <h2 class="mt-4">비행기 좌석 선택 - ${seatClass}</h2>
        <p>비행기 ID: ${flightId}</p>
        <p>탑승객 수: ${passengers}명</p>

        <!-- 비행기 좌석 배치 -->
        <div id="seatsContainer" class="airplane">
            <c:set var="currentRow" value="" />

            <c:forEach var="seat" items="${seats}" varStatus="status">
                <c:set var="seatRow" value="${seat.seatNumber.substring(0, seat.seatNumber.length() - 1)}" />

                <c:if test="${status.first || seatRow != currentRow}">
                    <c:set var="currentRow" value="${seatRow}" />
                    <div class="row">
                </c:if>

                <c:choose>
                    <c:when test="${seatRow >= 1 && seatRow <= 10}">
                        <div class="seat-container">
                            <div class="seat-number">${seat.seatNumber}</div> <!-- 좌석 번호 -->
                            <div class="seatf ${seat.available ? 'available' : 'unavailable'}"
                                 data-seat-number="${seat.seatNumber}"
                                 data-available="${seat.available}"
                                 onclick="selectSeat(this)">
                            </div>
                        </div>
                        <div class="aisle"></div>
                    </c:when>

                    <c:when test="${seatRow >= 11 && seatRow <= 30}">
                        <div class="seat-container">
                            <div class="seat-number">${seat.seatNumber}</div> <!-- 좌석 번호 -->
                            <div class="seatb ${seat.available ? 'available' : 'unavailable'}"
                                 data-seat-number="${seat.seatNumber}"
                                 data-available="${seat.available}"
                                 onclick="selectSeat(this)">
                            </div>
                        </div>
                        <div class="aisle"></div>
                    </c:when>

                    <c:when test="${seatRow >= 31 && seatRow <= 49}">
                        <div class="seat-container">
                            <div class="seat-number">${seat.seatNumber}</div> <!-- 좌석 번호 -->
                            <div class="seat ${seat.available ? 'available' : 'unavailable'}"
                                 data-seat-number="${seat.seatNumber}"
                                 data-available="${seat.available}"
                                 onclick="selectSeat(this)">
                            </div>
                        </div>
                        <c:if test="${status.index % 3 == 2}">
                            <div class="aisle"></div>
                        </c:if>
                    </c:when>

                    <c:when test="${seatRow >= 50}">
                        <div class="seat-container">
                            <div class="seat-number">${seat.seatNumber}</div> <!-- 좌석 번호 -->
                            <div class="seat ${seat.available ? 'available' : 'unavailable'}"
                                 data-seat-number="${seat.seatNumber}"
                                 data-available="${seat.available}"
                                 onclick="selectSeat(this)">
                            </div>
                        </div>
                        <c:if test="${status.index % 3 == 2}">
                            <div class="aisle"></div>
                        </c:if>
                    </c:when>
                </c:choose>

                <c:if test="${status.last || seatRow != seats[status.index + 1].seatNumber.substring(0, seats[status.index + 1].seatNumber.length() - 1)}">
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- 선택한 좌석 표시 -->
        <div class="mt-4">
            <h4>선택한 좌석:</h4>
            <p id="selectedSeatsDisplay"></p>
        </div>

        <!-- 선택 완료 버튼 -->
        <button class="btn btn-primary mt-4" onclick="confirmSelection()">선택 완료</button>
    </div>

    <!-- 자바스크립트 코드 -->
    <script>
        var maxSelectableSeats = ${passengers};  // 탑승객 수
        var selectedSeats = [];

        function selectSeat(element) {
            var isAvailable = element.getAttribute('data-available') === 'true';
            if (!isAvailable) {
                return; // 선택 불가능한 좌석
            }

            var seatNumber = element.getAttribute('data-seat-number');
            var index = selectedSeats.indexOf(seatNumber);

            if (index === -1) {
                // 좌석 선택 시 제한 확인
                if (selectedSeats.length >= maxSelectableSeats) {
                    alert('최대 ' + maxSelectableSeats + '개의 좌석만 선택할 수 있습니다.');
                    return;
                }
                // 좌석 선택
                selectedSeats.push(seatNumber);
                element.classList.add('selected'); // 선택된 좌석에 'selected' 클래스 추가
            } else {
                // 좌석 선택 해제
                selectedSeats.splice(index, 1);
                element.classList.remove('selected'); // 선택 해제된 좌석에서 'selected' 클래스 제거
            }

            // 선택한 좌석 표시 업데이트
            document.getElementById('selectedSeatsDisplay').innerText = selectedSeats.join(', ');
        }

        function confirmSelection() {
            if (selectedSeats.length === 0) {
                alert('최소 한 개의 좌석을 선택해야 합니다.');
                return;
            }

            if (selectedSeats.length !== maxSelectableSeats) {
                alert('탑승객 수에 맞게 좌석을 선택해 주세요.');
                return;
            }

            // 선택한 좌석 정보를 서버로 전송
            var form = document.createElement('form');
            form.method = 'post';
            form.action = '${pageContext.request.contextPath}/flights/confirmSeats';

            // 필요한 데이터 추가
            var flightIdInput = document.createElement('input');
            flightIdInput.type = 'hidden';
            flightIdInput.name = 'flightId';
            flightIdInput.value = '${flightId}';
            form.appendChild(flightIdInput);

            var seatClassInput = document.createElement('input');
            seatClassInput.type = 'hidden';
            seatClassInput.name = 'seatClass';
            seatClassInput.value = '${seatClass}';
            form.appendChild(seatClassInput);

            var passengersInput = document.createElement('input');
            passengersInput.type = 'hidden';
            passengersInput.name = 'passengers';
            passengersInput.value = '${passengers}';
            form.appendChild(passengersInput);

            var selectedSeatsInput = document.createElement('input');
            selectedSeatsInput.type = 'hidden';
            selectedSeatsInput.name = 'selectedSeats';
            selectedSeatsInput.value = selectedSeats.join(',');  // 선택한 좌석 목록을 콤마로 구분
            form.appendChild(selectedSeatsInput);

            document.body.appendChild(form);

            form.submit();  // 폼을 전송
            window.opener.postMessage({
                type: 'returnSeatsSelected',
                seats: selectedSeats
            }, '*');

            // 창 닫기
            window.close();
        }

    </script>
</body>
</html>
