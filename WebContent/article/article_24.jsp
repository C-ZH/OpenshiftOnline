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
			article_title = "article_24";
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
<title>【Day 50 ~ 52】低頭吃便當 | 京都の留學日誌</title>
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
										<h2>【Day 50 ~ 52】低頭吃便當</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-10-27">2017年10月27日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_24_cover.jpg" alt="" /></span>
								<p>已經來到第 50 天囉… 交換時間轉眼間已經過了 1/3，這兩天發生了不少讓我覺得「早知道就…」的事情。</p>
								<p>星期三再次來到出町柳桝形商店街，逛了一下除了ゑびす的店。首先，逛完第一間 Le Plus 百元商店後，讓我有著一股很悲喜交加的想法。</p>
								<span class="image middle"><img src="../images/article_img/article_24_gate.JPG" />（桝形商店街入口）</span>
								<p>悲的是早知道就早點來這裡，和我在此之前常去的百元商店 ダイコク 相比，餐具都比較可愛或典雅有質感。這間的商品種類也多很多，不管是衛生用品、廚房用品都勝過 ダイコク，尤其是文書用品，我在校內的書店買了比較不合用又比較貴的資料夾，Le Plus 裡就有剛好又便宜的類型。<br/>
								喜的是好險沒太早知道這裡，要不然在買齊生活用品以前來，一定會失心瘋買一堆不需要的東西XD<br/>
								ダイコク 的優點是「含稅」100 日圓，而 Le Plus就和一般百元店一樣，「不含稅」100 日圓，也就是真正的價格是 108 日圓。因此，在這裡也幫 ダイコク 平反一下，有些一模一樣的商品，到 ダイコク 買比較划算！</p>
								<p>這裡不少間店家很像是台灣的菜市場，有賣水果、蔬菜、生肉、鮮魚等等，但價格其實也有點微妙，不一定比業務超市或ゑびす便宜。另外，還有一間二手書店和一間服飾店還沒逛，早知道之前就不要那麼懶，覺得遠就一直沒來逛過。</p>
								<p>最近桝形商店街好像有活動，星期六以前，商店街內買 300 日圓可換一張兌換券，累積 5 張可抽獎一次。就和烏龍派出所裡會看到的那種轉盤抽獎一樣，今天路過時還聽到有人中獎的搖鈴聲XD 可惜要抽獎的消費金額太高，我在這裡應該不會花到那麼多錢。</p>
								<span class="image middle"><img src="../images/article_img/article_24_fukubiki.JPG" />（抽獎區）</span>
								<p>星期三晚上參考了<a href="https://www.youtube.com/watch?v=8A8bUDib4iM" class="ref">柯建年老師的作法</a>做看看漢堡排，原則上好像是豬絞肉和牛絞肉各半，但我不吃牛所以全用豬肉。<br/>
								沒想到整個製作時間居然花了 3 小時，除了我技術真的不好之外，我認為和流理台太小絕對也有關連！而且煎完之後的事後清理超難用，油到爆。</p>
								<span class="image left_2"><img src="../images/article_img/article_24_obentou.JPG" />（隔天的便當）</span>
								<span class="image left_2"><img src="../images/article_img/article_24_dinner.jpg" />（當天的晚餐，漢堡排、蔥花蛋）</span>
								<p>星期三晚上吃掉一半，星期四早上就把剩下的一半熱一熱，然後放涼裝到便當盒帶去學校當午餐。在寒冷的天氣中，曬著太陽，看著樹木，吃著便當，真的是非常舒適啊！這樣煮一頓吃兩餐，平均只要大概 180 日圓耶！而且又吃得很飽，早知道就早點這樣做了。<br/>
								晚上又試著做了蛋包飯，但最後一步翻到盤子裡真的好難QQ 照片是用手偷調整過的樣子。</p>
								<span class="image middle"><img src="../images/article_img/article_24_omuraisu.jpg" />（就像斯斯有四種，蛋包飯也有兩種作法，這是比較原始的作法）</span>
								<p>因為網誌更新又比預計晚了一天，所以順便寫星期五的事情XD<br/>
								下午又去了桝形商店街，這次看到一個很神奇的東西，就是「客家擂茶」！我看說明的看板上面只說這是東亞的食物，就去問攤販這是日本產的嗎？果不其然，他說是台灣來的。</p>
								<span class="image middle"><img src="../images/article_img/article_24_hakka1.JPG" /></span>
								<p>然後就和他們表明我是台灣人，想試喝看看（先澄清，他本來就有提供試喝）。一喝，很棒！味道和在台灣老街喝到的一樣。接著店家就拿出一本不知道是什麼，寫著繁體中文的台灣雜誌，上面有介紹他們在大阪的製造商從台北的九份直接進口客家擂茶到日本。</p>
								<span class="image middle"><img src="../images/article_img/article_24_hakka2.JPG" />（桌上放有很多擂茶用的穀物）</span>
								<p>剛好前陣子我家才跟電鍋一起寄來一大包擂茶XD 如果喝完又有閒錢，就來這間捧場一下好了！</p>
								<p>真的很喜歡這條商店街的氛圍，不像是錦市場、京極通那樣商業化，比較接近我在烏龍派出所看到的淳樸商店街，也有點台灣傳統市場的感覺。<br/>
								是說，回宿舍查了後才發現，原來有部動畫以這裡當舞台設定。看了宣傳海報，真的和桝形商店街長很像！</p>
								<span class="image fit"><img src="../images/article_img/article_24_street.png" />（今天拍的照片和宣傳海報的對照圖）</span>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_24.jsp" data-numposts="5"></div>
								
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
