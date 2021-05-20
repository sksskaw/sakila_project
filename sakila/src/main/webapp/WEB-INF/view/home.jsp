<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready...');
	$('#btn').click(function(){
		console.log('click....');
		$('#loginForm').submit();
	});
});
</script>
<title>Home</title>
</head>
<body>
   <h1>Home</h1>
   <!-- 로그아웃 상태 -->
   <c:if test="${loginStaff == null}">
      <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
         <div>email :</div>
         <div><input type="text" id="email" name="email"></div>
         <div>password :</div>
         <div><input type="password" id="password" name="password"></div>
         <div><button class="btn btn-default" id="btn" type="button">Login</button></div>
      </form>
   </c:if>
   
   <!-- 로그인 상태 -->
   <c:if test="${loginStaff != null}">
      <a href="${pageContext.request.contextPath}/admin/getBoardList">BoardList</a>
      <a href="${pageContext.request.contextPath}/admin/logout">Logout</a>
      
   </c:if>
   
</body>
</html>