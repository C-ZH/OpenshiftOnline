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
<title>【雜記】夜行巴士 | 京都の留學日誌</title>
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
										<h2>【雜記】夜行巴士</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-17">2017年11月17日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/memo_img/memo_01_cover.jpg" alt="" /></span>
								<p>就我目前的整理，在日本要做國內陸上長距離的移動有以下三種方式：<br/>
								搭飛機：廉航很多便宜的國內線機票。<br/>
								乘電車：不解釋，各地差異太大很難說明。但有個全國 JR 都可用的<a href="http://www.jreast.co.jp/tc/pass/seishun18.html" class="ref">青春十八套票</a>，要注意只能普通車廂自由座席。<br/>
								坐巴士：長途巴士也很多，晚上發車的夜行巴士相當便宜，超級推薦！</p>
								<p>若有觀光簽證（最多 90 天的短期居留），可選擇的方式又會更多，例如 <a href="https://www.westjr.co.jp/global/tc/ticket/icoca-haruka/" class="ref">ICOCA &amp; HARUKA 套票</a>，以及其他有的沒有的套票。<br/>
								像我現在沒有觀光簽證的情況下，就只能利用前面提到的三種方式，但相對就不用做太多功課XD<br/>
								然而，京都並沒有機場，所以搭飛機不考慮，若我住在大阪或東京，或是要去和本島不相連的北海道、沖繩才會考慮；電車可能比較便宜沒錯，但轉車的時間成本也是頗高。</p>
								<p>夜行巴士顧名思義就是晚上的巴士，只要是過了 21 : 00 發車就會被歸類在夜行巴士。基本上票價會比早上的昼行巴士便宜非常多，以離峰時段的京都到東京為例，昼行巴士便宜的單程票價落在 5000 日圓左右，但夜行巴士落在 2000 日圓左右，最便宜的看過 1600 日圓。附帶一提，來日本的第一天，我從大阪機場搭巴士到京都車站花了 2550 日圓。<br/>
								</p>
								<p>前面提及的離峰時段，指的是<b>星期一到星期四</b>的晚上，非特殊節日的話很好買到 2500 日圓以下的車票。星期五、六、日三天的票價會翻倍，不過還是比昼行巴士便宜啦！<br/>
								以我這次的車資為例，星期四晚上的去程是 2000 日圓，星期六晚上的返程是 4800 日圓。</p>
								<p>日本的長途巴士公司非常非常多家，不像台灣大致上就是統聯、國光、噶瑪蘭那幾家。以下提供一個夜行巴士的比價網站<a href="https://www.bushikaku.net/" class="ref">夜行バス比較なび</a>，其實很像是廣告打很兇的 TrivagX，或查飛機的 skyscanneX（但真心認為比 Xrivago 和 Xkyscanner好用，價格很準）。<br/>
								輸入條件後，顯示的是不同巴士公司不同班次的票價，也有呈現出該班巴士的一些特色，例如有沒有提供毛毯？有沒有插座？男女是否會分開坐？ 還可以直接連結到那班車得巴士公司訂票網站。</p>
								<p>到了該公司的訂票網站，通常還要加入他們的會員才可以用網路訂票。<br/>
								另外，夜行巴士的票價其實會浮動，比較晚買可能可以買到較便宜的清倉特割價，像我從東京回來的車票就是特割。但晚買當然也可能都沒票，只剩貴的車票，就看願不願意賭，離峰的票通常已經很便宜了，建議非離峰時段再考慮就好。</p>
								<p>京都有 2 個比較大的乘車地點，一個在京都車站八條口附近，另一個在長岡京市。八條口附近雖然離宿舍很近，但真的很複雜，若不是我前一個星期有先去探路，可能就無法準時到八條口。<br/>
								到了八條口，整條街都是巴士搭乘點，常常的街上有大約十個乘車點，要搭的巴士要在哪個地方等也必須先注意。像我那天就搞錯地點，最後十分鐘連滾帶爬才在前 2 分鐘趕到正確的乘車點。</p>
								<p>以上是在京都搭夜行巴士的介紹，接著聊一下我這次的乘坐體驗。</p>
								<p>夜行巴士很像廉航，拿著行動載具打開訂票的 Email 給站務員看就可上車，雖然我看站務員都沒看啦XD 只會問你的名字，然後跟你說被安排到哪個座位（座位當天才會知道，無法事先選位）。</p>
								<p>大型行李就像一般的長途巴士可在上車前寄放，隨身行李也可放置在座位上方。<br/>
								因為是秋天快冬天了，車上開著超強的暖氣，我去的時候忘記帶水，整個喉嚨非常乾，身體也會很不舒服，回程時很難得地買了罐飲料就挺舒適了。一上車時，座位上雖放有毛毯，但因為暖氣很強所以其實用不太到XD</p>
								<p>剛上車時會開著燈，過了一段時間就會關燈，因此想滑手機或看書來打發時間不太可行，但那個時段正常來說都需要睡覺啦XD<br/>
								路途中可能會停靠休息站，因此想上廁所可以乘機去。此時因為會開著車門，去程時坐在第二排，涼風灌進來結果被冷醒XD 有些班次的巴士是有附廁所的車種，就比較沒有這個問題了。</p>
								<p>晚上開車的好處就是不太會塞車，去程和回程都比預定時間早不少到達目的地。當然如果該站不是終點站的話，還是會等到發車時間再發。</p>
								<p>整體而言，我搭的是最擠的車種（一列 4 席），座位不大，但比廉航捷星的座位大，如果你和旁邊的人都是正常體型的話並沒有太大的問題。<br/>
								開車的路途也沒有什麼顛頗的感覺，我都有睡著。總結來說，我認為離峰時段的 CP 值超高！給有興趣的人參考囉～</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/memo/memo_01.jsp" data-numposts="5"></div>
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
