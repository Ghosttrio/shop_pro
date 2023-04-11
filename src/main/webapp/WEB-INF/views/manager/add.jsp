<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/manager/add.css" type="text/css">
</head>
<body>
	<div id="wrap">
    	<header>
	    	<div>
	    		관리자페이지
	    	</div>
	        <div>
	        	<form action="manager">
					<input class="add btn-7" type="submit" value="홈으로 돌아가기">
				</form>
	        </div>
        </header>
        <section>
	        <h2>제품추가</h2>
		    <form action="add.do" method="POST">
		    	제품코드 : <input type="text" name="product_code"> <br>
			    제품이름 : <input type="text" name="product_name"> <br>
		    	제품사진 : <input type="text" name="product_image"> <br>
			    제품가격 : <input type="text" name="product_price"> <br>
			    제품정보 : <input type="text" name="product_explain"> <br>
		    	<select name="product_type">
			      <option selected>분류</option>
			      <option value="top" >상의</option>
			      <option value="bottom">하의</option>
			      <option value="outer">아우터</option>
			      <option value="shose">신발</option>
			      <option value="etc">기타</option>
		        </select>
		        <br>
		        <div class="btn_box">
				    <input class="btn-5" type="submit">
				    <input class="btn-5" type="reset">
		        </div>
		    </form>
        </section>
		
    </div>
</body>
</html>