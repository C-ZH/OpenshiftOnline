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
<title>旅日札記 | 京都の留學日誌</title>
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
								<header>
									<div class="title">
											<h2><a href="memo.jsp">生活小雜記</a></h2>
									</div>
								</header>
								<a href="memo.jsp" class="image featured"><img src="images/cover/memo_cover.jpg" alt="" /></a>
								<!-- Abstract -->
								<p>把一些比較特別的事情從主要日誌中抽出來單獨寫，內容相當雜，故為雜記。</p>
								<footer>
									<ul class="actions">
										<li><a href="memo.jsp" class="button big">查看文章</a></li>
									</ul>
								</footer>
							</article>

							<article class="post">
								<header>
									<div class="title">
											<h2><a href="recipe.jsp">宅男大主廚</a></h2>
									</div>
								</header>
								<a href="recipe.jsp" class="image featured"><img src="images/cover/recipe_cover.jpg" alt="" /></a>
								<!-- Abstract -->
								<p>隨著來日本的時間漸漸變久了，方便的超市讓我得以盡情玩食物，煮出來的（黑暗）料理也越來越多。最近，漸漸覺得做料理非常有趣！準備晚餐可說是我一天當中最想逃避（因為很麻煩）又最期待的時間（因為很有趣）。<br/>
								因此，想開個區塊來記錄總是說得意料理是泡麵的我，到最後能夠變成什麼樣子。基本上就是寫些不負責任的食譜，若有需要會補充一些日文或我認為的豆知識。反正我的觀念是料理做得開心、吃得安心最重要。簡言之，料理是帶給人們幸福的！</p>
								<p>此外，因為我不是天才，大部分都要先上網看過別人的教學才有辦法做。只是常常做出來和教學不一樣XD 如果我有寫錯或觀念不正確的地方，歡迎糾正！<br/>
								以下附上我常看的幾個教學網站，主要是日式和台式料理：</p>
								<ul>
									<li><a href="https://www.youtube.com/user/masaabc1/playlists" class="ref" target="_blank">MASA の料理 ABC</a>：大推！</li>
									<li><a href="https://www.youtube.com/channel/UCESmkqVGJb5CieOnSK3AXRA/playlists" class="ref" target="_blank">Yuuuma cooking</a>：也大推！</li>
									<li><a href="https://icook.tw/" class="ref" target="_blank">iCook 愛料理</a>：食譜的共享網站。</li>
									<li><a href="http://a0925631.pixnet.net/blog/category/4028843" class="ref" target="_blank">莎莉實驗料理</a>：一開始是因為中華一番找到這個部落格，裡面的料理種類相當豐富！沒有影片，所以我不算常用。</li>
									<li><a herf="http://yui0201.pixnet.net/blog/category/2015060" class="ref" target="_blank">仿妝夭后 Yui </a>：這個其實有段時間沒看了，沒有很推，但還是貼上來存放一下。</li>
									<li>此外，用 Google 找到《料理美食王》、《美食鳳味》、《型男大主廚》等節目的影片也很常用！自由電子報的<a href="http://food.ltn.com.tw/" class="ref" target="_blank">食譜自由配</a>也有不少料理小撇步可參考。</li>
								</ul>
								<p>另外 <a href="https://cookpad.com/" class="ref" target="_blank">cookpad</a> 很有名，但因為沒有影片，還有要付費的機制所以用得不是很順。<br/>
								基本上食譜上面附的日期都是第一次製作的時間，有些可能會持續更新。</p>
								<footer>
									<ul class="actions">
										<li><a href="recipe.jsp" class="button big">查看文章</a></li>
									</ul>
								</footer>
							</article>

							<article class="post">
								<header>
									<div class="title">
											<h2><a href="nihongo.jsp">日語豆知識</a></h2>
									</div>
								</header>
								<a href="nihongo.jsp" class="image featured"><img src="images/cover/nihongo_cover.jpg" alt="" /></a>
								<!-- Abstract -->
								<p>預計放些偶然得知的有趣日語，希望可以用成像音速日語或王可樂那樣好玩。</p>
								<footer>
									<ul class="actions">
										<li><a href="nihongo.jsp" class="button big">查看文章</a></li>
									</ul>
								</footer>
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
