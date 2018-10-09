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
			article_title = "article_73";
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
<title>【Day 143】 學期結束，日本語VI-71 慶功宴 | 京都の留學日誌</title>
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
										<h2>【Day 143】 學期結束，日本語VI-71 慶功宴</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-01-26">2018年1月26日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_73_cover.jpg" alt="" /></span>
								<p>今天早上考完剩下的 2 科，下午寒假就開始了！</p>
								<p>早上考文法，老實說我沒有念完，我考試常常就是最後會沒動力。<br/>
								如果把我大學四年的期中考和期末考的平均分數來比較，我相信一定會有差到 5 分以上的差距。雖然期末考可能比較難，但我想主要原因還是因為我最後容易鬆懈。</p>
								<p>最後的一堂課是口頭表現課，老師事先有公布數個題目，然後課堂上抽題目做即興發表，跟以前大一修過的德文期末口試很相似。<br/>
								我有事先擬稿，然後當天課堂上背起來。只是和德文口試不同，不是和老師一對一而是站到講台上對上數十雙眼睛。雖然有事先擬稿，但還是表現得很差，到底這種情況怎樣才會改善啊…</p>
								<p>特別感謝這堂課的授課老師西島，也是我唯一有去合照的老師XD<br/>
								說真的，日本人做足表面功夫，尤其是女生（沒有性別歧視，因為是事實）。我修的這些課大多是女老師，然後也都分不清楚他們在想什麼，表面話和真心話難以區別，詳細狀況之後應該會在之後的一篇課程評價寫到。<br/>
								西島老師也不意外，之前一度覺得他有點可怕，因為總是笑笑的，但私下去找她聊也都不錯，這次最後的相談讓我覺得他人是「真的」很不錯。</p>
								<p>另外，今天收到一本意外的禮物，是教文化特講的高岸老師送的《京都職人文化讀本》。<br/>
								在 11 月去東京的前一晚，有去幫 peer support 同學修的一門針對留學生製作讀本的課程做讀者測試，看看內容會不會太難，還有日本同學的翻譯購不夠精確。只去不到 2 小時左右而已，竟能夠拿到這麼精美的全彩讀本，後面感謝名單還看到我的名字，太感謝了。</p>
								<span class="image left_2"><img src="../images/article_img/article_73_book1.jpg" alt="" /></span>
								<span class="image left_2"><img src="../images/article_img/article_73_book2.jpg" alt="" />（有我的名字&gt;///&lt;）</span>
								<span class="image middle"><img src="../images/article_img/article_73_book3.jpg" alt="" /></span>
								<p>下午先去剪個頭髮，利用了 Hot Pepper Beauty 抽中的 1000 日圓點數預約了 11 月也去過的那家理髮店，折算下來只要 640 日圓而已!!! 雖然還是比台灣的男士理髮貴啦。<br/>
								這次的剪髮體驗沒有很好，今天這位女美髮師講話和行為都很假，雖然沒有隨便剪，但那個態度很像只想趕快打發而已。<br/>
								比較喜歡上次那位造型很台的男美髮師，感覺比較真誠，我日文不好還會和我找話題聊天，上髮蠟後還幫我噴定型液。這次這位就沒噴，結果外面風大一下就塌了。</p>
								<p>之後用早上買的地鐵一日券到處跑，買菜、繳房租等等。最後回同志社吃某位韓國同學主糾的慶功宴，地點在同志社附近的居酒屋。<br/>
								這應該是我們 6 級 71 班第一次，也是最後一次在課堂以外的地方聚再一起吧。老實說這個班我覺得平常沒什麼互動，上課也都是一片死寂，藉由今晚才比較認識那些平常沒什麼接觸的同學。之後有想寫一篇敘述一下我所看到的 6 級 71 班的同學們，記錄這些一起上課半年，以後可能再也遇不到的同學。<br/>
								以下用條列式紀錄今晚所發生的事：
								<ul>
									<li>原來夏威夷出身的 Minh和挪威出身的 Andy 一樣是越南裔，原本以為是新加坡裔。問 Andy 之後，才知道因為以前越南的戰爭而到國外的移民相當多，他和 Minh 的父母都是，不過 2 人都是今天才知道對方也是越南裔XD</li>
									<li>Minh 和同宿舍的一位師大交換生感覺很要好，也常在學校看到他們黏一起。他說 3 月要和那位師大同學一起來台灣玩一個禮拜！<br/>
									感覺 Minh 對台灣還滿有興趣，學期中跟他幾乎沒說過什麼話，但今晚和他聊了不少，是說沒想到夏威夷也有珍珠奶茶啊！他還說他非常喜歡喝XD 師大同學真是做了國民外交的好典範啊！<br/>
									Minh 人真的很好，聊起來非常好聊，而且就算我日文講得很破也會認真對話。原本就對他有不錯的印象，但比原先認為的還相當友善。</li>
									<li>希爾和他妹通電話時說了維吾爾語，聽起來很像西班牙語，他也說常常有人說很像。另外，新疆的烏魯木齊今晚氣溫好像是 -23 度，他說烏魯木齊夏天的白天也很冷，感覺以前國中地理學到的是錯誤資訊。</li>
									<li>之前聽說挪威語和瑞典語很像，於是就問問看。Andy 解釋要說很像的話，就文法有點相似而已吧，如果拿來溝通的話，字詞和發音都差很多，硬要說能互通的話的程度大概 10 % 吧。外國人會覺得像只是因為不熟悉。<br/>
									至於地理位置明明很接近的芬蘭，使用的語言系統之前就聽說過完全不同，果然Andy 說挪威語與和芬蘭語的溝通程度是 0 % XD</li>
									<li>在途中突然變成在各國髒話大教學，韓國的唸起來像是「shi ba ge」，韓國同學只叫我們千萬不要隨便說，一直不願意說詳細意思，大概意思就是「FXXX」。聽說男生的話還滿常用，不過在場都女生。<br/>
									對岸的髒話，每次問好像都是「操」而已，其他像是「二百五」之類的我完全不明白為何算髒話…<br/>
									越南語髒話唸起來是「du ma mai」，意思好像也是「FXXX」。<br/>
									最能代表台灣的還是「幹」吧！對岸沒在用的樣子，意思也還是「FXXX」，各國都差不多嘛！不過他們沒問我我也沒教他們，反正中國人們也已經教他們「操」和「他媽的」了。</li>
									<li>對岸的學生感覺都很會玩嘛，一直在談夜店（這部分用中文），他們好像夜店都直接叫做 Club 吧。</li>
									<li>Kat 原來是福建人，但是他說的閩語我聽得不是很懂啊@@ 感覺和我知道的不太一樣。不清楚他是閩南還是閩北人，但他說離開福建去念大學後就沒什麼講，已經不太會講了。</li>
									<li>全班還真的除了我和另一位韓國同學，其他都是日文系…<br/>
									那位韓國同學雖然是經濟系，但他之前有說過韓國在高中時第二外語課程是必修，而且只能中文、日文二擇一，在場的韓國同學友也都說是這樣沒錯。當然，班上的韓國同學都說高中時二外選日文。</li>
									<li>CCR 比例超高！Andy 和希爾的女朋友都是日本人，Rosalie 的男朋友是韓國人。</li>
									<li>這間店有道菜餚叫做「台灣棒餃子」，點來吃之後，果然味道差很多XD 形狀是有點像啦，但感覺是用 2 片水餃皮把肉餡包起來去煎，所以鍋貼兩側都被封起來，相當詭異，而且還 2 面都拿去煎。</li>
								<span class="image middle"><img src="../images/article_img/article_73_guotei.jpg" alt="" /></span>
								</ul></p>
								<p>吃完後，Andy 和韓國金同學先回去，剩下的人到四条的一間卡拉 OK 酒吧進行二次會。<br/>
								第一次知道卡拉 OK 酒吧這種店，台灣好像沒有吧？簡單來說就是酒吧裡可以唱卡拉 OK，只要付飲料錢就好，但是全部客人共用一台點唱機而已，所以無法多桌同時唱不同歌。另外，這間店過晚上 11 點就會變成夜店的樣子，所以無法繼續唱。<br/>
								以下一樣條列發生的事：
								<ul>
									<li>掉了 1 ~ 2 枚硬幣，那邊燈光太暗完全找不到，但印象中錢包裡沒有 500 日圓的硬幣，所以應該還好。</li>
									<li>伏特加鳳梨汁有夠難喝... 原本想說伏特加之前辦桌時劉逸文和岱軒有請過，喝起來感覺還不錯，跟高粱有點像，但沒想到加果汁變那麼難喝。</li>
									<li>對岸的同學抽菸比率頗高，而且沒分男女。尤其是希爾吸得很兇，不過他上課時身上也常會飄來菸味就是了。</li>
									<li>Minh 不吸菸但抽電子菸，他有借我抽看看電子菸，說裡面沒有尼古丁，然後是咖啡口味的。<br/>
									這應該算是人生第一次抽菸吧，但我覺得這應該不算菸了吧XD感覺真的就像是在吃咖啡糖的味道。<br/>
									上網查成分都是香料之類的，沒有焦油和尼古丁。另外，電子菸的呼出的煙霧超多，但我完全沒嗆到的感覺，明明聽說沒抽過菸的人抽第一口都會嗆到。</li>
									<li>有一桌一直在唱懷舊卡通歌曲XD 像是七龍珠 GT 的〈DAN DAN 心魅かれてく〉和數碼寶貝的〈Butter-fly〉，我也跟著一起唱XD</li>
									<li>大家都好會唱！ 希爾和 Minh 算比較不會唱的，但還是比我好很多QQ</li>
									<li>韓國的尹同學真的很有錢… 除了多次去大阪環球玩，平常還會搭計程車。</li>
								</ul></p>
								<span class="image middle"><img src="../images/article_img/article_73_last.jpg" alt="" />（最後的合照）</span>
								<p>回去的路上還看到一個很神奇的巨無霸百匯，一客要價是夭壽的 15000 日圓。</p>
								<span class="image middle"><img src="../images/article_img/article_73_gold.jpg" alt="" /></span>
								<p>最後，夜雪真的很美！歸途中欣賞的很滿足。</p>
								<p>總之，留學生活算是告一段落了！除了辦一些歸國前手續，剩下都是自由利用時間。<br/>
								總結一下我的花費，目前快 5 個月，買衣服、去東京看棒球等等，食衣住行育樂全包含但不算來回機票，大概花費 46 萬日圓，預計再一週到達 5 個月後會落在 47.5 萬日圓外左右。當初同志社給的建議最低生活標準是 1 個月 10 萬日圓，其實差不多。<br/>
								扣掉已領完最後一期的獎學金，如果我 2 月初就馬上回去，這段在日本的時間一個月只要 1 萬台幣耶！比在台北市租房子還便宜。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_73.jsp" data-numposts="5"></div>
								
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
