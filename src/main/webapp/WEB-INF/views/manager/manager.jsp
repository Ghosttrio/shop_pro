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
    <link rel="stylesheet" href="/css/manager/manager.css" type="text/css">
   	<script type="text/javascript" src="/js/manager/manager.js"></script>
</head>
<body>
    <div id="wrap">
    	<header>
	    	<div>
	    		관리자페이지
	    	</div>
	        <div>
	        	<form name="managerForm">
					<input class="add btn-7" type="button" value="상품추가하기">
				</form>
	        </div>
        </header>
        
        <section>
        	<h2>상품목록</h2>
        	<div class="type">상의</div>
        	<div class="type_wrap">
	        	<c:forEach var="productList" items="${productList }">
	        		<c:if test="${productList.product_type == 'top' }">
		        		<div class="product_wrap">
		        			<img src="${productList.product_image }" width="100%" height="250px">
			        		${productList.product_name }
			        		<div class="btn_wrap">
			        			<form action="update" method="get" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="수정"  >
								</form>
				        		<form action="delete.do" method="post" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="삭제" >
								</form>
							</div>
						</div>
					</c:if>
	        	</c:forEach>
        	</div>
        	
        	<div class="type">하의</div>
        	<div class="type_wrap">
	        	<c:forEach var="productList" items="${productList }">
	        		<c:if test="${productList.product_type == 'bottom' }">
		        		<div class="product_wrap">
		        			<img src="${productList.product_image }" width="100%" height="250px">
			        		${productList.product_name }
			        		<div class="btn_wrap">
				        		<form action="update" method="get" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="수정"  >
								</form>
				        		<form action="delete.do" method="post" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="삭제" >
								</form>
							</div>
						</div>
					</c:if>
	        	</c:forEach>
        	</div>
        	
        	<div class="type">아우터</div>
        	<div class="type_wrap">
	        	<c:forEach var="productList" items="${productList }">
	        		<c:if test="${productList.product_type == 'outer' }">
		        		<div class="product_wrap">
		        			<img src="${productList.product_image }" width="100%" height="250px">
			        		${productList.product_name }
			        		<div class="btn_wrap">
				        		<form action="update" method="get" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="수정"  >
								</form>
				        		<form action="delete.do" method="post" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="삭제" >
								</form>
							</div>
						</div>
					</c:if>
	        	</c:forEach>
        	</div>
        	
        	
        	<div class="type">신발</div>
        	<div class="type_wrap">
	        	<c:forEach var="productList" items="${productList }">
	        		<c:if test="${productList.product_type == 'shose' }">
		        		<div class="product_wrap">
		        			<img src="${productList.product_image }" width="100%" height="250px">
			        		${productList.product_name }
			        		<div class="btn_wrap">
				        		<form action="update" method="get" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="수정"  >
								</form>
				        		<form action="delete.do" method="post" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="삭제" >
								</form>
							</div>
						</div>
					</c:if>
	        	</c:forEach>
        	</div>
        	
        	
        	<div class="type">기타</div>
        	<div class="type_wrap">
	        	<c:forEach var="productList" items="${productList }">
	        		<c:if test="${productList.product_type == 'etc' }">
		        		<div class="product_wrap">
		        			<img src="${productList.product_image }" width="100%" height="250px">
			        		${productList.product_name }
			        		<div class="btn_wrap">
				        		<form action="update" method="get" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="수정"  >
								</form>
				        		<form action="delete.do" method="post" >
				        			<input type="hidden" name="product_code" value="${productList.product_code }">
				        			<input class="btn-5" type="submit" value="삭제" >
								</form>
							</div>
						</div>
					</c:if>
	        	</c:forEach>
        	</div>
        </section>
    </div>
</body>
</html>