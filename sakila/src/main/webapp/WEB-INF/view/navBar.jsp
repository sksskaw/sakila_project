<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul>
	<li><a href="${pageContext.request.contextPath}/">Home</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/getBoardList">BoardList</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/getStaffList">StaffList</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/getFilmList">FilmList</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/getActorList">ActorList</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/getCustomerList">CustomerList</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/getInventoryList">InventoryList</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/getSalesList">SalesList</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/logout">Logout</a>
</ul>