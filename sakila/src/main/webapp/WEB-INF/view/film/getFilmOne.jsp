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
</head>
<body>
<div class="container">
    <h1>FilmOne</h1>
    <br>
     <table class="table table-striped">
         <tbody>
         	<tr>
				<td class="col-sm-2">film_id :</td>
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
                   <td>${actors}</td>
            </tr>
            
            <tr>
                   <td>last_update :</td>
                   <td>${film.lastUpdate.substring(0,10)}</td>
            </tr>

			<tr>
                   <td>store 1 재고량 :</td>
                   <td>${store1.filmCount}개</td>
            </tr>
            <tr>
                   <td>store 2 재고량 :</td>
                   <td>${store2.filmCount}개</td>
            </tr>
        </tbody>
    </table>

	<form method="get" action="form-action.html">
		<p>이 영화에 누가 출연했을까요??</p>
		<table class="table table-striped">
			<tr>
	     <c:forEach var="a" items="${actorsCheckList}">
		 	<c:set var="i" value="${i + 1}" />
	     		<c:if test="${a.ck == 'O' }">
			    	<td>
			    		<label><input type="checkbox" name="actorsCheck" value="${a}" checked="checked"> ${a.name}</label>
			    	</td>
		    	</c:if>
		    	
		    	<c:if test="${a.ck == 'X' }">
		    		<td>
			    		<label><input type="checkbox" name="actorsCheck" value="${a}"> ${a.name}</label>
		    		</td>
		    	</c:if>
		    	
		    	<c:if test="${i%5 == 0 }">
		    		</tr><tr>
		    	</c:if>
	     </c:forEach>
	     <tr>
		</table>

	    <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
	</form>
    
    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>

   	
</div>
</body>
</html>