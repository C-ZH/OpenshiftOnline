<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增雜記 | 京都の留學日誌</title>
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
			<h1>新增雜記</h1>
			<form name = "admin" action = "NewMemo" method = "post">
				<label>標題</label>
				<input type = "text" name = "title">
				<label>年份</label>
				<input type = "text" name = "year">
				<label>月份</label>
				<input type = "text" name = "month">
				<label>日期</label>
				<input type = "text" name = "date">
				<label>標籤</label>
				<input type = "text" name = "tag">
				<label>內文</label>
				<textarea name="content"></textarea>
				<input id="submit" type = "submit" value = "送出">
			</form>
		</div>
	</div>
</body>
</html>
