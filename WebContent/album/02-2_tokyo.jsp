<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="model.DBConnection"%> 

<%!
	boolean isAdmin = false;
%>
<% 
	DBConnection dbc = new DBConnection();
	Connection conn = dbc.connect_mysql("KyotoExchangeDB");
	
	try {
		try {
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>11/18 東京背包行 Day2 | 京都の留學日誌</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/swipebox.css">
<!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="../index.jsp">京都の留學日誌</a></h1>
						<nav class="links">
							<ul>
								<li><a href="../about.jsp">關於站主</a></li>
								<li><a href="../article.jsp">旅日札記</a></li>
								<li><a href="../album.jsp">生活相簿</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="../Search">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="../Search">
									<input type="text" name="query" placeholder="Search" />
									<input type="submit" value="搜尋"/>
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
								<li>
										<a href="../about.jsp">
											<h3>關於站主</h3>
										</a>
									</li>
									<li>
										<a href="../article.jsp">
											<h3>旅日札記</h3>
										</a>
									</li>
									<li>
										<a href="../album.jsp">
											<h3>生活相簿</h3>
										</a>
									</li>
								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions vertical">
									<%
									// why I must initialize one more time, after redirecting ??
									isAdmin = false;
									// avoid null pointer
									if(session.getAttribute("isAdmin") != null){
										System.out.println(isAdmin);
										isAdmin = (boolean)session.getAttribute("isAdmin");
									}
									
									if(!isAdmin){
									%>
									<li><a href="../login.jsp" class="button big fit">Log In</a></li>
									<% 
									}else{
									%>
									<li><a href="../addArticle.jsp" class="button big fit">New Article</a></li>
									<li><a href="../Logout" class="button big fit">Log Out</a></li>
									<% 
									}
									%>
								</ul>
							</section>

					</section>

				<!-- Main -->
					<div id="main">

						<!-- PostN -->
							<article class="post">
								<h2>11/18 東京背包行 Day2</h2>
								<h3>
									<p>電腦版：<br/>
									可觀看說明文字，可使用鍵盤左右鍵來瀏覽相片。<br/>
									點擊右上角 x 可關閉相簿視窗。</p>
									行動版：<br/>
									無法觀看說明文字，可使用觸控手勢左右移動來瀏覽相片。<br/>
									向上滑動可關閉相簿視窗。</p>
								</h3>
					<table id="photo_collection">
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/01.jpg" class="swipebox" title="東京 澀谷，清晨滿地垃圾">
									<img src="../images/album/02-2_tokyo/01.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/02.jpg" class="swipebox" title="東京 澀谷，清晨滿地垃圾">
									<img src="../images/album/02-2_tokyo/02.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/03.jpg" class="swipebox" title="東京 澀谷，清晨滿地垃圾">
									<img src="../images/album/02-2_tokyo/03.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/04.jpg" class="swipebox" title="東京 澀谷，清晨滿地垃圾">
									<img src="../images/album/02-2_tokyo/04.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/05.jpg" class="swipebox" title="東京 澀谷，清晨滿地垃圾">
									<img src="../images/album/02-2_tokyo/05.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/06.jpg" class="swipebox" title="東京 澀谷，清晨滿地垃圾">
									<img src="../images/album/02-2_tokyo/06.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/07.jpg" class="swipebox" title="東京 澀谷，早上要離開前又來拍一次十字路口，雖然很早人還是不少">
									<img src="../images/album/02-2_tokyo/07.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/08.jpg" class="swipebox" title="東京 澀谷十字路口，這次拍的和C;C的遊戲背景同角度">
									<img src="../images/album/02-2_tokyo/08.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/09.jpg" class="swipebox" title="東京 澀谷，早上要離開前又來拍一次站前派出所">
									<img src="../images/album/02-2_tokyo/09.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/10.jpg" class="swipebox" title="東京 澀谷，早上要離開前又來拍一次八公像">
									<img src="../images/album/02-2_tokyo/10.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/11.jpg" class="swipebox" title="東京 澀谷，清晨滿地垃圾">
									<img src="../images/album/02-2_tokyo/11.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/12.jpg" class="swipebox" title="東京 東急澀谷站">
									<img src="../images/album/02-2_tokyo/12.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/13.jpg" class="swipebox" title="東京 JR澀谷站">
									<img src="../images/album/02-2_tokyo/13.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/14.jpg" class="swipebox" title="東京 澀谷站前廣場，漫畫裡常常提到這個地方是情侶約會聖地，晚上也確實很多情侶，清晨則是很多喝醉的人">
									<img src="../images/album/02-2_tokyo/14.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/15.jpg" class="swipebox" title="東京 澀谷，皮卡丘自動販賣機">
									<img src="../images/album/02-2_tokyo/15.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/16.jpg" class="swipebox" title="東京 澀谷，松屋早餐">
									<img src="../images/album/02-2_tokyo/16.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/17.jpg" class="swipebox" title="東京 澀谷，松屋早餐">
									<img src="../images/album/02-2_tokyo/17.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/18.jpg" class="swipebox" title="東京 澀谷，JR中央總武線">
									<img src="../images/album/02-2_tokyo/18.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/19.jpg" class="swipebox" title="東京 JR代代木站">
									<img src="../images/album/02-2_tokyo/19.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/20.jpg" class="swipebox" title="東京 JR代代木站">
									<img src="../images/album/02-2_tokyo/20.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/21.jpg" class="swipebox" title="東京 飯田橋">
									<img src="../images/album/02-2_tokyo/21.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/22.jpg" class="swipebox" title="東京 JR飯田橋站">
									<img src="../images/album/02-2_tokyo/22.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/23.jpg" class="swipebox" title="東京 東京巨蛋附近，直升機正在起飛">
									<img src="../images/album/02-2_tokyo/23.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/24.jpg" class="swipebox" title="東京 東京巨蛋附近，芳文社是我們的神！（雖然我不熟，但逛 PTT 常看到這句XD）">
									<img src="../images/album/02-2_tokyo/24.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/25.jpg" class="swipebox" title="東京 東京巨蛋附近">
									<img src="../images/album/02-2_tokyo/25.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/26.jpg" class="swipebox" title="東京 東京巨蛋附近">
									<img src="../images/album/02-2_tokyo/26.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/27.jpg" class="swipebox" title="東京 東京巨蛋附近">
									<img src="../images/album/02-2_tokyo/27.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/28.jpg" class="swipebox" title="東京 東京巨蛋附近">
									<img src="../images/album/02-2_tokyo/28.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/29.jpg" class="swipebox" title="東京 小石川後樂園，在售票處被疑似台灣人用英文和日文要求幫忙拍照，過程中說了不少話，但我一句中文都沒說XD">
									<img src="../images/album/02-2_tokyo/29.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/30.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/30.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/31.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/31.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/32.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/32.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/33.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/33.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/34.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/34.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/35.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/35.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/36.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/36.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/37.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/37.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/38.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/38.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/39.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/39.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/40.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/40.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/41.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/41.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/42.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/42.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/43.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/43.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/44.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/44.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/45.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/45.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/46.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/46.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/47.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/47.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/48.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/48.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/49.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/49.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/50.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/50.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/51.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/51.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/52.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/52.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/53.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/02-2_tokyo/53.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/54.jpg" class="swipebox" title="東京 東京巨蛋附近，賽馬場，這張重點是「大王降臨」XD">
									<img src="../images/album/02-2_tokyo/54.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/55.jpg" class="swipebox" title="東京 東京巨蛋附近，賽馬場">
									<img src="../images/album/02-2_tokyo/55.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/56.jpg" class="swipebox" title="東京 東京巨蛋附近，賽馬場">
									<img src="../images/album/02-2_tokyo/56.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/57.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/57.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/58.jpg" class="swipebox" title="東京 Tokyo Dome City，傑尼斯周邊專賣店">
									<img src="../images/album/02-2_tokyo/58.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/59.jpg" class="swipebox" title="東京 Tokyo Dome City，MLB餐廳">
									<img src="../images/album/02-2_tokyo/59.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/60.jpg" class="swipebox" title="東京 Tokyo Dome City，MLB餐廳">
									<img src="../images/album/02-2_tokyo/60.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/61.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/61.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/62.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/62.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/63.jpg" class="swipebox" title="東京 Tokyo Dome City，庫洛魔法使專賣店">
									<img src="../images/album/02-2_tokyo/63.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/64.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/64.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/65.jpg" class="swipebox" title="東京 Tokyo Dome City，SEGA遊戲中心">
									<img src="../images/album/02-2_tokyo/65.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/66.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/66.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/67.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/67.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/68.jpg" class="swipebox" title="東京 Tokyo Dome City，SEGA遊戲中心">
									<img src="../images/album/02-2_tokyo/68.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/69.jpg" class="swipebox" title="東京 Tokyo Dome City，SEGA遊戲中心">
									<img src="../images/album/02-2_tokyo/69.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/70.jpg" class="swipebox" title="東京 Tokyo Dome City，SEGA遊戲中心">
									<img src="../images/album/02-2_tokyo/70.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/71.jpg" class="swipebox" title="東京 Tokyo Dome City，東京寶島商店">
									<img src="../images/album/02-2_tokyo/71.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/72.jpg" class="swipebox" title="東京 Tokyo Dome City，東京寶島商店">
									<img src="../images/album/02-2_tokyo/72.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/73.jpg" class="swipebox" title="東京 Tokyo Dome City，東京寶島商店">
									<img src="../images/album/02-2_tokyo/73.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/74.jpg" class="swipebox" title="東京 Tokyo Dome City，JUMP商店">
									<img src="../images/album/02-2_tokyo/74.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/75.jpg" class="swipebox" title="東京 Tokyo Dome City，JUMP商店">
									<img src="../images/album/02-2_tokyo/75.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/76.jpg" class="swipebox" title="東京 Tokyo Dome City，JUMP商店">
									<img src="../images/album/02-2_tokyo/76.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/77.jpg" class="swipebox" title="東京 Tokyo Dome City，巧克力香蕉可麗餅">
									<img src="../images/album/02-2_tokyo/77.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/78.jpg" class="swipebox" title="東京 Tokyo Dome City，嚕嚕米咖啡廳">
									<img src="../images/album/02-2_tokyo/78.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/79.jpg" class="swipebox" title="東京 Tokyo Dome City，嚕嚕米咖啡廳">
									<img src="../images/album/02-2_tokyo/79.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/80.jpg" class="swipebox" title="東京 Tokyo Dome City，賣可麗餅的小餐車">
									<img src="../images/album/02-2_tokyo/80.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/81.jpg" class="swipebox" title="東京 Tokyo Dome City，Hello Kitty甜點店">
									<img src="../images/album/02-2_tokyo/81.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/82.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/82.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/83.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/83.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/84.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/84.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/85.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/85.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/86.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/86.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/87.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/87.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/88.jpg" class="swipebox" title="東京 Tokyo Dome City，LaQua購物中心">
									<img src="../images/album/02-2_tokyo/88.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/89.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/89.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/90.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/90.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/91.jpg" class="swipebox" title="東京 Tokyo Dome City，LaQua購物中心">
									<img src="../images/album/02-2_tokyo/91.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/92.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/92.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/93.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/02-2_tokyo/93.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/94.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/94.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/95.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/95.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/96.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/96.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/97.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/97.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/98.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/98.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/99.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/99.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/100.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/100.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/101.jpg" class="swipebox" title="東京 東京巨蛋，周圍都是日本球迷QQ">
									<img src="../images/album/02-2_tokyo/101.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/102.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/102.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/103.jpg" class="swipebox" title="東京 東京巨蛋，日本隊列隊">
									<img src="../images/album/02-2_tokyo/103.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/104.jpg" class="swipebox" title="東京 東京巨蛋，陳冠宇">
									<img src="../images/album/02-2_tokyo/104.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/105.jpg" class="swipebox" title="東京 東京巨蛋，中華隊列隊">
									<img src="../images/album/02-2_tokyo/105.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/106.jpg" class="swipebox" title="東京 東京巨蛋，陽岱鋼">
									<img src="../images/album/02-2_tokyo/106.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/107.jpg" class="swipebox" title="東京 東京巨蛋，王柏融">
									<img src="../images/album/02-2_tokyo/107.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/108.jpg" class="swipebox" title="東京 東京巨蛋，陽岱鋼賽前練習">
									<img src="../images/album/02-2_tokyo/108.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/109.jpg" class="swipebox" title="東京 東京巨蛋，投手賽前練投">
									<img src="../images/album/02-2_tokyo/109.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/110.jpg" class="swipebox" title="東京 東京巨蛋，王柏融賽前練習">
									<img src="../images/album/02-2_tokyo/110.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/111.jpg" class="swipebox" title="東京 東京巨蛋，中華隊啦啦隊">
									<img src="../images/album/02-2_tokyo/111.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/112.jpg" class="swipebox" title="東京 東京巨蛋，中華隊首打席 YOH">
									<img src="../images/album/02-2_tokyo/112.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/113.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/113.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/114.jpg" class="swipebox" title="東京 東京巨蛋，日本隊啦啦隊中場表演">
									<img src="../images/album/02-2_tokyo/114.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/115.jpg" class="swipebox" title="東京 東京巨蛋，中華隊啦啦隊中場表演">
									<img src="../images/album/02-2_tokyo/115.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/116.jpg" class="swipebox" title="東京 東京巨蛋，中華隊啦啦隊中場表演">
									<img src="../images/album/02-2_tokyo/116.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/117.jpg" class="swipebox" title="東京 東京巨蛋，中華隊啦啦隊中場表演">
									<img src="../images/album/02-2_tokyo/117.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/118.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/118.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/119.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/119.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/120.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/120.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-2_tokyo/121.jpg" class="swipebox" title="東京 東京巨蛋，第九局安打時大家揮舞國旗">
									<img src="../images/album/02-2_tokyo/121.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-2_tokyo/122.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/02-2_tokyo/122.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
					</table>
							</article>

						<!-- Pagination -->

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a class="logo"><img src="../images/avatar.png" alt="" /></a>
								<header>
									<h2>京都の留學日誌</h2>
									<p id="second_title">～ 在京都半年的生活體驗 ～</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>
								<h3>文章分類</h3>
								<div class="mini-posts">
									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../doshisha_list.jsp">同志社の校園生活</a></h3>
											</header>
											<a href="../doshisha_list.jsp" class="image"><img src="../images/tag/doshisha_minipost.jpg" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../kyoto_list.jsp">京都の古都記趣</a></h3>
											</header>
											<a href="../kyoto_list.jsp" class="image"><img src="../images/tag/kyoto_minipost.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../food_list.jsp">美食の食記</a></h3>
											</header>
											<a href="../food_list.jsp" class="image"><img src="../images/tag/food_minipost.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../travel_list.jsp">日本周遊の旅程</a></h3>
											</header>
											<a href="../travel_list.jsp" class="image"><img src="../images/tag/travel_minipost.JPG" alt="" /></a>
										</article>

								</div>
							</section>

							<!-- Posts List -->
							<section>
								<h3>文章月份</h3>
								<ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="../september.jsp">九月</a></h3>
												<time class="published" datetime="2017-09">September, 2017</time>
											</header>
											<a href="../september.jsp" class="image"><img src="../images/tag/Sep.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../october.jsp">十月</a></h3>
												<time class="published" datetime="2015-10-15">October, 2017</time>
											</header>
											<a href="../october.jsp" class="image"><img src="../images/tag/Oct.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../november.jsp">十一月</a></h3>
												<time class="published" datetime="2015-10-10">November, 2017</time>
											</header>
											<a href="../november.jsp" class="image"><img src="../images/tag/Nov.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../december.jsp">十二月</a></h3>
												<time class="published" datetime="2015-10-08">December, 2017</time>
											</header>
											<a href="../december.jsp" class="image"><img src="../images/tag/Dec.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../january.jsp">一月</a></h3>
												<time class="published" datetime="2015-10-06">January, 2018</time>
											</header>
											<a href="../january.jsp" class="image"><img src="../images/tag/Jan.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../february.jsp">二月</a></h3>
												<time class="published" datetime="2015-10-06">February, 2018</time>
											</header>
											<a href="../february.jsp" class="image"><img src="../images/tag/Feb.jpg" alt="" /></a>
										</article>
									</li>
								</ul>
							</section>

						<!-- Footer -->
							<section id="footer">
								<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
							</section>

					</section>

			</div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="../assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>
			
			<!-- Gallery -->
			<!-- Notice: JQ ver.3 do not work -->
			<script src="../assets/js/jquery-2.1.0.min.js"></script>
			<script src="../assets/js/jquery.swipebox.js"></script>
			<script src="../assets/js/ios-orientationchange-fix.js"></script>
			<!-- Fire the Gallery -->
			<script type="text/javascript">
				$( document ).ready(function() {
					$( '.swipebox' ).swipebox();
				});
			</script>
	</body>
</html>
<%
		} catch (Exception ex) {
			System.out.println("can't read data");
			System.out.println(ex.toString());
		} finally{
			//dbc.cleanConnectionObj(rs, stmt, conn);
		}
	} catch (Exception e) {
		System.out.println("can't create statement");
		System.out.println(e.toString());
	}
%>
