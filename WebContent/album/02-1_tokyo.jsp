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
<title>11/17 東京背包行 Day1 | 京都の留學日誌</title>
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
								<h2>11/17 東京背包行 Day1</h2>
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
								<a href="../images/album/02-1_tokyo/01.jpg" class="swipebox" title="東京 鍛冶橋駐車場附近">
									<img src="../images/album/02-1_tokyo/01.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/02.jpg" class="swipebox" title="東京 鍛冶橋駐車場附近">
									<img src="../images/album/02-1_tokyo/02.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/03.jpg" class="swipebox" title="東京 鍛冶橋駐車場附近">
									<img src="../images/album/02-1_tokyo/03.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/04.jpg" class="swipebox" title="JR 有樂町站">
									<img src="../images/album/02-1_tokyo/04.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/05.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/05.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/06.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/06.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/07.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/07.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/08.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/08.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/09.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/09.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/10.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/10.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/11.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/11.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/12.jpg" class="swipebox" title="東京 銀座">
									<img src="../images/album/02-1_tokyo/12.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/13.jpg" class="swipebox" title="東京 築地">
									<img src="../images/album/02-1_tokyo/13.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/14.jpg" class="swipebox" title="東京 築地">
									<img src="../images/album/02-1_tokyo/14.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/15.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/15.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/16.jpg" class="swipebox" title="東京 築地市場玉子燒，我聽到店員私底下是說中文">
									<img src="../images/album/02-1_tokyo/16.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/17.jpg" class="swipebox" title="東京 築地市場玉子燒">
									<img src="../images/album/02-1_tokyo/17.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/18.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/18.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/19.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/19.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/20.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/20.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/21.jpg" class="swipebox" title="東京 築地市場，A5牛肉">
									<img src="../images/album/02-1_tokyo/21.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/22.jpg" class="swipebox" title="東京 築地市場，海苔出汁">
									<img src="../images/album/02-1_tokyo/22.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/23.jpg" class="swipebox" title="東京 築地市場，馬肉">
									<img src="../images/album/02-1_tokyo/23.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/24.jpg" class="swipebox" title="東京 築地市場，詭異的人像">
									<img src="../images/album/02-1_tokyo/24.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/25.jpg" class="swipebox" title="東京 築地市場，草莓大福">
									<img src="../images/album/02-1_tokyo/25.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/26.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/26.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/27.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/27.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/28.jpg" class="swipebox" title="東京 築地市場，鮪魚起司和鰹魚起司口味的餅乾">
									<img src="../images/album/02-1_tokyo/28.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/29.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/29.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/30.jpg" class="swipebox" title="東京 築地市場">
									<img src="../images/album/02-1_tokyo/30.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/31.jpg" class="swipebox" title="東京 築地本願寺，在這裡遇到外國人請我幫忙拍照，拍完還和我說ありがとうXD">
									<img src="../images/album/02-1_tokyo/31.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/32.jpg" class="swipebox" title="東京 築地本願寺">
									<img src="../images/album/02-1_tokyo/32.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/33.jpg" class="swipebox" title="東京 築地本願寺">
									<img src="../images/album/02-1_tokyo/33.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/34.jpg" class="swipebox" title="東京 築地本願寺">
									<img src="../images/album/02-1_tokyo/34.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/35.jpg" class="swipebox" title="東京 築地本願寺">
									<img src="../images/album/02-1_tokyo/35.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/36.jpg" class="swipebox" title="東京 築地本願寺">
									<img src="../images/album/02-1_tokyo/36.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/37.jpg" class="swipebox" title="東京 築地">
									<img src="../images/album/02-1_tokyo/37.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/38.jpg" class="swipebox" title="東京 築地，天丼てんや菜單">
									<img src="../images/album/02-1_tokyo/38.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/39.jpg" class="swipebox" title="東京 築地，天丼てんや的全明星天婦羅定食">
									<img src="../images/album/02-1_tokyo/39.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/40.jpg" class="swipebox" title="東京 築地，天丼てんや">
									<img src="../images/album/02-1_tokyo/40.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/41.jpg" class="swipebox" title="東京 銀座附近">
									<img src="../images/album/02-1_tokyo/41.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/42.jpg" class="swipebox" title="東京 地鐵銀座站">
									<img src="../images/album/02-1_tokyo/42.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/43.jpg" class="swipebox" title="東京 地鐵銀座站，東京不像京都靠左靠右很亂，都有固定靠法">
									<img src="../images/album/02-1_tokyo/43.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/44.jpg" class="swipebox" title="東京 地鐵表參道站">
									<img src="../images/album/02-1_tokyo/44.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/45.jpg" class="swipebox" title="東京 表參道">
									<img src="../images/album/02-1_tokyo/45.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/46.jpg" class="swipebox" title="東京 表參道">
									<img src="../images/album/02-1_tokyo/46.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/47.jpg" class="swipebox" title="東京 表參道，善光寺，沒聽過但路過就進去看看">
									<img src="../images/album/02-1_tokyo/47.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/48.jpg" class="swipebox" title="東京 表參道，善光寺">
									<img src="../images/album/02-1_tokyo/48.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/49.jpg" class="swipebox" title="東京 表參道，善光寺">
									<img src="../images/album/02-1_tokyo/49.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/50.jpg" class="swipebox" title="東京 表參道，善光寺">
									<img src="../images/album/02-1_tokyo/50.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/51.jpg" class="swipebox" title="東京 表參道">
									<img src="../images/album/02-1_tokyo/51.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/52.jpg" class="swipebox" title="東京 表參道，路過的船光稻荷神社">
									<img src="../images/album/02-1_tokyo/52.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/53.jpg" class="swipebox" title="東京 表參道，迷路中">
									<img src="../images/album/02-1_tokyo/53.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/54.jpg" class="swipebox" title="東京 表參道，迷路中">
									<img src="../images/album/02-1_tokyo/54.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/55.jpg" class="swipebox" title="東京 原宿">
									<img src="../images/album/02-1_tokyo/55.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/56.jpg" class="swipebox" title="東京 原宿，咬一口專賣店">
									<img src="../images/album/02-1_tokyo/56.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/57.jpg" class="swipebox" title="東京 原宿，LINE 商店">
									<img src="../images/album/02-1_tokyo/57.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/58.jpg" class="swipebox" title="東京 原宿，LINE 商店內的大頭貼機">
									<img src="../images/album/02-1_tokyo/58.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/59.jpg" class="swipebox" title="東京 原宿，LINE 商店">
									<img src="../images/album/02-1_tokyo/59.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/60.jpg" class="swipebox" title="東京 原宿">
									<img src="../images/album/02-1_tokyo/60.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/61.jpg" class="swipebox" title="東京 原宿，可麗餅店">
									<img src="../images/album/02-1_tokyo/61.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/62.jpg" class="swipebox" title="東京 原宿，草莓巧克力冰淇淋可麗餅">
									<img src="../images/album/02-1_tokyo/62.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/63.jpg" class="swipebox" title="東京 原宿，草莓巧克力冰淇淋可麗餅">
									<img src="../images/album/02-1_tokyo/63.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/64.jpg" class="swipebox" title="東京 原宿COCO都可，全日本只有 2 間，分別在原宿和澀谷">
									<img src="../images/album/02-1_tokyo/64.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/65.jpg" class="swipebox" title="東京 原宿">
									<img src="../images/album/02-1_tokyo/65.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/66.jpg" class="swipebox" title="東京 原宿">
									<img src="../images/album/02-1_tokyo/66.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/67.jpg" class="swipebox" title="東京 原宿，明治神宮前">
									<img src="../images/album/02-1_tokyo/67.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/68.jpg" class="swipebox" title="東京 JR原宿站">
									<img src="../images/album/02-1_tokyo/68.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/69.jpg" class="swipebox" title="東京 原宿">
									<img src="../images/album/02-1_tokyo/69.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/70.jpg" class="swipebox" title="東京 原宿竹下通，很像西門町">
									<img src="../images/album/02-1_tokyo/70.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/71.jpg" class="swipebox" title="東京 原宿竹下通">
									<img src="../images/album/02-1_tokyo/71.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/72.jpg" class="swipebox" title="東京 原宿竹下通">
									<img src="../images/album/02-1_tokyo/72.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/73.jpg" class="swipebox" title="東京 原宿">
									<img src="../images/album/02-1_tokyo/73.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/74.jpg" class="swipebox" title="東京 原宿">
									<img src="../images/album/02-1_tokyo/74.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/75.jpg" class="swipebox" title="東京 宮下公園">
									<img src="../images/album/02-1_tokyo/75.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/76.jpg" class="swipebox" title="東京 宮下公園">
									<img src="../images/album/02-1_tokyo/76.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/77.jpg" class="swipebox" title="東京 原宿往澀谷，迪士尼商店">
									<img src="../images/album/02-1_tokyo/77.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/78.jpg" class="swipebox" title="東京 原宿往澀谷">
									<img src="../images/album/02-1_tokyo/78.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/79.jpg" class="swipebox" title="東京 原宿往澀谷">
									<img src="../images/album/02-1_tokyo/79.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/80.jpg" class="swipebox" title="東京 澀谷，109，這位是安室奈美惠，今年從歌壇引退">
									<img src="../images/album/02-1_tokyo/80.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/81.jpg" class="swipebox" title="東京 澀谷，十字路口">
									<img src="../images/album/02-1_tokyo/81.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/82.jpg" class="swipebox" title="東京 澀谷，十字路口">
									<img src="../images/album/02-1_tokyo/82.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/83.jpg" class="swipebox" title="東京 澀谷，十字路口">
									<img src="../images/album/02-1_tokyo/83.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/84.jpg" class="swipebox" title="東京 澀谷，十字路口">
									<img src="../images/album/02-1_tokyo/84.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/85.jpg" class="swipebox" title="東京 澀谷，澀谷中央街">
									<img src="../images/album/02-1_tokyo/85.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/86.jpg" class="swipebox" title="東京 澀谷，澀谷中央街">
									<img src="../images/album/02-1_tokyo/86.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/87.jpg" class="swipebox" title="東京 澀谷，澀谷中央街">
									<img src="../images/album/02-1_tokyo/87.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/88.jpg" class="swipebox" title="東京 澀谷，忘了店名的雞白湯拉麵，好吃！">
									<img src="../images/album/02-1_tokyo/88.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/89.jpg" class="swipebox" title="東京 澀谷，雞白湯拉麵和餃子">
									<img src="../images/album/02-1_tokyo/89.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/90.jpg" class="swipebox" title="東京 澀谷，109內部">
									<img src="../images/album/02-1_tokyo/90.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/91.jpg" class="swipebox" title="東京 澀谷，109 MENS">
									<img src="../images/album/02-1_tokyo/91.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/92.jpg" class="swipebox" title="東京 澀谷，八公像">
									<img src="../images/album/02-1_tokyo/92.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/93.jpg" class="swipebox" title="東京 澀谷，欅坂46的廣告">
									<img src="../images/album/02-1_tokyo/93.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/02-1_tokyo/94.jpg" class="swipebox" title="東京 澀谷，澀谷站前派出所，《辣妹當家》的主要場景">
									<img src="../images/album/02-1_tokyo/94.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/02-1_tokyo/95.jpg" class="swipebox" title="東京 澀谷，MANBOO 漫畫喫茶">
									<img src="../images/album/02-1_tokyo/95.jpg" class="thumb" alt="image">
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
