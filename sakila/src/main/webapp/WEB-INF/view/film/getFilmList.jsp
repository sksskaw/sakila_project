<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Film List</title>
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
                  <h4 class="page-title">Film List</h4>
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
                          <h4 class="card-title mb-0">Film List</h4>
                        </div>
                        <p>You can sort by movie category, price, rating, and title search, and search for actors.</p>
						
						<div class="col-md-12">
							<!-- 카테고리별, 가격별, 등급별 출력 -->
						    <form style="display:inline-block" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
						    
						    	<select class="form-control" name="category" style="width:150px;">
							    	<option value="0" selected="selected">카테고리</option>
						    		<c:forEach var="c" items="${categoryList}">
						    			<c:if test="${c.name == category}">
						    				<option value="${c.name}" selected="selected">${c.name}</option>
						    			</c:if>
						    			<c:if test="${c.name != category}">
						    				<option value="${c.name}">${c.name}</option>
						    			</c:if>
						    		</c:forEach>
						        </select>
						    
							    <select class="form-control" name="price" style="width:150px;">
							    	<option value="0" selected="selected">가격별</option>
						    		<c:forEach var="p" items="${priceList}">
						    			<c:if test="${p == price}">
						    				<option value="${p}" selected="selected">${p}</option>
						    			</c:if>
						    			<c:if test="${p != price}">
						    				<option value="${p}">${p}</option>
						    			</c:if>
						    		</c:forEach>
						        </select>
						    
						    	<select  class="form-control" name="rating" style="width:150px;">
						    		<option value="" selected="selected">등급별</option>
						    		<c:forEach var="r" items="${ratingList}">
						    			<c:if test="${r == rating}">
						    				<option value="${r}" selected="selected">${r}</option>
						    			</c:if>
						    			<c:if test="${r != rating}">
						    				<option value="${r}">${r}</option>
						    			</c:if>
						    		</c:forEach>
						    	</select>
						    	
						    <button type="submit" class="btn btn-primary" id="searchNameBtn"><i class="fa fa-search"></i></button>
						    <a href="${pageContext.request.contextPath}/admin/getFilmList">
						    	<button type="button" class="btn btn-primary" id="searchNameBtn"><i class="fa fa-refresh"></i></button>
						    </a>
						    </form>
						    <a href="${pageContext.request.contextPath}/admin/addFilm">
								<button type="button" class="btn btn-primary btn-sm">Add Film</button>
							</a>
					    </div>
						
						<!-- 영화 목록 출력 -->
                        <div class="table-responsive">
	                        <table class="table table-striped table-hover">
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
						                    <td class="text-center">${f.FID}</td>
						                    <td class="text-center">
						                    	<a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${f.FID}">${f.title}</a>
						                    </td>
						                    <td class="text-center">${f.description.substring(0,10)}...</td>
						                    <td class="text-center">${f.category}</td>
						                    <td class="text-center">${f.price}</td>
						                    <td class="text-center">${f.length}</td>
						                    <td class="text-center">${f.rating}</td>
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
		            <a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&searchWord=${searchWord}&category=${category}&price=${price}&rating=${rating}&searchKind=${searchKind}">
		            	<button type="button" class="btn btn-primary"><i class="fa fa-angle-left"></i></button>
		            </a>
		        </c:if>&nbsp;
		        
		        <c:forEach var="i" begin="1" end="10">
					<c:if test="${(pageSet*10)+i < lastPage+1}">
			            <a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${(pageSet*10)+i}">
							<button type="button" class="btn btn-primary">${(pageSet*10)+i}</button>
						</a>&nbsp;
					</c:if>
				</c:forEach>

		        <c:if test="${currentPage < lastPage}">
		            <a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&searchWord=${searchWord}&category=${category}&price=${price}&rating=${rating}&searchKind=${searchKind}">
		            	<button type="button" class="btn btn-primary"><i class="fa fa-angle-right"></i></button>
		            </a>
		        </c:if>
		        
		        <!-- 영화 제목,배우 검색 -->
				<form class="ml-auto search-form d-none d-md-block" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
					<input type="hidden" name="category" value="${category}">
			        <input type="hidden" name="rating" value="${rating}">
			        <input type="hidden" name="price" value="${price}">
				    
				    <div>
				    	<select class="form-control" name="searchKind" style="width:150px;">
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
			          	
						<label>
				  			<input type="text" id="form1" class="form-control" name="searchWord" placeholder="Search"/>
				  		</label>
				    	<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
				  </div>
				  
				</form>
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