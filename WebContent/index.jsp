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
<% 
	DBConnection dbc = new DBConnection();
	Connection conn = dbc.connect_mysql("KyotoExchangeDB");
	ResultSet rs = null;
	Statement stmt = null;
	
	try {
		// 建立statement
		/*Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmt_row_count = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		*/
		try {
			// 建立SQL查詢
			/* post name for table */
			/*table_name = "post03";
			String sql = "select * from " + table_name;
			rs = stmt.executeQuery(sql);
			
			row_count = stmt_row_count.executeQuery("SELECT * FROM " + table_name);
			while (row_count.next()) {
				post_count ++;
			}
			*/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首頁 | 京都の留學日誌</title>
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
									<li><a href="addArticle.jsp" class="button big fit">New Article</a></li><br/>
									<li><a href="addRecipe.jsp" class="button big fit">New Recipe</a></li>
									<li><a href="addMemo.jsp" class="button big fit">New Memo</a></li>
									<li><a href="addNihongo.jsp" class="button big fit">New Nihongo</a></li><br/>
									<li><a href="Logout" class="button big fit">Log Out</a></li>
									<% 
									}
									%>
								</ul>
							</section>

					</section>

				<!-- Main -->
					<div id="main">
						<%
							if(request.getAttribute("post_count") == null)
								request.getRequestDispatcher("/PostIndex").forward(request, response);
							int post_count = (int)request.getAttribute("post_count");
							String[] post_id_index = (String[])request.getAttribute("post_id_index");
							String[] post_title_index = (String[])request.getAttribute("post_title_index");
							String[] post_year_index = (String[])request.getAttribute("post_year_index");
							String[] post_month_index = (String[])request.getAttribute("post_month_index");
							String[] post_date_index = (String[])request.getAttribute("post_date_index");
							String[] post_tag_index = (String[])request.getAttribute("post_tag_index");
							String[] post_tagCode_index = (String[])request.getAttribute("post_tagCode_index");
							String[] post_intro_index = (String[])request.getAttribute("post_intro_index");
							
							String back_ability = (String)request.getAttribute("back_ability");
							String next_ability = (String)request.getAttribute("next_ability");
						%>
						<!-- Post -->
							<%
								for(int i = 0; i < post_id_index.length; i ++){
									if(post_id_index[i] == null)
										break;
							%>
							<article class="post">
								<header>
									<div class="title">
											<h2><a href="article/<%=post_id_index[i]%>.jsp"><%=post_title_index[i]%></a></h2>
									</div>
									<div class="meta">
										<time class="published" datetime="<%=post_year_index[i]%>-<%=post_month_index[i]%>-<%=post_date_index[i]%>"><%=post_year_index[i]%>年<%=post_month_index[i]%>月<%=post_date_index[i]%>日</time>
										<a href="tag/<%=post_tagCode_index[i]%>.jsp" class="author"><span class="name"><%=post_tag_index[i]%></span><img src="images/tag/<%=post_tagCode_index[i]%>_icon.png" alt="" /></a>
									</div>
								</header>
								<a href="article/<%=post_id_index[i]%>.jsp" class="image featured"><img src="images/cover/<%=post_id_index[i]%>_cover.jpg" alt="" /></a>
								<!-- Abstract -->
								<p><%=post_intro_index[i]%></p>
								<footer>
									<ul class="actions">
										<li><a href="article/<%=post_id_index[i]%>.jsp" class="button big">繼續閱讀</a></li>
									</ul>
								</footer>
							</article>
							<%
								}
							%>

						<!-- Pagination -->
							<ul class="actions pagination">
								<%
									int current_page = 1; // if para is null
									String current_page_para = request.getParameter("page_index"); // Parameter, only String
									if(current_page_para != null)
										current_page = Integer.parseInt(current_page_para);
								%>
								<li><a href="PostIndex?page_index=<%=current_page - 1%>" class="<%=back_ability%> button big previous">前一頁</a></li>
								<%
									int page_index = (post_count / 5) + 1;
									for (int i = 0; i < page_index; i ++){
										if((i + 1) == current_page){
								%>
								<li class="dynamic_page_num"><a id="page_now"><%=i + 1%></a></li>
								<%
										}else{
								%>
								<li class="dynamic_page_num"><a href="PostIndex?page_index=<%=i + 1%>" class="page_index"><%=i + 1%></a></li>
								<%
										}
									}
								%>
								<li><a href="PostIndex?page_index=<%=current_page + 1%>" class="<%=next_ability%> button big next">下一頁</a></li>
							</ul>

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
<%
		} catch (Exception ex) {
			System.out.println("can't read data");
			System.out.println(ex.toString());
		} finally{
			dbc.cleanConnectionObj(rs, stmt, conn);
		}
	} catch (Exception e) {
		System.out.println("can't create statement");
		System.out.println(e.toString());
	}
%>
