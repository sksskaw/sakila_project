<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyFilmActorsInfo</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>
	
	<h1>영화(filmId : ${filmId}) 출연자(actor) 수정</h1>
	<form action="${pageContext.request.contextPath}/admin/modifyFilmActorsInfo" method="post">
		<input type="hidden" name="filmId" value="${filmId}">
		<c:forEach var="m" items="${actorsCheckList}">
			<c:if test="${m.filmId == null}">
				<input type="checkbox" name="ck" value="${m.actorId}">
			</c:if>
			<c:if test="${m.filmId != null}">
				<input type="checkbox" name="ck" checked="checked" value="${m.actorId}">
			</c:if>
			<span style="color:red;">${m.name.substring(0, 1)}</span>${m.name.substring(1)}&nbsp;
		</c:forEach>
		<div>
			<button type="submit">출연배우 수정</button>
		</div>
	</form>
</body>
</html>