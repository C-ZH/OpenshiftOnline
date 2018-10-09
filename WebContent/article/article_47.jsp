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
			article_title = "article_47";
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
<title>【Day 89】重返 19 歲 | 京都の留學日誌</title>
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
										<h2>【Day 89】重返 19 歲</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-12-03">2017年12月3日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_47_cover.jpg" alt="" /></span>
								<p>為了能樂課的報告，必須要去京都觀世會館聽至少 2 場的能樂表演。課程大綱上是有寫會有 2 場舞台鑑賞沒錯啦，但一直以為是免費… 沒想到要 4500 日圓，不便宜耶。<br/>
								總之今天先去了第一場，也是第一次現場體驗能樂。</p>
								<p>先說結論：沒有很喜歡。<br/>
								能樂的表演除了演出故事的演員之外，側方會有像是合唱時負責和聲的「謡」，後方則有演奏樂器的樂師，常見的有笛子、太鼓、大鼓、小鼓四種，這裡的大鼓和小鼓並不是西洋樂器的鼓，而是日本的傳統樂器。</p>
								<span class="image middle"><img src="../images/article_img/article_47_instrument.png" />（左起分別為：太鼓、大鼓、小鼓、笛子）</span>
								<p>表演時間是中午 12 點到下午 5 點的 5 個小時，共 2 齣劇。但我早上很蠢地搭錯公車，原本要搭 206，結果看到 205 就坐上去了。<br/>
								搭錯就算了，還搭到往反方向的QQ 幸好那台公車是繞圈圈型的路線，為了省錢就坐了 1 小時等它繞回來，從離會館最近的站點下車後再走過去。<br/>
								然後我只看了 1齣後就離場了XD 一方面是因為能樂的台詞都念得很低沉，而且會有特殊的腔調，因而聽得不是很懂，就像是學中文的外國人聽京劇的感覺吧；另一方面是因為我太晚來沒位置QQ 現場都是和我一樣為了報告而非來不可的學生，看到某排座位的人整場都睡成一片。</p>
								<p>雖然不知道這樣類比是否恰當，但我覺得很能樂像台灣的歌仔戲。唸一般的台詞時都會有特殊的口氣，演出有劇情的故事也都會途中突然開始唱歌，並配有樂器演奏音樂。<br/>
								整個表演的起伏也很像，都是故事演出、演唱交錯，一般演出時氣氛較為低迷，當開口唱曲子時就會高昂起來，此時也通常是我精神比較好的時候XD<br/>
								四種常見樂器中，我看的那場用到了笛子、大鼓和小鼓。笛子就是演奏傳統的日式音階；大鼓會發出鏗鏘有力的聲響，有點像是梆子的感覺，演奏上沒什麼變化性，但我很喜歡它的聲音；小鼓可以發出咚咚的中空聲響。<br/>
								比較有趣的是演唱時的吆喝聲，除了演員之外，演奏樂器的樂師有時也會負責喊。</p>
								<span class="image middle"><img src="../images/article_img/article_47_poster.jpg" />（當天表演的海報）</span>
								<p>晚上攝影社 EVE 祭的慶功宴，就在能樂的會場附近。由於比預計早很多離場，想說難得來到東山站這一帶，就去逛逛平安神宮，以及走訪三年前的住宿周遭！<br/>
								平安神宮聽說原本不是神社，而是某個博覽會的展覽會場，之後才硬被改成神社。神社中間的空地非常大，風格和目前看過的其他神社很不一樣。</p>
								<span class="image left_2"><img src="../images/article_img/article_47_heian1.jpg" /></span>
								<span class="image left_2"><img src="../images/article_img/article_47_heian2.jpg" />（著名的大鳥居）</span>
								<span class="image middle"><img src="../images/article_img/article_47_baseball.jpg" />（附近的棒球場正在進行少棒比賽）</span>
								<p>之後剛好路過京都府立圖書館，身為圖資系當然要進去看看XD<br/>
								一眼看過去，門口小又簡陋，原本想說是位階很高的「府立」，應該很大或很有特色吧！果然期待越大失望也越大，就只是個不大且很普通的公立圖書館，比較有特色的地方大概是閱報室很大，報紙種類相當齊全，新聞相關的資料庫也很多。</p>
								<span class="image middle"><img src="../images/article_img/article_47_lib.jpg" /></span>
								<p>最後，回到了人生首次出國時的下榻處──Kyoto Traveller Inn。先聲明不是業配XD 如果 4 ~ 5 人來京都，這間在台灣知名度不高的旅館我認為還不賴，一晚一人大約 1100 ~ 1300 台幣，CP 值可比高雄的康X，若不想住得太簡陋很推！<br/>
								住宿方面有和室和洋房可選，之前是住和室，所以只提 5 人房和室的部分。房內空間頗大，大概有我現在的宿舍 5 倍大，當時躺下來可以輕鬆滾來滾去。<br/>
								衣櫃裡有床鋪和棉被，就跟大雄一樣，床鋪要自己舖的那種。裡面有浴衣可穿，地下室也有大浴場，但當時不敢去XD<br/>
								其他設施還有冰箱、電視、保險箱、小桌子和坐墊，冰箱可以冰一些有的沒的還不錯。<br/>
								店內人員很親切，英文也不錯。當時我和同行的朋友只會一點點日文，問櫃台附近有沒有超市，他就用我們也懂的日文跟我們說，還畫了地圖。房間也掃得很乾淨，我覺得不錯。<br/>
								房內有電熱水壺，桌上也有泡不完的日式綠茶茶包。</p>
								<p>交通方面，離一處公車站很近，走路大約 3 分鐘而已。<br/>
								距地下鐵東山站走路大約 10 分鐘，雖說離市中心的鬧區有段距離，但我個人很喜歡這種恬靜的感覺，美麗的鴨川也在附近，可以隨時去看看風景。另外還有超多的百元飲料販賣機，過橋之後的下京、中京、上京區看到都不多。</p>
								<span class="image middle"><img src="../images/article_img/article_47_inn.jpg" /></span>
								<p>同時去看了當時每晚來挑便當的 AEON 超市（來觀光，吃超市打折便當的大概不多吧XD）！那時覺得很便宜，像是牛奶、飲料和台灣比確實是便宜，但過了 3 年再來看，卻覺得有點貴，菜、肉、便當完全買不下手。比較意外的是零食和包裝飲料打折後居然是目前看到最便宜的!!! 比業務超市、高木商場還便宜，但種類不如高木。<br/>
								在裡面一邊回憶一邊逛，繞了很久後只挑了個打折的烤布丁。結帳時，前面的阿婆要我先排，原本以為他是要拿會員卡或是要回去選購其他商品，但看他仍然毫無動作繼續排著隊，原來他是看我只拿一樣商品，然後堅持要我先結帳。<br/>
								京都的老人家真的都頗有善，雖然聽說不少是笑裡藏刀啦，但感覺其實還好。</p>
								<!-- article_47_pudding.jpg cannot to be shown? -->
								<p>晚上來到居酒屋型吃到飽餐廳吃慶功宴。日本的居酒屋型吃到飽，餐點上來都是像合菜的一大盤，原本以為是一人一小份這樣。大家都吃得有點少QQ 我也不好意思要再加點，因為一點又是一大盤。<br/>
								日本人愛喝酒，因此這種吃到飽餐廳也都會有酒類喝到飽，啤酒、梅酒、日本酒、威士忌、紅酒、雞尾酒都有，當然也有軟性飲料。不過攝影社裡剛好沒有酒鬼的樣子XD 都喝得很節制。<br/>
								以價格來說，這樣子大約 2500 日圓，和台灣貴一點的吃到飽差不多。</p>
								<p>吃完後，又去了卡拉 OK 二次會！這也是我第一次去日本的卡拉 OK。<br/>
								日本的卡拉 OK 大多會有個叫做「Free Time」的方案，也就是在特定時段內，沒有時間限制「唱到飽」。<br/>
								像我們去的這間店，星期一到五和星期天，下午 6 點到早上 5 點可利用此方案，不管唱多久一律 1650 日圓。這樣算起來可能比台灣便宜，記得我高中時去過一次（也是今天以前的人生唯一一次）卡拉 OK，印象中是三小時 400 台幣的樣子。<br/>
								不過回宿舍後仔細一想，當初他們選用 Free Time 其實虧了耶。因為有人住大阪，通勤時間 2 小時而不能太晚走，所以我們只唱了 1.5 小時就離開，如果用一般方案來算是 1134 日圓。</p>
								<p>日本人真的都很會唱，像是沉默寡言的田中同學，沒想到不只長得帥，唱歌也超強，唱 flumpool 的〈君に届け〉超好聽！還有 peer support 同學很喜歡 Lovelive，雖然我沒看過，但他唱劇中的歌也很好聽。<br/>
								過去曾聽過我唱歌的人都不會否定我說我是個音痴，就連愛說場面話的日本人這次也沒什麼否定了XD 我只唱了首〈奏〉就不好意思再唱了QQ<br/>
								是說目前我能完整唱完整首的日文歌感覺有點太少，有把握的只有〈奏〉、〈小さな恋のうた〉、〈高嶺の花子さん〉。其他像是〈女々しくて〉、〈RPG〉、〈眠り姫〉和〈ray〉等等都只會部分歌詞，很怕沒辦法暢順地唱，看來要找時間認真記歌詞了。</p>
								<p>今天雖然中午才出門，但做了不少事情，尤其去東山區緬懷過去，頗有充實感！</p>
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
								<!-- Content END -->
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_47.jsp" data-numposts="5"></div>
								
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
