<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addBoardfile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			console.log('btn click....');
			
			// 파일들중 하나라도 첨부되지 않으면 ck = true;
        	let ck = false;
            let boardfile = $('.boardfile'); // 배열
            // break키워드 사용을 위해 for반복문 사용 <-- boardfile.each()메서드 사용 X
			for(let item of boardfile) {
				if($(item).val() == '') {
					ck = true;
					console.log('첨부되지 않은 파일이 있습니다.');
					break;
				}
			}
            
        	if(ck) { // if(ck == true)
        		alert('첨부되지 않은 파일이 있습니다.');
        	} else{
        		$('#addForm').submit();
        	}
		});
	});
</script>
</head>
<body>
	<h1>파일추가</h1>
	<form 	id="addForm"
			method="post"
			enctype="multipart/form-data" 
			action="${pageContext.request.contextPath}/admin/addBoardfile">
		<div>
			boardId :
			<input type="text" id="boardId" name="boardId" value="${boardId}" readonly="readonly">
		</div>
		<div>
			<input type="file" id="multipartFile" name="multipartFile" class="boardfile">
		</div>
		<div>
			<button type="button" id="btn">파일추가</button>
			<a href="${pageContext.request.contextPath}/admin/getBoardOne?boardId=${boardId}"><button type="button">취소</button></a>
		</div>
	</form>
</body>
</html>