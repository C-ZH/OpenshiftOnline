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
			article_title = "article_50";
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
<title>【Day 100】日本文化特講（5）京都在地企業 | 京都の留學日誌</title>
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
										<h2>【Day 100】日本文化特講（5）京都在地企業</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-12-14">2017年12月14日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_50_cover.jpg" alt="" /></span>
								<p>第 100 天！正式進入 3 位數了QQ<br/>
								從上一週開始，文化特講連續 3 週的課程內容都會和京都當地的企業有關。</p>
								<p>相信大部分人都不清楚有哪些位在京都的企業，老師問大家時，只聽到一堆人說京阿尼。<br/>
								在來日本之前，提到京都的企業我也是只知道以前朋友提到過的京阿尼而已，完全沒想到以京都為起始的企業有那麼多!!! 以下提幾個比較有名的企業：
								<ul>
									<li><b>華歌爾</b><br/>
									我沒穿過所以不太熟XD 但原本一直以為是歐美的牌子。</li>
									<li><b>餃子王將</b><br/>
									還以為是大阪的品牌，剛來到京都時看到那麼多家反而覺得弔詭。</li>
									<li><b>任天堂</b><br/>
									想不到我學日文的契機，剛剛好就在京都!!!<br/>
									說到我學日文的理由，最初只是很單純地想看懂 Pokémon 的遊戲劇情，也就是學好玩的。小時候總是抱著一本堂姊送的黃版攻略本在讀，讀到後來看開頭幾個字就可以辨識出是哪隻神奇寶貝或哪個招式（我想很多的 PM 玩家都和我一樣），還記得大嘴蝠（ゴルバット）和哥達鴨（ゴルダック）的拼法太像，讓我常常搞錯XD 看到最後，甚至把後面附的圖鑑，哪頁是哪隻神起寶貝都記起來了。<br/>
									也因此，當初背 50 音從片假名開始背，而且招式表和圖鑑都是照 50 音排列，讓我後來背 50 音所花的時間也相對不算多。這樣嚴格算來，我從 7 歲就開始學日文XD</li>
								</ul>
								</p>
								<p>有點扯遠了，總之有機會，我一定要去任天堂看看！<br/>
								回到正題，今天到「島津製作所」做企業參訪。這間京都在地企業以生產精密儀器聞名，包括測量儀器、醫療儀器、航空零件和產業機器為主。</p>
								<p>京都的島津製作所是總公司，因此以研發為主，但這次參觀的內容只有儀器介紹，並沒有看到工廠或實驗室。<br/>
								廠方人員為我們介紹了醫療儀器及測量儀器，並配有一位中文翻譯人員隨行。由於我不是相關科系的，對於這些儀器非常不了解，我想如果是醫學院、工學院或是化學系的朋友，應該就會比較有感觸。</p>
								<p>這個課程大約有 40 人選上，其中 3 位台灣人、2 位韓國人、1 位越南人，剩下的全是中國大陸的學生…<br/>
								這次廠方在介紹他們獲利最多的測量儀器部分時，特別準備了中文、英文和日文的解說人員，相當用心。然而，上星期老師請想聽中文解說的人舉手時，包括我只有不到 10 人左右舉手，還因為太少所以問了 3 次。今天要我們各自選解說人員時，幾乎全部人都跑到中文那一塊= = 莫名其妙。<br/>
								韓國人裡有位日文級數 9 級的怪物，因此他們選日文沒問題，但看到英文解說人員旁只有 1 位越南同學，感覺有點可憐，我和其他台灣同學就也去聽英文啦XD 另外還有 3 位左右對岸同學也和我們相同想法過來，以及 1 位人真的超好的日本帥哥同學。<br/>
								英文解說由 1 男 1 女負責。前半段的女解說員英文超標準，發音很漂亮，完全沒有日本人的腔調，也講得很清晰，因而較好理解；後半段的男解說員很認真地解說，還親自操作儀器給我們看，但就有很重的日式腔調。<br/>
								老實說，我英文本身就很廢，專有名詞又多，全部內容只聽得懂 30 ~ 50 % 而已QQ 但聽完感覺還是很有趣啦！</p>
								<p>想省錢用走的回宿舍時，在二条附近路過一棟叫 Bivi 的購物中心。之前完全沒發現這裡有購物中心，因此就近去逛了一下。<br/>
								1F 有書店和很多餐廳。<br/>
								2F 有間不大也不小的遊戲中心，還有個小小的可麗餅卻賣 400 日圓的餐車，雖然我還是買了XD<br/>
								<span class="image middle"><img src="../images/article_img/article_50_crepe.jpg" />（起司照燒雞可麗餅）</span>
								3F 只有停車場。<br/>
								4F 是間電影院，也是我第一次踏入日本電影院大廳。<br/>
								無聊調查了一下電影的比例，全部 24 部正在上映的作品中，動畫或特攝片共有 5 部，日本片有 8 部，外國片只有 11 部。整體而言，日本本土電影不少，不像台灣滿滿的好萊塢。此外，只要是日語發音就不會有字幕，外國片有些也會有日文配音。</p>
								<p>雖然沒看到工廠有點遺憾，也沒有相關背景知識來感嘆，但還是滿好玩啦！廠方真的對這次參訪超用心，共計出動了 5 名員工來協助解說，Q &amp; A時間也很充裕，最後還送了一堆紀念品，不過可能也和老師以前在島津工作過有關啦～</p>
								<span class="image left_3"><img src="../images/article_img/article_50_gift1.jpg" />（傳說中的いろはす！日本有名的瓶裝水）</span>
								<span class="image left_3"><img src="../images/article_img/article_50_gift2.jpg" />（左邊是個小型萬花筒，右邊的白色盒子裡是一套手足修剪磨拋用具 ）</span>
								<span class="image left_3"><img src="../images/article_img/article_50_gift3.jpg" />（盒子裡的內容物相當豐富，光是左邊的指甲刀和小剪刀，之前在金興發買就要 80 台幣，這次還多了銼刀、鑷子、像是挖耳朵的器具，以及一個不知道是啥的東東）</span>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_50.jsp" data-numposts="5"></div>
								
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
