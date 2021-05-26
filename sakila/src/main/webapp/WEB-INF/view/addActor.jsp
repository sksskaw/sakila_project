<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addActor</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready!');
	
	$('#btn').click(function(){
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
	<h1>addActor</h1>
	<form id="addActionForm"
		action="${pageContext.request.contextPath}/admin/addActor"
		method="post">
		<input id="firstName" name="firstName" type="text"placeholder="firstName"> 
		<input id="lastName" name="lastName"type="text" placeholder="lastName">

		<div>
			<button type="button" id="btn">등록</button>
		</div>
	</form>
</body>
</html> 