<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Inventory</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/icheck/skins/all.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/template/src/assets/images/favicon.ico" />
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
	$(document).ready(function(){
		
		$("#formbutton").click(function(){
			if($("#storeId").val() == ""){
				alert("store를 입력해 주세요");
			} else if($("#filmTitle").val() == ""){
				alert("filmTitle 선택해 주세요");
			} else{
				$("#form").submit();
			}
		});
		
		console.log('Film 목록');
		$.ajax({
			type:'get',
			url:'/getFilmTitleList',
			success: function(jsonData) {
				$('#filmTitle').empty();
					$('#filmTitle').append(
						'<option value="">Film List</option>'
					);
				$(jsonData).each(function(index, item) {
					$('#filmTitle').append(
						'<option value="'+item.film_id+'">'+item.title+'</option>'
					);
				});
			}
		});
		
	});
	</script>
  
  </head>
  <body>
    <div class="container-scroller">

      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
          	<div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Add Inventory</h4>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Select stores and movies in stock to add</h4>
                    <form class="form-sample" id="form" action="${pageContext.request.contextPath}/admin/addInventory" method="post">
                      <p class="card-description">Store Info</p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Store</label>
                            <div class="col-sm-9">
                              <select class="form-control" name="storeId" id="storeId">
                                <option value="">Select Store</option>
                                <option value="1">Store 1</option>
  							    <option value="2">Store 2</option>
                              </select>
                            </div>
                          </div>
	                   </div>
                      </div>
					  
					  <br>
                      <p class="card-description">Film Info</p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Film Title</label>
                            <div class="col-sm-9">
                              <select class="form-control" name="filmId" id="filmTitle">
                              </select>
                            </div>
                          </div>
	                   </div>
                      </div>
                      <br>
                      <div>
                      	<button type="button" class="btn btn-primary" id="formbutton">Add</button>
                      	<a href="${pageContext.request.contextPath}/admin/getInventoryList">
                      		<button type="button" class="btn btn-primary" id="formbutton">Cancel</button>
                      	</a>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
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
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}/template/src/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/template/src/assets/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/template/src/assets/js/shared/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/template/src/assets/js/shared/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="${pageContext.request.contextPath}/template/src/assets/js/shared/jquery.cookie.js" type="text/javascript"></script>
    <!-- End custom js for this page-->
  </body>
</html>