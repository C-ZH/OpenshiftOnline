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
			article_title = "article_44";
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
<title>【Day 83】 EVE 祭（2） 女僕咖啡廳 | 京都の留學日誌</title>
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
										<h2>【Day 83】 EVE 祭（2） 女僕咖啡廳</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-27">2017年11月27日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_44_cover.jpg" alt="" /></span>
								<p>EVE 祭第二天！但是早上突然收到虎航要打折的資訊，為了搶票只好請掉早上的排班。<br/>
								沒想到時間到了後，虎航的訂票網站狂當並跳出，有夠爛。好不容易進去之後發現根本沒放票… 虎航不愧是唬航。</p>
								<p>今天大概是我這三天 EVE 祭裡最特別的一天XD 詳細後述。<br/>
								總之又到了攝影社幫忙，雖說幫忙，但其實感覺不太有事情做。抵達教室不久後，又來了 2 位在攝影社是前輩級的同學，分別是穿衣風格奇特的南鄉和碩二的大學長原田。<br/>
								他們同樣問了我是誰，接著果然又問我的年紀XD 只是沒想到原田比我還大，他看起來頗年輕，大概大二的感覺。拿下眼鏡後的臉，加上染金髮和玉米鬚，有點像以前的屁孩高中生。</p>
								<span class="image middle"><img src="../images/article_img/article_44_sandwich.jpg" />（原田請的草莓水果三明治）</span>
								<p>南鄉今年大四，和我一樣 22 歲，是去年的攝影社社長；原田則是 3 年前的社長，長相、談吐都有點像台灣的同學，讓我很有熟悉感，人也很親切。<br/>
								不知怎麼了，他們突然提到想去女僕咖啡廳看看，問我要不要去。我人生中還沒去過女僕咖啡廳，感覺非常有趣就一起去了XD</p>
								<p>日本的男生真的人都不錯，昨天的田邊也是，感覺很好客，我說話時講得很破很難懂，他們也都還是非常認真地聽，給人的感覺很好。<br/>
								路上和他們聊了不少，發現日本女生對女僕咖啡廳的接受度不是很高。我不清楚台灣的狀況，因為也沒和人聊過這個，但他們兩人的女朋友其實都不允許他們去，所以他們都是偷偷去的XD</p>
								<p>一到店面門口，南鄉發現在門口顧店的女僕店員是和他同一個研究會的後輩。出店的社團好像是御宅社團，而那位後輩似乎跟我一樣是隱性宅，甚至比我還隱性。我的話是平常沒必要不會和沒興趣的人聊比較宅的話題而已，但他感覺是完全不想讓身邊的人知道（雖然當下覺得你在這顧店怎麼可能不會遇到認識的人XD）。<br/>
								他一直請求南鄉絕對不要和研究會的其他人講，南鄉則說他是瞞著女朋友來，講了不就也曝露自己來過的事實XD</p>
								<span class="image middle"><img src="../images/article_img/article_44_entrance.jpg" />（女僕咖啡廳門口）</span>
								<p>店內賣的東西很簡單，只有咖啡、紅茶、鬆餅和餅乾。<br/>
								這頓由原田請客。我的感覺是日本學長學弟雉很重，但學長會很照顧學弟，像昨天田邊也有請櫻木吃東西。<br/>
								話說我覺得我一直被日本男生請客XD 之前被 peer support 請麵包，昨天也被櫻木請了餃子。雖然都只有 1、2 百日圓，金額不大，但還是會有點不好意思。</p>
								<p>餐點到了之後，要跟著女僕小姐一起唸一段咒語；「美味しくなれ、美味しくなれ、萌え萌えキュン（變好吃吧變好吃吧！萌萌）」很羞恥但很有趣XD<br/>
								我點的是鬆餅，還要讓女僕小姐用楓糖漿畫想讓他畫的圖案。一時之間想不到，就叫他畫皮卡丘，結果好像有點太為難人了XD</p>
								<span class="image middle"><img src="../images/article_img/article_44_pancake.jpg" /></span>
								<p>這段時間，就如同我在來日本前所幻想和朋友相處的模式：吃餅喝茶，聊天哈啦，講一些五四三、沒營養的話和生活瑣事。<br/>
								他們有問到我比較喜歡台灣還是日本的女生，我的回答是臉的話喜歡台灣女生，但個性有可能是日本女生，因為場面話比較多。<br/>
								他們也同意台灣女生長相很好看，在電視和網路上看到的台灣女生照片確實都很漂亮，但認為台灣女生場面話少，較直爽不是反而是優點嗎？<br/>
								然而，對於這點我也表示同意，理性上我也喜歡直爽的個性，當實際上聽到場面話還是不免會心癢癢的XD 人都喜歡聽好話嘛。<br/>
								但就全面考量後，果然還是比較偏好台灣的女生！真心不騙。本來就不是很擅長和女生相處了，場面話一堆的日本女生在想什麼，我是真的完全搞不懂。</p>
								<p>原田還說他之前去過一間咖啡廳，特色是裡面的店員會罵你，進去就是為了要被罵。我說感覺好像很有趣，滿有興趣的！然後就被調侃XD 但日本真是無奇不有啊… 連這種詭異的店都有。</p>
								<p>最後要離店前，他們一直叫我挑喜歡的女僕來合照。雖然我推說讓請客的原田來挑，但還是被盧到妥協。<br/>
								大致環視一下，有看到 2 位店員算是我會喜歡的類型，但都比我高QQ 姑且說了想和剛剛研究會的學妹一起合照。基本上我和日本男生的審美觀差滿多的，原田覺得正的店員我覺得臉有點圓，南鄉覺得正的店員我覺得還不錯但妝太濃。<br/>
								第一次在女僕咖啡廳合照超尷尬、害羞和緊張 > ///// < Pose 還擺錯（一開始是伸左手），他們也都說看的出來我很緊張。</p>
								<span class="image middle"><img src="../images/article_img/article_44_photo.jpg" />（這張才是本尊，封面那是陳意涵，應該都有看出來...吧，我有故意沒把邊邊修好）</span>
								<p>回去之後，聽到南鄉被某社員說キモイ（噁心）XD 但當然是開玩笑的啦。<br/>
								快結束前，又來了位帥哥，原來是 N 年前的社長堀先生。講話給人感覺超成熟，跟我聊時說這段時間交換很好，現在秋天可以看到紅葉，之後冬天還有雪，而這兩樣東西他想台灣都不太會有。<br/>
								聽說堀先生已經 30 歲了，但外表完全看不出來。只見他掏出超高級的 Canon DSLR，還配有相當昂貴的 135 mm 鏡頭，並裝有遮光罩，整個就是專業感十足。雖然他嘴上說著微單比較好，偷拍時比較不會被發現（當時在場的大家都不想被拍XD）。</p>
								<p>今天學到一些上課不太會教到的單字。像請客是「おごる」，女裝男是「オカマ」。回家後上網查了一下，オカマ帶有很嚴重的貶義，中文應該翻做「人妖」；相較之下，近來比較新的單字「男の娘」就沒有貶義的樣子，中文翻做「偽娘」。</p>
								<p>今天真的很有趣！感謝原田和南鄉兩位同學帶我去見識見識。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_44.jsp" data-numposts="5"></div>
								
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
