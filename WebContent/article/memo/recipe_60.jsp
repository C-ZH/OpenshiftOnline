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
<title>【食譜】乾咖哩（ドライカレー） | 京都の留學日誌</title>
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
										<h2>【食譜】乾咖哩（ドライカレー）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-01-14">2018年1月14日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_60_cover.jpg" alt="" /></span>
								<p>【參考教學】<br/>
								《天真與閃電》動畫第 9 話〈うちのおうちカレー〉<br/>
								《天真與閃電》漫畫第 12 話〈うちのおうちカレー〉
								</p>

								<span>【材料】</span>
								<ul>
									<li>茄子（なす） ----- 2 條</li>
									<li>芹菜（セロリ） ----- 2 根</li>
									<li>青椒（ピーマン） ----- 5 顆</li>
									<li>洋蔥（玉葱） ----- 1 顆</li>
									<li>紅蘿蔔（人参） ----- 1 條</li>
									<li>蘋果（りんご） ----- 1/2 顆</li>
									<li>雞胸肉（鶏むね肉） ----- 1 片</li>
									<li>蒜頭（にんにく） ----- 2 瓣</li>
									<li>薑（生姜 しょうが） ----- 適量</li>
									<li>佛蒙特中辛咖哩塊（バーモントカレー 中辛） ----- 4 小塊</li>
									<li>番茄醬（ケチャップ） ----- 適量</li>
									<li>鹽（塩） ----- 適量</li>
									<li>橄欖油（オリーブ油） ----- 適量</li>
									<li>高湯（出汁） ----- 300 ml</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>把茄子、芹菜、青椒、洋蔥、紅蘿蔔全部切丁，薑、蒜切成末備用。</li>
									<li>雞胸肉剁成肉末備用。 ※1</li>
									<li>咖哩塊切成蒜末備用。 ※2</li>
									<li>加油中小火熱鍋，放入薑末、蒜末爆香。</li>
									<li>爆香完後，加入洋蔥。</li>
									<li>加入紅蘿蔔、芹菜、茄子下去炒。</li>
									<li>加入豬肉末下去炒。</li>
									<li>以上都炒熟之後，加入咖哩粉、鹽一起炒。</li>
									<li>加番茄醬一起炒。</li>
									<li>加入高湯，然後放入蘋果、青椒，轉大火約 10 分鐘收汁。 ※3</li>
								</ol>
								
								<p>
									<u>
									※1 可直接用絞肉，但都是雞肉，絞肉的價格貴 2 倍，所以我自己剁。
									※2 也可用咖哩粉，我是手上沒有咖哩粉才這樣做。
									※3 食譜上是說 20 分啦，但我實作覺得 10 分就差不多了。
									</u>
								</p>
								<p>【感想】<br/>
								這應該是我來日本以來最認真的一次XD 切丁真的有夠麻煩，但切完後就很好做了。<br/>
								我幾乎按照劇情裡給的食譜做了，只差在沒放葡萄乾（要放的話再放蘋果、青椒那邊一起放）。吃起來有點像咖哩口味的肉醬，但不得不說，加了番茄醬後味道差超多！神奇啊。
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_60.jsp" data-numposts="5"></div>
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
