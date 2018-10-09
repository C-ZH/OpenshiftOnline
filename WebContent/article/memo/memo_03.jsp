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
<title>【雜記】2017 亞冠賽觀戰 @ 東京巨蛋 | 京都の留學日誌</title>
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
										<h2>【雜記】2017 亞冠賽觀戰 @ 東京巨蛋</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-18">2017年11月18日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/memo_img/memo_03_cover.jpg" alt="" /></span>
								<p>這次來東京的最主要目的就是為了到東京巨蛋看亞冠賽，在超市買了毛豆和代表日本的納豆壽司後就準備入場。</p>
								<p>我買的是靠中華隊休息室，附有日本武士隊球衣的位置。進去巨蛋前先去領了球衣，沒想到只有提供一個尺寸，對我來說是相當大件的一件球衣。<br/>
								雖說是靠近中華隊的三壘側，但周圍根本都是日本人嘛！我看隔壁排不知為何好像不少台灣人，而且官方派來的啦啦隊也在那排的前方進行應援… 可惜離我離得很遠。有位帶了 2 位小孩的媽媽，也像我一樣在離得遠遠的位置默默揮著國旗加油。</p>
								<p>即使如此，我也還是提起不怕被周圍白眼或是毆打的勇氣，拿出帶來的國旗幫中華隊加油！<br/>
								首先是雙方球員的介紹，基本上球迷人數的差異，就決定了球員所擁有的歡呼聲。然而，中華隊中有兩位的歡呼聲特別大聲：一位是陽岱鋼（以下簡稱 YOH），另一位是吳念庭（以下簡稱西瓜子）。<br/>
								YOH 不用說，在火腿時就算是看板球星，來到巨人後球迷人數只會增加不會減少；西瓜子與其說被歡呼，不如說是在噓他，因為他姓吳，而日本看球時的噓聲就是「嗚嗚嗚」的聲音，因此他出場時就是超大聲的「嗚嗚嗚」，個人覺得這樣很沒品。<br/>
								這批球員中，我最喜歡的是陳冠宇，因此給他的歡呼聲也最大聲。</p>
								<span class="image fit"><img src="../../images/memo_img/memo_03_chen.jpg" alt="" />（陳冠宇的介紹）</span>
								<p>第一局時，郭阜林（以下簡稱 -0）的一個守備就讓周圍的日本球迷都說「結構うまい！（中華隊不錯耶！）」感覺就是標準的捧殺。<br/>
								YOH 是中華隊第一位打出安打的球員。第一個守備機會成功時，聽到有日本球迷說「さすが陽岱鋼！（真不愧是陽岱鋼！）」在日本的人氣真的也很高！<br/>
								另外，日本人真的認識王柏融（以下簡稱大王）！有個大王得點圈的打席，聽到日本球迷說「こいつだ（是這傢伙啊）」才確信不是 PTT 在亂講，日本真的有在關注大王。<br/>
								這場比賽我覺得表現最好的是朱育賢（以下簡稱已婚），打出去的球都很扎實，也在大幅落後的情況下轟出一發陽春砲；投手林政賢也還不錯，表現得中規中矩；-0 雖然一直被酸，但我覺得這場的守備都做得很好。</p>
								<p>還記得第三局是中華隊的大局，當時台灣球迷的氣氛超熱血！現在想起來還是很感動。後方有熱情球迷在喊各個球員的加油口號，我也有跟著喊XD 感覺真的很棒！連日本人都在說「燃えて来た！（感覺燃起來了！）」<br/>
								第九局時，一邊擔心著趕不上巴士，希望趕快結束；另一邊又希望中華隊可以逆轉勝。可惜最後還是輸了。<br/>
								到後面局數時，有台灣球迷拿出瓦斯喇叭，以及在對方打者打擊時不斷喊三振，雖然這些行為我不是很喜歡，但帶口號的也是他們，還是很感謝他們跟啦啦隊一起帶動氣氛。</p>
								<p>我把比賽中觀察到的一些有趣現象條列出來：
									<ul>
										<li>日本球迷很多都看完第三局就先離開，到了第六局或第七局又回來。原因不明。</li>
										<li>日本從頭到尾都是領先，尤其大幅領先後感覺相當開心，啤酒妹突然變得超忙，在第七局時所有啤酒就已經完售了。</li>
										<li>台灣的加油方式日本球迷似乎也滿喜歡的XD 日本的加油方式很單調，就是手舉起來唸固定的口號而已，不像台灣有球員的個人加油口號和舞步。看到旁邊有位媽媽帶小孩來看球，小孩一直跟著啦啦隊模仿大王和已婚的加油動作XD 其實也不只這位小朋友啦，不少日本人都在跟著跳。</li>
										<li>前面一排的中年男子一直拿手機在拍中華隊的啦啦隊。</li>
										<li>前面一排除了很多中年男子，還有幾位國中學生，手上都拿著巨人的加油棒。其實有點意外，因為聽說現在日本年輕一代比較瘋足球。這些女學生在第九局時還有日本人因為快要贏球太開心而送他們餅乾吃，羨慕呀！</li>
									</ul>
								</p>
								<p>以上，就是這次的東京巨蛋看球體驗，雖然花了不少錢來，但是值得的！</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/memo/memo_03.jsp" data-numposts="5"></div>
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
