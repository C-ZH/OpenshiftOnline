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
			article_title = "article_19";
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
<title>【Day 37】日本文化特講專欄（1）孩子們的遊戲 | 京都の留學日誌</title>
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
										<h2>【Day 37】日本文化特講專欄（1）孩子們的遊戲</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-10-12">2017年10月12日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_19_cover.jpg" alt="" /></span>
								<p>目前每個禮拜最期待的課就是星期四的這門「日本文化特講」了！大致上就像森多概那類型的課，雖然要寫心得，但大部分都還是在玩，以及了解一些日本的文化。<br/>
								因為實在是很有趣，老師又很可愛，所以我決定從這週開始為它寫個專欄，記錄一些上課內容。</p>
								<p>這週的課程內容是「日本の昔の子どもの遊び」，也就是我們這個年代的童年遊戲，現場也有同志社的日本學生志願者當助教示範遊戲。以下是在課程中有介紹到的遊戲：</p>
								<p><b>剣玉</b><br/>
								這個大家應該不陌生，玩法就不多說明了。上網查說台灣好像也叫劍玉，以前我家也有一個，但我以前都叫他槌球XD<br/>
								有一位日本學生超強!!! 真的可以把球甩到鎚子上。他說小學時體育課老師要求要練劍玉，聽起來和我小學體育課考毽子有 87% 像。
								</p>
								<span class="image middle"><img src="../images/article_img/article_19_kendama.gif" /></span>

								<p><b>お手玉</b><br/>
								其實外觀就像是沙包，但他們的玩法是放在地上，然後念一串台詞，唸到最後就選擇那個沙包，然後…就沒了。<br/>
								那串台詞會因為不同地區有差異的樣子，所以就不寫上來了（不過也沒記起來啦XD）。<br/>
								韓國也有一樣的遊戲，有韓語的台詞。但韓國除了數沙包以外，也和我們一樣會玩丟沙包。<br/>
								台灣好像沒有一樣的遊戲，但我和隔壁的台灣人說「有點像雞蛋雞蛋破雞蛋耶」，結果就被推上去表演了XD 雖然我覺得差滿多的啦。</p>
								<span class="image middle"><img src="../images/article_img/article_19_otedama.jpg" /></span>
								
								<p><b>まりつき</b><br/>
								其實就是拍皮球啦，檢待來說就是照著一首歌的節拍來拍皮球，然後拍到完，中間可能會加一些動作。詳細玩法可參考這部<a href="https://www.youtube.com/watch?v=cf-RqKPwMBE" class="ref">影片</a>，裡面用的歌也和課堂上的一樣。</p>

								<p><b>あやとり</b><br/>
								這個就是很有名、大雄很會的翻花繩。小時候我也很喜歡玩橡皮筋，但認真來說我覺得翻花繩看起來難上很多XD<br/>
								比較有趣的是，在日本好像真的都是女生在玩翻花繩。有位男生出來示範，老師感到非常訝異的感覺。</p>
								<span class="image middle"><img src="../images/article_img/article_19_ayatori.jpg" /></span>

								<p><b>指相撲</b><br/>
								就是手握在一起，手指壓手指的遊戲。我小時候也常玩，就不解釋了。</p>

								<p><b>あっち向いてホイ</b><br/>
								這句的中文翻譯是「往那邊看！」也就是黑白猜。規則完全一樣，只是台詞不同。<br/>
								順帶一提，日本的猜拳叫做<b>じゃんけん</b>，台詞是「最初はグー、じゃんけんぽい」，中文翻譯是「先出石頭，剪刀石頭布」，但聽說還是會因為地區而有稍微不同的唸法。</p>
								
								<p><b>福笑い</b><br/>
								這項是我覺得最有趣的！規則是給 2 個人各 1 面空白的臉，然後蒙住眼睛，由輔助的人把眉毛、眼睛、鼻子和嘴巴遞給蒙眼者，並跟他說這是哪裡，蒙眼者就慢慢將不同的部位放到適當的位置。<br/>
								完成後，看誰排出來的臉比較好看就贏了。</p>
								<span class="image middle"><img src="../images/article_img/article_19_fukuwarai.png" /></span>

								<p><b>かるた</b><br/>
								這個的中文翻譯好像有點爭議，就先叫它「歌牌」好了。<br/>
								遊戲規則是將寫有《百人一首》（日本的一本和歌集）某句歌詞的卡片散落在地上，卡片一面是完整歌詞，另一面只有歌詞開頭的第一個字。<br/>
								參加者可看到只寫一個字的那面，然後由裁判吟唱歌詞，最先伸手拍到對應歌牌的參賽者可拿回那張牌，最後統計誰拿最多。<br/>
								個人感想，有點像是心臟病。</p>
								<span class="image middle"><img src="../images/article_img/article_19_karuta.jpg" /></span>

								<p><b>かごめかごめ</b><br/>
								一群人圍著 1 個人，被圍著的人遮住眼睛蹲在地上，然後圍著的人唱著歌詞並以被圍著的人為中心繞圈圈，直到歌詞唱完後停下。<br/>
								停下後，中心的那個人要猜在他正後方的是誰。可參考這部<a href="https://www.youtube.com/watch?v=j4vPvzX9PMM" class="ref">影片</a>，歌曲曲調非常陰森，加上遊戲規則的因素，難怪上網查都是一堆鬼故事XD</p>
								<span class="image middle"><img src="../images/article_img/article_19_kagome.jpg" /></span>

								<p><b>花いちもんめ</b><br/>
								一群人分成 2 組，一樣是唱一段歌詞，並做一些特定動作。<br/>
								歌詞結束後，雙方各自討論想要對方的誰加入自己的組別，然後各自派代表出來猜拳，贏的組別就可以搶走對方組別中被指定的人。最後看哪組先被滅門就輸了。<br/>
								詳細玩法可參考這部<a href="https://www.youtube.com/watch?v=FFIhh1wtPYc" class="ref">影片</a>。</p>

								<p>另外今天還有學到個豆知識：原來在韓國，剪刀石透不的剪刀，比法是伸出拇指和食指，像是台灣在比的「七」。</p>
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
										<li><a href="../tag/school.jsp">同志社</a></li>
										<!-- click event -->
										<li><a href="javascript: reverseDisplay('all_gb')" class="icon fa-comment">顯示<%=post_count%>則留言</a></li>
										<!--
										<li><a href="javascript: void(0)" onclick="reverseDisplay('all_gb')" class="icon fa-comment">顯示&nbsp;<\%=post_count%\>&nbsp;則留言</a></li>
										-->
									</ul>
								</footer>
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_19.jsp" data-numposts="5"></div>
								
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
