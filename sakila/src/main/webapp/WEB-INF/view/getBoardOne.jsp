<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>
    <!-- 댓글 목록 -->
    <br>
    <br>
    <div>
	   	전체 댓글수 : ${commentList.size()}
	   	<div>
	   		<div><!-- 댓글 남기기 -->
	   			<form id="addCommentForm" action="${pageContext.request.contextPath}/admin/addComment" method="post">
	   				<input name="boardId" type="hidden" value="${boardMap.boardId}">
	   				<input id="username" type="text" name="username" placeholder="username">
	   				<div>
	   					<textarea id="commentContent" name="commentContent" rows="5" cols="80" placeholder="commentContent"></textarea>
	   				</div>
	   				<button id="btn" type="submit">댓글 남기기</button>
	   			</form>
	   		</div>
	   		<br>
	   		<table class="table">
	   			<c:forEach items="${commentList}" var="c">
		   			<tr>
		   				<td class="col-sm-9">${c.commentContent}</td>
		   				<td class="col-sm-1">${c.username}</td>
		   				<td>${c.insertDate.substring(0,10)}</td>
		   				<td><a href="${pageContext.request.contextPath}/admin/removeComment?commentId=${c.commentId}&boardId=${boardMap.boardId}">삭제</a></td>
		   			</tr>
	   			</c:forEach>
	   		</table>
	   	</div>
   	</div>
   	
</div>
</body>
</html>