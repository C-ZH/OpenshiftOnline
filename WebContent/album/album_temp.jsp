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
<title>生活相簿 | 京都の留學日誌</title>
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
								<h1>111</h1>
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
								<a href="../images/album/album_name/01.jpg" class="swipebox" title="紫式部">
									<img src="../images/album/album_name/01.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/02.jpg" class="swipebox" title="紫式部">
									<img src="../images/album/album_name/02.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/03.jpg" class="swipebox" title="10月底紫式部墓所楓葉">
									<img src="../images/album/album_name/03.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/04.jpg" class="swipebox" title="奈良">
									<img src="../images/album/album_name/04.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/05.jpg" class="swipebox" title="奈良">
									<img src="../images/album/album_name/05.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/06.jpg" class="swipebox" title="奈良">
									<img src="../images/album/album_name/06.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/07.jpg" class="swipebox" title="奈良">
									<img src="../images/album/album_name/07.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/08.jpg" class="swipebox" title="宇治 平等院">
									<img src="../images/album/album_name/08.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/09.jpg" class="swipebox" title="宇治 平等院">
									<img src="../images/album/album_name/09.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/10.jpg" class="swipebox" title="宇治 平等院">
									<img src="../images/album/album_name/10.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/11.jpg" class="swipebox" title="宇治 平等院">
									<img src="../images/album/album_name/11.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/12.jpg" class="swipebox" title="東京">
									<img src="../images/album/album_name/12.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/13.jpg" class="swipebox" title="東京 宮下公園">
									<img src="../images/album/album_name/13.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/14.jpg" class="swipebox" title="東京 宮下公園">
									<img src="../images/album/album_name/14.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/15.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/15.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/16.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/16.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/17.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/17.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/18.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/18.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/19.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/19.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/20.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/20.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/21.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/21.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/22.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/22.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/23.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/23.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/24.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/24.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/25.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/25.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/26.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/26.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/27.jpg" class="swipebox" title="東京 小石川後樂園">
									<img src="../images/album/album_name/27.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/28.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/album_name/28.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/29.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/album_name/29.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/30.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/album_name/30.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/31.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/album_name/31.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/32.jpg" class="swipebox" title="東京 Tokyo Dome City">
									<img src="../images/album/album_name/32.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/33.jpg" class="swipebox" title="東京 東京巨蛋">
									<img src="../images/album/album_name/33.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/34.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/34.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/35.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/35.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/36.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/36.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/37.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/37.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/38.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/38.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/39.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/39.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/40.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/40.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/41.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/41.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/42.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/42.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/43.jpg" class="swipebox" title="京都水族館">
									<img src="../images/album/album_name/43.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/44.jpg" class="swipebox" title="京都 高台寺">
									<img src="../images/album/album_name/44.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/45.jpg" class="swipebox" title="京都 高台寺">
									<img src="../images/album/album_name/45.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/album_name/46.jpg" class="swipebox" title="京都 高台寺">
									<img src="../images/album/album_name/46.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/47.jpg" class="swipebox" title="京都 高台寺">
									<img src="../images/album/album_name/47.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/48.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/48.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr><tr>
							<td>
								<a href="../images/album/album_name/49.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/49.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/50.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/50.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/51.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/51.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr><tr>
							<td>
								<a href="../images/album/album_name/52.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/52.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/53.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/53.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/54.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/54.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr><tr>
							<td>
								<a href="../images/album/album_name/55.jpg" class="swipebox" title="京都 堀川上立賣">
									<img src="../images/album/album_name/55.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/56.jpg" class="swipebox" title="京都 中京中學校前">
									<img src="../images/album/album_name/56.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/57.jpg" class="swipebox" title="京都 中京中學校前">
									<img src="../images/album/album_name/57.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr><tr>
							<td>
								<a href="../images/album/album_name/58.jpg" class="swipebox" title="京都 中京中學校前">
									<img src="../images/album/album_name/58.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/59.jpg" class="swipebox" title="京都 中京中學校前">
									<img src="../images/album/album_name/59.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/60.jpg" class="swipebox" title="京都 中京中學校前">
									<img src="../images/album/album_name/60.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr><tr>
							<td>
								<a href="../images/album/album_name/61.jpg" class="swipebox" title="京都 中京中學校前">
									<img src="../images/album/album_name/61.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/62.jpg" class="swipebox" title="京都 中京中學校前">
									<img src="../images/album/album_name/62.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/63.jpg" class="swipebox" title="京都 西本願寺銀杏">
									<img src="../images/album/album_name/63.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr><tr>
							<td>
								<a href="../images/album/album_name/64.jpg" class="swipebox" title="京都 西本願寺銀杏">
									<img src="../images/album/album_name/64.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/65.jpg" class="swipebox" title="京都 西本願寺銀杏">
									<img src="../images/album/album_name/65.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/album_name/66.jpg" class="swipebox" title="京都 西本願寺銀杏">
									<img src="../images/album/album_name/66.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr><tr>
							<td>
								<a href="../images/album/album_name/67.jpg" class="swipebox" title="京都 西本願寺銀杏">
									<img src="../images/album/album_name/67.jpg" class="thumb" alt="image">
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
