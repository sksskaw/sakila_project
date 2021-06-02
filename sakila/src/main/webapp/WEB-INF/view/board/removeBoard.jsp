<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeBoard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#btn').click(function(){
		console.log('btn click!');//웹브라우저에서 확인가능
		//유효성 검사 코드 추가
		if($('#boardPw').val().length < 4){
			 alert('boardPw는 4자이상 이어야 합니다');
			 $('#boardPw').focus();
		} else {
			$('#removeForm').submit();	
		}
	});
});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>
		
		<br>
		<h3>removeBoard</h3>
		<br>
		<form id="removeForm" action="${pageContext.request.contextPath}/admin/removeBoard" method="post">
			<input type = "hidden" name="boardId" value="${boardId}">
			<div class="row">
				<label class="col-sm-1"> boardPw: </label>
				<input type="password" class="col-sm-3 form-control" id="boardPw" name="boardPw">
				&nbsp;&nbsp;<button type="button" id="btn" class="btn btn-light">삭제</button>
			</div>
		</form>
	</div>
</body>
</html>