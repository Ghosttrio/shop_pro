<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChangShop</title>
	<link rel="stylesheet" href="/css/product/info.css" type="text/css" >
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="/js/product/info.js" defer></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" defer></script>
</head>

<body>
 	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section style="height:auto;">
        <article>
        	<c:forEach var="productList" items="${productList }">
        		<form class="product_form">
		        	<div class="product_box">
		        		<!-- 왼쪽 -->
		        		<div class="product_image"><img src="${productList.product_image }"></div>
		        		<!-- 오른쪽  -->
		        		<div class="product_info">
		          			<div class="product_name">${productList.product_name }</div>
			        		<div class="product_price">판매가 : ${productList.product_price }원</div>
	          				<div class="product_rate">평점 : 00</div>
		        			
		          			
		          			
		          			<select class="product_option" onchange="product_option()">
						      <option selected>선택안함</option>
						      <option value="XL" >XL</option>
						      <option value="L">L</option>
						      <option value="M">M</option>
					        </select>
					        <div class="option_show">
					        	<input class="option_price" type="hidden" value="${productList.product_price }">
					        	수량선택 : <input class="option_amount" type="number" min="1" value="1">
					        	<input class="up" type="button" value="+">
					        	<input class="down" type="button" value="-">
					        </div>
					        <div>총 상품 금액 : <input class="price" type="text" value="0">원</div>
		          			
		          			
					        
					        <input class="product_pay" type="button" value="구매하기">
					        <input class="product_heart" type="button" value="♡">
					        <input class="product_cart" type="submit" value="장바구니에 담기">
		        		</div>
		        	</div>
	        	</form>
		        <div class="product_content">
			        <img src="/image/content/a1_content.jpg" width="100%">
			         더보기 구현
		         </div>
	        	
	        </c:forEach>
	        
	        
	        
	        
	        <div class="product_qna">상품문의 게시판</div>
	        	
        	<div>댓글 대댓글</div>
	        <h3>후기</h3>
	        <c:forEach var="reviewList" items="${reviewList }">
	        <div class="product_review">후기(사진업로드, 별점, 댓글, 대댓글, 페이징)</div>
		        <div>
		        	<div>${reviewList.review_num }</div>
		        	<div>${reviewList.review_content }</div>
		        </div>
	        </c:forEach>
	    
        
        </article>
        
    </section>
</body>
</html>