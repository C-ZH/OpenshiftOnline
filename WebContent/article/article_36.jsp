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
			article_title = "article_36";
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
<title>【Day 72】 亂入高中生修學旅行 | 京都の留學日誌</title>
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
										<h2>【Day 72】 亂入高中生修學旅行</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-16">2017年11月16日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_36_cover.jpg" alt="" /></span>
								<p>今天去參加了個「和千葉的高中生一起在秋天的京都逛街」的活動，而這其實就是之前晚了一星期打電話給我的那份打工。<br/>
								工作內容是和來自千葉縣的高二學生，在他們為期四天的修學旅行中，第三天的上午一起逛街玩耍，順便做文化交流。</p>
								<p>首先在他們下榻的飯店集合報到，飯店位置就在京都車站附近而已，離我的宿舍超近。<br/>
								然後一班分成5組，一位或兩位留學生跟著一組 8 位同學行動。我被分到的是 E 班第 5 組（其實用日文講剛好反過來，是 E 組第 5 班XD），人員組成男女各半，猜測男女比應該是有被規定。<br/>
								一開始真的很尷尬，完全不知道要說什麼，但後來有比較好了，他們的長相現在都還記得，但名字只記得一半QQ<br/>
								根據主辦單位的資訊，這間學校平常有和台灣的學校交流，但問了後才發現根本唬爛，好像是這十幾個班裡只有一個還兩個班有和台灣的學校交流過，他們班並沒有。另外，那份資訊上還寫他們被規定禁用手機，但看他們根本爽爽用XD</p>
								<p>活動的行程完全由各組自行規劃，我只是跟著走而已。幸好他們好像也沒有什麼和外國人交流的經驗，因此對我說的事情還抱有點新鮮感的感覺。反觀大學生們在大學裡可能看多了，就沒有從他們身上感受到這種感覺。<br/>
								電車上自我介紹後，到達第一站──平等院。這是我第一次來宇治，所以根本也是來觀光的XD 門票原價 600 日圓，但因為我跟著他們一起進去，櫃台可能沒仔細檢查就收我高中生的 300 日圓（其實高中生是 400 日圓，但來修學旅行的學生可以再折 100 日圓，超划算！）XD<br/>
								平等院寺廟裡其實沒什麼好說的，大致上就是觀世音菩薩、如來佛和地藏。學生們的重點應該是寺廟外的庭園風景，真的很漂亮！</p>
								<span class="image left_2"><img src="../images/article_img/article_36_1.jpg" /></span>
								<span class="image left_2"><img src="../images/article_img/article_36_2.jpg" /></span>
								<span class="image middle"><img src="../images/article_img/article_36_mochi.jpg" />（參觀完平等院後逛了一下土產街，買了抹茶紅豆餅，好吃！ 隔壁有一組其他學校來修學旅行的學生，這天氣居然在買抹茶冰淇淋XD）</span>
								<p>平等院逛完後，來到觀光客其實比鳥居還多的伏見稻荷大社。<br/>
								日本的神社感覺都長得大同小異，但伏見稻荷大社真的很不一樣，原因自然就是那著名的「千本鳥居」。此外，意外地有不少學生是第一次來伏見稻荷。<br/>
								三年前我來的時候有爬到稻荷山頂，其實不高，才 233 公尺而已，不到 101 的一半。然而，爬到山頂的人並不多，因為雖然不高，但路鋪得很長所以很花時間，越往上人會越少，當時到山頂時完全沒有其他人，和門口的人海形成強烈反差。<br/>
								他們原本似乎也想攻頂，但看到爬了半天才到地圖上的 1 / 4 就放棄了XD 體力方面男生們好像沒問題，但主要是時間問題，快的話大概來回 2 小時吧，而三年前我們用了 3 小時。</p>
								<span class="image middle"><img src="../images/article_img/article_36_3.jpg" /></span>
								<p>最後在清水五条一起吃午餐後就解散了！離開前送他們一人一包客家擂茶，這是前一天晚上特地從宿舍挖出來的，不過只剩下 7 包，後來挖半天又挖到一碗來一客，這樣就湊滿 8 個了XD 來一客真的有點 low，希望拿泡麵的同學也有機會喝到很好喝的擂茶。</p>
								<p>活動過程就不詳細記載了，比較特別的是有位學生其實是台日混血，但在場的同學都是今天才知道XD 他的祖母現在住台北，阿姨住花蓮，然後我忘了問她是不是原住民，因為臉的輪廓有點像。</p>
								<p>就把今天得知的一些，可能沒什麼用處但很有趣的豆知識、現象，或大家可能知道但跟他們確認才確定的事情記錄下來：<br/>
								<ul>
									<li>日本學校女生的制服真的沒有褲子，只有裙子。這樣冬天很辛苦耶…</li>	
									<li>日本的修學旅行都會有幾天讓學生像這樣自行安排的分組自由時間，覺得很羨慕。<br/>
									我國小時好像有分組在小人國玩，但國中、高中都只有分房而已。</li>	
									<li>日本的修學旅行時間大約都是在二年級的第二學期，不像台灣都穿便服，第一天和最後一天一定都要穿學校制服，其他天才可以隨便穿。</li>
									<li>看他們今天的自由時間行程，感覺日本人排的行程也和我們到日本觀光差不多嘛！跟我們三年前做功課時查到的資料很相似。<br/>
									他們也都會逛那種價位偏貴的土產店，然後也跟我說很貴（像明信片 1 張 300 日圓）XD 然後也必須買八橋之類的土產回去送家人。<br/>
									逛土產店時，看到日本也有「饅頭（まんじゅう）」這個食物，一模一樣的單字。但他們的饅頭是一種包內餡、小小的甜點，和我們在吃的饅頭完完全全不同。
									<span class="image middle"><img src="../images/article_img/article_36_manjuu.jpg" />（日本的饅頭，是和菓子的一種）</span>
									</li>
									<li>日本高中也會分文科和理科，但分了之後並不會作為之後編班依據。像他們現在已經分文理科了，這個組裡文理科都有，不過文科較多。<br/>
									同一個班級裡會文理科都有，當上文科科目時理科學生就自習；反之，上理科科目時文科學生就自習。</li>
									<li>我們的現代文和文言文是在同一門國文課一起上，日本似乎是把古文和現代文分開成不同科目來上。剛好宇治這邊跟紫式部有點淵源，就有提到會上源氏物語。</li>
									<li>紅葉有 2 種讀音，分別是こうよう和もみじ。前者是泛指會變紅的葉子，特別的是它還可以當する動詞用；後者則是專指楓葉這個品種。<br/>
									日本學生也說現代文在教這種東西時也會覺得複雜。</li>
									<li>現在的日本年輕人已經不知道台北 101 了，唉 老了。</li>	
									<li>東京迪士尼樂園不在東京都，而是在千葉縣！只是東京名氣比較大，名字才掛上東京。就像縮寫為 TPE 的機場不在台北，而是在桃園一樣。<br/>
									有位學生（但我打這篇時忘記是哪位了）是迪士尼的大粉絲，每個月至少會去 1 次。
									</li>	
									<li>千葉吃的特產是花生。</li>	
									<li>同志社大學在日本人之間的評價似乎真的不錯，我看這間高中的偏差值也有 68，但聽到同志社時也有點驚呼，而且感覺不像假裝的，所以應該是可信的。</li>	
									<li>之前聽說現在日本的年輕人喜歡足球，中老年人喜歡棒球。今天的四位男同學都喜歡足球，此消息應該可信度頗高。</li>	
									<li>來到京都後，一直搞不懂搭電扶梯時他們到底要靠左還靠右，這次的學生們也都搞不懂XD<br/>
									他們說東京那附近都是會靠左啦，但來到京都後看到都是靠右。我就和他們說也有不少靠左的… 大概一半一半。</li>
									<li>日本人吃麵真的都會發出聲音，我反而努力想發出來都無法耶XD</li>
									<li>之前聽說 TWICE 在日本的國高中族群很紅，事實也是如此。聽到我來自台灣，第一反應居然是 TWICE 的子瑜XD 說子瑜很漂亮後，有位女學生回我「每個人都會這樣想。」<br/>
									不愧是子瑜啊！</li>	
								</ul></p>
								<p>從上面敘述看起來，雖然我和他們似乎能正常溝通，而且有一位非常非常非常可愛的同學和我談話時都會特意用慢速，但還是遇到很多問題啦QQ<br/>
								像是會話課時教的「～んです」還是無法下意識地使用，還有「如果」的四種用法、丁寧語 / 常體的切換、時態也還無法隨心所欲應用。最要命的是，單字量不足啊!!! 感覺都一直在重複使用一樣的字彙。再加油！</p>
								<p>這活動真的很佛心，有得玩，又有6000 日圓報酬，還有不算在報酬的的午餐補助 1000 日圓和交通補助 1500 日圓。這個交通補助並不是在活動時的交通費，而是來飯店集合和解散回家時的補助。因為我是走路前往和走路回宿舍，等於多賺 1500 日圓！除此之外，途中的交通費、門票費是全額補助。<br/>
								原本以為上面說的 1000 和 1500 是當天早上會先給，但原來是之後跟薪水一起會到戶頭，今天匆匆忙忙只抓了 2000 日圓出門，幸好最後沒有付不出錢的狀況發生。</p>
								<p>雖然感覺是很輕鬆的工作，但我自認有盡心盡力去融入，至少有達到每位同學都聊過的目標（不是你好、謝謝、對不起那種而已）。<br/>
								我們只是萍水相逢，他們應該都不會記得我的名字，甚至長相，只希望他們能夠大概記得高中修學旅行時有位台灣人就好，並因為我的真誠，或好喝的客家擂茶讓他們對台灣有所興趣。<br/>
								※ 其實高二時那位四條畷的同學我還記得名字，長相也記得大概的模樣。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_36.jsp" data-numposts="5"></div>
								
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
