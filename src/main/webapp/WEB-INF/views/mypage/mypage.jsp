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
					<div class="bottom_head">회원정보수정</div>
					<c:forEach var="userInfo" items="${userInfo }">
						<form action="account_update.do" method="post">
							아이디 : <input type="text" name="id" value="${userInfo.id }" readonly><br><br>
							비밀번호 : <input type="password" name="pw" value="${userInfo.pw }"><br><br>
							이름 : <input type="text" name="name" value="${userInfo.name }"><br><br>
							닉네임 : <input type="text" name="nickname" value="${userInfo.nickname }"><br><br>
							이메일: <input type="text" name="email" value="${userInfo.email }"><br><br>
							<input type="submit" value="회원정보변경">
						</form>
					</c:forEach>
				</c:when>
				
				
				<c:when test="${orderInfo != null}">
					<div class="bottom_head">주문내역</div>
					
					<table class="order_table">
						<tr>
							<th>제품정보</th>
							<th>주문코드</th>
							<th>사이즈</th>
							<th>수량</th>
							<th>주문 금액</th>
							<th>배송지</th>
						</tr>	
						<c:forEach var="orderInfo" items="${orderInfo }">
							<c:forEach var="productList" items="${productList }">
								<c:if test="${productList.product_code == orderInfo.order_product_id }">
									<tr>
										<td>
											<img src="${productList.product_image }" width="100px"><br>
											<a href="/info?product_code=${productList.product_code}">${productList.product_name }</a>
										</td>
										<td>
											${orderInfo.order_id }
										</td>
										
										<td>
											${orderInfo.order_size }
										</td>
										<td>
											${orderInfo.order_num }
										</td>
										<td>
											<fmt:formatNumber value="${orderInfo.order_price }" pattern="#,###"/>원
										</td>
										<td>
											${orderInfo.order_addr } ${orderInfo.detail_addr }
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>								
					</table>
				</c:when>
				
				<c:when test="${reviewInfo != null}">
					<div class="bottom_head">작성한구매후기</div>
					<table class="order_table">
						<tr>
							<th>제품명</th>
							<th>작성내용</th>
							<th>평점</th>
						</tr>	
						<c:forEach var="reviewInfo" items="${reviewInfo }">
							<c:forEach var="productList" items="${productList }">
								<c:if test="${productList.product_code == reviewInfo.review_productId }">
								<tr>
									<td>
										<img src="${productList.product_image }" width="100px"><br>
										<a href="/info?product_code=${productList.product_code}">${productList.product_name }</a>
									</td>
									<td>
										${reviewInfo.review_content }
									</td>
									<td>
										${reviewInfo.review_rate }	
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
					</table>
				</c:when>
				
				
				<c:when test="${cartInfo != null}">
					<div class="bottom_head">장바구니</div>
					<table class="order_table">
						<tr>
							<th>제품명</th>
							<th>장바구니코드</th>
						</tr>	
						<c:forEach var="cartInfo" items="${cartInfo }">
							<c:forEach var="productList" items="${productList }">
								<c:if test="${productList.product_code == cartInfo.cart_productId }">
									<tr>
										<td>
											<img src="${productList.product_image }" width="100px"><br>
											<a href="/info?product_code=${productList.product_code}">${productList.product_name }</a>
										</td>
										<td>
											${cartInfo.cart_id }
										</td>
									</tr>
								</c:if>
						</c:forEach>
					</c:forEach>
					</table>
				</c:when>
				
				
			</c:choose>
		</article>
	</section>



</body>
</html>