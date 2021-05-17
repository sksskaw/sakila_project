<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countryLsit</title>
</head>
<body>
	<h1>countryLsit</h1>
	<table border="1">
		<thead>
			<tr>
				<th>countryId</th>
				<th>country</th>
				<th>lastUpdate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${list}">
				<tr>
					<td>${c.countryId}</td>
					<td>${c.country}</td>
					<td>${c.lastUpdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>