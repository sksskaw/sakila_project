<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>addFilm</title>
</head>
<body>
   <div class="container">

      <h1>add Film</h1>
      <form method="post" action="${pageContext.request.contextPath}/admin/addFilm">
         <table class="table table-hover">
            <tr>
               <td>title</td>
               <td>
                  <input type="text" name="title" id="title" class="form-control">
               </td>
            </tr>
            <tr>
               <td>category</td>
               <td>
                  <select name="categoryId" id ="categoryId" class="form-control">
                     <c:forEach var="c" items="${categoryList}">
                        <option value="${c.categoryId}">${c.name}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            <tr>
               <td>description</td>
               <td>
                  <textarea rows="5" cols="100" name="description" id="description" class="form-control"></textarea>
               </td>
            </tr>
            <tr>
               <td>releaseYear</td>
               <td>
                  <input type="text" name="releaseYear" id="releaseYear" class="form-control">
               </td>
            </tr>
            <tr>
               <td>language</td>
               <td>
                  <select name="languageId" id ="language" class="form-control">
                     <c:forEach var="l" items="${languageList}">
                        <option value="${l.languageId}">${l.name}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            <tr>
               <td>originalLanguage</td>
               <td>
                  <select name="originalLanguageId" id ="originalLanguage" class="form-control">
                     <option>======</option>
                     <c:forEach var="l" items="${languageList}">
                        <option value="${l.languageId}">${l.name}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            <tr>
               <td>rentalDuration</td>
               <td>
                  <input type="text" name="rentalDuration" id="rentalDuration" class="form-control">               
               </td>
            </tr>
            <tr>
               <td>rentalRate</td>
               <td>
                  <input type="text" name="rentalRate" id="rentalRate" class="form-control">
               </td>
            </tr>
            <tr>
               <td>length</td>
               <td>
                  <input type="text" name="length" id="length" class="form-control">
               </td>
            </tr>
            <tr>
               <td>replacementCost</td>
               <td>
                  <input type="text" name="replacementCost" id="replacementCost" class="form-control">
               </td>
            </tr>
            <tr>
               <td>rating</td>
               <td>
                  <select name="rating" id ="rating" class="form-control">
                     <option value="G">G</option>
                     <option value="PG">PG</option>
                     <option value="PG-13">PG-13</option>
                     <option value="R">R</option>
                     <option value="NC-17">NC-17</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td>specialFeatures</td>
               <td>
                  <input type="checkbox" name="specialFeatures" value="Trailers">Trailers&nbsp;
                  <input type="checkbox" name="specialFeatures" value="Commentaries">Commentaries&nbsp;
                  <input type="checkbox" name="specialFeatures" value="Deleted Scenes">Deleted Scenes&nbsp;
                  <input type="checkbox" name="specialFeatures" value="Behind the Scenes">Behind the Scenes
               </td>
            </tr>
         </table>
         
         <button id="btn" class="btn btn-secondary">등록</button>
      </form>
      
   </div>
</body>
</html>