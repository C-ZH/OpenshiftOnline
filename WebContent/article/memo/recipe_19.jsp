<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="model.DBConnection"%> 
<%@ page import="model.Guestbook"%> 

<%!
/*
	String article_title;
	ResultSet rs;
	ResultSet re_rs;
	
	int post_count = 0;
	ResultSet row_count;
*/
	boolean isAdmin = false;
%>
<%

	//Guestbook gb = new Guestbook();

	DBConnection dbc = new DBConnection();
	Connection conn = dbc.connect_mysql("KyotoExchangeDB");
	
	try {
		// 建立statement
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement re_stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		Statement stmt_row_count = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		try {
			// 建立SQL查詢
			//post name for table
			
			//article_title = "article_1";
			//String sql = "SELECT * FROM guestbook WHERE page = '" + article_title + "'";
			//rs = stmt.executeQuery(sql);
			
			//row_count = stmt_row_count.executeQuery(sql);
			// like "index.jsp", it seems that "declaration tag" will only act once
			//post_count = 0;
			/*
			while (row_count.next()) {
				post_count ++;
			}
			*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>【食譜】大阪燒（お好み焼き おこのみやき） | 京都の留學日誌</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- FB Admin -->
<meta property="fb:admins" content="100001781553864"/>

<!--[if lte IE 8]><script src="../../assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../../assets/css/main.css" />
<link rel="stylesheet" href="../../assets/css/page.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<script type = "text/javascript" src = "../../assets/js/page.js"></script>
</head>
	<body class="single">

	<!-- FB Comment Javascript SDK -->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
  	var js, fjs = d.getElementsByTagName(s)[0];
  	if (d.getElementById(id)) return;
  	js = d.createElement(s); js.id = id;
  	js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.10";
  	fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="../../index.jsp">京都の留學日誌</a></h1>
						<nav class="links">
							<ul>
								<li><a href="../../about.jsp">關於站主</a></li>
								<li><a href="../../article.jsp">旅日札記</a></li>
								<li><a href="../../album.jsp">生活相簿</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="../../Search">
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
								<form class="search" method="get" action="../../Search">
									<input type="text" name="query" placeholder="Search" />
									<input type="submit" value="搜尋"/>
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
								<li>
										<a href="../../about.jsp">
											<h3>關於站主</h3>
										</a>
									</li>
									<li>
										<a href="../../article.jsp">
											<h3>旅日札記</h3>
										</a>
									</li>
									<li>
										<a href="../../album.jsp">
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
									<li><a href="../../login.jsp" class="button big fit">Log In</a></li>
									<% 
									}else{
									%>
									<li><a href="../../Logout" class="button big fit">Log Out</a></li>
									<% 
									}
									%>
								</ul>
							</section>

					</section>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2>【食譜】大阪燒（お好み焼き おこのみやき）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="20170-10-24">2017年10月24日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_19_cover.jpg" alt="" /></span>
								<p>【參考教學】<br/>
								<a href="http://yui0201.pixnet.net/blog/post/193586097-%5Byui-%E8%B6%85%E7%B0%A1%E5%96%AE%E9%A3%9F%E8%AD%9C%5D-%E5%A4%A7%E9%98%AA%E7%87%92%EF%BC%88%E3%81%8A%E5%A5%BD%E3%81%BF%E7%84%BC%E3%81%8D%EF%BC%89%E8%BC%95%E9%AC%86" class="ref" target="_blank">大阪燒（お好み焼き）輕鬆做 ＊ 便宜簡單又美味</a><br/>
								<a href="https://www.youtube.com/watch?v=1e2rSilN5Z0" class="ref" target="_blank">【做菜#10】必吃的日本大阪料理！大阪燒</a><br/>
								<a href="https://www.youtube.com/watch?v=orD3xAS4h-k" class="ref" target="_blank">海鮮鬆軟大阪燒做法</a>
								</p>

								<span>【材料】</span>
								<ul>
									<li>低筋麵粉（薄力粉 はくりきこ） ----- 目測 100 g</li>
									<li>豬肉片（豚バラスライス） ----- 1 盒</li>
									<li>高麗菜（キャベツ） ----- 適量</li>
									<li>雞蛋（鶏卵） ----- 1 顆</li>
									<li>水 ----- 適量 <u>※1</u></li>
									<li>橄欖油（オリーブ油） ----- 適量</li>
									<li>醬油膏 ----- 隨意 <u>※2</u></li>
									<li>美乃滋（マヨネーズ） ----- 隨意</li>
									<li>海苔粉（青のり） ----- 隨意</li>
									<li>柴魚片（削りぶし けずりぶし） ----- 隨意</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>高麗菜洗好切小片備用。</li>
									<li>麵粉加水攪拌成麵糊。 <u>※3</u></li>
									<li>把麵糊、雞蛋加到高麗菜片中，輕輕攪拌均勻，避免太大力產生麵筋。</li>
									<li>平底鍋加油熱鍋，把調好的高麗菜麵糊放下去煎，並迅速將之推成圓形。</li>
									<li>麵糊上面放肉片，煎 3 分鐘。</li>
									<li>翻面後，蓋鍋蓋煎 3 分鐘。</li>
									<li>打開鍋蓋，再翻面煎 3 分鐘。</li>
									<li>翻面繼續煎，煎好後起鍋。</li>
									<li>淋上醬油膏，再依序加上美乃滋、海苔粉、柴魚片。</li>
								</ol>
								
								<p>
									<u>
									※1 也可用高湯或牛奶。<br/>
									※2 懶得買大阪燒醬，直接用台灣的醬油膏XD<br/>
									※3 在做麵糊時有個很重要的原料，那就是山藥泥（とろろ），聽說沒有會差很多，但我不想買特地磨泥板就都沒有加。順帶一提，山藥是叫做「山の芋」。<br/>
									</u>
								</p>
								<p>【感想】<br/>
								大阪燒的日文，其實就是你喜歡放什麼就放什麼的意思，很自由。製作時間不長，煎的關鍵神秘數字 333 記起來就很好做。
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_19.jsp" data-numposts="5"></div>
								</div>
							</article>
					</div>

				<!-- Footer -->
					<section id="footer">
						
						<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</section>

			</div>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/skel.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="../../assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../../assets/js/main.js"></script>

	</body>
</html>

<%

		} catch (Exception ex) {
			System.out.println("can't read data");
			System.out.println(ex.toString());
		} finally{
			//dbc.cleanConnectionObj(rs, stmt, conn);
			// Connection could be re-closed?
			//dbc.cleanConnectionObj(re_rs, re_stmt, conn);
		}
	} catch (Exception e) {
		System.out.println("can't create statement");
		System.out.println(e.toString());
	}

%>
