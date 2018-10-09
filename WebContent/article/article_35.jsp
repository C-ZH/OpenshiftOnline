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
			article_title = "article_35";
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
<title>【Day 69 ~ 70】 日本剪髮初體驗 | 京都の留學日誌</title>
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
										<h2>【Day 69 ~ 70】 日本剪髮初體驗</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-14">2017年11月14日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_35_cover.jpg" alt="" /></span>
								<p>藍色星期一，這天沒發生什麼事情，比較值得提的大概是在口頭表現 A 的課第一次以日文報告。</p>
								<p>說起來我一直以來都很不擅長口頭報告，連用中文報告都做得不是很好，更遑論是用不熟悉的日文。分組報告時為了不拖累組員分數也往往不會選擇口頭，因此當課堂有個人口頭報告時，總是讓我又討厭又期待。</p>
								<p>這次報告的主題是「島根縣的蚵仔」，雖然表面說選這個題目的理由是因為金門的特產也是蚵仔，但其實只對了一半，另一半是因為以前很喜歡的一部少女漫畫《雙面小魔女》裡有提到XD<br/>
								也不是說沒有準備，但這次報告我給自己打 31 分，這是高中三年裡最低的段考分數。理由很簡單，就是爛，下台後心情真的很藍色。</p>
								<p>算了，星期二比較有趣！不少初次的體驗，包括免治馬桶和剪頭髮。</p>
								<p><b>以下內容，建議進食時、睡覺前不要觀賞!!!</b></p>
								<p>當初選到這間宿舍，想說獨立衛浴，房間內應該也是免治馬桶吧！結果只是普通的馬桶QQ 隨著天氣漸漸變冷，就一直決定挑一天在校內體驗看看。<br/>
								一坐上去，第一時間的感想是「真的是溫的耶!!!」但感覺很奇怪，只有屁屁是溫的，身體其他地方還是覺得冷，也因為這奇怪的感覺，加上不習慣而拉不出來。後來比較習慣後就沒問題了。<br/>
								馬桶有不少功能，洗屁屁還分成男生和女生，分別都可以調整水柱強度，而且水也是溫的。原本以為按了之後過一定時間水柱會自己停下來，結果沒有QQ 然後我就在那邊洗了超久才想到要再按一次XD</p>
								<p>除了洗屁屁，還有所謂的「<a class="ref" href="https://www.youtube.com/watch?v=_E5XzvKzDu0">音姬</a>」可以放出假的沖水聲，聽說是因為日本人不想讓人聽到上廁所的聲音而設計。<br/>
								最後，沖水是用感應的，但我試了好久還是沒找到它的感應方式，有時稍微站起來就會沖水，但當我手一直在感應前放著又都沒反應。幸好旁邊還有一個手動的沖水按鈕可以用，不然當時真的不知怎麼沖掉衛生紙XD<br/>
								結論：之後其實沒必要特地來用免治馬桶，因為一般的馬桶蓋坐一下也會暖起來沒差。但還是可以理解為什麼中田翔不用免治馬桶就無法打球啦XD</p>
								<p>晚上預約了一間理髮店，或著該說是美容院。<br/>
								在台灣，從小到大都只去過百元男士理髮（不是捷運站裡那種快剪，然後現在有些其實漲到 120 或 150 了）。然而據我所知，日本最便宜的理髮店叫做QB House，要 1080 日圓，但是它的廣告標語裡，有句「保證不超過 10 分鐘」讓我不敢去XD<br/>
								至於其他路上掛著紅白藍燈筒的店家，外觀看起來很平價，但也幾乎都要 2000 日圓以上。最後網路找到今天去的這間比較便宜，評價也還 OK 的店，要價 1740 日圓，只差 QB House 660日圓而已。</p>
								<p>一進去真的就像是髮廊還是美容院，但我也不確定，因為根本沒去過那種地方XD櫃檯是由一位金髮男士接待，原本以為他只是櫃台人員，沒想到正是要幫我剪髮的美髮師。<br/>
								首先他先問了能不能用推子，然後問想剪成怎樣後就開始剪。話說他們一掛上裝滿剪刀、工具的腰帶後，突然就變很帥XD<br/>
								一開始看他拿推子猛推，我還在想是不是我會錯意了，他剛剛其實是問我要理平頭嗎？當他拿出剪刀後，才想說好險我沒搞錯。<br/>
								之後用剪刀剪了滿久，剪得很仔細，大約 20 分鐘後結束。覺得神奇的地方是，腦後的頭髮他剪超久，一直上上下下一點一點地剪，我看不到所以也不知道他到底做了什麼。剪完後用手摸感覺是中間靠近漩渦的地方留比較長，單看鏡子和以往剪過的髮型差不多，但後面摸起來很不一樣。</p>
								<p>最後結束後居然有熱毛巾可以擦臉！還問你要不要擦髮蠟。身為台灣的庶民代表，下意識問「要錢嗎？」也是很正常的，畢竟根本沒去過這種店。不過當然是免錢的～ 他還跟我解釋基本上都是不用錢的XD 然後看他先噴了個不知道是什麼的液體，抹完髮蠟後又噴了個猜想是定型液的東西，前前後後花了約 10 分鐘在做頭髮。<br/>
								人生第一次抓頭髮耶！不誇張，走出店家後用手機照鏡子一直在傻笑XD 怕被當成變態只好躲到暗巷裡笑。早知道就挑早上來剪了，這樣就可以頂著這顆頭出門見人。</p>
								<span class="image middle"><img src="../images/article_img/article_35_before.jpg" />（剪髮前）</span>
								<span class="image middle"><img src="../images/article_img/article_35_after.jpg" />（剪髮後）</span>
								<p>剪髮過程中，看旁邊的美髮師和客人一直在聊天，我這邊則可能因為語言溝通的問題還滿安靜的，但這樣也好，因為剪頭髮時我不太喜歡講話，常常會不小心動到頭。<br/>
								要走出店門時，這位美髮師還幫我開門，然後 90 度鞠躬送我出店門。當下覺得日本人真的太拘謹，拘謹到有點過頭。<br/>
								整體而言，這次的剪髮體驗我很滿意，多花這 660 日圓應該是值得的！</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_35.jsp" data-numposts="5"></div>
								
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
