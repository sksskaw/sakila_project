<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getActorInfoList</title>
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
	
    <h1>getActorInfoList</h1>
    
	<h4>카테고리</h4>
    <div>
    	<c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" />
    	
    		<a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${1}">전체 | </a>
	    <c:forTokens var="letter" items="${alphabet}" delims=",">
	    	<a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${1}&category=${letter}">
				&nbsp; ${letter} &nbsp;
	    	</a>|
	    </c:forTokens>
    </div>
    <br>

    <!-- film 리스트 출력 -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>actorId</th>
                <th>name</th>
                <th>filmInfo</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="actor" items="${actorInfoList}">
                <tr>
                    <td class="col-sm-1 text-center">${actor.actorId}</td>
                    <td class="col-sm-1 text-center">${actor.name}</td>
                    <td class="col-sm-2 text-center">${actor.filmInfo}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 페이징 처리 -->
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage-1}&searchWord=${searchWord}&category=${category}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage+1}&searchWord=${searchWord}&category=${category}">다음</a></li>
        </c:if>
    </ul>

	<!-- 검색어 입력창 -->
    <div class="text-center">
	    <form action="${pageContext.request.contextPath}/admin/getActorList" method="get">
	    	<input type="hidden" name="category" value="${category}">
	        <label for="searchWord">검색어 :</label>
	        <input name="searchWord" type="text" value="${searchWord}">
	        <button type="submit">검색</button>
	    </form>
    </div>

	<div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addActor">배우 추가</a>
    </div>
</div>
</body>
</html>