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
			article_title = "article_14";
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
<title>【Day 29】京都華僑總會國慶酒會 | 京都の留學日誌</title>
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
										<h2>【Day 29】京都華僑總會國慶酒會</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-10-04">2017年10月4日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_14_cover.jpg" alt="" /></span>
								<p>來到京都後，不知不覺也已經快要一個月了。<br/>
								今天剛好是中秋節，雖然我們家不太會去烤肉，但還是會吃月餅、柚子啦。昨天去超市沒看到有賣柚子，甚可惜。</p>
								<p>上星期在 FB 社團看到京都華僑總會要找留學生幫忙國慶酒會，而且可以免費吃東西就立刻報名了！當初報名時一直很怕自己日文太破不能去，幸好詢問過之後副會長說可以。<br/>
								聽說是一個很正式的活動，因此要穿西裝過去。這是我人生第一次穿上西裝，以前最多只有在全國學生音樂比賽打個領帶而已，覺得滿興奮的。然而，要出門時突然發現我的皮鞋出了問題，只好改穿黑色球鞋… 雖然我想會場上有不少人應該很快就有發現，希望大家沒有覺得我不得體之類的QQ</p>
								<p>與會的留學生有來自京都大學、立命館大學、京都教育大學等等，也有一樣是同志社的同學，還有遠從大阪攝南大學，也是今年九月才來交換的同學<br/>
								實際上去了後也發現是個比原本想像盛大的宴會，一堆政治人物有來，最大咖的大概就是京都市長，還穿和服來，而且沒有像某些議員待一下就跑了，感覺還不錯～</p>
								<span class="image middle"><img src="../images/article_img/article_14_mayor.jpg" /></span>
								<p>另外，有位議員名字很有趣，看到的人都忍俊不住，值得留念。那個名字就是「秋田公司」公司先生（在日本叫政治人物一定要加「先生」的樣子，表尊敬）！注意這不是法人團體的名字XD</p>
								<p>晚會上的料理看起來真的很高級，也第一次喝了清酒和生啤酒。<br/>
								清酒聽說度數很高，但沒有想像中那麼烈，比高粱易入口很多。聽說後勁很強，只是我喝不出來，所以也不敢喝太多。<br/>
								之前聽賣我腳踏車的大姊說生啤酒比啤酒好喝很多，喝完後覺得比台啤好喝沒錯，但大概就跟海尼根差不多吧。至於會場上還有提供葡萄酒，看起來也很好喝，但不敢混太多酒所以就沒喝了。</p>
								<p>席間的表演相當多元，而且實在是太精采，讓原先是抱著吃免錢好料的心態去參加的我都忘記吃東西了XD 離席前看到最後的義大利麵和壽司卷都還剩一半，可惜啊。另外， ASUS 以卵擊石的手機相機又在這種關鍵時刻爛掉可惡，只剩前鏡頭能用… 只好之後跟隔壁的好心同學借照片來用。</p>
								<p>首先上場是超猛超帥的二胡表演，由兩位京都的留學生演出。再來是請來的一位歌手，叫做平山みき來演唱。聽說在 20～30 年前是頗有名氣的歌手，同時也是會長的偶像XD</p>
								<p>然後是由北洋高校吹奏部一群很可愛的學生帶來的管樂表演。雖然我對古典樂不熟悉，但從外行看熱鬧的角度來欣賞，覺得水準非常高，也有聽說他們是全國大賽的常勝軍。</p>
								<span class="image middle"><img src="../images/article_img/article_14_school.jpeg" /></span>
								<p>而且他們根本就不只是吹奏部吧！演奏時各種整齊劃一又跟曲調高低起伏相符的姿勢，中間還出現像合唱團的聲樂。<br/>
								最後晚會結束前還出來帶團康，內容是找人搭肩繞會場，目標是全部串連成一長串。有點像是我幼稚園玩過的一項遊戲，但背景音樂從「一二三四五六七 我的朋友在哪裡」變成管樂曲，很有意思。</p>
								<p>接著是舞龍舞獅的表演，這是我看得最過癮的一項！一方面這真的是很道地的台灣特色；另一面真的很精采，不輸台灣當地的表演，而且和觀眾很有互動，一直在咬別人的頭XD 我們這一桌被其中一隻咬了一圈。</p>
								<span class="image middle"><img src="../images/article_img/article_14_lion.jpg" /></span>
								<p>中間是抽獎時間，最大獎是台灣日本 EVA 來回機票。雖然我對自己的運氣還算有點自信，但跟旁邊的同學正在聊去年有位同志社學姊抽中機票時，第一個獎項就突然喊到我的名字！整個嚇到。</p>
								<span class="image middle"><img src="../images/article_img/article_14_cake.JPG" />（阿薩姆紅茶口味超特別）</span>
								<p>聽說是特地台灣帶來的月餅，原本想說這兩盒既然只有一個名額，大概一盒 4 個或 6 個吧，沒想到一盒有 12 個，而且有效期限只有 1 星期!!! 這樣就要 7 天內吃完 24 個耶，豈不肥死XD 就算我有本錢吃，一天照三餐各吃 1 個對身體好像也不是很好，所以就當場發送給大家啦！剩下的份剛好讓我這一星期的早餐有著落了。</p>
								<p>留學生們最後也有個合唱〈紅蜻蜓〉的表演，不過小虎隊的歌我只會〈青蘋果樂園〉，所以只好在前兩天惡補一下XD 是說〈紅蜻蜓〉的副歌不錯聽耶，喜歡這種簡單又明快的曲調。</p>
								<p>在北洋高校學生進來帶團康前，每個人發了一面國旗，然後全員一起揮舞。先不論政治意識型態的問題，這種人在異地團結一心的氛圍我覺得很棒！<br/>
								結束後，主辦的前輩說獻花放著也是丟掉，每個人都摘了一束花回去XD 因為不喜歡玫瑰，所以只摘了我最愛的滿天星，還有一種不知是什麼的橘色花。</p>
								<span class="image middle"><img src="../images/article_img/article_14_flower.JPG" /></span>
								<p>很感謝京都滋賀地區同學會讓我有機會參加這項活動，而且留學生前輩們都人很好又很罩。也感謝主辦的劉姐、忘了名字的眼鏡大哥等人努力籌辦，活動才能很順利地落幕。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_14.jsp" data-numposts="5"></div>
								
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
