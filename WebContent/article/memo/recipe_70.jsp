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
<title>【甜點食譜】地瓜鮮奶油可麗餅（さつまいもクレープ） | 京都の留學日誌</title>
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
										<h2>【甜點食譜】地瓜鮮奶油可麗餅（さつまいもクレープ）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-02-05">2018年2月5日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_70_cover.jpg" alt="" /></span>
								<p>【參考教學】<br/>
								《天真與閃電》動畫第 11 話〈おゆうぎ会とさつまいもクレープ〉<br/>
								《天真與閃電》漫畫第 17 話〈おゆうぎ会とさつまいもクレープ〉
								</p>

								<span>【材料】</span>
								<ul>
									<li>地瓜（薩摩芋 さつまいも） ----- 2顆</li>
									<li>鮮奶油（ホイップ） ----- 300g</li>
									<li>砂糖（砂糖） ----- 30g（鮮奶油打發用）、20g（麵皮用）、30g（內餡用）</li>
									<li>低筋麵粉（薄力粉） ----- 80g</li>
									<li>雞蛋（鶏卵） ----- 2 顆</li>
									<li>無鹽奶油（バター） ----- 20g（麵皮用）、20g（煎麵皮用）</li>
									<li>牛奶（牛乳） ----- 250 ml（麵皮用）、100 ml（內餡用）</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>250 ml牛奶倒出來，放到常溫。</li>
									<li>奶油加到平底鍋，中火融化。等到全部融化後熄火，放到濕抹布上降溫。</li>
									<li>低筋麵粉過篩。</li>
									<li>把20g 砂糖加到麵粉內，並將雞蛋打進去中間。</li>
									<li>把一塊新的奶油倒入麵粉。</li>
									<li>麵粉邊加入常溫的牛奶邊攪拌，完成麵皮液。</li>
									<li>把麵粉液用包鮮膜封起來，放到冰箱冷藏 1 小時。</li>
									<li>地瓜削皮，切成小塊備用。</li>
									<li>切好的地瓜泡在清水 10 分鐘。</li>
									<li>水倒掉，再加入 1 大匙的水後，放到微波爐 5 分鐘，加熱至能以牙籤刺穿的程度。</li>
									<li>牛奶加熱到沸騰備用。</li>
									<li>把微波好的地瓜搗碎，並加入砂糖和熱牛奶，完成地瓜內餡。</li>
									<li>鮮奶油打發備用。</li>
									<li>前面放在濕毛巾上的平底鍋中火加熱後，把麵皮液舀一杓倒入平底鍋。</li>
									<li>麵皮邊緣有點變成茶色後熄火，用雙手翻麵皮，再煎 25 秒左右。</li>
									<li>煎好的麵皮放上鮮奶油和地瓜內餡，捲起來完成！</li>
								</ol>
								
								<p>【感想】<br/>
								當初看動畫時覺得為何餅皮會有奇怪的痕跡，實際做之後還真的一模一樣！<br/>
								地瓜本身就很甜，所以糖不用加太多也很好吃。是說不知道可麗餅的外形是否有強制規定要是捲筒狀，看劇中他們餅皮形狀都亂玩XD
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_70.jsp" data-numposts="5"></div>
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
