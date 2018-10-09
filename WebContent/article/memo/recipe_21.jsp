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
<title>【食譜】蛋包飯（オムライス） | 京都の留學日誌</title>
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
										<h2>【食譜】蛋包飯（オムライス）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="20170-10-26">2017年10月26日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_21_cover.jpg" alt="" /></span>
								
								<p>蛋包飯打算花比較多篇幅寫，畢竟做的次數也應該是最多XD<br/>
								大致上有分成 2 種蛋包飯，一種是比較傳統的作法，蛋皮較熟，稱為<b>「元祖オムライス」</b>；另一種是比較新潮的作法，因 1985 年的電影《蒲公英（タンポポ）》而有名，因此稱為<b>「タンポポオムライス」</b>，蛋皮較傳統的作法滑嫩。<br/>
								我找到的教學，同樣的作法差異不少，因此我就打自己研究過後的作法，不確定是否正確。<br/>
								以下直接把這 2 種分別介紹，MASA 那個自己研發的第 3 種就不提了。另外，裡面如果要包炒飯，<a href="recipe_35.jsp" class="ref">炒飯的食譜</a>在這裡～</p>
								<p>【參考教學】<br/>
								<a href="https://www.youtube.com/watch?v=MHe8p1xiqSs" class="ref" target="_blank">蛋包飯、 好吃的蛋包飯、日式蛋包飯</a><br/>
								<a href="https://www.youtube.com/watch?v=bsLHd6mHpDU" class="ref" target="_blank">美味！2種日式蛋包飯的做法</a><br/>
								<a href="https://www.youtube.com/watch?v=eC0cIQwAZUU" class="ref" target="_blank">3種蛋包飯 &amp; 雞肉蕃茄炒飯~加強版</a><br/>
								</p>

								<b>元祖オムライス</b><br/>
								<span>【材料】</span>
								<ul>
									<li>飯（ライス） ----- 適量</li>
									<li>雞蛋（鶏卵） ----- 2 ~ 3 顆</li>
									<li>鹽（塩） ----- 適量</li>
									<li>番茄醬（ケチャップ） ----- 隨意</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>打蛋，然後加鹽再打。</li>
									<li>加油中小火熱鍋，倒入蛋液，並迅速用筷子不停畫圈攪拌。 <u>※1</u></li>
									<li>攪拌得差不多後，轉鍋子讓蛋液均勻分布，並轉小火靜置一段時間讓蛋皮定型。</li>
									<li>熄火，把飯放在蛋皮上。</li>
									<li>開中火，讓蛋皮可以滑動後，包著飯滑到盤子上。</li>
									<li>淋上番茄醬完成。</li>
								</ol>
								
								<p>
									<u>
									※1 這好像是歐姆蛋作法，我也不確定。另外想要蛋皮內比較不熟的話，這步可以開大火，然後直接跳下下一步放飯。
									</u>
								</p>
								<p>【感想】<br/>
								為了學做蛋包飯吃超多次了，但我到現在還是沒能很好地把蛋皮從平底鍋滑下去。
								</p>

								<b>タンポポオムライス</b><br/>
								<span>【材料】</span>
								<ul>
									<li>飯（ライス） ----- 適量</li>
									<li>雞蛋（鶏卵） ----- 3 顆</li>
									<li>鹽（塩） ----- 適量</li>
									<li>番茄醬（ケチャップ） ----- 隨意</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>先把飯裝在盤子上塑好形狀備用。</li>
									<li>打蛋，然後加鹽再打。</li>
									<li>加油中小火熱鍋，倒入蛋液，並迅速用筷子不停畫圈攪拌。</li>
									<li>攪拌得差不多後，平底鍋向前傾斜拿，將蛋皮往上折 3/4，再把前端 1/4 往自己的方向折。</li>
									<li>翻面，待蛋皮黏合後，以黏合縫隙朝下的樣子滑到飯上面。</li>
									<li>用菜刀劃開蛋皮攤開，淋上番茄醬完成。</li>
								</ol>

								<p>【感想】<br/>
								捲起來的形狀不好用。
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_21.jsp" data-numposts="5"></div>
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
