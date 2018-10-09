<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入 | 京都の留學日誌</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/page.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<div class="box alt">
		<div class="login_box">
			<h1>管理員登入</h1>
			<% 
				String error_message = (String)request.getAttribute("error_message");
				if(error_message != null){
			%>
			<p class="error"><%= error_message %></p>
			<%
				}
			%>
			<form name = "admin" action = "Login" method = "post">
				<label>名稱</label>
				<input type = "text" name = "id">
				<label>密碼</label>
				<input type = "password" name = "pw">
				<input id="submit" type = "submit" name = "login" value = "送出">
			</form>
		</div>
	</div>
</body>
</html>
