<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Customer One</title>
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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  $(document).ready(function() {
	  console.log('ready');
	  $('#btn').click(function() {
		  console.log('btn.click!');
		  if ($('#username').val() == '') {
		  	   alert('username을 입력하세요');
			   $('#username').focus();
		  } else if ($('#commentContent').val() == ''){
			   alert('commentContent를 입력하세요');
			   $('#commentContent').focus();
		  } else{
			  $('#addCommentForm').submit();
		  }			
	  });
  });
  </script>
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
	        <div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Board&nbsp;One</h4>
                </div>
              </div>
            </div>
            
            <div class="row">
        	<div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                      <div class="d-flex justify-content-between">
                        <h4 class="card-title">Board Details</h4>
                      </div>
                      <p class="card-description">Board Info </p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Board ID</label>
                            <label class="col-sm-3 col-form-label">${boardMap.boardId}</label>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Board Title</label>
                            <label class="col-sm-3 col-form-label">${boardMap.boardTitle}</label>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Board Content</label>
                            <label class="col-sm-3 col-form-label">${boardMap.boardContent}</label>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">User Name</label>
                            <label class="col-sm-3 col-form-label">${boardMap.username}</label>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Insert Date</label>
                            <label class="col-sm-3 col-form-label">${insertDate}</label>
                          </div>
                        </div>
                      </div>
                      
                      <p class="card-description">File</p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Board File</label>
                              <a href="${pageContext.request.contextPath}/admin/addBoardfile?boardId=${boardMap.boardId}"><button type="button" class="btn btn-primary">파일추가</button></a>
                            </div>
                          </div>
                        </div>
                        
                        <!-- 해당 공지사항의 첨부파일 출력 -->
                        <div class="col-md-6">
                          <div class="form-group row">
                            <c:forEach var="f" items="${boardfileList}" varStatus="i">
                            	<c:if test="${i.first}">
                            		<label class="col-sm-3 col-form-label">Files</label>
                            	</c:if>
                            	<c:if test="${!i.first}">
                            		<label class="col-sm-3 col-form-label"></label>
                            	</c:if>
								<div>
									<a href="${pageContext.request.contextPath}/resource/${f.boardfileName}">${f.boardfileName}</a>
									<a href="${pageContext.request.contextPath}/admin/removeBoardfile?boardfileId=${f.boardfileId}&boardfileName=${f.boardfileName}&boardId=${boardMap.boardId}"><button type="button" class="btn btn-primary">파일삭제</button></a>
								</div>
							</c:forEach>
                          </div>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              
              <!-- 댓글 입력 폼 -->
              <div class="row">
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-12 grid-margin">
                    <div class="card">
                      <div class="card-body">
                        <div class="d-flex justify-content-between">
                          <h4 class="card-title mb-0">Add Comment</h4>
                        </div>
                          <form id="addCommentForm" action="${pageContext.request.contextPath}/admin/addComment" method="post">
	   				      	<input name="boardId" type="hidden" value="${boardMap.boardId}">

	   				      	<label class="col-sm-2 col-form-label">Username</label>
	   				      	<label class="col-sm-4 col-form-label">
	   				      		<input class="form-control" id="username" type="text" name="username" placeholder="username" value="${loginStaff.firstName} ${loginStaff.lastName}" readonly="readonly">
	   				     	</label>
	   				     	
	   				     	
	   				     	<div class="col-sm-6">
	   						  <textarea class="form-control" id="commentContent" name="commentContent" rows="5" cols="80" placeholder="commentContent"></textarea>
	   						</div>
	   						<div class="col-sm-3">
	   							<button class="btn btn-primary" id="btn" type="submit">댓글 남기기</button>
	   						</div>
	   					  </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
              
              <!-- 댓글 리스트 출력 -->
              <div class="row">
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-12 grid-margin">
                    <div class="card">
                      <div class="card-body">
                        <div class="d-flex justify-content-between">
                          <h4 class="card-title mb-0">Comment List</h4>
                        </div>
                        <div class="table-responsive">
                          <table class="table table-striped table-hover">
                            <thead>
                              <tr>
                                <th>Comment Content</th>
                                <th>Username</th>
                                <th>Insert Date</th>
                                <th>Delete</th>
                              </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="c" items="${commentList}">
					                <tr>
					                	<td>${c.commentContent}</td>
					                	<td>${c.username}</td>
					                    <td>${c.insertDate.substring(0,10)}</td>
					                    <td><a href="${pageContext.request.contextPath}/admin/removeComment?commentId=${c.commentId}&boardId=${boardMap.boardId}">삭제</a></td>
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
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    
    <!-- container-scroller -->
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