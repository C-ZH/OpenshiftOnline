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
			article_title = "article_43";
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
<title>【Day 82】 EVE 祭（1） 同志社學園祭 | 京都の留學日誌</title>
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
										<h2>【Day 82】 EVE 祭（1） 同志社學園祭</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-26">2017年11月26日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_43_cover.jpg" alt="" /></span>
								<p>今天開始，到 28 號為止連續三天是同志社的學園祭，簡稱 EVE 祭。加上 EVE 祭過後一天的創校紀念日（11 / 29），對於沒打算參加的人就等同是放了四天連假。<br/>
								話說上星期好像是京都大學校慶，可惜很忙沒去QQ 聽說台灣留學生會出攤位賣台灣啤酒。</p>
								<p>同志社因為有 2 個離的遠的校區，因此這 2 個校區的學園祭是採取分開進行的模式，相當詭異。<br/>
								我所在的今出川校區叫 EVE 祭，時間在 11 月底；而另一個京田邊校區叫 Clover 祭，時間在 11 月初。<br/>
								感覺同志社校方還是以較具歷史的今出川校區為主，除了學園祭時間點比較接近創校紀念日之外，這邊在 11 / 10 時已經搬出一棵很大的聖誕樹，並舉行點燈式（雖然我沒參加XD）。聽說京田邊校區到快要聖誕節時才會放一棵不太大的聖誕樹在校門口。</p>
								<p>我所規劃的行程是三天都到學校參加 EVE 祭，只休 29 號一天。一方面是因為之前就很期待日本的學園祭到底會是什麼樣貌，也加了攝影社，想說要盡力去幫忙寫真展；另一方面，這個月衣服實在買太多，也不想花太多錢去太遠的地方玩。</p>
								<p>一早趕到學校時，打開攝影社舉辦寫真展示的教室，毫不意外地，一堆不認識的人。除了之前有過一面之緣的 R 同學，還有有過兩面之緣的社長大大，其他人都是第一次見面。<br/>
								除了我之外，有些春天加入的新生感覺也不是對其他社員很熟悉，像是一年級的櫻木和田中，二年級的澤田和樫原。由此可見，這個攝影社的結構真的頗鬆散。<br/>
								※ 打到一半，決定不加「同學」和取外號了XD 反正他們應該看不到啦。</p>
								<p>EVE 祭表定 10 點開始，但攝影社這邊感覺事前準備工作完全沒在做，當天才在進行搬桌子、相片黏珍珠板、掛相片、掛暗幕等準備事項，因此一直佈置到 下午 1 點才全部用好，然後開放入場參觀。<br/>
								開放後的工作大致上就是有人進來要參觀的話，跟他說聲「こんにちは」後遞給他問卷填寫。參觀結束要離開時，回收問卷並說聲「ありがとうございました」就好，相當單純。雖然還是少數參觀者會一邊看，一邊問問題啦XD</p>
								<p>在門口顧的人只要有至少一位即可，其他人可以待在桌子後放看不見的地方，社長大大有帶一些零食可以吃。<br/>
								開展不久後，櫻木的雙親就來參觀了，還帶了一盒 Mister Donut 當慰勞品。</p>
								<span class="image middle"><img src="../images/article_img/article_43_donut.jpg" />（櫻木請的草莓甜甜圈）</span>
								<p>之後來了一位一臉跩樣，看起來像是社團前輩的人。一看到我就很不客氣問「きみ誰？」，和他大概解釋了一下後提到年紀，表示 22 歲後，居然說我看起來像 12 歲還差不多QQ 有點差太多了吧！<br/>
								日本好像真的很在意年紀位階。跩臉男田邊和我一樣 22 歲，都是 1995 年出生，整個社團如果不算 OB，目前最大的好像就是大四的 22 歲。田邊聽到我 22 歲後雖然有揶揄一下，但之後整個態度明顯有差。相反地，對 19 歲的櫻木語氣就很隨便，而櫻木對他的語氣就很慎重，剛見面時甚至有點畏縮的感覺。<br/>
								這時真的要慶幸我夠老，才不會被年紀壓制到XD</p>
								<span class="image middle"><img src="../images/article_img/article_43_shoukuriimu.jpg" />（田邊請的草莓泡芙）</span>
								<p>是說這個社團真的很自由，雖說有排班表，但只要說一聲就可以出去亂逛了。中途就有和櫻木跟田邊去隨意逛了一下。<br/>
								教學樓內主要是展示會、表演或喫茶店，例如攝影社、輕音社、紅茶研究社；而教學樓外則是各種類社團都有，只要有向學校申請出店即可擺攤。攤位非常多，就像漫畫看到的情景，但賣的東西其實並沒有很讓人有眼睛一亮的感覺，大致上就是烤雞肉串、鯛魚燒、章魚燒、炒麵、餃子之類。比較特別的是炸冰淇淋（揚げアイス），這個在台灣多到泛濫的東西，對於日本人而言居然是很新奇的玩意兒。</p>
								<p>在逛的過程中，發現田邊原來是文化情報學部的學生，他說文情並沒有分組別，原來我一直搞錯了。我想那大概就是像圖資那樣有不同群的課程，但不一定要同一群全修，而是可以隨意亂修後達到畢業學分就好。<br/>
								另外他還說文情是同志社裡有名的涼系（他有講個日文單字，但我忘了），隨便都能畢業XD 不知是謙虛還是真的，但旁邊法學部的櫻木似乎也對此表示同意。</p>
								<p>其他比較值得提的還有：<br/>
								有間攤販在賣珍珠奶茶（タピオカ ミルクティー）。<br/>
								中國留學生會賣小籠包，雖然我一直以為小籠包是台灣比較有名，但還是賣得相當暢銷的樣子。<br/>
								たません是把荷包蛋塞到 2 片仙貝中間的食物，也就是たませんべ的意思。我看到超多間店在賣，觸目所及至少 5 間。想想也是啦，雞蛋 1 顆 15 日圓，仙貝 2 片算 30 日圓好了，電費、醬料算 30 日圓，成本 75 日圓賣 150 日圓，好做又超賺。</p>
								<span class="image middle"><img src="../images/article_img/article_43_tamasen.jpg" />（たません）</span>
								<p>回去攝影社後，過了一陣子受櫻木之邀和他的朋友赤坂又去逛了一圈。他們 2 人都是法律系，也是法學研究社的成員，而法學研究社出了個完全不相干的 Cosplay 塔羅牌咖啡廳，感覺頗有趣！之後應該會去看看。</p>
								<span class="image middle"><img src="../images/article_img/article_43_agepasta.jpg" />（原價 150 日圓的炸義大利麵。猜拳贏了免費，輸了要付 300 日圓。沒想到我竟然輸了QQ 結果還很難吃）</span>
								<p>整體而言，當然比台大校慶熱鬧許多（台大校慶我好像也只去過一次XD），但和高中時松山的校慶其實差不多，只差在學生數較多、攤位和店面較多，然後持續 3 天。不算是失望，但就是感覺普普而已。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_43.jsp" data-numposts="5"></div>
								
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
