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
			article_title = "article_32";
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
<title>【Day 65】 日本文化特講專欄（3） 關西腔 | 京都の留學日誌</title>
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
										<h2>【Day 65】 日本文化特講專欄（3） 關西腔</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-09">2017年11月9日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_32_cover.jpg" alt="" /></span>
								<p>米哪嗓，偶海幼！<br/>
								是的！又是每週期待的日本文化特講，今天介紹的是「関西弁（關西腔）」，上面那句「みなさん、おはよう！」是我模仿關西腔的音調打出來的，但我也還不是很懂，不保證對啦XD </p>
								<p>聽說不少留學生都和我一樣對這個超有興趣，畢竟難得來到日本關西念書。尤其在同志社目前接觸到的日本學生，高達八成以上都是關西人，尤以大阪最多。想得起來不是關西人的只有一位茨城縣，還有一位宮崎縣，而在回想這個時，有點意外沒有半個東京人XD</p>
								<p>這篇想要稍微介紹一下今天課堂上學到的內容，但也只有一堂課，時間有限也學得不是很完善。<br/>
								首先，先說一些真的會用到的常用打招呼或生活用語：</p>
								<ol>
										<li><span class="kansaiben">あかん</span> <b>不行</b><br/>
										就是<u>だめ</u>。</li>
										<li><span class="kansaiben">ちゃう</span> <b>不對</b><br/>
										就是<u>違う（ちがう）</u>。<br/>
										這個說法我覺得超可愛，還可以延伸出一段很有趣的對話！類似於「I saw a saw saw a saw」（我看見一把鋸子在鋸鋸子）。<br/>
										A：「あれ、ちゃうちゃうちゃう？」<br/>
										B：「ちゃうちゃう、ちゃうちゃうちゃう。」<br/>
										在翻譯前，先提一下有種狗叫做「チャウチャウ」，餵狗後中文是叫「鬆獅犬」。<br/>
										以下還原成標準語：<br/>
										A：「あれ、チャウチャウじゃない？」  咦，那是鬆獅犬嗎？<br/>
										B：「違う違う、チャウチャウじゃない。」  不是不是，那不是鬆獅犬。<br/></li>
										<li><span class="kansaiben">あほ</span> <b>傻瓜</b><br/>
										罵人用語，就是關東說的<u>ばか</u>。<br/>
										在關西，羞辱程度 ばか > あほ，關東則相反。老師現場訪問一名大阪助教，他表示聽到ばか會想揍人XD<br/>
										但比較不一樣的是あほ依據使用情境會有不同含意，例如情侶放閃時說，就是充滿愛意的表現，其實中文有時也可以聽到相似用法。<br/>
										另外還有一種罵人說法是「ぼけ」，但沒特別解釋到。總之，因為是罵人用語，所以還是不能太隨便使用。</li>
										<li><span class="kansaiben">ええ</span> <b>好</b><br/>
										就是<u>いい</u>。<br/>
										常用「ええなぁ」（好好喔），就是「いいね」。</li>
										<li><span class="kansaiben">いやや</span> <b>討厭</b><br/>
										就是<u>いやだ</u>。<br/>
										其實這是一個文法，關西腔會把名詞和形容動詞最後面的「だ」轉換成「や」。助教表示，日常生活很常用。</li>
										<li><span class="kansaiben">なんで</span> <b>為什麼</b><br/>
										就是<u>どうして</u>，其實之前就聽過這用法，但不知道是關西腔XD<br/>
										可以提個我第一句學到的關西腔「なんでやねん」，漫才（類似對口相聲的搞笑方式）中常出現，吐槽用語。</li>
										<li><span class="kansaiben">ほんま</span> <b>真的</b><br/>
										就是<u>ほんとう</u>。路上很常聽到。<br/>
										同理，「ほんまに」就是「ほんとうに」(紅豆泥)。</li>
										<li><span class="kansaiben">ほな</span> <b>那麼</b><br/>
										就是<u>では或じゃ</u>。</li>
										<li><span class="kansaiben">ほかす</span> <b>丟掉</b><br/>
										就是<u>捨てる（すてる）</u>。<br/>
										老師表示，很多來自關東的學生在關西打工，要它丟垃圾時聽到這個詞都會聽不懂。</li>
										<li><span class="kansaiben">こおへん / きいひん</span> <b>不來</b><br/>
										就是<u>来ない（こない）</u>，大阪常用こおへん，京都常用きいひん。其實這個詞各地還有更多不同的用法。<br/>
										這裡可以導入個文法，關西腔裡動詞的「～ない」，五段動詞會變成「～[ a ]へん」，例如「飲まない」變成「飲まへん」；上一段動詞會變成「～[ i ]ひん」，例如「見ない」會變成「見いひん」；下一段動詞會變成「～[ e ]へん」，例如「寝ない」會變成「寝えへん」。<br/>
										但要注意，上面的見いひん和寝えへん分別多出一個い和え，是因為關西腔有把單音的單字拉長的傾向，例如「胃（い）」唸法會變成「いい」。一般的上 / 下一段動詞不用拉長，像是「読めない」變成「読めへん」。<br/>
										若是過去式，直接在後面加「かった」就好，例如「飲まへんかった」。<br/>
										還有一個值得一提，「ある」的否定標準語是「ない」，關西腔只要依照上面的變化變成「あらへん」就好。</li>
										<li><span class="kansaiben">せやな</span> <b>對啊</b><br/>
										就是<u>そうだね</u>。上課其實沒提到，但路上超常聽到。<br/>
										這句除了第一個字元，其實也是文法變化而已。「だ」變「や」，語尾助詞「ね」變「な」。另外，補充語尾助詞「よ」會變「で」。</li>
								</ol>
								<p>其實關西腔真的難的地方並非字詞不同或文法變化，尤其敬語變得超簡單。反而在語調部分，重音和全日本所使用的「標準語」差很多。</p>
								<p>此外，京都人身為日本的天龍人，無法忍受自己說的話被稱作「京都弁」，認為鄉下地方才會用到「弁」這個字，因此都說自己的口音是「京ことば」。例如：「です」→「どす」。<br/>
								然而，經過好幾位京都人認證，這些京ことば已經不會在日常生活中使用了，會聽到的場合大概只有在藝伎表演時聽到。</p>
								<p>結束！打這篇一直切換輸入法好麻煩XD</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_32.jsp" data-numposts="5"></div>
								
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
