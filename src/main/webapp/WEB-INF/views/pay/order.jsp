<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   	<link rel="stylesheet" href="/css/order/order.css" type="text/css">
    <script type="text/javascript" src="/js/order/order.js" defer></script>
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section>
    	<article>
    	
    	<h1>결제정보</h1>
    	
    	<div>
    		<h3>주문정보</h3>
    		<c:forEach var="productList" items="${productList }">
    			<div class="order_wrap">
	    			<img src="${productList.product_image }" width="20%">
	    			<div>
	    				<div>상품명 : ${productList.product_name }</div>
	    				<div>사이즈 : ${size }</div>
		    			<div>수량 : ${product_num }</div>
		    			<div>총 금액 : <fmt:formatNumber value="${total_price }" pattern="#,###"/>원</div>
	    			</div>
		    		<input id="product_code" type="hidden" value="${productList.product_code }">
		    		<input id="total_price" type="hidden" value="${total_price }">
		    		<input id="product_num" type="hidden" value="${product_num }">
		    		<input id="size" type="hidden" value="${size }">
	    		</div>
	    	</c:forEach>
    	</div>
    	
    	<div>
    		<h3>주문자 정보</h3>
    		<c:forEach var="userInfo" items="${userInfo }">
    			<div class="user_wrap">
    				<div>주문자 아이디 : ${userInfo.id }</div>
	    			<div>주문자 성함 : ${userInfo.name }</div>
	    			<input id="order_name" type="hidden" value="${userInfo.name }">
	    			<div>주문자 연락처 : ${userInfo.phone }</div>
    			</div>
    			
	    		<input id="id" type="hidden" value="${userInfo.id }">
	    		<input id="nickname" type="hidden" value="${userInfo.nickname }">
	    	</c:forEach>
    	</div>
    	
    	<div>
    		<h3>배송지 입력</h3>
			<input id="post_btn" type="button" class="btn-5" value="우편번호 찾기"><br>
   		    <input type="text" id="postcode" placeholder="우편번호">
			<input type="text" id="road_addr" placeholder="도로명주소">
			<input type="text" id="jibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="detail_addr" placeholder="상세주소">
    	</div>
    	
   		<input type="button" id="pay" class="btn-5" value="결제하기">
   		</article>
    </section>
</body>
</html>