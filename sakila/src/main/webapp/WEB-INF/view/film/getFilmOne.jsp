<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FilmOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
/* reset */
button {
  padding:0;
  background:none;
  border:0;
  cursor:pointer;
}

/* 버튼 영역 */
.btnBox {
  text-align:center;
}

.popOpenBtnCmmn {
  width:200px; 
  height:60px; 
  background:#000; 
  color:#fff; 
  font-size:16px;
  opacity:0.7;
  transition:all 0.3s;
}

.popOpenBtnCmmn:hover {
  opacity:1;
}

/* 팝업 영역 */
.popCmmn {
  display:none;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
}

.popBg {
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0,0,0,0.7);
}

.popInnerBox {
  display:flex;
  justify-content:space-between;
  flex-direction:column;
  position:absolute;
  top:40%;
  left:35%;
  width:1000px;
  height:400px;
  margin:-125px 0 0 -200px;
  text-align:center;
  background:#fff;
  border-radius:5px;
}

.popHead {
  padding:15px;
  background:#000;
  color:#fff;
  font-size:18px;
}

.popBody {
  padding:10px;
  box-sizing:border-box;
  font-size:14px;
}

.popCloseBtnCmmn {
  width:30%;
  margin:10px;
  padding:10px;
  font-size:16px;
  background:#999;
  color:#fff;
  transition:all 0.3s;
}

.popCloseBtnCmmn:hover {
  background:#666;
}
</style>

</head>
<body>
<div class="container">
    <h1>FilmOne</h1>
    <br>
     <table class="table table-striped">
         <tbody>
         	<tr>
         		<input type="hidden" id="filmId" value="${film.filmId}">
				<td class="col-sm-2" >film_id :</td>
                <td>${film.filmId}</td>
            </tr>
            <tr>
                   <td>Title :</td>
                   <td>${film.title}</td>
            </tr>
            <tr>
                   <td>description :</td>
                   <td>${film.description}</td>
            </tr>
            <tr>
                   <td>release_year :</td>
                   <td>${film.releaseYear.substring(0,4)}</td>
            </tr>
            <tr>
                   <td>language_id :</td>
                   <td>${film.languageId}</td>
            </tr>
            <tr>
                   <td>original_language_id :</td>
                   <td>${film.originalLanguageId}</td>
            </tr>
            <tr>
                   <td>rental_duration :</td>
                   <td>${film.rentalDuration}</td>
            </tr>
            <tr>
                   <td>rental_rate :</td>
                   <td>${film.rentalRate}</td>
            </tr>
            <tr>
                   <td>Runing Time :</td>
                   <td>${film.length}</td>
            </tr>
            <tr>
                   <td>replacement_cost :</td>
                   <td>${film.replacementCost}</td>
            </tr>
            <tr>
                   <td>rating :</td>
                   <td>${film.rating}</td>
            </tr>
            <tr>
                   <td>special_features :</td>
                   <td>${film.specialFeatures}</td>
            </tr>
            
            <tr>
                   <td>출연 배우 :</td>
                   <td>${actors} <a href="${pageContext.request.contextPath}/admin/modifyFilmActorsInfo?filmId=${film.filmId}"><button>수정</button></a>
            </tr>
            
            <tr>
                   <td>last_update :</td>
                   <td>${film.lastUpdate.substring(0,10)}</td>
            </tr>

			<tr>
                   <td>store 1 재고량 :</td>
                   <td>${store1Stock.filmCount}개</td>
            </tr>
            <tr>
                   <td>store 2 재고량 :</td>
                   <td>${store2Stock.filmCount}개</td>
            </tr>
        </tbody>
    </table>


	<div class="contentsWrap">
	  <div class="btnBox">
	    <button class="popOpenBtnCmmn" type="button" data-num="1">배우 수정</button>
	  </div>
	</div>
	
	<div id="popUp" class="popCmmn">
	  <div class="popBg" data-num="1"></div>
	  <div class="popInnerBox">
	    <div class="popHead">배우 수정</div>
	    <div class="popBody">
	    	<form action="" method="get">
	    	
	    		<table class="table table-striped" id="table">
					<tr id="cell"></tr>
					<tr id="cell2"></tr>
					<tr id="cell3"></tr>
					<tr id="cell4"></tr>
	    		</table>
	    		
	    		<p>
	    			<input type="submit" class="btn btn-default" value="수정">&nbsp;
	    		    <input type="reset" class="btn btn-default" value="초기화">
	    		</p>
	    	</form>
	    </div>
	    <div class="popFoot">
	      <button class="popCloseBtnCmmn" type="button" data-num="1">확인</button>
	    </div>
	  </div>
	</div>

    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>
 	
</div>

<script>
$(function(){
	  setPop();
	});

	// 팝업 세팅
	function setPop() {
	  var popOpenBtn = $('.popOpenBtnCmmn');
	  
	  //팝업 열기
	  popOpenBtn.on('click',function(){
	    var clickNum = $(this).attr('data-num');

	    console.log('actorCheckList');
		$.ajax({
			type:'get',
			url:'/getActorsCheckList?filmId='+$('#filmId').val(),
			success: function(jsonData) {
				 console.log(jsonData);
				$('#cell').empty();
				$('#cell2').empty();
				$('#cell3').empty();
				$('#cell4').empty();

				$(jsonData).each(function(index, item) {
					
					if(index < 5){
						if(item.ck == "O"){
							$('#cell').append(
								'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'" checked="checked">'+item.name+'</label></td>'	
							);
						}
						if(item.ck == "X"){
							$('#cell').append(
									'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'">'+item.name+'</label></td>'
							); 
						}
					}
					
					if(index < 10 && index >= 5){
						if(item.ck == "O"){
							$('#cell2').append(
								'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'" checked="checked">'+item.name+'</label></td>'	
							);
						}
						if(item.ck == "X"){
							$('#cell2').append(
									'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'">'+item.name+'</label></td>'
							); 
						}
					}
					
					if(index < 15 && index >= 10){
						if(item.ck == "O"){
							$('#cell3').append(
								'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'" checked="checked">'+item.name+'</label></td>'	
							);
						}
						if(item.ck == "X"){
							$('#cell3').append(
									'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'">'+item.name+'</label></td>'
							); 
						}
					}
					
					if(index < 20 && index >= 15){
						if(item.ck == "O"){
							$('#cell4').append(
								'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'" checked="checked">'+item.name+'</label></td>'	
							);
						}
						if(item.ck == "X"){
							$('#cell4').append(
									'<td><label><input type="checkbox" name="actorsCheck" value="'+item.ck+'">'+item.name+'</label></td>'
							); 
						}
					}

					
				});
			}
		});
	    
	    $('#popUp').fadeIn(200);

	  })
	  
	  //팝업 닫기
	  $('.popBg, .popCloseBtnCmmn').on('click',function(){
	    var clickNum = $(this).attr('data-num');
	    
	    $('#popUp').fadeOut(200);
	  })
	}
</script>

</body>
</html>