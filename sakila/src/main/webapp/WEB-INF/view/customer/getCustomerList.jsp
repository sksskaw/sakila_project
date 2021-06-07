<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Star Admin Premium Bootstrap Admin Dashboard Template</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/template/src/assets/images/favicon.ico" />
 <style>
 th {
   text-align:center
}
 </style>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>
	
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
                    	<a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${bc.ID}">${bc.name}</a>
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
                    	<a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${c.ID}">${c.name}</a>
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

    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}template/src/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/template/src/assets/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}template/src/assets/js/shared/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/template/src/assets/js/shared/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="${pageContext.request.contextPath}/template/src/assets/js/demo_1/dashboard.js"></script>
    <!-- End custom js for this page-->
    <script src="${pageContext.request.contextPath}/template/src/assets/js/shared/jquery.cookie.js" type="text/javascript"></script>
</body>
</html>