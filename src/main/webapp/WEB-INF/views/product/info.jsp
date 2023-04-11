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
	<link rel="stylesheet" href="/css/product/info.css" type="text/css" >
	<script type="text/javascript" src="/js/product/info.js" defer ></script>
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
		        		<div class="product_image">
		        			<img src="${productList.product_image }">
		        		</div>
		        		<!-- 오른쪽  -->
		        		<div class="product_info">
		        			<h3>Product Info</h3>
		          			<div class="product_name">${productList.product_name }</div>
		          			
			        		<div class="product_price">판매가 : <fmt:formatNumber value="${productList.product_price }" pattern="#,###"/>원</div>
	          				<div class="product_rate">
	          					제품 평점 : ${avg_rate }점
	          				</div>
		        			
		          			
		          			
		          			<select class="product_option" onchange="product_option()">
						      <option selected>사이즈 선택</option>
						      <option value="XL" >XL</option>
						      <option value="L">L</option>
						      <option value="M">M</option>
					        </select>
					        <br>
					        <div class="option_show">
					        </div>
					        
					        <input class="option_price" type="hidden" value="${productList.product_price }">
				        	수량선택 : <input class="option_amount" type="number" min="1" value="1" name="product_num">
				        	<input id="up" class="btn-5" type="button" value="+">
				        	<input id="down" class="btn-5" type="button" value="-">
				        	
					        <div>총 상품 금액 : <input class="price" type="text" value="0" name="total_price">원</div>
		          			
		          			<input id="loginInfo" type="hidden" value="${loginInfo }">
		          			
					        <input type="hidden" value="${productList.product_code }" name="code">
					        <c:if test="${loginInfo==null }">
					        	<input id="pay_alert" class="btn-5" type="button" value="구매하기">
						        <input id="product_pay" class="btn-5" type="hidden" value="구매하기">
						        <input id="cart_alert" class="btn-5" type="button" value="장바구니에 담기">
						        <input id="product_cart" class="btn-5" type="hidden" value="장바구니에 담기">
					        </c:if>
					        <c:if test="${loginInfo!=null }">
					        	<input id="pay_alert" class="btn-5" type="hidden" value="구매하기">
						        <input id="product_pay" class="btn-5" type="button" value="구매하기">
					        	<input id="cart_alert" class="btn-5" type="hidden" value="장바구니에 담기">
					        	<input id="product_cart" class="btn-5" type="button" value="장바구니에 담기">
					        </c:if>
					        
					        
					        
					        
		        		</div>
		        	</div>
	        	</form>
	        	
	        	<div class="detailinfo showstep1">
	        		<h3>Info</h3>
				    <div class="content"><img src="${productList.product_explain }" width="100%"></div>
				</div>
				<div class="btn_open btn-5">더보기</div>
				<div class="btn_close btn-5 hide">감추기</div>
	        </c:forEach>
	        <br>
	        <br>
	        <h3>Review</h3>
	        <div>
	        	<input type="text" value="닉네임">
	        	<input type="text" value="후기를 입력하세요">
	        	<input type="number" placeholder="평점">
	        	<input type="button" value="후기작성">
	        </div>
	        <c:forEach var="reviewList" items="${reviewList }">
	        	<div style="border:1px solid red">
	        		댓글번호 : ${reviewList.review_num }
      				평점 : ${reviewList.review_rate }
      				닉네임 : ${reviewList.review_productNickname }
      				댓글내용 : ${reviewList.review_content }
	        	</div>
	        	<div>
	        		<input type="text" value="닉네임">
		        	<input type="text" value="댓글내용">
		        	<input type="button" value="댓글달기">
	        	</div>
	        </c:forEach>
	    	
	    	
	    	<!-- 페이징 -->
	    	
	    	<div id="paging" style="height:50px">
						<c:if test="${mapNum.total_review != null }">
							<c:choose>
								<c:when test="${mapNum.total_review > 100 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${mapNum.section > 1 && page == 1 }">
											<div class="no-uline">
												<form action="info" method="get">
													<input type="hidden" name="product_code" value="${mapNum.product_code }">
													<input type="hidden" name="section" value="${mapNum.section-1 }">
													<input type="hidden" name="pageNum" value="${(mapNum.section-1)*10 }">
													<input class="btn-1" type="submit" value="pre">
												</form>
											</div>
										</c:if>
										<div class="no-uline">
											<form action="info" method="get">
												<input type="hidden" name="product_code" value="${mapNum.product_code }">
												<input type="hidden" name="section" value="${mapNum.section}">
												<input type="hidden" name="pageNum" value="${page}">
												<input class="btn-1" type="submit" value="${(mapNum.section-1)*10 +page}">
											</form>
										</div>
										<c:if test="${page == 10 }">
											<form class="no-uline" action="info" method="get">
												<input type="hidden" name="product_code" value="${mapNum.product_code }">
												<input type="hidden" name="section" value="${mapNum.section+1 }">
												<input type="hidden" name="pageNum" value="${mapNum.section*10+1}">
												<input class="btn-1" type="submit" value="next">
											</form>
										</c:if>
									</c:forEach>
								</c:when>
								<c:when test="${mapNum.total_review == 100 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<a class="no-uline" href="#">${page}</a>
									</c:forEach>
								</c:when>
								<c:when test="${mapNum.total_review < 100 }">
									<c:forEach var="page" begin="1" end="${mapNum.total_review/10 + 1}" step="1">
										<c:choose>
											<c:when test="${page==pageNum }">
												<div class="sel-page">
													<form action="info" method="get">
														<input type="hidden" name="product_code" value="${mapNum.product_code }">
														<input type="hidden" name="section" value="${mapNum.section}">
														<input type="hidden" name="pageNum" value="${page }">
														<input class="btn-1" type="submit" value="${page }">
													</form>
												</div>
											</c:when>
											<c:otherwise>
												<div class="no-uline">
													<form action="info" method="get">
														<input type="hidden" name="product_code" value="${mapNum.product_code }">
														<input type="hidden" name="section" value="${mapNum.section}">
														<input type="hidden" name="pageNum" value="${page }">
														<input class="btn-1" type="submit" value="${page }">
													</form>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:if>
					</div>
	    	<!-- 페이징 끝 -->
	    	
	    	
	    	
	    	
	    	
        
        </article>
        
    </section>
</body>

	
</html>