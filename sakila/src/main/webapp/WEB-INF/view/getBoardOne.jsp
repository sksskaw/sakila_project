<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD VIEW(spring mvc ���)</title>
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	console.log('ready');
	$('#btn').click(function() {
		console.log('btn.click!');
		if ($('#username').val() == '') {
			 alert('username�� �Է��ϼ���');
			 $('#username').focus();
		} else if ($('#commentContent').val() == ''){
			 alert('commentContent�� �Է��ϼ���');
			 $('#commentContent').focus();
		} else{
			$('#addCommentForm').submit();
		}		
		
	});
});
</script>
</head>
<body>
<div class="container">
    <h1>BoardOnd</h1>
    <br>
     <table class="table">
         <tbody>
             <tr>
                <td class="col-sm-2">board_id :</td>
                <td>${boardMap.boardId}</td>
           </tr>
            <tr>
                   <td>board_title :</td>
                   <td>${boardMap.boardTitle}</td>
            </tr>
            <tr>
                   <td>board_content :</td>
                   <td>${boardMap.boardContent}</td>
            </tr>
            <tr>
                   <td>username :</td>
                   <td>${boardMap.username}</td>
            </tr>
            <tr>
                   <td>insert_date :</td>
                   <td>${insertDate}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/modifyBoard?boardId=${boardMap.boardId}">����</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/removeBoard?boardId=${boardMap.boardId}">����</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/getBoardList">�۸��</a>
    <!-- ��� ��� -->
    <br>
    <br>
    <div>
	   	��ü ��ۼ� : ${commentList.size()}
	   	<div>
	   		<div><!-- ��� ����� -->
	   			<form id="addCommentForm" action="${pageContext.request.contextPath}/addComment" method="post">
	   				<input name="boardId" type="hidden" value="${boardMap.boardId}">
	   				<input id="username" type="text" name="username" placeholder="username">
	   				<div>
	   					<textarea id="commentContent" name="commentContent" rows="5" cols="80" placeholder="commentContent"></textarea>
	   				</div>
	   				<button id="btn" type="button">��� �����</button>
	   			</form>
	   		</div>
	   		<br>
	   		<table class="table">
	   			<c:forEach items="${commentList}" var="c">
		   			<tr>
		   				<td class="col-sm-9">${c.commentContent}</td>
		   				<td class="col-sm-1">${c.username}</td>
		   				<td>${c.insertDate.substring(0,10)}</td>
		   				<td><a href="${pageContext.request.contextPath}/removeComment?commentId=${c.commentId}&boardId=${boardMap.boardId}">����</a></td>
		   			</tr>
	   			</c:forEach>
	   		</table>
	   	</div>
   	</div>
   	
</div>
</body>
</html>