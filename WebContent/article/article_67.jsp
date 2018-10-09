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
			article_title = "article_67";
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
<title>【Day 128】 日本文化特講（6） 流行語 | 京都の留學日誌</title>
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
										<h2>【Day 128】 日本文化特講（6） 流行語</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-01-11">2018年1月11日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_67_cover.jpg" alt="" /></span>
								<p>星期四又是日本文化特講的時間，這次的主題是年輕人的用語。</p>
								<p>這裡的年輕人是指大約 30 歲以下，最多到 40 歲的人會說的話。比較具代表性的是以下幾個：</p>
								<ol>
										<li><span class="kansaiben">めちゃ</span> / <span class="kansaiben">超（ちょう）</span> <b>非常</b><br/>
										同於<u>すごく</u>、<u>非常に</u>之類的。<br/>
										めちゃ原先是關西腔，後來變成流行語。</li>
										<li><span class="kansaiben">マジ（で）</span> / <span class="kansaiben">ガチ（で）</span> <b>真的</b><br/>
										就是<u>本当に</u>。<br/>
										有句話會常聽過，那就是「マジっすか？」，同於「本当ですか？（真的嗎？）」</li>
										<li><span class="kansaiben">ウケる</span> <b>好笑</b><br/>
										其實這個原先是辣妹用語，意思同於<u>面白い</u>或<u>笑える</u>。<br/>
										常和上面的超一起使用，變成「超ウケる」代表超好笑。</li>
										<li><span class="kansaiben">ファミマ</span> / <span class="kansaiben">スタバ</span> / <span class="kansaiben">マクド</span> <b>全家便利商店</b> / <b>星巴克</b> / <b>麥當勞</b><br/>
										<u>ファミリーマート</u> / <u>スターバックス</u> / <u>マクドナルド</u>的簡稱，大概就像我們會說的全家、潮巴克、麥當當、小 7 這種感覺。<br/>
										另外之前在說和日本同學聊天的時候也有提過，關西的麥當勞會說<u>マクド</u>，關東是說<u>マック</u>。</li>
										<li><span class="kansaiben">就活</span> / <span class="kansaiben">婚活</span> / <span class="kansaiben">終活</span><br/>
										<u>就職活動</u> / <u>幸せな結婚をするための活動</u> / <u>人生の終わりのための活動</u>的簡稱，簡單來說就是為了就業 / 結婚 / 過世所做的事前準備。<br/>
										比較有趣的是終活，之前上身分法時教授有提過。</li>
										<li><span class="kansaiben">おつ</span> / <span class="kansaiben">おっつー</span> / <span class="kansaiben">おっさん</span> <b>辛苦了</b><br/>
										就是<u>あつかれさん</u>的縮語。</li>
										<li><span class="kansaiben">あけおめ</span> / <span class="kansaiben">ことよろ</span> <b>新年快樂</b> / <b>今年也請多多指教</b><br/>
										就是<u>明けましておめでとう</u> / <u>今年もよろしく</u>的縮語。</li>
										<li><span class="kansaiben">りょ</span> / <span class="kansaiben">あ～ね</span> <b>了解</b> / <b>原來如此</b><br/>
										<u>了解しました</u> / <u>あ～なるぼどね</u>的縮寫，就像我們也會說只說「了」或「就醬」這種感覺吧。。</li>
										<li><span class="kansaiben">キモい</span> / <span class="kansaiben">ウザい</span> / <span class="kansaiben">ハズい</span> / <span class="kansaiben">エモい</span> / <span class="kansaiben">チャラい</span> <b>噁心</b> / <b>吵死了</b> / <b>難為情</b> / <b>讓人感到動搖、激動</b> / <b>輕浮</b><br/></li>
										<li><span class="kansaiben">ググる</span> / <span class="kansaiben">コクる</span> / <span class="kansaiben">ハマる</span> / <span class="kansaiben">コピる</span> / <span class="kansaiben">オケる</span> <b>餵狗</b> / <b>告白</b> / <b>熱衷於</b> / <b>影印；複製</b> / <b>去唱卡拉 OK</b><br/>
										源自於<u>グーグルで検索する</u> / <u>告白する</u> / <u>夢中になる</u> / <u>コピーする</u> / <u>カラオケに行く</u>。</li>
										<li><span class="kansaiben">ディスる</span> <b>看不起</b><br/>
										源自英文網路用語 dis 或 diss，就是輕視某人的意思。</li>
										<li><span class="kansaiben">ヤバい</span> <b>糟了；好棒</b><br/>
										原先意思是<u>危ない</u>，但用作流行語的意思變成<u>すごい</u>，可用在抽象的事情上，像是食物的味道、事件等等。</li>
										<li><span class="kansaiben">ぼっち～</span> <b>獨自～</b><br/>
										作為接頭語使用，意思是<u>ひとりぼっちで～する</u>。<br/>
										例如「ぼっち飯（めし）」是獨自一人吃飯，「ぼっち映画」是獨自一人看電影。</li>
										<li><span class="kansaiben">ガチ～</span> <b>認真的～</b><br/>
										作為接頭語使用，同於<u>真剣な</u>，ガチばな代表認真的話。</li>
										<li><span class="kansaiben">壁ドン</span> <b>糟了；好棒</b><br/>
										就少女漫畫常有的那種男角一手扶著牆壁，面對女角的情節。感覺在台灣也很常聽到。</li>
										<li><span class="kansaiben">KY</span> <b>白目，天兵</b><br/>
										<u>空気が読めない</u>的縮寫，不會閱讀空氣的人，也就是不會看情形的白目人。</li>
										<li><span class="kansaiben">JK</span> / <span class="kansaiben">JD</span> <b>女高中生</b> / <b>女大學生</b><br/>
										<u>女子高生（じょしこうせい）</u> / <u>女子大生（じょしだいせい）</u>的縮語。</li>
										<li><span class="kansaiben">リア充</span> <b>現充</b><br/>
										這應該很多人都知道了，就是人生勝利組的意思啦。<br/>
										リア充爆発しろ，就是現充都去死（爆炸）吧的意思。</li>
								</ol>
								<p>下課後，和一位同宿舍的朋友露西（男）去超市買東西，路過博物館在展示畫作就進去看了看。展示的主題是「為原爆祈求」。<br/>
								逛完之後，2 位工作人員請我們簽簽到簿，看到我們分別來自中國和台灣後就跟我們聊了很多。</p>
								<p>一位年紀較大的工作人員說有去過台灣玩，不意外又是九份XD 還有圓山大飯店。他還說有去「中山」，一開始好像是說なかやま，但我沒聽懂所以後來寫在紙上。我想總不可能是高雄中山吧，那應該是指淡水線中山站那裡。<br/>
								另一位較年輕的工作人員是同志社的學姊，他的祖父是日本人，但是說是來自台灣，1945 年二戰結束後才回到日本，聽到後立刻心想這不就是所謂的灣生嗎!? 而他的祖母就是台灣人，難怪我一見到他就覺得他長得很親切XD</p>
								<p>因為 1/11 是日本「鏡開き（かがみびらき）」的日子，要把過年前放置的年糕剖來吃。因此，晚上我就來煮看看紅豆年糕湯！<br/>
								原則上鏡開き不能用刀子之類的尖銳物切年糕，因為要避免連想到切る這種比較不吉祥的字眼，所以要用鎚子之類的鈍器。然而我手上只有菜刀，所以也只能用菜刀了XD</p>
								<span class="image left_2"><img src="../images/article_img/article_67_mochi.jpg" alt="" /></span>
								<span class="image left_2"><img src="../images/article_img/article_67_zenzai.jpg" alt="" /></span>
								<p>文化特講的課算是告一段落了，期末考週因為之前有去工廠參觀了所以不上課，下週將是最後一堂課。真的很高興最後可以選到這門課，原本差一點忽略掉XD</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_67.jsp" data-numposts="5"></div>
								
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
