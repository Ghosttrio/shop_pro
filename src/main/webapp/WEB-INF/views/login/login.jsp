<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="login.css" type="text/css">
    <script type="text/javascript" src="login.js"></script>

</head>
<body>
    <div id="wrap">
        <div id="login_header">
            로그인
        </div>
        
        <div >
            <input id="login_id" type="text" placeholder="ID">
        </div>
        <div id="login_pwd">
            <input type="text" placeholder="PASSWORD">
        </div>
        <div id="">
            <div id="find_id">
                <input type="button" value="아이디찾기">
            </div>
            <div id="find_pwd">
                <input type="button" value="비밀번호찾기">
            </div>
        </div>
        <div id="login_btn">
            <input type="button" value="SIGN IN">
        </div>
        <div id="signup_btn">
            <input type="button" value="SIGN UP">
        </div>

    </div>
</body>
</html>