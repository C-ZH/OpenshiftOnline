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
<title>【食譜】咖哩飯（カレーライス） | 京都の留學日誌</title>
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
										<h2>【食譜】咖哩飯（カレーライス）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="20170-10-14">2017年10月14日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_16_cover.jpg" alt="" /></span>
								<p>【參考教學】<br/>
								<a href="https://icook.tw/recipes/72143" class="ref" target="_blank">日本家の味道佛蒙特咖哩</a><br/>
								<a href="http://food.ltn.com.tw/article/5410" class="ref" target="_blank">市售咖哩塊為什麼一定要熄火再放入？</a>
								</p>

								<span>【材料】</span>
								<ul>
									<li>馬鈴薯（メークイン） ----- 隨意 <u>※1</u></li>
									<li>紅蘿蔔（人参 にんじん） ----- 隨意</li>
									<li>洋蔥（玉葱 たまねぎ） ----- 隨意</li>
									<li>雞胸肉（鶏むね肉） ----- 隨意 <u>※2</u></li>
									<li>佛蒙特甜味咖哩塊（バーモントカレー 甘口） ----- 1/2 盒</li>
									<li>黑巧克力（ブラックチョコレート） ----- 少量</li>
									<li>橄欖油（オリーブ油） ----- 適量</li>
									<li>水 ----- 600 ml</li>
									<li>白飯（ライス） ----- 隨意</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>馬鈴薯、紅蘿蔔以滾刀切，切大塊備用。 <u>※3</u></li>
									<li>洋蔥切片、肉切塊備用。</li>
									<li>熱鍋加油，放洋蔥中火拌炒，再放肉進去炒。</li>
									<li>炒一陣子後，紅蘿蔔也放下去炒。 <u>※ 4</u></li>
									<li>加水煮至沸騰，放入馬鈴薯。</li>
									<li>中火煮 15 分鐘。</li>
									<li>熄火，加入咖哩塊，並攪拌到溶化。</li>
									<li>開小火，邊攪拌邊煮 5 ~ 10 分鐘，然後加一小塊巧克力。 <u>※5</u></li>
									<li>最後放冷 5 ~ 10 分鐘後再加飯吃，這樣咖哩就不會太稀，聽說也可以比較入味。</li>
								</ol>
								
								<p>
									<u>
									※1 馬鈴薯有分 2 種的樣子，一種比較軟、易爛，日文為男爵芋（だんしゃくいも）；另一種比較硬、耐煮，日文為メークイン。參考自<a href="http://melissakai.pixnet.net/blog/post/26137207-%E6%97%A5%E6%9C%AC%E9%A6%AC%E9%88%B4%E8%96%AF%E7%A8%AE%E9%A1%9E%28%E9%99%84%E5%9C%96%E7%89%87%29" class="ref" target="_blank">日本馬鈴薯種類</a>。<br/>
									※2 其實要用什麼肉都行啦。<br/>
									※3 雖說這裡說用滾刀切，但我刀工太爛都亂切XD<br/>
									※4 其實我只有這次有放紅蘿蔔下去炒，之後都放下去後直接加水。<br/>
									※5 我看《明天，我要和昨天的妳約會》學的，但後來發現我記錯了，男主角巧克力不是加在咖哩，而是加在燉牛肉。
									</u>
								</p>
								<p>【感想】<br/>
								窮學生好夥伴，便宜好吃，煮一次可吃好幾天省時間。
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_16.jsp" data-numposts="5"></div>
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
