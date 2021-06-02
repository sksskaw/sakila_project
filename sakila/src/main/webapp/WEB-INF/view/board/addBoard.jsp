<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
    crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
 
<script>
    $(document).ready(function() {
        $('#addButton').click(function() {
            
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
        	} else if ($('#boardPw').val().length < 4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else if ($('#boardTitle').val() == '') {
                alert('boardTitle을 입력하세요');
                $('#boardTitle').focus();
            } else if ($('#boardContent').val() == '') {
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else if ($('#staffId').val() == '') {
                alert('staffId을 입력하세요');
                $('#staffId').focus();
            } else {
                $('#addForm').submit();
            }
        });
        
        // #inputFile에 input type="file" 마지막에 추가
        $('#addFileBtn').click(function(){
        	console.log('#addFileBtn click!');
        	$('#inputFile').append('<input type="file" name="boardfile" class="boardfile">');
        });
        
     	// #inputFile에 input type="file" 마지막 태그를 삭제
		$('#delFileBtn').click(function(){
			console.log('#delFileBtn click!');	
			$('#inputFile').children().last().remove();
        });	
    });
</script>
<title>ADD BOARD</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/navBar.jsp"></jsp:include>
	
    <div class="container">
        <h1>BOARD ADD</h1>
        <form id="addForm" 
        		action="${pageContext.request.contextPath}/admin/addBoard" 
        		method="post"
        		enctype="multipart/form-data">
            <div>
            	<div>
            		<button id="addFileBtn" type="button">파일추가</button>
            		<button id="delFileBtn" type="button">파일삭제</button>
            	</div>
            	<div id="inputFile">
            	</div>
            </div>
            
            <div class="form-group">
                <label for="boardPw">boardPw :</label> <input class="form-control"
                    name="board.boardPw" id="boardPw" type="password" />
            </div>
            <div class="form-group">
                <label for="boardPw">boardTitle :</label> <input
                    class="form-control" name="board.boardTitle" id="boardTitle" type="text" />
            </div>
            <div class="form-group">
                <label for="boardContent">boardContent :</label>
                <textarea class="form-control" name="board.boardContent" id="boardContent"
                    rows="5" cols="50"></textarea>
            </div>
            <div class="form-group">
                <label for="staffId">staffId :</label> <input
                    class="form-control" name="board.staffId" id="staffId" type="text" />
            </div>
            <div>
                <input class="btn btn-default" id="addButton" type="button"
                    value="글입력" /> <input class="btn btn-default" type="reset"
                    value="초기화" /> <a class="btn btn-default"
                    href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>
            </div>
        </form>
    </div>
</body>
</html>