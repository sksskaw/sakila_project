<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getInventoryList</title>
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
	
    <h1>getInventoryList</h1>
   
    <h4>매장별 분류</h4>
    <div>
	    <form action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">
		    <div>
			    <select name="storeId">
			    	<option value="0" selected="selected">전체</option>
		        	<c:if test="${storeId == 1}">
			    		<option value="1" selected="selected">Store 1</option>
					</c:if> 
					<c:if test="${storeId != 1}">
			    		<option value="1">Store 1</option>
					</c:if>
					
					<c:if test="${storeId == 2}">
			    		<option value="2" selected="selected">Store 2</option>
			    	</c:if>
			    	<c:if test="${storeId != 2}">
			    		<option value="2">Store 2</option>
			    	</c:if>
		        </select>
		    <button type="submit">보기</button>
		    </div>
	    </form>
    </div>
    <br>
    
    <!-- film 리스트 출력 -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>SID</th>
                <th>Title</th>
                <th>Total Inventory</th>
                <th>Rental Inventory</th>
                <th>Stock Inventory</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="i" items="${inventoryList}">
                <tr>
                    <td class="col-sm-1 text-center">${i.storeId}</td>
                    <td class="col-sm-2 text-center">
                    	<a href="#">${i.title}</a>
                    </td>
                    <td class="col-sm-1 text-center">${i.totalInventory}</td>
                    <td class="col-sm-2 text-center">${i.rental}</td>
                    <td class="col-sm-1 text-center">${i.stock}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 페이징 처리 -->
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}">다음</a></li>
        </c:if>
    </ul>
    
    <!-- 검색어 입력창 -->
    <div class="text-center">
	    <form action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">
	    	<input type="hidden" name="storeId" value="${storeId}">
	        <label for="searchWord">검색어 :</label>
	        <input name="searchWord" type="text" value="${searchWord}">
	        <button type="submit">검색</button>
	    </form>
    </div>
    
	<div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addInventory">재고 추가</a>
    </div>
</div>
</body>
</html>