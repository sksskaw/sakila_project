<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	console.log('Film 목록');
	$.ajax({
		type:'get',
		url:'/getFilmTitleList',
		success: function(jsonData) {
			$(jsonData).each(function(index, item) {
				$('#filmTitle').append(
					'<option value="'+item.film_id+'">'+item.title+'</option>'
				);
			});
		}
	});
});
</script>
<body>

<div>
  <select class="form-control" name="storeId" id="storeId">
  	<option value="1">store 1</option>
  	<option value="2">store 2</option>
  </select>
</div>
<div>
  <select class="form-control" name="filmId" id="filmTitle">
  	
  </select>
</div>
</body>
</html>