<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>getBoardList</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/font-awesome/css/font-awesome.min.css" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/template/src/assets/images/favicon.ico" />
 <style>
 th, td {
   text-align:center
}
 </style>
</head>
<body>
	<div class="container-scroller">
      <!-- partial:partials/_navbar.html -->

      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        	<jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>
        
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- Page Title Header Starts-->
            <div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Board List</h4>
                </div>
              </div>
            </div>
            
            <!-- 대여 리스트 출력 -->
            <div class="row">
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-12 grid-margin">
                    <div class="card">
                      <div class="card-body">
                        <div class="d-flex justify-content-between">
                          <h4 class="card-title mb-0">Board List </h4>
                        </div>
                        <p>You can create new notice and comment on notice.</p>
						
						<div class="col-md-12">
						    <!-- 고객 ID 검색 -->
						    <form action="${pageContext.request.contextPath}/admin/getBoardList" method="get">
							  <div>
							  	<label>
							  		<input type="text" style="width:270px;" class="form-control" name="searchWord" value="${searchWord}" placeholder="Search Name"/>
							  	</label>
									<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
							  </div>
							</form>
					    </div>
						
                        <div class="table-responsive">
	                        <table class="table table-striped table-hover">
						        <thead>
						            <tr>
						                <th>boardId</th>
						                <th>boardTitle</th>
						                <th>insertDate</th>
						            </tr>
						        </thead>
						        <tbody>
						            <c:forEach var="b" items="${boardList}">
						                <tr>
						                    <td class="text-center">${b.boardId}</td>
						                    <td class="text-center"> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
						                    	<a href="${pageContext.request.contextPath}/admin/getBoardOne?boardId=${b.boardId}">${b.boardTitle}</a>
						                    </td>
						                    <td class="text-center">${b.insertDate.substring(0,10)}</td>
						                </tr>
						            </c:forEach>
						        </tbody>
						    </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			
			<!-- 페이징 -->
			<div class="row">
		        <c:if test="${currentPage > 1}">
		            <a href="${pageContext.request.contextPath}/admin/getBoardList?currentPage=${currentPage-1}&searchWord=${searchWord}">
		            	<button type="submit" class="btn btn-primary"><i class="fa fa-angle-left"></i></button>
		            </a>
		        </c:if>&nbsp;
		        <c:if test="${currentPage < lastPage}">
		            <a href="${pageContext.request.contextPath}/admin/getBoardList?currentPage=${currentPage+1}&searchWord=${searchWord}">
		            	<button type="submit" class="btn btn-primary"><i class="fa fa-angle-right"></i></button>
		            </a>
		        </c:if>
		        &nbsp;
		        <a href="${pageContext.request.contextPath}/admin/addBoard"><button type="button" class="btn btn-primary btn-sm">Add Board</button></a>&nbsp;
			</div>
			
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid clearfix">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © Kim Tae Hoon 2021</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Git source <a href="https://github.com/sksskaw/sakila_project/" target="_blank">Sakila project</a></span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
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