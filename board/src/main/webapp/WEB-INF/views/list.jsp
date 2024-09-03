<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Diphylleia&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>테스트 보드</title>
<style>
	body {
		margin: auto;
		font-family: 'Diphylleia', sans-serif;
		background-color: skyblue;
	}
	#sett {
		display: inline-block;
	}
	.cont {
		width: 850px;
		background: white;
		margin: 50px auto;
		padding: 20px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		border-radius: 8px;
	}
	table {
		width: 100%;
		border: 1px solid #ddd;
		border-collapse: collapse;
		background: #f4fff9;
	}
	tr {
		border: 1px solid #ddd;
		height: 35px;
	}
	td {
		border: 1px solid #ddd;
		text-align: center;
		padding: 8px;
	}
	thead tr {
		background: navy;
		color:white;
	}
	thead td {
		font-weight: bold;
		color: white;
	}
	caption {
		margin-bottom: 15px;
		font-size: 24px;
		color: #3c763d;
	}
	h3 {
		margin: 0;
	}
	input[type="button"],[type="submit"] {
		background-color: #5cb85c;
		color: white;
		border: none;
		padding: 5px 8px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 14px;
		border-radius: 7px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	input[type="button"],[type="submit"]:hover {
		background-color: #4cae4c;
	}
	a {
		text-decoration: none;
	}
	input[type="text"] {
		height: 24px;
		border: 1px;
		border-radius: 5px;
	}
	select {
		height: 27px;
		border-radius: 5px;
	}
	#listbtn {
		vertical-align: middle;
	}
</style>
<script>
	function change(my) {
		my.submit();
	}
	window.onload=function() {
		document.sjk.rec.value=${rec };
	}
</script>
</head>
<body>
	<div class="cont" align="center">
		<table>
			<caption><h3>TEST BOARD</h3></caption>
			<thead>
			<tr><td colspan="3"><form name="sform" method="post" action="list">
				<select name="field">
					<option value="title">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="sword" value="${sword }">
				<input type="submit" value="검색">
			</form></td>
			<td>1페이지</td>
			<td>
			<form method="post" action="list" name="sjk">
				<select name="rec" onchange="change(this.form)">
					<option value="10">10개</option>
					<option value="20">20개</option>
					<option value="30">30개</option>
					<option value="50">50개</option>
				</select>
			</form></td></tr>
			</thead>
			<tr>
				<td colspan="5" style="text-align: right;">
					<a href="write"><input type="button" value="새글"></a>
				</td>
			</tr>
			<tbody>
				<tr>
					<td width="100">no.</td>
					<td width="150">글쓴이</td>
					<td width="300">제 목</td>
					<td width="100">조회수</td>
					<td width="150">작성일</td>
				</tr>
				<c:forEach items="${list }" var="bdto">
				<tr>
					<td>${bdto.id }</td>
					<td>${bdto.name }</td>
					<td><a href="rnum?id=${bdto.id }&page=${page }&rec=${rec }">${bdto.title }</a></td>
					<td>${bdto.rnum }</td>
					<td>${bdto.writeday }</td>
				</tr>
				</c:forEach>
			</tbody>
			<tr>
				<td colspan="5" align="center">
				<c:if test="${pstart!=1 }">
					<a href="list?page=${pstart-1 }&rec=${rec }&field=${field }&sword=${sword }">◀◀</a>
				</c:if>
				<c:if test="${pstart==1 }">
					◁◁
				</c:if>
				<c:if test="${page!=1 }">
					<a href="list?page=${page-1 }&rec=${rec }&field=${field }&sword=${sword }">◀</a>
				</c:if>
				<c:if test="${page==1 }"> 
					◁
				</c:if>
				|
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${page==i}">
						<a href="list?page=${i }&rec=${rec }&field=${field }&sword=${sword }"
						style="color:red; font-size:20px; font-weight:1000; display: inline-block; width: 40px; text-align: center;">
						${i }</a>
					</c:if>
					<c:if test="${page!=i }">
						<a href="list?page=${i }&rec=${rec }&field=${field }&sword=${sword }"
						style="display: inline-block; width: 40px; text-align: center;">
						${i }</a>
					</c:if>
				</c:forEach>
				|
				<c:if test="${page!=chong }">
					<a href="list?page=${page+1 }&rec=${rec }&field=${field }&sword=${sword }">▶</a>
				</c:if>
				<c:if test="${page==chong }"> 
					▷
				</c:if>
				<c:if test="${pend!=chong }"> 
					<a href="list?page=${pend+1 }&rec=${rec }&field=${field }&sword=${sword }">▶▶</a>
				</c:if>
				<c:if test="${pend==chong }">
					▷▷
				</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>