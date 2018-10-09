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
<title>【雜記】日本住宿──網咖 | 京都の留學日誌</title>
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
										<h2>【雜記】日本住宿──網咖</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-17">2017年11月17日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/memo_img/memo_02_cover.jpg" alt="" /></span>
								<p>這次去東京，上網作功課時發現就算是膠囊旅館，動輒也要 2500 日圓以上。住宿的部分想說只有一晚，就選擇網咖來住。</p>
								<p>這次選擇了 <a href="http://manboo.co.jp/" class="ref">MANBOO</a> 這間「漫畫喫茶」。</p>
								<p><u>價格部分</u><br/>
								他們雖然是連鎖店，但很神奇地是各店差異極大，連離不到一公里的店面都有差。像澀谷的宇田川町店假日 8 小 1800 日圓，同樣在澀谷的センター街店假日 8 小 2100 日圓。<br/>
								對了，消費方案有分為平日和假日兩種價格。我原本想利用平日晚上才有的夜間特別方案， 10 小 1500 日圓而已。沒想到他們說<b>星期五晚上算是假日時段</b>QQ 只好用一般假日的 8 小 1800 日圓。<br/>
								要注意的是時間到了店員不會提醒你，要自己注意時間，超時的話可是要加錢的。</p>
								<p><u>住宿部分</u><br/>
								裡面都是包廂型的個室，都配有 1 台電腦、1 隻耳機、1 個保險箱和 2 個插座，也都有 Wi-Fi 可用。包廂內有分為電腦椅和像是皮革沙發材質的通鋪兩種配置，目的若是睡覺，當然要選擇通鋪型的。<br/>
								一人可免費洗澡 30 分鐘，但要事先登記，當輪到你的時候會來你的包廂敲門提醒。若沒有帶衣服或盥洗用品都可以在店內買，價格還算合理。<br/>
								廁所和洗澡間都還算乾淨，洗完澡後也看到店員好像有進去打掃。吹風機可免費借用，女生的話好像還可以借一些其他的梳洗用品。</p>
								<p>包廂有分吸菸間和禁菸間，但飲料機位在吸菸間，因此去到飲料時還是會聞到些許菸味。此外，包廂的隔音並不好，會聽到隔壁的人做動作的聲音，打呼聲、嘆息聲也都聽得到，能否待得安穩很看運氣。<br/>
								通鋪型包廂的長度我用自己來量，躺下來伸直身體剛剛好，跟我差不多高，所以估計是 180 公分上下。</p>
								<p><u>附加服務方面</u><br/>
								裡面除了如同傳統網咖可以用電腦之外，店內還有好幾櫃的漫畫可以看到飽的服務，當然也不只有漫畫，我看到還有雜誌之類的書籍。電腦就是普通的電腦，雖有些可用的特殊網站，但對我而言有跟沒有一樣。漫畫倒是比較有趣XD 畢竟是日文原文的漫畫耶！<br/>
								我覺得最能弄回本的是飲料喝到飽！店內有幾台飲料機可以免費喝，像是可樂、紅茶、可爾必思、草莓牛奶、咖啡等基本款項都有。飲料種類頗多，雖然都看得出成本不高。<br/>
								還有一些食物販賣機，賣薯條、炸雞之類的，但不是免費的。其實可以帶外食進去沒關係，因此我認為用不太到。</p>
								<p>總結而言，如果洗澡時間小於 30 分鐘、睡覺時能忍受可能出現的奇怪聲音（不一定有，像我就沒遇到太奇怪的）、早上自己起得來、身高沒有非常高，那就可以考慮住網咖過夜！基本上安全性應該沒問題啦，但住的客人大致上男性遠大於女性，因此女生要住的話建議想清楚再住。</p>
								<p>題外話，最近聽說一個什麼「Airbnb」可以住到更便宜的房間，似乎是遊走在法律邊緣的產物，但如果研究過後真的比較便宜，我之後還是會想試試看啦！畢竟在充足安全性的條件下，便宜最重要。</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/memo/memo_02.jsp" data-numposts="5"></div>
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
