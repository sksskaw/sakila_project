<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Inventory List</title>
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
                  <h4 class="page-title">Inventory List</h4>
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
                          <h4 class="card-title mb-0">Inventory List</h4>
                        </div>
                        <p>Order By Film Title</p>
                        
                        <!-- 매장별 목록 출력 선택상자 -->
                        <div class="col-md-9">
						    <form style="display:inline-block" action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">
							    <select class="form-control" name="storeId" style="width:300px;">
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
						    	<button type="submit" class="btn btn-primary" id="searchNameBtn"><i class="fa fa-search"></i></button>
						    </form>
						    
						    <a href="${pageContext.request.contextPath}/admin/addInventory">
					        	<button type="button" class="btn btn-primary btn-sm">Add Inventory</button>
					        </a>
					        <a href="${pageContext.request.contextPath}/admin/removeInventory">
					        	<button type="button" class="btn btn-primary btn-sm">Remove Inventory</button>
					        </a>
					    </div>
                        
                        
                        <div class="table-responsive">
	                        <table class="table table-striped table-hover">
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
						                    <td>${i.storeId}</td>
						                    <td>
						                    	<a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${i.filmId}">${i.title}</a>
						                    </td>
						                    <td class="text-center">${i.totalInventory}</td>
						                    <td class="text-center">${i.rental}</td>
						                    <td class="text-center">${i.stock}</td>
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
		            <a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}">
		            	<button type="submit" class="btn btn-primary"><i class="fa fa-angle-left"></i></button>
		            </a>
		        </c:if>&nbsp;
		        
		        <c:forEach var="i" begin="1" end="10">
					<c:if test="${(pageSet*10)+i < lastPage+1}">
			            <a href="${pageContext.request.contextPath}/admin/getRentalList?currentPage=${(pageSet*10)+i}">
							<button type="button" class="btn btn-primary">${(pageSet*10)+i}</button>
						</a>&nbsp;
					</c:if>
				</c:forEach>
				
		        <c:if test="${currentPage < lastPage}">
		            <a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}">
		            	<button type="submit" class="btn btn-primary"><i class="fa fa-angle-right"></i></button>
		            </a>
		        </c:if>
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