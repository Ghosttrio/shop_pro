<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChangShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/signup/signup.css" type="text/css">
    <script type="text/javascript" src="/js/signup/signup.js"></script>

</head>
<body>
	<form action="signup.do" method="post">
	    <div id="wrap">
	        <div id="logo_header">
	            <img src="/image/logo/shop_logo.jpg" width="150px">
	        </div>
	        <div class="id_wrap">
	        	아이디<br>
	        	<input type="text" name="id" placeholder="아이디를 입력하시오">
	        	<font class="checkId"></font>
	        </div>
	        <div class="pw_wrap">
	        	비밀번호<br>
	        	<input type="password" name="pw" placeholder="비밀번호를 입력하시오"><br>
	        	<input type="password" placeholder="비밀번호를 재입력하시오">
	        	<font class="checkId"></font>
	        </div>
	        <div class="name_wrap">
	        	이름 <input type="text" name="name" placeholder="이름 입력하시오">
	        </div>
	        <div class="email_wrap">
	        	이메일 <input type="text" name="email" placeholder="이메일을 입력하시오">
	        </div>
	        <div class="addr_wrap">
	        	주소 <input type="text" name="addr" placeholder="주소를 입력하시오">
	        </div>
	        <div class="btn_wrap">
	        	<input class="btn btn-success" type="submit" value="회원가입">
	        </div>
	    </div>
	</form>
</body>
</html>