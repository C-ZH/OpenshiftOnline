<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="model.DBConnection"%> 

<%!
	/*String table_name;
	ResultSet rs;
	
	int post_count = 0;
	ResultSet row_count;
	*/
	boolean isAdmin = false;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2017年10月 | 京都の留學日誌</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="index.jsp">京都の留學日誌</a></h1>
						<nav class="links">
							<ul>
								<li><a href="about.jsp">關於站主</a></li>
								<li><a href="article.jsp">旅日札記</a></li>
								<li><a href="album.jsp">生活相簿</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="Search">
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
								<form class="search" method="get" action="Search">
									<input type="text" name="query" placeholder="Search" />
									<input type="submit" value="搜尋"/>
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
								<li>
										<a href="about.jsp">
											<h3>關於站主</h3>
										</a>
									</li>
									<li>
										<a href="article.jsp">
											<h3>旅日札記</h3>
										</a>
									</li>
									<li>
										<a href="album.jsp">
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
									<li><a href="login.jsp" class="button big fit">Log In</a></li>
									<% 
									}else{
									%>
									<li><a href="addArticle.jsp" class="button big fit">New Article</a></li>
									<li><a href="Logout" class="button big fit">Log Out</a></li>
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
								<%
									request.setAttribute("year", "2017");
									request.setAttribute("month", "10");
									request.setAttribute("month_page", "october.jsp");
									if(request.getAttribute("page_count") == null)
										request.getRequestDispatcher("/Month").forward(request, response);
										
									int count = (int)request.getAttribute("page_count");
									int memo_count = (int)request.getAttribute("memo_count");
								
									int count_1 = (int)request.getAttribute("page_count_1");
									int count_10 = (int)request.getAttribute("page_count_10");
									int count_100 = (int)request.getAttribute("page_count_100");
									
									String[] month_page_1 = (String[])request.getAttribute("month_page_1");
									String[] month_page_10 = (String[])request.getAttribute("month_page_10");
									String[] month_page_100 = (String[])request.getAttribute("month_page_100");
									String[] memo_month_page = (String[])request.getAttribute("memo_month_page");
									
									String[] month_title_1 = (String[])request.getAttribute("month_title_1");
									String[] month_title_10 = (String[])request.getAttribute("month_title_10");
									String[] month_title_100 = (String[])request.getAttribute("month_title_100");
									String[] memo_month_title = (String[])request.getAttribute("memo_month_title");

									if(count == 0 && memo_count == 0){
								%>
										<h3>目前無內容！</h3>
								<%
									}else{
								%>
										<h2>2017 年 10 月的文章</h2>
								<%
										if(!(month_page_1[0] == null)){
											for(int i = 0; i < count_1; i ++){
											//continue;
								%>
												<a href="article/<%=month_page_1[i]%>.jsp"><%=month_title_1[i]%></a><br/>
								<%
											}
										}
										if(!(month_page_10[0] == null)){
											for(int i = 0; i < count_10; i ++){
								%>
												<a href="article/<%=month_page_10[i]%>.jsp"><%=month_title_10[i]%></a><br/>
								<%
											}
										}
										if(!(month_page_100[0] == null)){
											for(int i = 0; i < count_100; i ++){
								%>
												<a href="article/<%=month_page_100[i]%>.jsp"><%=month_title_100[i]%></a><br/>
								<%
											}
										}
										if(!(memo_month_page[0] == null)){
											for(int i = 0; i < memo_count; i ++){
								%>
												<a href="article/memo/<%=memo_month_page[i]%>.jsp"><%=memo_month_title[i]%></a><br/>
								<%
											}
										}
									}
								%>
							</article>

						<!-- Pagination -->

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a class="logo"><img src="images/avatar.png" alt="" /></a>
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
												<h3><a href="doshisha_list.jsp">同志社の校園生活</a></h3>
											</header>
											<a href="doshisha_list.jsp" class="image"><img src="images/tag/doshisha_minipost.jpg" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="kyoto_list.jsp">京都の古都記趣</a></h3>
											</header>
											<a href="kyoto_list.jsp" class="image"><img src="images/tag/kyoto_minipost.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="food_list.jsp">美食の食記</a></h3>
											</header>
											<a href="food_list.jsp" class="image"><img src="images/tag/food_minipost.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="travel_list.jsp">日本周遊の旅程</a></h3>
											</header>
											<a href="travel_list.jsp" class="image"><img src="images/tag/travel_minipost.JPG" alt="" /></a>
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
												<h3><a href="september.jsp">九月</a></h3>
												<time class="published" datetime="2017-09">September, 2017</time>
											</header>
											<a href="september.jsp" class="image"><img src="images/tag/Sep.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="october.jsp">十月</a></h3>
												<time class="published" datetime="2015-10-15">October, 2017</time>
											</header>
											<a href="october.jsp" class="image"><img src="images/tag/Oct.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="november.jsp">十一月</a></h3>
												<time class="published" datetime="2015-10-10">November, 2017</time>
											</header>
											<a href="november.jsp" class="image"><img src="images/tag/Nov.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="december.jsp">十二月</a></h3>
												<time class="published" datetime="2015-10-08">December, 2017</time>
											</header>
											<a href="december.jsp" class="image"><img src="images/tag/Dec.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="january.jsp">一月</a></h3>
												<time class="published" datetime="2015-10-06">January, 2018</time>
											</header>
											<a href="january.jsp" class="image"><img src="images/tag/Jan.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="february.jsp">二月</a></h3>
												<time class="published" datetime="2015-10-06">February, 2018</time>
											</header>
											<a href="february.jsp" class="image"><img src="images/tag/Feb.jpg" alt="" /></a>
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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>
