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
			article_title = "article_3";
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
<title>【Day 3】麥當當也懂 Makerspace | 京都の留學日誌</title>
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
										<h2>【Day 3】麥當當也懂 Makerspace</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-09-08">2017年9月8日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_3_cover.jpg" alt="" /></span>
								<p>今天早上大失敗啊… 九點半有個介紹宿舍的導覽活動，結果我居然睡過頭了，大概 33 分正要出門時，就被按電鈴了Orz 當下只覺得好丟臉QQ
								<br/>
								導覽活動分成英文導覽和日文導覽兩團，我選的是日文導覽。導覽內容其實也沒什麼啦，就跟之前寄來的資料差不多內容，雖然只聽得懂約七成，但有先看過資料所以應該沒什麼問題。</p>

								<p>下午和 PTT 網友約看腳踏車，因此想趕快解決午餐就決定去吃麥當勞了。日本的麥當勞只要下載「マクドナルド」這個 APP，裡面就有各種活動的 coupon。
								<br/>
								點了一份麥香雞配檸檬紅茶，不知道我是不是比錯位置了，他居然給熱的，今天天氣剛好也很熱…
								<span class="image middle"><img src="../images/article_img/article_3_mcd.jpg" /></span>
								但更讓我吃驚的就在照片上方那杯，沒錯！他只給你一杯熱水，檸檬紅茶要自己用紅茶包放到熱水泡，再加上檸檬汁和砂糖，完全自己 DIY 耶！蒸蚌！原來麥當勞也在推行 Makerspace。
								<span class="image middle"><img src="../images/article_img/article_3_makerspace.jpg" /></span>
								</p>

								<p>在日本腳踏車有號碼，就像機車汽車的車牌號碼一樣，因此買新車要花 510 日圓手續費辦防犯登錄（防盜登錄），轉讓也要花 510 日圓做類似的事。和 PTT 網友 C 大姊見面後，他說防盜登錄卡弄丟了，問了幾間車行，老闆們都說沒有那張卡的話不能轉讓QQ 但可以去車主 C 大姊去年辦防盜登錄的店家要看看有沒有留當初的資料。幸好 C 大姊記憶力很好，還記得是哪家，不過走路要 1 小時左右。
								<br/>
								展開1小時的旅程前先把車拿去打氣，結果發現後輪一直打不進氣，猜測是內胎爆裂，拿去檢查還真的是… 換內胎居然要 2800 日圓!!! 超貴，還要等 1 小時。反正我們下午都沒其他事了，就決定先走去C大姊去年那間店，順便比較修理的價格。好在後來問到另一家內胎要 2100 日圓，雖然還是比台灣貴，不過還可以接受啦，而且只要等 10 分鐘！差超多。
								<br/>
								最後，順利找到他去年留的資料，終於成功得到腳踏車了！
								<span class="image middle"><img src="../images/article_img/article_3_trans.jpg" />（就是用丟這張小小的轉讓書）</span>

								<p>晚上去C大姊推薦的店吃晚餐，不過是在很遠的四条，於是又走了一大段路XD
								<br/>
								和 C 大姊聊了很多，雖然才來不到一週，但在不熟悉的地方遇到同鄉，真的倍感親切！他也說了一些頗有用和有趣的事，以下條列：
								<ul>
										<li>京都的自來水真的可以喝，因為水源位在琵琶湖水庫的上游位置，所以還算乾淨不用擔心。</li>
										<li>日本電影院的好萊塢片都比較晚上映，因為他們都會做配音。</li>
										<li>雖然日本人都有點虛偽，但京都人在日本是特別笑裡藏刀、表裡不一的代名詞，有時候稱讚你會含有別的意思。例如和你說「你女兒鋼琴彈得好好聽喔！」代表要你女兒不要在家彈鋼琴，很吵。這樣講誰會知道啦!!!如果是我，一定回說「謝謝！」</li>
										<li>去京都人家裡作客，他們想要趕人時會問你「要不要吃茶泡飯？」如果是我，一定回說「好啊！」</li>
										<li>在外縣市聚餐時，聽到你是京都人，會有像是在台灣聽到天母人的反應。</li>
								</ul>
								另外也跟我講了一些店家可以逛，像是 LOFT、AEON，他只說這兩個地方像是百貨公司但又不一樣，去了就知道XD；還有介紹哪些好吃的，像是京都塔上最近開的「大起水產」迴轉壽司聽說很棒。總之，長了不少知識！</p>

								<p>算一算今天走的路，從下京區走到東山區，再從東山區走到上京區，最後走回下京區的四条，總共至少走了有 10 公里吧XD 雖然很累，但沿路的風景真的不錯看，像今天這種好天氣感覺路上怎麼拍照都好看。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_3.jsp" data-numposts="5"></div>
								
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
