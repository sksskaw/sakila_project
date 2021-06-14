<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Remove Inventory</title>
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
			if($("#customerId").val() == ""){
				alert("customerId 입력해 주세요");
				$("#customerId").focus();
			} else if($("#filmTitle").val() == ""){
				alert("filmTitle 선택해 주세요");
				$("#filmTitle").focus();
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
		
		// 영화 제목 선택 시 대여가능한 재고 출력 api
		$('#filmTitle').change(function(){
			console.log('Inventory 목록');
			$.ajax({
				type:'get',
				url:'/getCanRentalList',
				data:{filmId : $('#filmTitle').val()},
				success: function(jsonData) {
					$('#inventoryTableBody').empty();
						
					$(jsonData).each(function(index, item) {		
						var html = '';
						
						html += '<tr>';
						html += '<td>'+item.inventoryId+'</td>';
						html += '<td>'+item.storeId+'</td>';
						
						html += '<td>';
						html += '<div class="form-check">';
						html += '<input class="form-check-input" type="radio" name="inventoryId" id="flexRadioDefault2" value="'+item.inventoryId+'">';
						html += '<label class="form-check-label" for="flexRadioDefault2">&nbsp;</label>';
						html += '</div>';
						html += '</td>';
						
						html += '</tr>';
						
						$('#inventoryTableBody').append(html);
					});
				}
			});
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
                  <h4 class="page-title">Add Rental</h4>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Choose your customer number and movie to rent</h4>
                    <form class="form-sample" id="form" action="${pageContext.request.contextPath}/admin/removeInventory" method="post">
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

                        <div class="col-md-6">
						<table class="table">
	                      <thead>
	                        <tr>
	                          <th>Inventory ID</th>
	                          <th>Store ID</th>
	                          <th>Select</th>
	                        </tr>
	                      </thead>
	                      <tbody id="inventoryTableBody">
	                      </tbody>
	                    </table>
                       </div>
                       
	                   </div>
                      </div>
                      <br>
                      <div>
                      	<button type="button" class="btn btn-primary" id="formbutton">대여하기</button>
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