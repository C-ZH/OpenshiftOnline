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
			article_title = "article_76";
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
<title>【Day 151】 節分 | 京都の留學日誌</title>
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
										<h2>【Day 151】 節分</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-02-03">2018年2月3日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_76_cover.jpg" alt="" /></span>
								<p>今天是日本的「節分（せつぶん）」，原指四季之始的前一日，也就是立春、立夏、立秋和立冬的前一天，但現在多專指立春前一天。</p>
								<p>台灣的立春或立春前一天好像沒有什麼特別活動，但對日本人來說，節分這個節日似乎相當重要。Fresco 在 1 月中就一直在廣告可以預約惠方卷了，然後今天的便利商店、超市也全部都在賣惠方卷。<br/>
								什麼是惠方卷（えほうまき）呢？它的由來有多種說法，目前沒有確切的一種說法，只確定這原本是大阪的特色食物。惠方卷裡面會包有 7 種食材，象徵七福神。詭異的是我查各種資料都只列出 6 種，然後說是 7 種，怪哉。<br/>
								6 種食材分別是：醃葫蘆條（干瓢 かんぴょう）、黃瓜（キュウリ）、雞蛋卷（伊達巻 だてまき，就是玉子燒）、鰻魚（鰻 うなぎ）、肉鬆（田麩 でんぶ）、椎茸（椎茸 しいたけ）。<br/>
								還記得之前問日本人，他說日本沒有肉鬆，我想應該是日文太爛導致溝通上出問題。只不過惠方卷裡的肉鬆似乎都會用成粉紅色，稱為桜でんぶ。<br/>
								近年來，日本全國盛行起節分吃惠方卷的行為，像是今天 Twitter 的最熱門關鍵字就是惠方卷，多達 25 萬推文。吃的時候要朝著吉位吃，那個吉位日本稱為「惠方（えほう）」，每年不同，今年是南南東，而且要一口吃完！這超難，明天來挑戰XD</p>
								<span class="image middle"><img src="../images/article_img/article_76_all.jpg" alt="" />（分別買了惠方卷、可吃可撒的豆菓子、納豆。其中，惠方卷比較晚去買，撿到 7 折！）</span>
								<p>惠方卷盛行的現在，7 種食材都隨便放了啦，也看到一堆生魚片還是烤魚之類的食材。當然沒有 7 種食材的惠方卷也有，我也看到只放 2 種食材的。<br/>
								我買的基本上符合那 6 種食材，只是便宜貨當然沒有鰻魚，然後肉鬆是用一個叫做おぼろ的食材取代。<br/>
								今天因為晚飯吃頗飽，決定留到明天早上吃。</p>
								<span class="image middle"><img src="../images/article_img/article_76_ehou.jpg" alt="" />（7 折惠方卷）</span>
								<span class="image middle"><img src="../images/article_img/article_76_an.jpg" alt="" /></span>
								<p>事實上，節分最原本是要在迎接一年之始春天的日子，也就是立春之際迎福。為此，要把邪氣驅散以迎來福氣，這裡所指的邪氣就是病痛之類的不好事物，以「鬼（おに）」作為具體呈現。也因此，今天也看到很多店家在賣鬼面具，店內裝飾也貼有很多鬼的圖像。<br/>
								傳統上會有撒豆子的活動，並邊撒邊喊「鬼は外、福は内」。例如，神社可能會有和尚向外撒豆子；家庭中的爸爸可能會扮鬼，讓小孩朝自己撒豆子。此外，也有在今天要吃和自己歲數相同數目的豆子的習俗。<br/>
								還記得小時候看卡通（忘了哪部，好像是《家有賤狗》還是《櫻桃小丸子》）時，有看到撒豆子的劇情，後來就跟我哥和我姊在家裡吃香香豆、撒綠豆，還學電視裡的人說「惡鬼退散」XD</p>
								<p>以上廢話講完，開始記錄今天的行程。原本想打很多，但前面打不少了，還是簡單記述就好。<br/>
								下午去了古本市場和 Book Off 這 2 間二手店逛，結果 2 間店都各逛了超過一小時，但都沒買XD<br/>
								古本市場京都只有 3 家，不像 Book Off 那麼多分店，而離我這邊最近的是同志社大學附近的西陣店。<br/>
								首先，在 Book Off 堀川五条店買了本 108 日圓的《火車》，並利用折價券折了 100 日圓，最後只有 8 日圓！</p>
								<p>後來首度去了古本市場，共有 2 層樓，1F 是遊戲王卡、遊戲片、CD、DVD和模型，2F 是漫畫、小說等各種書籍區。<br/>
								整體而言，若要買宅物會推薦來古本市場，尤其是遊戲王卡相當多。遊戲片也很多，而且普遍比 Book Off 便宜。像是《人中之龍5》只要1280 日圓，《GTA5》也只要 1480 日圓，《巫師3》1980 日圓，而《精靈寶可夢X》只要 780 日圓，比我當初在台灣用台幣買的數目還低耶，不過我是買新品啦。除此之外，相同主機的遊戲片買 2 片以上還能打 8 折！<br/>
								我發現二手的遊戲若以價格為 Y 軸，年份為 X 軸，很多都呈現 U 型曲線。以寶可夢為例，USUM 大約 3000，早一些的SM 1280，然後 XY 是780，到了更早的 BW 又回到 1280 ~ 1980，我國中時期的 DP 也和 BW 差不多，但到了 HGSS 和 FRLG 那邊又暴漲為 3000 左右。其實我一直很想玩 HGSS，但看到價格實在下不了手QQ 畢竟也是絕版品了。</p>
								<p>漫畫方面，有名的很多，而且便宜，80 日圓就有，少部分還有 50 日圓跟 30 日圓。除了便宜、書況不錯，也還算齊全，我看 80 日圓的火影忍者，第 1 集到第 67 集中間只少了 4 集。<br/>
								至於音樂 CD 就呵呵了，不僅量少，連整理都沒整理好，超難找。</p>
								<p>後來又去了最大間的 Book Off 河原町店，結果這 2 天剛好在做 260 日圓以下的漫畫再打 5 折的促銷活動，看得我非常心動動。但在那邊逛了半天，猶豫要買《天真與閃電》、野崎君還是《orange》，最後還是一本都沒買XD<br/>
								我好像滿常發生這種事耶，逛超久，猶豫超久，最後空手而歸。</p>
								<p>總而言之，不管是遊戲、漫畫、各類小說，若要買有名的大作、經典作品，就到古本市場吧！齊全又便宜。<br/>
								若要冷門作品，或是想要挖寶，建議到 Book Off，尤其河原町店非常大間，可能會有心中的目標。</p>
								<p>※ 補充：2/4 吃惠方卷狀況，因為旁邊就是西本願寺，所以南南東很好找。但是太大條了啦，怎麼可能一口吃完XD 直接放棄。</p>
								<span class="image middle"><iframe width="560" height="315" src="https://www.youtube.com/embed/GkTa1pHsbvM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></span>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_76.jsp" data-numposts="5"></div>
								
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
