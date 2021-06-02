<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getCustomerList</title>
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
	<h1>블랙리스트</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Customer ID</th>
				<th>Customer Name</th>
				<th>연체 횟수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bc" items="${blackCustomerList}">
                <tr>
                    <td class="col-sm-1 text-center">${bc.ID}</td>
                    <td class="col-sm-2 text-center">
                    	<a href="#">${bc.name}</a>
                    </td>
                    <td class="col-sm-4 text-center">${bc.count}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <h1>getCustomerList</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>zip code</th>
                <th>phone</th>
                <th>city</th>
                <th>country</th>
                <th>notes</th>
                <th>SID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${customerList}">
                <tr>
                    <td class="col-sm-1 text-center">${c.ID}</td>
                    <td class="col-sm-2 text-center">
                    	<a href="#">${c.name}</a>
                    </td>
                    <td class="col-sm-2 text-center">${c.address}</td>
                    <td class="col-sm-1 text-center">${c.zipCode}</td>
                    <td class="col-sm-1 text-center">${c.phone}</td>
                    <td class="col-sm-1 text-center">${c.city}</td>
                    <td class="col-sm-1 text-center">${c.country}</td>
                    <td class="col-sm-1 text-center">${c.notes}</td>
                    <td class="col-sm-1 text-center">${c.SID}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
        </c:if>
    </ul>
    
    <!-- 검색어 입력창 -->
    <div class="text-center">
	    <form action="${pageContext.request.contextPath}/admin/getCustomerList" method="get">
	        <label for="searchWord">검색어(제목) :</label> 
	        <input name="searchWord" type="text">
	        <button type="submit">검색</button>
	    </form>
    </div>

    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addCustomer">고객 등록하기</a>
    </div>
    
</div>
</body>
</html>