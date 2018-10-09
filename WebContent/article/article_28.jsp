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
			article_title = "article_28";
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
<title>【Day 58】 日本文化特講專欄（2）同志社大學 | 京都の留學日誌</title>
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
										<h2>【Day 58】 日本文化特講專欄（2）同志社大學</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-02">2017年11月2日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_28_cover.jpg" alt="" /></span>
								<p>今天又是日本文化特講課程的日子！原本想說這天的授課內容應該沒什麼好寫的，但其實還頗有趣的。<br/>
								今天課程進行分成兩部分，第一部分由老師介紹同志社大學的歷史，接著由學校的志工帶我們參觀校園並解說。</p>
								<p>提到同志社的歷史，就不得不來介紹它們的創辦人──新島襄。<br/>
								來同志社之前，為了掰志望理由書有稍微查一下而得知新島襄的事蹟，不過也僅限於他到美國念過書、綾瀨遙在大河劇《八重之櫻》演過他的老婆，然後和慶應大學的創辦人「萬元鈔票先生」福澤諭吉的聲望差不多，都對教育很有貢獻。雖然最後覺得理由書中特意提到他有點假就沒寫了XD<br/>
								上過課後，我也開始認同他確實是個滿偉大的人。這邊只簡單介紹，新島先生的詳細經歷網路上的資料應該更完整。</p>
								<p>首先，他是第一位到美國留學的日本人，自小愛好閱讀書籍，在書中看到美國的民主制度而萌生赴美的想法。然而，在他身處的江戶時代下日本正在鎖國，因此身為獨生子的他只能悲痛地選擇拋棄家鄉和家人，以偷渡的方式前往。到達美國時，美國人船長經過和搭的一番談話後，決定和老婆一起收養牠為養子，並改名叫做 Joe，幫助他在美國的生活。<br/>
								剛到美國後，他發現他的英文完全無法溝通，但還是很猛地四年就念完大學並取得學位。其後，日本鎖國結束，派了一支使節團到美國參訪，同時也讓新島襄持有正式的留學生身份。</p>
								<p>在美國經過洗禮成為基督徒的新島襄，在拿到理學士學位後又拿了個神學士學位。畢業後決定回國辦教育，並得到行政官員的允許得以到京都設立學校。京都市做為古都，寺廟神社相當多，且以當時的環境而言相當保守，反對聲浪源源不絕。最後雙方做出讓步，達成「不能有傳授基督教教義的課程和行為」的協議才順利成立「同志社英學校」（這是高中），位置就在現在的同志社大學。這間高中現今仍在，只是後來遷址到別處。<br/>
								不久後又設立的同志社女學校（現今的同志社女子大學和中學，但那時只有高中），然後又想再設立大學，只可惜晚年身體狀況不佳，飲恨離世。因此，同志社大學其實是在他過世後才出現。</p>
								<p>新島襄的簡介大概就是這樣，我覺得是一位還不錯的教育家。接著校園建築觀禮的部分，似乎有不少古蹟，但這裡只提兩個我覺得有趣的地方。<br/>
								第一個是教堂。小小的同志社大學裡就有三座教堂，並在平日五天中共會開放三天讓學生或教職員使用，聽說有時候還有結婚典禮呢！我們有進去其中一座教堂，裡面真的很漂亮，尤其當陽光從彩繪玻璃透出，在地板上形成七彩圖樣時真的很美。<br/>
								第二是聖誕樹。在良心館前有顆很大很壯觀的聖誕樹，而且是長在土裡的那種，聽說聖誕節時會有點燈儀式，相當期待！<br/>
								此外，校內有個地放就像是台大的校史館，可以免費入場參觀。</p>
								<p>有件頗有趣的事情，就是當老師說她從小學到研究所都念同志社時，後方的日本學生助教立刻冒出一句「お金持ち」，也就是有錢人。<br/>
								其實我當時也是這樣想，因為來日本前有特別查一下我省了多少錢，得知同志社大學一年的學費平均要 100 萬日圓，剛入學時還有一筆 20 萬的入學金。另外，我的 peer support 應該家境也不錯，也是從小就從同志社念上來，還加了不少社團（我覺得社費都不算便宜）。<br/>
								說到這個，日本很多大學都可以從有關係的高中直升，當然門檻也比較低。因此，同志社裡從同志社體系升上來的學生也不在少數。</p>
								<p>下午有個打工的電話面談，工作內容是去和從千葉來修學旅行的高中生一起去賞楓，好玩又有錢拿。<br/>
								其實上星期就有敲定一天進行電話面談，但我那天從下午 4 點等到 晚上 9 點都沒有電話，也就是被放鴿子。但前天他們又突然來信說忘了很抱歉等等，想要再約今天面談。雖然不爽，但還是為了東京的旅費而裝作不介意。<br/>
								面談內容大致上是先問我一些基本資料，大概是要和履歷核對，然後問我來日本多久、會待到什麼時候、參加動機之類的。接著突然說他們也有不少英文的 case（他們公司專做這種留學生國際交流活動），要我做一分鐘英文介紹。在受到嚇嚇的狀況下，花了 30 秒想了一下要講什麼。講出來和剛剛想得不同且零零落落，只用了大概40 秒就句點了，但聽電話彼端的態度，他好像還算滿意！</p>
								<p>最後，不到 5 小時就寄信說錄取了，快得相當詭異。<br/>
								以下是我個人猜測：原本看我的履歷覺得不行，決定放我鴿子。但過了一週後，實在太缺人就又寄信。如此猜測的理由三點，第一，錄取通知實在來得太快，很不自然；第二，不管日文部分還是英文部分，我面談都講得很糟，完全不認為有到可以讓他們滿意的程度。第三是最主要的原因，他們的徵才廣告，限定條件從「台灣出身」變成「國籍不拘，台灣出身為佳」。<br/>
								算了，反正有錢拿就好。</p>
								<p>話說明天是個大家都不太知道的假日「文化之日」，連部分老師也不清楚是否放假XD</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_28.jsp" data-numposts="5"></div>
								
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
