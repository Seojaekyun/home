<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		font-family: 'Hahmlet';
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
		color: green;
		font-weight: 900;
	}
	#section1 #loginMenu ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
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
		top: 30px;
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
	#section1 #loginMenu .cmenu > li:hover, #section1 #loginMenu .mmenu > li:hover {
		text-decoration: underline;
		color: green;
	}
	#section1 #loginMenu #supMenu {
		position: relative;
	}
	#section1 #loginMenu #myInfo {
		position: relative;
	}
	#section1 #loginMenu #supMenu .menu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 30px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
	}
	#section1 #loginMenu #supMenu .menu > li {
		list-style-type: none;
		width: 130px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		border-bottom: 1px solid #ddd;
	}
	#section1 #loginMenu #supMenu .menu > li:hover {
		text-decoration: underline;
		color: green;
	}
	header > nav {
		width: 1200px;
		height: 70px;
		margin: auto;
		line-height: 50px;
		font-family: 'Gugi';
	}
	header > nav a {
		text-decoration: none;
		color: black;
	}
	header > nav a:hover {
		text-decoration: underline;
		color: green;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px  1px 0 #000, 1px  1px 0 #000;
	}
	header > nav #main {
		padding-left: 0;
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
		padding-left: 0;
		position: absolute;
		left: 0;
		top: 48px;
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
		background: #150084;
		color: white;
		text-align: center;
	}
	footer table {
		width: 100%;
		max-width: 1000px;
		margin: auto;
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
		footer table, footer td {
			font-size: 11px;
		}
	}
</style>
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
</script>
<sitemesh:write property="head"/>
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
				<c:if test="${userid==null}">
				
					<!-- 관리조 홈 예시 -->
					<a href="#" style="color: orange;"> 관리자 홈 </a>&nbsp;|&nbsp;
					
					<a href="../member/member"> 회원가입 </a>&nbsp;|&nbsp;
					<a href="../login/login"> 로그인 </a>&nbsp;|&nbsp;
					
				</c:if>
										
				<c:if test="${userid!=null}">
					<span id="myInfo" onmouseover="viewMmenu(0)" onmouseout="hideMmenu(0)">  ${name}님 &nbsp;|&nbsp;
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
						<li><a href="../menu/index1">여행 준비</a></li>
						<li><a href="../menu/index2">여행</a></li>
						<li><a href="../menu/index3">예약 취소</a></li>
					</ul>
				</li>
				<li onmouseover="viewMenu(1)" onmouseout="hideMenu(1)"> 항공권
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
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
				<li onmouseover="viewMenu(4)" onmouseout="hideMenu(4)"> 호텔
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
<sitemesh:write property="body"/>
	<footer>
		<table>
			<tr align="left">
				<td rowspan="5" width="200"></td>
				<td rowspan="5"><img alt="logo" src="../static/resources/123.png" width="80" align="middle"></td>
				<td> 상호명 : LLTA </td>
				<td> 365고객센터 </td>
			</tr>
			<tr align="left">
				<td> 대표이사 : 주인장 </td>
				<td> 080-888-1234(무료) </td>
			</tr>
			<tr align="left">
				<td> 본사 : 경기도 파주시 야당동 </td>
				<td> email : Tmaster@air.co.kr </td>
			</tr>
			<tr align="left">
				<td> 사업자 등록번호 : 444-44-44444 </td>
				<td> 전화번호 : 010-1234-5678 </td>
			</tr>
			<tr align="left">
				<td> 통신판매업 신고 제 18-2838 </td>
				<td></td>
			</tr>
		</table>
	</footer>
</body>
</html>