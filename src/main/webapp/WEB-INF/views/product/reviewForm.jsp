<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChangShop</title>
	<link rel="stylesheet" href="/css/product/reviewForm.css" type="text/css" >
</head>

<body>
 	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section>
        <article>
        	<form action="review.do">
	        	<div class="writer">작성자: ${loginInfo }</div>
	        	평점입력 : <input class="writer_rate" type="number" name="writer_rate" max="5" min="1" placeholder="평점(1~5)">
	        	<textarea name="textarea"></textarea>
	        	<input type="hidden" name="command" value="parent_review">
	        	<input type="hidden" name="loginInfo" value="${loginInfo}">
	        	<input type="hidden" name="code" value="${code}">
	        	<input id="review_btn" class="btn-5" type="submit" value="후기작성하기">
        	</form>
		</article>
	</section>
</body>

	
</html>