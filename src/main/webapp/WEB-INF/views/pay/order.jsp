<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   	<link rel="stylesheet" href="/css/order/order.css" type="text/css">
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/order/order.js" defer></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section>
    	<article>
    	
    	<h1>결제정보</h1>
    	
    	<div>
    		<h3>주문정보</h3>
    	</div>
    	
    	<div>
    		<h3>주문자</h3>
	    	<h3>주문자 전화번호</h3>
	    	<h3>수령인</h3>
	    	<h3>수령자 전화번호</h3>
    	</div>
    	
    	<div>
    		<h3>배송지</h3>	
   		    <input type="text" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소">
			<input type="text" id="sample4_extraAddress" placeholder="참고항목">
    	</div>
    	
    	
   		<input type="button" id="pay" value="카카오 페이 결제">
   		</article>
    </section>
</body>
</html>