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
			article_title = "article_11";
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
<title>【Day 14】朝聖！同志社今出川圖書館 &amp; 京都寶可夢中心 | 京都の留學日誌</title>
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
										<h2>【Day 14】朝聖！同志社今出川圖書館 &amp; 京都寶可夢中心</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-09-19">2017年9月19日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_11_cover.jpg" alt="" /></span>
								<p>早上去同志社處理一些事情後，想說拿到學生證了，就進去他們的圖書館看看。不去還好，一去驚為天人！理由後述。整間圖書館總共分為 5 層，分別是 B2 到 3F，今天只逛了 B1 和 1F ，2F和3F看平面圖好像就是書架加上自習室這樣的組合。<br/>
								1F 一進去就會看到一塊區域都是電腦，數量不少，大約 60 台，都可以自由使用，使用方法和台大計中一樣輸入學號、密碼。雖然校內其實還有另外一棟的資訊教室，但這裡給我感覺就像是圖書館裡面有個小計中，不過硬體設備勝過台大計中，軟體部分居然還有裝VirtualBox!!! 裡面是裝CentOS而不是Ubuntu。電腦區旁邊有 2 台列印機，然後比較奇怪的是有 2 台微縮捲機也在這個區域，附近也沒看到微縮資料呀。</p>
								<p>整體而論，雖然同志社今出川圖書館的藏書量看起來頗多，但應該還是總圖略勝，而視聽中心則是總圖大勝，因為這裡 B1 的視聽中心不只地方小、館藏少，連螢幕也很小。然而，讓我最驚訝的是除了館藏豐富，自習座位的數量也頗多，總圖地下室我沒去過不太清楚，都只去上面比較大的座位，同志社這裡光是 1F 大概數了一下就有超過 400 張座位，B1兩間自習室合起來至少也有250張，還有 2F、3F 還沒看耶… 保守估計整棟應該有1000張座位以上，只可惜好像都沒有隔板。<br/>
								除了這間今出川圖書館，和隔壁的同志社女子大學可以互相使用圖書館。另外，聽說京田邊校區的圖書館更大。是說我看京田邊校區的平面圖超大，可能有今出川 3 個校區加起來的 10 倍以上，運動場地也都在那裡，覺得有點可惜。</p>
								<p>而日本也有自己的圖書分類法，叫做「日本十進分類法（NDC）」，基本上分類方向和中文圖書分類法相似，但順序不太一樣，例如 NDC 的 700 是藝術類，而中文圖書分類法的藝術類是放在 900 。</p>
								<span class="image middle"><img src="../images/article_img/article_11_NDC.jpg" /></span>

								<p>下午想說去新京極商店街逛逛好了，逛一逛不小心走到寺町通商店街，再逛了一下又走到三条商店街，原來這三個商店街是在同一塊區域啊！之前一直以為是不同的地方。可能我比較不習慣逛街吧，沒看到太多有意思的東西，比較特別的大概是有間很大的電影院、好幾間很大的夾娃娃中心。另外有間很大的樂器行，裡面有賣口琴耶！不過沒賣特樂，只有複音和半音階。雖然看到有賣Sirius和Super64，但很明顯還是以複音為主，旁邊賣的教材、樂譜集也都只有複音的。</p>

								<p>接著在去二手店 BookOff 的路上，不小心路過了高島屋，又不小心想起來聽說京都寶可夢中心就在高島屋，所以就近去逛啦！<br/>
								一進去果然名不虛傳，雖然京都的似乎不大，也沒看到傳說中的對戰區域，但商品很多，還有不少京都特有產品。當然這裡的價位都是偏高的，像百元商店 100 元三雙襪子，這裡是任選三雙 1000 元。<br/>
								中心內充滿了快活的氣氛，有男有女、有年輕人有小孩子，逛了一圈感覺神清氣爽！我在逛的時候應該是一直傻笑的表情XD <br/>
								看到一位西方人的購物籃放了滿滿的布偶，然後布偶單價又都是上千日圓，當下 OS 是「可惡，有錢真好！」如果我有申請到獎學金，絕對要來這裡敗家啊！今天只轉了個扭蛋而已，同一台扭蛋機我看台北地下街要台幣 60 元，這裡只要 100 日圓，價位差了一半左右。</p>
								<p>雖然想要拍照，無奈 ASUS 手機超爛，有時相機狂閃退，不然就是只有前鏡頭可用，運氣好可以用時還常常不能對焦。來日本前就有這問題，也拿去皇家送修過了，結果只是重灌而已== 因為下載了開源的相機也一樣，但有時又能用應該不是硬體問題，嚴重懷疑根本是韌體的問題。當時剛好拍到一半出問題，所以沒拍到門口，後來想說算了，反正之後一定還會再來！</p>
								<span class="image left_3"><img src="../images/article_img/article_11_pokemon1.jpg" />（可愛又實用）</span>
								<span class="image left_3"><img src="../images/article_img/article_11_pokemon2.jpg" />（也是很實用，但不便宜）</span>
								<span class="image left_3"><img src="../images/article_img/article_11_pokemon3.jpg" />（之前某人有送我這裡的掌門球XD 另一個櫃子有賣比較小顆、材質不同的球）</span>
								<span class="image left_3"><img src="../images/article_img/article_11_pokemon4.jpg" />（貴姍姍的布偶們）</span>
								<span class="image left_3"><img src="../images/article_img/article_11_pokemon5.jpg" />（只有 iPHONE 的殼QQ）</span>
								<span class="image left_3"><img src="../images/article_img/article_11_pokemon6.jpg" />（轉蛋機們）</span>

								<p>最後到了原本的目的地 BookOff，雖然聽說不一定是最便宜的，但品項真的很齊全，有衣服、書、音樂 CD、電影戲劇 DVD / BD、遊戲片、模型、電視、相機……等，但這間店只有男裝，價位落差有點大；書的部份大概 70 % 漫畫、15 % 小說，剩下的類型 15%，漫畫二手價和台灣全新的差不多。這裡提個比較有用的資訊，可以白看書喔！我看到有兩排漫畫櫃站滿了人在白看書，一排是 JUMP 系，白看人士有男有女；一排是正統少女漫畫區，白看人士清一色只有女生，害我想看看有什麼漫畫都不敢走進去QQ </p>
								<p>在我的行動範圍內好像還有兩間 BookOff 的分店，之後有空再去逛逛看好了！希望可以挖到寶。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_11.jsp" data-numposts="5"></div>
								
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
