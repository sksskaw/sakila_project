<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getFilmList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 <style>
 th {
   text-align:center
}
 </style>
</head>
<body>
<div class="container">
    <h1>getFilmList</h1>
    
    <h4>카테고리</h4>
    <div>
    		<a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${1}">전체 | </a>
	    <c:forEach var="c" items="${categoryList}">
	    	<a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${1}&searchWord=${searchWord}&category=${c}">${c} |</a>
	    </c:forEach>
    </div>
    
    <h4>가격별 검색</h4>
    <div>
    		<a href="">전체 | </a>
	    <c:forEach var="p" items="${priceList}">
	    	<a href="">${p}$ |</a>
	    </c:forEach>
    </div>
    
    <table class="table table-striped">
        <thead>
            <tr>
                <th>FID</th>
                <th>Title</th>
                <th>description</th>
                <th>Category</th>
                <th>Price</th>
                <th>Running time</th>
                <th>Rating</th>
                <th>Actors</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="f" items="${filmList}">
                <tr>
                    <td class="col-sm-1 text-center">${f.FID}</td>
                    <td class="col-sm-2 text-center">
                    	<a href="#">${f.title}</a>
                    </td>
                    <td class="col-sm-2 text-center">${f.description.substring(0,10)}...</td>
                    <td class="col-sm-1 text-center">${f.category}</td>
                    <td class="col-sm-1 text-center">${f.price}</td>
                    <td class="col-sm-1 text-center">${f.length}</td>
                    <td class="col-sm-1 text-center">${f.rating}</td>
                    <td class="col-sm-1 text-center">${f.actors.substring(0,10)}...</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&searchWord=${searchWord}&category=${category}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&searchWord=${searchWord}&category=${category}">다음</a></li>
        </c:if>
    </ul>
    
    <!-- 검색어 입력창 -->
    <div class="text-center">
	    <form action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
	        <label for="searchWord">검색어(제목) :</label> 
	        <input name="searchWord" type="text">
	        <button type="submit">검색</button>
	    </form>
    </div>

    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addFilm">직원 등록하기</a>
    </div>
    
</div>
</body>
</html>