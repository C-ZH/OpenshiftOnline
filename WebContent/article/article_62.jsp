<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="model.DBConnection"%> 
<%@ page import="model.Guestbook"%> 

<%!
	String article_title;
	ResultSet rs;
	ResultSet re_rs;
	
	int post_count = 0;
	ResultSet row_count;
	
	int article_count;
	ResultSet article_row_count;
	
	boolean isAdmin = false;
%>
<% 
	Guestbook gb = new Guestbook();

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
			/* post name for table */
			article_title = "article_62";
			String sql = "SELECT * FROM guestbook WHERE page = '" + article_title + "'";
			rs = stmt.executeQuery(sql);
			
			row_count = stmt_row_count.executeQuery(sql);
			// like "index.jsp", it seems that "declaration tag" will only act once
			post_count = 0;
			while (row_count.next()) {
				post_count ++;
			}
			
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>【Day 114 ~ 117】當個假日本人 | 京都の留學日誌</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- FB Admin -->
<meta property="fb:admins" content="100001781553864"/>

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/page.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<script type = "text/javascript" src = "../assets/js/check.js"></script>
<script type = "text/javascript" src = "../assets/js/page.js"></script>
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
						<h1><a href="../index.jsp">京都の留學日誌</a></h1>
						<nav class="links">
							<ul>
								<li><a href="../about.jsp">關於站主</a></li>
								<li><a href="../article.jsp">旅日札記</a></li>
								<li><a href="../album.jsp">生活相簿</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="../Search">
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
								<form class="search" method="get" action="../Search">
									<input type="text" name="query" placeholder="Search" />
									<input type="submit" value="搜尋"/>
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
								<li>
										<a href="../about.jsp">
											<h3>關於站主</h3>
										</a>
									</li>
									<li>
										<a href="../article.jsp">
											<h3>旅日札記</h3>
										</a>
									</li>
									<li>
										<a href="../album.jsp">
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
									<li><a href="../login.jsp" class="button big fit">Log In</a></li>
									<% 
									}else{
									%>
									<li><a href="../Logout" class="button big fit">Log Out</a></li>
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
										<h2>【Day 114 ~ 117】當個假日本人</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-12-31">2017年12月31日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_62_cover.jpg" alt="" /></span>
								<p>這個連假並沒有排任何計畫，唯一勉強算是計畫的就是在京都體驗日本的過年氣氛！</p>
								<p>日本人在年末時，會在家中擺放「鏡餅」。想了解相關內容，可以參考這些文章：<a href="https://www.facebook.com/wangcolaneko/posts/1779515178747467" class="ref" target="_blank">〈日本過年的緣起物〉</a>、<a href="https://zh-tw.facebook.com/kenichikaku/photos/a.1513406408907717.1073741828.1513364218911936/1550425008539190" class="ref" target="_blank">〈日本年節特輯:鏡餅(かがみもち)日本年糕、日本麻糬〉</a>、<a href="https://www.facebook.com/wangcolaneko/posts/1398984786800510:0" class="ref" target="_blank">〈鏡餅上為什麼要放「橘子」呢？〉</a>、<a href="https://www.facebook.com/121678347864500/photos/a.136301419735526.19578.121678347864500/712897982075864" class="ref" target="_blank">〈参考資料（開鏡儀式）〉</a>。<br/>
								28 號我也買了個鏡餅擺在冰箱上，據說這天剛好是最佳的放置日期，因為 29 號有 9，在日文中同「苦」的音；30 號是舊曆最後一天，31 號是新曆最後一天，如果最後一天才放感覺對神沒誠意。</p>
								<span class="image middle"><img src="../images/article_img/article_62_kagami.jpg" alt="" />（雖然理論上要放橘子，但我覺得這個放狗的比較可愛XD）</span>
								<p>此外，還買了蕎麥麵（そば）和日式年糕（もち）！<br/>
								蕎麥麵要在日本的除夕，通稱為大晦日（おおみそか）的日子裡吃。一定要在 31 號的晚上吃，不能到隔年才吃。若嚴格一點要在 31 號的晚上 11 點半後，隔年的1 號到來前吃。<br/>
								日式年糕則是要烤來吃，可加到像是紅豆湯的汁粉（しるこ）甜甜吃，或是加到像是雜燴湯的雑煮（ぞうに）鹹鹹吃。</p>
								<span class="image middle"><img src="../images/article_img/article_62_buy.jpg" alt="" /></span>
								<p>31 號晚上第一次認真看完紅白，以下條列心得和一些紀錄：
								<ul>
									<li>NHK 的轉播技術很好，即便是 Live，鏡頭切換還是很完美。</li>
									<li>SHISHAMO 還不錯，以後會多關注。</li>
									<li>吉岡里凡好可愛&gt;///&lt;，而且也是京都人。</li>
									<li>有村架純還是一如既往很漂亮，不過老實說主持方面有點像花瓶。另外，天童よしみ演唱時，關西出身的都站在舞台上，才知道原來有村也是關西人，查了是兵庫縣出身。</li>
									<li>渡邊直美真的很有趣。</li>
									<li>SEKAI NO OWARI 的 SAORI剛生完小孩沒來，換吉他手彈鋼琴。</li>
									<li>很多登台的歌手的歌有被 Goosehouse 翻唱過！</li>
									<li>倉木麻衣穿得超花俏，而且不知為何看起來長得很像我的一位高中同學XD</li>
									<li>輪到 TWICE 時超卡… 可能因為片源是對岸的轉播吧。</li>
								<span class="image left_2"><img src="../images/article_img/article_62_kuraki.jpg" alt="" /></span>
								<span class="image left_2"><img src="../images/article_img/article_62_twice.jpg" alt="" />（TWICE 的表現我不太清楚，因為很卡，但聽說有點慘）</span>
									<li>島津亞矢唱了我很喜歡的〈ROSE〉，英文發音意外很漂亮。</li>
									<li>鄉ひろみ的歌好像賈修裡福爾高雷的變態歌XD</li>
									<li>主持人内村光良似乎是欅坂46 的粉絲XD 說很想下去一起跳，還一起唱。此外，有成員在舞台上暈倒的樣子，我是之後看新聞才知道。</li>
									<li>去買個蝦子，松田聖子、平井堅這 2 位想看的歌手就過了 =口=</li>
									<li>X JAPAN 不愧是日本的天團，舞台魅力相當猛。</li>
									<li>AKB演唱的歌是 40 幾首歌中，由粉絲事前選出 10 首，裡面再由粉絲選出 3 首。<br/>
									最後是〈11月のアンクレット〉、〈365日の紙飛行機〉、〈大声ダイヤモンド〉被選出，剛好分別是要畢業的山本彩和渡邊麻友當center的曲子，粉絲還滿有情有義的嘛，雖然我只聽過〈365日の紙飛行機〉。感覺 2 人很不捨得畢業，尤其是渡邊麻友看起來真的快哭了，不知道<a href="https://youtu.be/faNzIicFzco?t=47s" class="ref" target="_blank">興奮哥</a>會做何感想。</li>
									<li>Superfly 很猛！也要關注他了。</li>
									<li>今年重頭戲絕對是安室奈美惠的登場，他在今年過後和江蕙一樣要從歌壇引退。<br/>
									因為安室紅的時候我還小，對他不熟，只知道《安室愛美惠》，但沒想到他居然唱〈HERO〉！這首歌是我唯一知道的，因為 Goosehouse 有翻唱過XD 很勵志的歌，他在紅白上唱得很讓人感動！</li>
									<li>個人對演歌沒太大興趣，但石川さゆり的演歌我居然覺得好聽！而且那首〈津輕海峽‧冬景色〉感覺以前有聽過。</li>
									<li>ゆず人氣高不是沒有道理，唱功確實了得，尤其比較矮的那位高音好恐怖。〈栄光の架橋〉這首個歌詞內容確實很適合運動賽事。</li>
									<li>最後不知為何在唱螢之光。</li>
								</ul></p>
								<p>最後，吃著剛煮好熱騰騰的蕎麥麵，上頭配著超商買來的紅燒蝦仁（其實一般要放炸蝦天婦羅，但我沒找到QQ 這包紅燒蝦仁還要 350 日圓，不便宜），看著紅白歌合戰的結尾，等待著消除煩惱的 108 下鐘聲被敲響。</p>
								<p>然而，手機錄音都準備好了，等了 4 分鐘還是沒有鐘聲。上網查詢確認後，似乎京都市只有知恩院有在敲 108 下鐘QQ<br/>
								可惡啊！虧我那麼期待。</p>
								<!-- Content END -->
								<%
									sql = "SELECT * FROM article;";
									article_row_count = stmt_row_count.executeQuery(sql);
									if(article_row_count.last())
										article_count = article_row_count.getRow(); // move to the last row
									article_row_count.first(); // return to the first row
									System.out.println("article_count: " + article_count);
								
									int article_num = 0;
								   	article_num = Integer.parseInt(article_title.substring(8));
								   	
									if(article_num > 1){
								%>
									<div class="next_to last_page"><a href="article_<%=article_num - 1%>.jsp" class="page_orient">← 上一篇</a></div>
								<%
									}
									if(article_num < article_count){
										if(article_num == 1){
								%>
										<div class="next_to next_page"><a href="article_<%=article_num + 1%>.jsp" class="page_orient"></a></div>
										<div class="next_to next_page"><a href="article_<%=article_num + 1%>.jsp" class="page_orient">下一篇 →</a></div>
								<% 		}else{ %>
										<div class="next_to next_page"><a href="article_<%=article_num + 1%>.jsp" class="page_orient">下一篇 →</a></div>
								<%		}
							   		}
								%>
								<footer>
									<ul class="stats">
										<li><a href="../tag/life.jsp">生活</a></li>
										<!-- click event -->
										<li><a href="javascript: reverseDisplay('all_gb')" class="icon fa-comment">顯示<%=post_count%>則留言</a></li>
										<!--
										<li><a href="javascript: void(0)" onclick="reverseDisplay('all_gb')" class="icon fa-comment">顯示&nbsp;<\%=post_count%\>&nbsp;則留言</a></li>
										-->
									</ul>
								</footer>
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_62.jsp" data-numposts="5"></div>
								
								<h2>留言版</h2>
								<!-- onsubmit must "return" to stop sending data -->
								<form name="guestbook" action="../AddPost" method="post" onsubmit="return check('guestbook')">
									
									<!--  DB Table & Redirection Target -->
									<input type="hidden" name="table_name" value=<%="\"" + article_title + "\""%>>
									<input type="hidden" name="page" value=<%="\"" + article_title + ".jsp" + "\""%>>
									
									<div class="row uniform">
										<div class="4u$ 6u$(large)">
											<label for="user">留言者</label>
											<input type="text" name="user">
										</div>
										<div class="8u$ 12u$(large)">
										<label for="content">留言內容</label>
										<textarea name="content"></textarea>
										</div>
										<div class="12u$ 12u$(xsmall)">
											<input type="submit" value="留言">
										</div>
									</div>
								</form>
								
								<div id="all_gb">
									<h2>留言列表</h2>
									<%
									//顯示資料
									while(rs.next()){
									%>
									<div class="guestbook">
										<div class="gb1">
											<span class="post_user"><%=rs.getString("post_user")%></span>
											<br/>
											<span class="post_time">於 &nbsp; <%=rs.getString("post_time")%></span>
										</div>
										<div class="gb2">
											<span class="post_title">留言內容</span>
											<br/>
									<% 
										String content = rs.getString("post_content");
										
										String enter_word[] = gb.showPost(content);
										for(int i = 0; i < enter_word.length; i ++){
									%>
												<span class="post_content"><%= enter_word[i]%></span>
									<% 
										}
									%>
										</div>
										<!-- click event -->
										<a href="javascript: ReverseDisplay('feedback_input<%= rs.getString("post_id")%>')">回覆此留言</a>	
									<% 
												// avoid null pointer
											if(session.getAttribute("isAdmin") != null){
												isAdmin = (boolean)session.getAttribute("isAdmin");
											}
												
											if(isAdmin){
									%>
										<form name="deletion" action="../DeletePost" method="post">
											<input type="hidden" name="table_name" value=<%="\"" + article_title + "\""%>>
											<input type="hidden" name="page" value=<%="\"" + article_title + ".jsp" + "\""%>>
											
											<input type="hidden" name="post_id" value=<%=rs.getString("post_id")%>>
											<input type="submit" value="移除">
										</form>
									<% 
											}
									%>
									</div>
									<div class="feedback_input" id="feedback_input<%= rs.getString("post_id")%>">
										<form name="feedback<%=rs.getString("post_id")%>" action="../AddFeedback" method="post" onsubmit="return check('feedback<%=rs.getString("post_id")%>')">
											<input type="hidden" name="table_name" value=<%="\"" + article_title + "\""%>>
											<input type="hidden" name="page" value=<%="\"" + article_title + ".jsp" + "\""%>>
											<input type="hidden" name="post_id" value=<%=rs.getString("post_id")%>>
											
												<div class="row uniform">
													<div class="4u$ 6u$(large)">
														<label for="user">回覆者</label>
														<input type="text" name="user">
													</div>
													<div class="8u$ 12u$(large)">
														<label for="content">回覆內容</label>
														<textarea name="content"></textarea>
													</div>
													<div class="12u$ 12u$(xsmall)">
														<input type="submit" value="回覆">
													</div>
												</div>
										</form>
									</div>
									<% 
										sql = "SELECT * FROM re_guestbook WHERE page = '" + article_title + "' AND post_id = " + rs.getInt("post_id");
										System.out.println(article_title);
										System.out.println(rs.getInt("post_id"));
										re_rs = re_stmt.executeQuery(sql);
										
										while(re_rs.next()){
									%>
									<div class="feedback">
										<div class="gb1">
											<span class="post_user"><%=re_rs.getString("re_post_user")%></span>
											<br/>
											<span class="post_time">於 &nbsp; <%=re_rs.getString("re_post_time")%></span>
										</div>
										<div class="gb2">
											<span class="post_title">回覆內容</span>
											<br/>
									<% 
										String re_content = re_rs.getString("re_post_content");
										
										String re_enter_word[] = gb.showPost(re_content);
										for(int i = 0; i < re_enter_word.length; i ++){
									%>
												<span class="post_content"><%= re_enter_word[i]%></span>
									<% 
										}
									%>
										</div>
									<% 
												// avoid null pointer
											if(session.getAttribute("isAdmin") != null){
												isAdmin = (boolean)session.getAttribute("isAdmin");
											}
												
											if(isAdmin){
									%>
										<form name="re_deletion" action="../DeleteFeedback" method="post">
											<input type="hidden" name="table_name" value=<%="\"" + article_title + "\""%>>
											<input type="hidden" name="page" value=<%="\"" + article_title + ".jsp" + "\""%>>
											
											<input type="hidden" name="re_post_id" value=<%=re_rs.getString("re_post_id")%>>
											<input type="submit" value="移除">
										</form>
									<% 
											}
									%>
									</div>
								<%
										}
								}
								// while END
								%>
									
								</div>
							</article>

					</div>

				<!-- Footer -->
					<section id="footer">
						
						<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</section>

			</div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>

	</body>
</html>

<%
		} catch (Exception ex) {
			System.out.println("can't read data");
			System.out.println(ex.toString());
		} finally{
			dbc.cleanConnectionObj(rs, stmt, conn);
			// Connection could be re-closed?
			dbc.cleanConnectionObj(re_rs, re_stmt, conn);
		}
	} catch (Exception e) {
		System.out.println("can't create statement");
		System.out.println(e.toString());
	}
%>
