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
<title>【甜點食譜】起司蛋糕 | 京都の留學日誌</title>
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
										<h2>【甜點食譜】起司蛋糕</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="20170-12-16">2017年12月16日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_41_cover.jpg" alt="" /></span>
								<p>【參考教學】<br/>
								<a href="https://www.youtube.com/watch?v=ZYCWHPirvtQ" class="ref" target="_blank">免烤箱生乳酪蛋糕 超簡單零失誤 #10</a>
								</p>

								<span>【材料】</span>
								<ul>
										<li>消化餅乾（ビスケット） ----- 100 g <u>※1</u></li>
									<li>無鹽奶油（バター） ----- 目測 40 g</li>
									<li>吉利丁粉（粉ゼラチン こなゼラチン） ----- 目測 6 g</li>
									<li>鮮奶油（ホイップ） ----- 100 ml</li>
									<li>奶油乳酪（クリームチーズ） ----- 目測 200 g</li>
									<li>砂糖（砂糖） ----- 目測 50 g</li>
									<li>豆漿（豆乳 とうにゅう） ----- 100 ml <u>※2</u></li>
									<li>檸檬汁（レモン汁 レモンじる） ----- 30 g <u>※3</u></li>
									<li>水 ----- 適量</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>奶油乳酪放室溫半小時軟化備用。</li>
									<li>消化餅乾放在塑膠袋敲成粉末。</li>
									<li>無鹽奶油拿去微波熔化，加到餅乾粉末內攪拌。</li>
									<li>將攪好的餅乾粉末倒到烤模底部，用力壓平後拿去冷凍。</li>
									<li>吉利丁粉倒入 5 倍重量的冷水，攪拌備用。 <u>※4</u></li>
									<li>吉利丁水加到鮮奶油裡攪拌備用。</li>
									<li>起司乳酪打軟，加入砂糖繼續打。</li>
									<li>加入豆漿繼續打。</li>
									<li>加入檸檬汁繼續打。</li>
									<li>加入鮮奶油繼續打，完成慕斯。</li>
									<li>取出冷凍過的餅乾底座，把慕斯進去。</li>
									<li>稍微敲一下烤模擠出空氣後，拿去冷凍 6 ~ 8 小時。</li>
									<li>冷凍好後，烤模周圍圍著熱毛巾脫模，放在冷藏軟化一下再吃。</li>
									<li>若要切片，將菜刀泡熱水後以熱刀切，避免沾黏。</li>
								</ol>
								
								<p>
									<u>
									※1 第一次做時沒買到，改用其他的餅乾。<br/>
									※2 我沒優酪乳，改用豆漿代替。<br/>
									※3 第一次做時忘記加，但好像也還可以吃。<br/>
									※4 第一次做時忘記泡水了…
									</u>
								</p>
								<p>【感想】<br/>
								還不錯，但豆漿味道不合。
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_41.jsp" data-numposts="5"></div>
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
