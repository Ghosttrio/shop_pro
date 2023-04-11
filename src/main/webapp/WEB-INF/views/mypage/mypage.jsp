<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/mypage/mypage.css" type="text/css">
    <script type="text/javascript" src="/js/mypage/mypage.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section>
		<article class="top">
			<div class="left">
				<div>
					${loginInfo }님의 마이페이지
				</div>
			</div>
			<div class="right">
				<div>
					<form action="order_list">
						<!-- 아이디에 맞는 정보 셀렉트 -->
						<input type="hidden" name="id" value="${loginInfo }">
						<input type="submit" value="주문내역조회">
					</form>
				</div>
				<div>
					<form action="review_list">
						<!-- 아이디에 맞는 정보 셀렉트 -->
						<input type="hidden" name="id" value="${loginInfo }">
						<input type="submit" value="작성한구매후기">
					</form>
				</div>
				<div>
					<form action="cart_list">
						<!-- 아이디에 맞는 정보 셀렉트 -->
						<input type="hidden" name="id" value="${loginInfo }">
						<input type="submit" value="장바구니상품">
					</form>
				</div>
				<div>
					<form action="account_update">
						<input type="hidden" name="id" value="${loginInfo }">
						<input type="submit" value="회원정보변경">
					</form>
				</div>
			</div>
		</article>
		
		<article class="bottom">
			<c:choose>
				<c:when test="${(userInfo == null) and (orderInfo == null) and (reviewInfo == null) and (cartInfo == null)}">
					<div class="none_content">${loginInfo }님의 마이페이지입니다.</div>
				</c:when>
				<c:when test="${userInfo != null}">
					<h3>회원정보수정</h3>
					<c:forEach var="userInfo" items="${userInfo }">
						<form action="account_update.do" method="post">
							<input type="text" name="id" value="${userInfo.id }" readonly>
							<input type="text" name="pw" value="${userInfo.pw }">
							<input type="text" name="name" value="${userInfo.name }">
							<input type="text" name="nickname" value="${userInfo.nickname }">
							<input type="text" name="email" value="${userInfo.email }">
							<input type="submit" value="제출">
						</form>
					</c:forEach>
				</c:when>
				
				
				<c:when test="${orderInfo != null}">
					<h3>주문내역</h3>
					<c:forEach var="orderInfo" items="${orderInfo }">
						<c:forEach var="productList" items="${productList }">
							<c:if test="${productList.product_code == orderInfo.order_product_id }">
								<img src="${productList.product_image }" width="100px">
								제품명 : ${productList.product_name }
								주문코드 : ${orderInfo.order_id }
								사이즈 : ${orderInfo.order_size }
								수량 : ${orderInfo.order_num }
								총 금액 : ${orderInfo.order_price }
								배송지 : ${orderInfo.order_addr }
							</c:if>
						</c:forEach>
						
					</c:forEach>
				</c:when>
				
				
				<c:when test="${reviewInfo != null}">
					<h3>작성한구매후기</h3>
					<c:forEach var="reviewInfo" items="${reviewInfo }">
						<c:forEach var="productList" items="${productList }">
							<c:if test="${productList.product_code == reviewInfo.review_productId }">
								<img src="${productList.product_image }" width="100px">
								제품명 : ${productList.product_name }
								작성내용 : ${reviewInfo.review_content }
								작성평점 : ${reviewInfo.review_rate }	
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:when>
				
				
				<c:when test="${cartInfo != null}">
					<h3>장바구니</h3>
					<c:forEach var="cartInfo" items="${cartInfo }">
						<c:forEach var="productList" items="${productList }">
							<c:if test="${productList.product_code == cartInfo.cart_productId }">
								<img src="${productList.product_image }" width="100px">
								제품명 : ${productList.product_name }
								장바구니코드 : ${cartInfo.cart_id }
								<form action="info">
									<input type="hidden" name="product_code" value="${productList.product_code}">
									<input type="submit" value="주문하러가기">
								</form>
							</c:if>
					
						</c:forEach>
					</c:forEach>
				</c:when>
				
				
			</c:choose>
		</article>
	</section>



</body>
</html>