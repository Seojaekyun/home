<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   div {
     margin-top:20px;
   }
 </style>
 <script>
   function winClose()
   {
	   close();
   }
   function loginMove()
   {
	   // 부모창의 문서를 login으로
	   opener.location="../login/login";
	   close();
   }
   function pwdMove()
   {
	   location="psForm";
	   //resizeTo(400,350); // 브라우저 창의 크기를 변경
	   resizeBy(0,70); // 현재기준에서 증가시키키
   }
   
 </script>
</head>
<body> <!-- member/useriSearch.jsp -->
   <div>&nbsp;</div>
   <div align="center"> 당신의 아이디 : ${userid} </div>
   <div align="center"> 
      <input type="button" onclick="winClose()" value="창닫기">
      <input type="button" onclick="loginMove()" value="로그인하기">
      <input type="button" onclick="pwdMove()" value="비밀번호찾기">
   </div>
</body>
</html>