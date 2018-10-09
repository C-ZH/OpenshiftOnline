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
			article_title = "article_37";
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
<title>【Day 73】 東京背包行（1） | 京都の留學日誌</title>
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
										<h2>【Day 73】 東京背包行（1）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-17">2017年11月17日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_37_cover.jpg" alt="" /></span>
								<p>前一天晚上匆匆吃過晚飯後，補了一下網誌進度，還來不及洗碗就背著背包衝出門去搭夜行巴士。幸好最後有趕上，真的只差一點（大概一個紅綠燈）就搭不到了，好險！</p>
								<p>晚上 11 點的車，早上 7 點到東京的鍛冶橋駐車場（銀座附近）。不得不說夜巴真的是好東西，便宜又可以睡覺，如果能在公車上睡著的話很推！像我高中三年已經習慣在長距離公車上睡覺。<br/>
								關於夜行巴士，我寫了一篇<a href="memo/memo_01.jsp" class="ref">搭乘感想</a>可參考。</p>
								<p>一下車，給我的第一印象是：這不就是台北？只是馬路寬了點。<br/>
								因為只有 2 天 1 夜，這次的行程排得相當鬆散，大致上第一天就是先到築地市場，再到表參道、原宿和澀谷就結束；第二天只排了東京巨蛋。雖然也很想去淺草和秋葉原之類的地方看看，但想說不順路就算了，希望還有機會去。</p>
								<span class="image middle"><img src="../images/article_img/article_37_tokyoimg.jpg" /></span>
								<p>首先走過有樂町，來到了築地市場。雖然感覺很有名，但其並沒什麼好說的，旁邊的築地本願寺還比較值得一去。<br/>
								市場內主要就賣以下四樣東西：玉子燒、水產物（生魚片、海菜之類的）、菜刀、醃漬物。偏偏我討厭吃海鮮，生魚片又都賣得很貴，對我而言沒有什麼吸引力。於是乎，我就在充滿吃著生魚片的外國人的用餐區，拿出帶來的 Pocky 當早餐吃。<br/>
								當然早餐不只吃零食而已啦，一路逛下來很多攤販都可以試吃，逛完一圈的份量以早餐而言差不多～ 比較特別的是鯨魚生魚片吧，肉本身沒什麼味道，感覺都是靠調味料的味道。</p>
								<span class="image middle"><img src="../images/article_img/article_37_ichiba.jpg" /></span>
								<span class="image middle"><img src="../images/article_img/article_37_tera.jpg" />（築地本願寺，和京都的東 / 西本願寺是姊妹寺）</span>
								<p>前往表參道前，看到一家叫「天丼てんや」的店滿便宜的就進去吃午餐。之前聽人說天丼 900 日圓算便宜，但這家只要 550 日圓耶!!! 我點的是貴一點的定食，但可以續飯，CP 值還 OK！</p>
								<span class="image middle"><img src="../images/article_img/article_37_tendon.jpg" /></span>
								<p>回來後仔細回想，購物行程真的不適合我，而表參道、原宿正是那種購物聖地。給我的印象就只有店家很多，然後我都隨便繞隨便逛，逛了一天還是兩手空空XD<br/>
								但原宿有條街叫做「竹下通」很有特色，店很多，人也很多。在這條路上有發生一件比較特別的事情，就是一直看到一堆黑人在拉客。他們會先裝熟搭話，然後帶你到他們的店裡。當時沒注意到這個狀況，被其中一位搭話後，他說什麼他很喜歡台灣，所以算我 50 % 的折扣，於是跟著他走去他的店。然而，感覺越來越怪，到了有點深的巷子裡，周圍有不少抽菸的黑人（帶我來的人身上其實也有菸味），而他的店就建在鐵皮屋上。<br/>
								先說沒有種族歧視，但當下真的有點怕怕的，問他價格又一直不說，要我先挑喜歡的。幸好最後掰了一些理由順利走出來，回程又有另一位黑人來跟我握手，但我和他握完手後就裝作聽不懂英文繼續往前走XD</p>
								<span class="image middle"><img src="../images/article_img/article_37_takeshita.jpg" />（人很多的竹下通，有點西門町的感覺）</span>
								<p>在原宿時，正好是日本學生放學的時間（3 點、4 點左右），這也讓我發現一件事情：東京的女生裙子真的好短 >///< 大概都落在大腿一半以上吧，讓小弟感到非常害羞，都不知道眼睛要看哪裡XD<br/>
								原本以為日本女學生裙子短只是都市傳說，因為京都的學生裙子穿得甚至比台灣學生長，幾乎都蓋到膝蓋。但在東京，裙子長度的比例根本完全反過來，著實讓我感到驚嚇。</p>
								<p>在竹下通只買了一樣東西──可麗餅！終於吃到日本的可麗餅了，在京都都沒看到。竹下通裡可麗餅店超多，一開始太興奮好像買貴了QQ 不過真的頗好吃，喜歡甜食的我吃得很滿足！</p>
								<span class="image middle"><img src="../images/article_img/article_37_crepe.jpg" /></span>
								<p>另外還看到一個熟悉的身影──CoCo都可！聽說全日本就只有原宿和澀谷 2 間店，然後因為是以日本物價在賣，換算回台幣會覺得很貴。<br/>
								剛吃完可麗餅後感到很有罪惡感，所以在原宿沒買，但晚上到澀谷後就有喝。我不常喝手搖杯所以不敢斷定，但感覺還原度頗高。</p>
								<span class="image middle"><img src="../images/article_img/article_37_coco.jpg" /></span>
								<p>晚上來到澀谷，觀賞了著名的十字路口，黑壓壓的人流讓我感到既恐怖又震撼。還記得之前在玩 Chaos; Child 時一直看到這個場景，實際看到後覺得比想像中還壯觀。</p>
								<span class="image middle"><img src="../images/article_img/article_37_cross.jpg" /></span>
								<p>之後和惠琳碰面後，晚餐首度吃了在京都也頗有名的雞白湯拉麵。<br/>
								什麼是雞白湯拉麵呢？一般的拉麵是用豚骨，也就是豬骨熬湯，但雞白湯顧名思義是用雞來熬。吃起來感覺比較油一點，但是我比較喜歡的味道，可能我對食物油的容忍度大於鹹味吧！</p>
								<span class="image middle"><img src="../images/article_img/article_37_ramen.jpg" /></span>
								<p>我們對澀谷其實都不是很熟，所以就隨便逛～ <br/>
								109 的人比想像中少，裡面也沒有傳聞中那麼厲害的感覺。另外也逛了開設給男性的 109 Men's，但一樣感覺沒什麼。<br/>
								除了逛街，還有聖地巡禮！小時候看了一部很奇特的少女漫畫，叫做《辣妹當家》，故事舞台就是發生在澀谷。這次特地去拍漫畫裡常出現的八公像和派出所。</p>
								<span class="image left_2"><img src="../images/article_img/article_37_policebox.jpg" />（澀谷站前派出所）</span>
								<span class="image left_2"><img src="../images/article_img/article_37_hachi.jpg" />（八公像）</span>
								<p>晚上住宿選擇住網咖，原因當然是因為便宜！上網查到膠囊旅館 1 晚也要 2500 日圓左右，但網咖只要 1500 日圓就可以住 10 小時，而且日本的網咖很特別，詳細內容可以看我<a href="memo/memo_02.jsp" class="ref">住過後的感想</a>。<br/>
								很可惜我到的時候夜間方案好像滿了，只好選比較貴的 8 小時 1800 日圓，但還是比旅館便宜啦！<br/>
								原本想說可以看一堆日文漫畫，但有點累就趕緊洗洗睡了。</p>
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
										<li><a href="../tag/travel.jsp">旅行</a></li>
										<!-- click event -->
										<li><a href="javascript: reverseDisplay('all_gb')" class="icon fa-comment">顯示<%=post_count%>則留言</a></li>
										<!--
										<li><a href="javascript: void(0)" onclick="reverseDisplay('all_gb')" class="icon fa-comment">顯示&nbsp;<\%=post_count%\>&nbsp;則留言</a></li>
										-->
									</ul>
								</footer>
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_37.jsp" data-numposts="5"></div>
								
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
