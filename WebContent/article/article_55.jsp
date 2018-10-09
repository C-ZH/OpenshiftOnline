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
			article_title = "article_55";
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
<title>【Day 106】胡椒博士 | 京都の留學日誌</title>
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
										<h2>【Day 106】胡椒博士</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-12-20">2017年12月20日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_55_cover.jpg" alt="" /></span>
								<p>今天中午下課後，立刻前往京都車站的 Uniqlo 買打折到明天為止的毛帽。途中路過一棟叫做「京都 Avanti」的購物大樓，想說沒來過就進去看看，沒想到就是以前來過一次的唐吉軻德所在的大樓XD 於是隔了許久又來看看他們賣的價格，並和其他家比價看看。</p>
								<p>如果只看零食、飲料的部分，唐吉軻德的確是夠便宜！<br/>
								雖然不是全部，像是美味棒同樣的包裝賣 298 日圓，業務超市賣 248 日圓；十六茶賣 148 日圓，AEON 超市打折時賣 128 日圓；某種巧克力餅乾賣 88 日圓，高木批發賣 82 日圓。當然也有比較便宜的，像是午後紅茶賣 148 日圓，而業務超市賣 157 日圓，AEON 超市打折時賣 155 日圓；吐司一斤 59 日圓，目前看到最便宜的，業務超市要 65 日圓。<br/>
								總的來說，唐吉軻德種類多又還算便宜，交通位置也不錯。如果來觀光的話，我想應該無法跑太多家，建議要買零食、飲料就這裡買，就算比其他家貴的話也只會貴個幾十日圓，不過其他商品我就不確定了XD</p>
								<p>其實原本是想買上次買過的水果麥片，但發現那時好像是促銷價，這次看到貴 50 日圓就想說算了。<br/>
								日本商店真的很常在促銷，每次來都可能看到不同價格，比價時有點麻煩。因為我不是來觀光，所以沒有無法再來的壓力，而且想買的東西也都不是必要品，這次就只買特價商品，因為經過這幾個月，我確定他這裡的特價真的夠低了。</p>
								<p>說到促銷，日本的 12 月和 1 月被稱為折扣季，全國各地店家在這個時期打折好像是約定成俗的慣例，而且折扣都很有誠意，大致上都有到 30% off 以上。<br/>
								今天在 Uniqlo 所在的 AEON 購物中心裡，看到真的不少店家都貼出 30% ~ 50% off，而且幾乎遍及該店的整個店面，其中以服飾店為主，今天逛了好幾圈，看得我都心動動了。<br/>
								不過聽說時間越晚折扣會越多，尤其 1 月又比 12 月的折扣更兇。反正必要保暖衣物都買了，再忍一下看看好了。</p>
								<p>唐吉軻德位在 Avanti 的 2F，再往上到 4F 會有一間叫しまむら的衣服店。<br/>
								逛了一會兒，這間店的衣服價格以日本而言好便宜!!! 例如長袖上衣、襯衫落在 400 ~ 900 日圓，和在台灣時我常去的菜市場或艾○特有得比。<br/>
								但是有可能也是折扣價啦，因為他的吊牌有點特別，只是所有商品都掛那種吊牌，店家也沒明寫，所以看不太出來。</p>
								<p>5F 是GU，和在河原町的分店比起來，多了女生的飾品，空間也比較大，衣服款式好像也不太同，各有優劣啦。</p>
								<p>最後是 6F，這邊除了一間雜貨店，幾乎都是和 ACG 有關的商店。像我在第一間店裡逛了一段時間，出來後看招牌才發現是安利美特（Animate），第一次逛安利美特居然是在不知情的狀況下逛完XD<br/>
								感想四個字：「不過如此」因為我喜歡的通常不是很大眾或很主流，所以裡面大多是沒看過或沒興趣的作品。店面不大，繞一下就繞完了，但意外的是女性顧客比例比想像中高非常多，大約有 8 ~ 9 成。</p>
								<p>前面說的那間雜貨店，其實也有一區很大的漫畫區，部分漫畫現場還有提供前 1 ~ 3 集的試閱本。像我就在那邊站著看完半本《三月的獅子》的第 1 集，還有最近剛好拿來配飯吃的《來自深淵》的第 2 集。</p>
								<p>另外幾間分別是卡牌專賣店、夾娃娃機店和二手店。<br/>
								二手店的漫畫大概 150 ~ 400 日圓，我認為 150 算便宜，400 就很貴。比較有趣是看到他正在高價收購的 DVD，幾乎都是我的童年回憶XD 夢幻蠟筆王國 12000 日圓收，封神演義 18000 日圓收，靈異教師神眉最扯，35000 日圓收。<br/>
								在店門口明明有寫「未滿 18 歲禁止入店」，但還是看到一堆專制服的學生在店內，相當弔詭。不過也沒差啦，那些東西日本的便利商店就有了。</p>
								<p>天氣變冷後，食量也跟著變大，最近晚上超容易肚子餓。在唐吉軻德買了一堆垃圾食物回去儲藏，其中讓我感到最開心的莫過於Dr. Pepper！和 Pocky 一樣，是我看了《命運石之門》後才知道的東西。</p>
								<span class="image left_2"><img src="../images/article_img/article_55_drpepper.jpg" alt="" /></span>
								<span class="image left_2"><img src="../images/article_img/article_55_sg.jpg" alt="" />（真的和劇中畫的長一樣，連瓶蓋上的金色商標圖樣和位置都一樣）</span>
								<p>之前在台灣有去找過，但似乎沒什麼地方在賣，只有在板橋大遠百地下是一間專賣外國舶來品的地方看過，而且非常貴。聽說 costco 也有賣，但不清楚價格。在 PChome 看到鋁罐 330 ml 賣 35 台幣，和大遠百差不多，然而今天在日本買 500 ml 寶特瓶包裝只花了不到 30 台幣！<br/>
								之前聽說味道很奇特，評價相當兩極。在惴惴不安的心情下打開來喝了一口後，我想我是屬於好評的那群！<br/>
								剛入口時，總覺得很像以前喝過的某種東西，像是感冒糖漿但又不是，想了又想，原來是京都念慈庵川貝枇杷膏！感覺香料放不少，但除了有點太甜，我覺得不錯喝！對我而言是可能會上癮的味道。</p>
								<p>以上，El Psy Congroo。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_55.jsp" data-numposts="5"></div>
								
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
