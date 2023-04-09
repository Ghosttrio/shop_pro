<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="css/product/info.css" type="text/css">
    <script type="text/javascript" src="js/product/info.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section>
      	
        <article class="main_article">
        <c:forEach var="productList" items="${productList }">
        	${productList.product_name }
        	
        	<input class="like_btn" type="button" value="좋아요">
        	<div>댓글 대댓글</div>
        	<div>qna게시판</div>
        	
        </c:forEach>
        
        
        <c:forEach var="reviewList" items="${reviewList }">
        <div style="border:1px solid red">
        	<div>${reviewList.review_num }</div>
        	<div>${reviewList.review_content }</div>
        </div>
        	<a href="order">결제하기</a>
        		<!-- 페이징 -->
	<%-- 	<div id="paging" style="height:100px">
			<c:if test="${mapNum.total_product != null }">
				<c:choose>
					<c:when test="${mapNum.total_product > 100 }">
						<c:forEach var="page" begin="1" end="10" step="1">
							<c:if test="${mapNum.section > 1 && page == 1 }">
								<div class="no-uline">
									<form action="product" method="get">
										<input type="hidden" name="product_type" value="${mapNum.product_type }">
										<input type="hidden" name="section" value="${mapNum.section-1 }">
										<input type="hidden" name="pageNum" value="${(mapNum.section-1)*10 }">
										<input type="submit" value="pre">
									</form>
								</div>
							</c:if>
							<div class="no-uline">
								<form action="product" method="get">
									<input type="hidden" name="product_type" value="${mapNum.product_type }">
									<input type="hidden" name="section" value="${mapNum.section}">
									<input type="hidden" name="pageNum" value="${page}">
									<input type="submit" value="${(mapNum.section-1)*10 +page}">
								</form>
							</div>
							<c:if test="${page == 10 }">
								<form class="no-uline" action="product" method="get">
									<input type="hidden" name="product_type" value="${mapNum.product_type }">
									<input type="hidden" name="section" value="${mapNum.section+1 }">
									<input type="hidden" name="pageNum" value="${mapNum.section*10+1}">
									<input type="submit" value="next">
								</form>
							</c:if>
						</c:forEach>
					</c:when>
					<c:when test="${mapNum.total_product == 100 }">
						<c:forEach var="page" begin="1" end="10" step="1">
							<a class="no-uline" href="#">${page}</a>
						</c:forEach>
					</c:when>
					<c:when test="${mapNum.total_product < 100 }">
						<c:forEach var="page" begin="1" end="${mapNum.total_product/10 + 1}" step="1">
							<c:choose>
								<c:when test="${page==pageNum }">
									<div class="sel-page">
										<form action="product" method="get">
											<input type="hidden" name="product_type" value="${mapNum.product_type }">
											<input type="hidden" name="section" value="${mapNum.section}">
											<input type="hidden" name="pageNum" value="${page }">
											<input type="submit" value="${page }">
										</form>
									</div>
								</c:when>
								<c:otherwise>
									<div class="no-uline">
										<form action="product" method="get">
											<input type="hidden" name="product_type" value="${mapNum.product_type }">
											<input type="hidden" name="section" value="${mapNum.section}">
											<input type="hidden" name="pageNum" value="${page }">
											<input type="submit" value="${page }">
										</form>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
				</c:choose>
			</c:if>
		</div> --%>
        	
        	
        	
        </c:forEach>
        
        <!-- 
        	<div class="product_brand">브랜드이름</div>
          	<div class="product_name">상품제목</div>
	        <div class="product_photo">상품사진</div>
	        <div class="product_heart">좋아요 수</div>
	        <div class="product_star">별점 점수</div>
	        <div class="product_price">가격정보</div>
	        <div class="product_option">옵션, 수량 선택</div>
	        <div class="product_cart">장바구니 버튼</div>
	        <div class="product_pay">구매버튼</div>
	        <div class="product_info">상품정보란, 더보기 구현</div>
	        <div class="product_review">후기(사진업로드, 별점, 댓글, 대댓글, 페이징)</div>
	        <div class="product_qna">상품문의 게시판</div> -->
        </article>
    </section>
    
</body>

</html>