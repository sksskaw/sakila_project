<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Film</title>
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
		
		$("#formbutton").click(function(){
			
			var cnt = $("input[name=specialFeatures]:checkbox:checked").length;
			
			if($("#title").val() == ""){
				alert("title 입력바람");
				$("#title").focus();
				
			} else if($("#categoryId").val() == ""){
				alert("categoryId 입력바람");
				$("#categoryId").focus();
				
			}else if($("#description").val() == ""){
				alert("description 입력바람");
				$("#description").focus();
				
			}else if($("#releaseYear").val() == ""){
				alert("releaseYear 입력바람");
				$("#releaseYear").focus();
				
			}else if($("#language").val() == ""){
				alert("language 입력바람");
				$("#language").focus();
				
			}else if($("#originalLanguage").val() == ""){
				alert("originalLanguage 입력바람");
				$("#originalLanguage").focus();
				
			}else if($("#rentalDuration").val() == ""){
				alert("rentalDuration 입력바람");
				$("#rentalDuration").focus();
				
			}else if($("#length").val() == ""){
				alert("length 입력바람");
				$("#length").focus();
				
			}else if($("#replacementCost").val() == ""){
				alert("replacementCost 입력바람");
				$("#replacementCost").focus();	
			
			}else if($("#rating").val() == ""){
				alert("rating 입력바람");
				$("#rating").focus();	
			
			}else if(cnt < 1){
				alert("specialFeatures를 하나 이상 체크 해주세요~");

			}else{
				$("#form").submit();
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
                  <h4 class="page-title">Add Film</h4>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Please fill in the information</h4>
                    <form class="form-sample" id="form" action="${pageContext.request.contextPath}/admin/addFilm" method="post">
                      <p class="card-description"> Film info </p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Title</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" name="title" id="title"/>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Category</label>
                            <div class="col-sm-9">
                              <select name="categoryId" id ="categoryId" class="form-control">
			                     <c:forEach var="c" items="${categoryList}">
			                        <option value="${c.categoryId}">${c.name}</option>
			                     </c:forEach>
			                  </select>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">description</label>
                            <div class="col-sm-9">
                              <textarea class="form-control" rows="5" cols="100" name="description" id="description" class="form-control"></textarea>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                      </div><br>
                      
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Release Year</label>
                            <div class="col-sm-9">
                              <input type="text" name="releaseYear" id="releaseYear" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Language</label>
                            <div class="col-sm-9">
		                      <select name="languageId" id ="language" class="form-control">
				                 <c:forEach var="l" items="${languageList}">
				                    <option value="${l.languageId}">${l.name}</option>
				                 </c:forEach>
				              </select>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Original Language</label>
                            <div class="col-sm-9">
                              <select name="originalLanguageId" id ="originalLanguage" class="form-control">
			                    <option>======</option>
			                    <c:forEach var="l" items="${languageList}">
			                      <option value="${l.languageId}">${l.name}</option>
			                    </c:forEach>
			                  </select>
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Rental Duration</label>
                            <div class="col-sm-9">
                              <input type="text" name="rentalDuration" id="rentalDuration" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Rental Rate</label>
                            <div class="col-sm-9">
                              <input type="text" name="rentalRate" id="rentalRate" class="form-control">
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Length</label>
                            <div class="col-sm-9">
                              <input type="text" name="length" id="length" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Replacement Cost</label>
                            <div class="col-sm-9">
                              <input type="text" name="replacementCost" id="replacementCost" class="form-control">
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Rating</label>
                            <div class="col-sm-9">
                              <select name="rating" id ="rating" class="form-control">
			                     <option value="G">G</option>
			                     <option value="PG">PG</option>
			                     <option value="PG-13">PG-13</option>
			                     <option value="R">R</option>
			                     <option value="NC-17">NC-17</option>
			                  </select>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Special Features</label>
                            <div class="col-sm-9">
                              <input type="checkbox" name="specialFeatures" value="Trailers">&nbsp;Trailers&nbsp;
			                  <input type="checkbox" name="specialFeatures" value="Commentaries">&nbsp;Commentaries&nbsp;
			                  <input type="checkbox" name="specialFeatures" value="Deleted Scenes">&nbsp;Deleted Scenes&nbsp;
			                  <input type="checkbox" name="specialFeatures" value="Behind the Scenes">&nbsp;Behind the Scenes
                            </div>
                          </div>
                        </div>
                      </div>
                      <div>
                      	<button type="button" class="btn btn-primary" id="formbutton">Add</button>
                      	<a href="${pageContext.request.contextPath}/admin/getFilmList"><button type="button" class="btn btn-primary">Cancel</button></a>
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