<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Actor</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/src/assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
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
	console.log('ready!');
	
	$('#formbutton').click(function(){
		console.log('btn.click!');
		
		if($('#firstName').val() == ''){
			alert('firstName을 입력하시오.');
			$('#firstName').focus();
			
		} else if($('#lastName').val() == ''){
			alert('lastName을 입력하시오.');
			$('#lastName').focus();
			
		} else{
			$('#addActionForm').submit();
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
                  <h4 class="page-title">Add Customer</h4>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Please fill in the information</h4>
                    <form class="form-sample" id="addActionForm" action="${pageContext.request.contextPath}/admin/addActor" method="post">
                      <p class="card-description"> Personal info </p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">First Name</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" name="firstName" id="firstName"/>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Last Name</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" name="lastName" id="lastName"/>
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <div>
                      	<button type="button" class="btn btn-primary" id="formbutton">Add</button>
                      	<a href="${pageContext.request.contextPath}/admin/getActorList"><button type="button" class="btn btn-primary">Cancel</button></a>
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