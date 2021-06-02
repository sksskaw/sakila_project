<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD VIEW(spring mvc 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		console.log('ready');
		$('#btn').click(function(){
			if($('#boardPw').val().length < 4){
				 alert('boardPw는 4자이상 이어야 합니다');
				 $('#boardPw').focus();
			} else {
				$('#modifyForm').submit();	
			}
		}) ;
	 });
 </script>
</head>
	<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>
		
		 <h1>modifyBoard</h1>
		 <form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyBoard" method="post">
			 <table class="table">
			      <tbody>
			         <tr>
			             <td>board_id :</td>
			             <td>
			             	<input type ="text" name="boardId" readonly="readonly" value="${map.boardId}">
			             </td>
			         </tr>
			         <tr>
			             <td>board_pw :</td>
			             <td><input type="password" name="boardPw" id="boardPw"></td>
			         </tr>
			         <tr>
			              <td>board_title :</td>
			              <td>
			          		<input id="boardTitle" name="boardTitle" type="text" value="${map.boardTitle}">
			              </td>
			          </tr>
			          <tr>
			               <td>board_content :</td>
			               <td>
			               	<textarea class="form-control" rows="10" cols="100" name="boardContent" id="boardContent">${map.boardContent}</textarea>
			               </td>
			          </tr>
			          <tr>
			               <td>username :</td>
			               <td>${map.username}</td>
			          </tr>
			          <tr>
			               <td>insert_date :</td>
			               <td>${map.insertDate}</td>
			          </tr>
			      </tbody>
			</table>
			<div class="row text-right">
				<button type="submit" id="btn" class="btn">수정</button>
			</div>
			
		</form>
	</div>
</body>
</html>