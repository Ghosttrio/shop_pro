<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.test{
		border:1px solid red;
		width:100px;
		height:100px;
	}
</style>
</head>
<body>
	제품리스트
	<c:forEach var="productList" items="${productList }">
		<div class="test">
			제품이름 : ${productList.product_name }<br>
			제품타입 : ${productList.product_type }<br>
			제품코드 : ${productList.product_code }<br>
			<form action="info">
			<!-- forEach 해서 product_code 하나씩 출력하게 만들기 -->
		     	<input type="hidden" name="product_code" value="${productList.product_code }">
		      	<input type="submit" value="이동">
		   	</form>
	   	</div>
	</c:forEach>
	
	
	<!-- 
		페이징 할 때 불러올 것들
		1. 카테고리별 전체 제품 개수
		2. 섹션(10단위)과 페이지번호
		3. 페이지 번호 클릭시 product_type 보내서 다시 같은 카테고리로 오게 만들기 
	 -->
	
	<!-- 페이징 -->
		<div id="paging" style="height:100px">
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
		</div>
</body>
</html>