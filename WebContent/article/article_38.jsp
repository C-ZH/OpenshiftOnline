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
			article_title = "article_38";
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
<title>【Day 74】 東京背包行（2） | 京都の留學日誌</title>
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
										<h2>【Day 74】 東京背包行（2）</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-18">2017年11月18日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_38_cover.jpg" alt="" /></span>
								<p>早上 5 點半在網咖睡醒，醒來後感覺其實不錯！睡得還算舒適。因為沒有睡過頭，所以就慢慢整理行李，然後再去喝 2 杯飲料撈回本後就退包廂去覓食。</p>
								<p>清晨的澀谷真的很值得一看！滿地都是喝完的罐子、名片，還有各種外表很潮的年輕人與喝醉的人，感覺澀谷這裡的清晨、白天、晚上就像三個不同的世界。</p>
								<span class="image left_2"><img src="../images/article_img/article_38_yopporai.jpg" /></span>
								<span class="image left_2"><img src="../images/article_img/article_38_gomi.jpg" />（滿地垃圾）</span>
								<p>吉野家、すき家這種丼飯店都有所謂的早餐定食，而我這次選定吃松屋。<br/>
								這是首度吃丼飯店的早餐定食，看起來很豐富，但其實份量不算多。因為時間還很多，所以吃得超慢XD</p>
								<span class="image middle"><img src="../images/article_img/article_38_breakfast.jpg" /></span>
								<p>吃完後大概才 7 點，整個時間還超級多，這時就有點後悔行程排太鬆，感覺還可以去個秋葉原。但仔細考慮後，秋葉原還是不要有時壓力，一次逛到底應該比較好玩，還是下次吧！<br/>
								為了打發時間，我就很無聊地把環狀的山手線從澀谷坐到澀谷，看看它繞一圈需要多久XD 根據我的親身體驗，山手線繞一圈不多不少，剛好 70 分鐘。星期六早上應該是算離峰時段，沒有體驗到傳說中的Rush Hour，因此測出來的時間可能也會和尖峰時段有所不同。</p>
								<p>之後就乖乖照行程走，前往東京巨蛋，並先到旁邊的小石川後樂園賞楓。除了看到美麗的風景，在這裡還發生 2 件插曲。</p>
								<span class="image middle"><img src="../images/article_img/article_38_rakuen.jpg" />（小石川後樂園）</span>
								<p>在後樂園門口準備買票時，突然有位說著台灣口音的男生請我幫他和家人拍照。看起來很正常的事情，但他好像把我成日本人，一直用英文和我溝通XD 然後我就陪他一起練英文口說。拍完後，還跟我說ありがとう。</p>
								<p>另一件是入園後，站在身旁的阿伯突然和我搭話，並問我從哪裡來的。<br/>
								他本身是從大阪來，聽到我從京都來好像有點驚訝，再聽到我來自台灣又更驚訝XD 然後開始說了很多感性的話。雖然我大概只能聽得懂三成，而且也不太有辦法回話互動，但還是說一下阿伯大概說了什麼。<br/>
								我說來自台灣後，他就開始感嘆日本人對台灣人都很友善啊。之前的東北大地震當然是一個原因，但對他而言，早在地震事件之前就一直對台灣懷有感激的心情。原因他也說不上來，只說和韓國或中國大陸不一樣，台灣跟日本不會出現對立的狀況，而是會互助，就像是聯繫起來的關係。簡言之，我覺得他就是想說台日友好啦！</p>
								<p>對於這位阿伯的話，基本上算是同意。我認為身為台灣人身在日本頗吃香，但不同的年齡層對台灣人的態度很明顯有變化，大致上以現在的 30 歲為界線。30 歲以上會對台灣觀光客非常友善，像是之前在買票時出示台灣的學生證，看售票員明顯和對前面的觀光客態度不同；30 歲以下比較年輕的世代，哈韓與崇洋的人很多，反而會把台灣和東南亞學生視為比日本弱的人對待，很多學中文的人也都是學簡體字為主，接受到的資訊自然也都是對岸的居多，也因而對對岸更有興趣，像是我的 peer support就是這樣。<br/>
								以上當然都只是我的觀察，非常主觀。我的看法是和地震等事件脫不了關係，因此才會造成 30 歲的分界。但還是要澄清我遇到的年輕人中，還是有相當數量的人對台灣人很友善，或是對台灣很有興趣，主要還是因人而異啦！就像爪爪有好爪也有個案爪。</p>
								<p>原本以為吃完午餐後，要等到 5 點入場很難熬，因為原先的預定就是逛完後樂園後入場。幸好東京巨蛋附近其實超好逛！不少新奇的事情。</p>
								<p>東蛋旁有個叫做Tokyo Dome City 的購物商城，裡面除了很多知名店家，像是 Uniqlo、MUJI，還有一座小小的遊樂園。遊樂園雖小，設施俱全，旋轉木馬、海盜船、雲霄飛車、摩天輪都有！<br/>
								除了遊樂設施，還有一座遊戲中心。雖然規模不如昨天在澀谷看到的 4 層樓遊戲中心，但也不小啦！看到一位同學玩音 Game 打出 500 Combo，真心覺得猛。<br/>
								在遊樂場的中間有塊廣場，上面有不少整理過的樹和可愛的餐車店家。看到有在賣可麗餅，又立刻買了一個XD</p>
								<span class="image middle"><img src="../images/article_img/article_38_amusement.jpg" /></span>
								<span class="image middle"><img src="../images/article_img/article_38_gamecenter.jpg" />（遊戲中心）</span>
								<span class="image middle"><img src="../images/article_img/article_38_crepe.jpg" /></span>
								<p>遊樂園旁邊還有一些特色店家，以下簡單介紹。<br/>
								首先是 MLB 咖啡廳，看起來很貴所以沒進去。在這間咖啡廳的附近還有間專賣棒球書籍的書店，不過果然都是巨人隊的書居多XD 還看到 YOH 上封面的雜誌。另外，大谷翔平的書好像很暢銷。<br/>
								再來是一間超大的賽馬中心，位在一棟 10 層樓的大樓，裡面的人幾乎都在賽馬。看了之後，才感受到日本的賽馬有多麼興盛。</p>
								<span class="image middle"><img src="../images/article_img/article_38_gamble.jpg" />（賽馬場，拍了之後才發現上面有寫不能拍XD）</span>
								<p>「東京寶島」裡面賣的東西很雜，有吉普力、史努比、假面騎士等等的周邊。<br/>
								不知道是不是 Tokyo Dome City 和 COLOPL 有合作，除了一堆《白貓 Project》、《魔法使與黑貓維茲》、PTT 上很紅的《戰鬥好學園》的周邊之外，甚至還有專門的區塊放這三部作品的扭蛋，整個遊樂場也掛滿戰鬥好學園的活動廣告。<br/>
								我曾經有迷過黑貓，但現在的角色完全不認識了XD 而且意外地，感覺這三款在日本男生和女生之間都很紅。</p>
								<span class="image middle"><img src="../images/article_img/article_38_colopl.jpg" />（白貓、黑貓、戰女的扭蛋專區）</span>
								<p>在很靠近巨蛋的地方有間我最有興趣的店，那就是《庫洛魔法使》專賣店！<br/>
								入店時，剛好有三對情侶和我差不多時間一起進來，年紀跟我應該也都差不多。每個人開口第一句都是說「好懷念喔！」的確，因為我也是這樣想！<br/>
								原本以為有賣牌，結果只有賣一些周邊，像是一塊質料不怎樣的衣服，上面印了魔法陣就變超貴。</p>
								<span class="image middle"><img src="../images/article_img/article_38_sakura.jpg" />（庫洛魔法使專賣店）</span>
								<p>最後逛了 JUMP 專賣店，裡面從北斗神拳的商品到最近的排球少年都有。那天剛好有為了慶祝 JUMP SQ 十週年，邀請 2 位 SQ 的前任編輯長的座談會。SQ 我其實不熟，只知道 JUMP 底下三大漫畫雜誌分別是 JUMP、Sunday 和 Magazine。<br/>
								另外，看到這裡竟然有賣《灌籃高手十日後》，但不便宜...<br/>
								有個現象我一直覺得很有趣：日本的少年漫畫真的是男生女生都會看，反觀少女漫畫女生看的比例遠大於男生。</p>
								<span class="image middle"><img src="../images/article_img/article_38_jump.jpg" />（JUMP商店）</span>
								<p>最後逛了逛商場，把夜景拍一拍後，就前往東京巨蛋準備入場看球！<a href="memo/memo_03.jsp" class="ref">看球心得</a>另外寫了一篇，原本想說贏了就發到 PTT 上，但輸了那就算了QQ<br/>
								比賽有點久，總共打了 4 小時，結束後沒時間到處亂晃，看能不能遇到哇靠就去趕夜巴了。結果 JR 比想像中還快，很早就到新宿了，也結束這兩天一夜的東京背包之旅。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_38.jsp" data-numposts="5"></div>
								
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
