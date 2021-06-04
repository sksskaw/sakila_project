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
	<jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>
	
    <h1>getFilmList</h1>
   
    <h4>카테고리</h4>
    <div>
    		<a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${1}">전체 | </a>
	    <c:forEach var="c" items="${categoryList}">
	    	<a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${1}&category=${c.name}">${c.name} |</a>
	    </c:forEach>
    </div>
    <br>
    
    <!-- 가격별, 등급별 검색 -->
    <form action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
    	<input type="hidden" name="category" value="${category}">
	    <div>
		    가격별
		    	<select name="price">
		    		<option value="0" selected="selected">전체</option>
		    		<c:forEach var="p" items="${priceList}">
		    			<c:if test="${p == price}">
		    				<option value="${p}" selected="selected">${p}</option>
		    			</c:if>
		    			<c:if test="${p != price}">
		    				<option value="${p}">${p}</option>
		    			</c:if>
		    		</c:forEach>
		    	</select>
		    &nbsp;
		    등급별
		    	<select name="rating">
		    		<option value="" selected="selected">전체</option>
		    		<c:forEach var="r" items="${ratingList}">
		    			<c:if test="${r == rating}">
		    				<option value="${r}" selected="selected">${r}</option>
		    			</c:if>
		    			<c:if test="${r != rating}">
		    				<option value="${r}">${r}</option>
		    			</c:if>
		    		</c:forEach>
		    	</select>
	    <button type="submit">검색</button>
	    </div>
    </form>
    
    <!-- film 리스트 출력 -->
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
            </tr>
        </thead>
        <tbody>
            <c:forEach var="f" items="${filmList}">
                <tr>
                    <td class="col-sm-1 text-center">${f.FID}</td>
                    <td class="col-sm-2 text-center">
                    	<a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${f.FID}">${f.title}</a>
                    </td>
                    <td class="col-sm-2 text-center">${f.description.substring(0,10)}...</td>
                    <td class="col-sm-1 text-center">${f.category}</td>
                    <td class="col-sm-1 text-center">${f.price}</td>
                    <td class="col-sm-1 text-center">${f.length}</td>
                    <td class="col-sm-1 text-center">${f.rating}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 페이징 처리 -->
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&searchWord=${searchWord}&category=${category}&price=${price}&rating=${rating}&searchKind=${searchKind}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&searchWord=${searchWord}&category=${category}&price=${price}&rating=${rating}&searchKind=${searchKind}">다음</a></li>
        </c:if>
    </ul>
    
    <!-- 검색어 입력창 -->
    <div class="text-center">
	    <form action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
	    	<input type="hidden" name="category" value="${category}">
	    	<input type="hidden" name="rating" value="${rating}">
	    	<input type="hidden" name="price" value="${price}">
	        <label for="searchWord">검색어 :</label>
	        <select name="searchKind">
	        	<c:if test="${searchKind == 'title'}">
		    		<option value="title" selected="selected">제목</option>
				</c:if>
				<c:if test="${searchKind != 'title'}">
		    		<option value="title">제목</option>
				</c:if>
				
				<c:if test="${searchKind == 'actors'}">
		    		<option value="actors" selected="selected">배우</option>
		    	</c:if>
		    	<c:if test="${searchKind != 'actors'}">
		    		<option value="actors">배우</option>
		    	</c:if>
	        </select>
	        <input name="searchWord" type="text" value="${searchWord}">
	        <button type="submit">검색</button>
	    </form>
    </div>
    
	<div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addFilm">영화 추가</a>
    </div>
</div>
</body>
</html>