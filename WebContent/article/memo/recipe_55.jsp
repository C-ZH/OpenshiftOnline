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
<title>【甜點食譜】草莓生乳酪蛋糕（ショートケーキ） | 京都の留學日誌</title>
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
										<h2>【甜點食譜】草莓生乳酪蛋糕（ショートケーキ）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-01-07">2018年1月7日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_55_cover.jpg" alt="" /></span>
								<p>【參考教學】<br/>
								<a href="https://icook.tw/recipes/190972" class="ref" target="_blank">【免烤箱】特濃草莓生乳酪蛋糕</a>
								</p>

								<span>【材料】</span>
								<ul>
									<li>草莓（いちご） ----- 14 顆</li>
									<li>消化餅乾（ビスケット） ----- 約 56 g</li>
									<li>無鹽奶油（バター） ----- 目測 30 g</li>
									<li>奶油乳酪（クリームチーズ） ----- 225 g</li>
									<li>草莓優格（いちごヨーグルト） ----- 75 g</li>
									<li>植物性鮮奶油（ホイップ） ----- 100 g、目測 100 g ※1</li>
									<li>砂糖（砂糖） ----- 目測 50 g、目測 10 g</li>
									<li>吉利丁粉（粉ゼラチン） ----- 目測 7 g</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>奶油乳酪放室溫 1 小時軟化備用。</li>
									<li>消化餅乾放在塑膠袋敲成粉末。</li>
									<li>無鹽奶油拿去微波熔化，加到餅乾粉末內攪拌。</li>
									<li>將攪好的餅乾粉末倒到烤模底部，用力壓平後拿去冷藏 30 分鐘。</li>
									<li>把 100 g 鮮奶油和 10 g 砂糖混在一起攪拌，打到看起來有紋路，但是整體仍會流動的狀態即可。打好後拿去冷藏備用。</li>
									<li>草莓拿 7 顆切半，並用廚房紙巾擦乾水分。</li>
									<li>往裝有吉利丁粉的容器內倒入 5 倍重量的冷水，攪拌備用。</li>
									<li>吉利丁水加到鮮奶油裡攪拌備用。</li>
									<li>起司乳酪加入 50 g 砂糖後，以隔水加熱的方式打到軟，打到滑順漂亮有光澤即可。</li>
									<li>吉利丁水加到前述步驟中完成的奶油乳酪裡，然後加入前面打好的鮮奶油，以及草莓優格。</li>
									<li>將切半的的草莓，圍著 6 吋蛋糕模外圈排列成圈。然後倒入上一步中完成的慕斯。</li>
									<li>放到冰箱冷藏 6 小時。</li>
									<li>把鮮奶油打發成奶霜（whipped cream）備用。 ※2</li>
									<li>冰好的蛋糕拿出來，擠上已成奶霜的鮮奶油作裝飾，並在上面放上完整的草莓。最後將奶霜鮮奶油塗於側面完成！</li>
								</ol>
								
								<p>
									<u>
									※1 食譜上是說動物性鮮奶油啦，但我手上只有植物性，不知道會有什麼差。<br/>
									※2 我是用手打，大概打了 5 小時，有夠累QQ 後來聽說可以裝到空罐裡用力搖就好，可惡。
									</u>
								</p>
								<p>【感想】<br/>
								時間花太多… 但以自己做的標準來看還算好吃。<br/>
								ショートケーキ（shortcake）原意似乎是泛指水果蛋糕，但在日本聽到都會先想到草莓蛋糕，可以說是草莓蛋糕的代稱了。順道一提，泡芙的日文跟這個很像，叫做シュークリーム。
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_55.jsp" data-numposts="5"></div>
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
