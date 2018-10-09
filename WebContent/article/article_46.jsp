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
			article_title = "article_46";
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
<title>【Day 85 ~ 86】下京中學校茶道體驗 &amp; 日本文化特講專欄（4）茶道 | 京都の留學日誌</title>
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
										<h2>【Day 85 ~ 86】下京中學校茶道體驗 &amp; 日本文化特講專欄（4）茶道</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2017-11-30">2017年11月30日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../images/cover/article_46_cover.jpg" alt="" /></span>
								<p>過了一個月，星期三下午，又很厚臉皮地去了下京中學的日本傳統文化體驗！</p>
								<p>剛到時，先看了一會兒他們玩歌牌。進到正式的活動內容後，前半段和上次差不多，就是學生泡茶、拿乾菓子給我們吃。<br/>
								雖然上次體驗活動時中有努力記下日本茶道喝茶時，什麼時候要說什麼話，但想當然爾，過了一個月已經全忘光了XD 不過上次比較緊張，這次記下來應該就不太會忘了…吧！</p>
								<p>後半段就跟上次不同了，上次是看他們的折紙作品，這次讓我們真正體驗茶道的沖茶流程！<br/>
								原本想寫學生們的指導內容，但因為星期四的文化特講恰好也在教茶道，所以就把 2 天的教學內容整理起來一起說。</p>
								<p>日本的茶道理論上有分為很多流派，其中較著名的三個流派為表千家、裏千家和武者小路千家，不同流派在茶道流程上有些微差異。我也不知道他們是哪個流派，當時忘了問，但上網查了一下，感覺比較像是裏千家，而文化特講的老師剛好也是裏千家。<br/>
								以下將分為客人喝茶的情境，以及亭主（負責泡茶的人）泡茶的情境分別說明。</p>
								<p>首先是當客人時喝茶的方式：
									<ol>
										<li>會有人端上一盤菓子，此時亭主會說<b>「お菓子をどうぞ」</b>（「請吃菓子」），我們要說<b>「お菓子をちょうだいします」</b>（這我不會翻… 感覺就像是「我得到菓子了！」）」。<br/></li>
										<li>如果後面還有其他客人，要對他說<b>「おさきに」</b>（「我要先拿囉！」的感覺）。</li>
										<li>從叫做帛紗ばさみ的用具包裡拿出懷紙（一張或兩張折起來，又白又薄的紙，用途像是小盤子），維持折起來的狀態用左手拿著，再用右手將菓子從盤子取過來放在懷紙上面，然後放在身前。
										<span class="image middle"><img src="../images/article_img/article_46_fukusabasami.jpg" />（帛紗ばさみ）</span></li>
										<li>將裝有菓子的盤子遞給下一位客人。</li>
										<li>吃菓子。<br/>
										我兩次去吃的菓子差異頗大，第一次去是像月餅的軟糕點，會附一支小小的菓子切，像是叉子讓你可以切來吃，但我挖到最後還是直接用咬的XD 內餡實在太黏；第二次是個小小的硬糕點，當天就沒附菓子切，因為也叉不下去嘛XD<br/>
										量都不多，對我來說都是一口或兩口而已，但我都還是跟著大家小口小口吃XD</li>
										<li>接著亭主會泡茶，剛好吃完超甜的菓子時可以喝到茶。茶端上來後，若前面有其他客人，要把茶碗移到他的那側，並對他說<b>「お相伴（しょうばん）いたします」</b>（「我也要喝囉！」的感覺）。<br/>
										雖然我去了兩次體驗活動都是先喝茶再吃菓子，整個搞錯順序XD 文化特講時才知道自己錯了。<br/>
										</li>
										<li>若後面還有其他客人，再把茶碗改放到他的那側，並對他說<b>「おさきに」</b>（「我要先喝囉！」的感覺）。</li>
										<li>要喝之前，對亭主說<b>「お点前（てまえ）ちょうだいいたします」</b>（「讓我品嘗你的手藝吧！」的感覺），亭主會回說「どうぞ」。</li>
										<li>此時茶碗的正面應該會是面向我們，先欣賞茶碗一下。</li>
										<li>拿起茶碗，以右手拿著，並用左手扶著下方，然後朝著自己，也就是<b>順時針轉 2 次，總共轉大約半圈</b>，讓茶碗的正面面向亭主和其他人。</li>
										<li>喝茶。喝到最後要發出「簌簌簌」的聲響，並把抹茶的泡沫都喝乾淨。<br/>
										不過我不知為何都喝不乾淨啦QQ 都會黏在碗底。</li>
										<li>用右手拇指和食指稍微擦一下剛剛茶碗接觸到嘴巴的地方。<br/>
										這個步驟下京中學的體驗活動沒講到。</li>
										<li>同 10.，以右手拿著，並用左手扶著下方，然後朝著自<b>己再順時針轉 2 次</b>，讓正面再次面向自己。<br/>
										這步不確定，似乎聽到兩個不同的說法，查網路好像也是不同流派不同動作。</li>
										<li>欣賞茶碗，結束。</li>
									</ol>
								</p>
								<p>再來是泡茶流程，比喝茶要複雜非常非常多。雖然不算難，中學的小朋友也教得很仔細，但沒有多練真的會忘。<br/>
								由於這篇是隔了 5 天才補完，文化特講上課時主要在談喝茶，沖茶是很簡單帶過而已，因此腦海中的記憶又漸漸消散了XD 以下用僅存的記憶打出來，像是放在幾點鐘位置上網查不太到，就直接憑記憶打，應該是會有錯。
									<ol>
										<li>先準備好擺有棗、茶碗、茶筅、茶杓的托盤，在身旁放好柄杓、建水和蓋置，並在和服腰間掛好袱紗。<br/>
										當天我沒繫皮帶，也不好意思直接夾在褲子邊，只好夾在口袋XD<br/>
										※  茶道具用語解釋：<br/>
										<ul>
											<li>棗：抹茶粉罐</li>
											<li>茶筅：攪拌用的竹刷</li>
											<li>茶杓：取茶粉用的小竹匙</li>
											<li>柄杓：取水用的勺子</li>
											<li>建水：放置髒水的容器</li>
											<li>蓋置：放置柄杓的支撐物</li>
											<li>袱紗：擦各種茶道具的絲質布，女生依流派不同有紅色也有橘色，男生則都是紫色。但我在中學活動看到紅色、橘色都有</li>
										</ul>
										<span class="image left_2"><img src="../images/article_img/article_46_natsume.jpg" />（棗）</span>
										<span class="image left_2"><img src="../images/article_img/article_46_chasen.jpg" />（茶筅）</span>
										<span class="image left_2"><img src="../images/article_img/article_46_chashaku.jpg" />（茶杓）</span>
										<span class="image left_2"><img src="../images/article_img/article_46_hishaku.jpg" />（柄杓）</span>
										<span class="image left_2"><img src="../images/article_img/article_46_kensui.jpg" />（建水）</span>
										<span class="image left_2"><img src="../images/article_img/article_46_futaoki.jpg" />（蓋置）</span>
										</li>
										<li>抽出袱紗，沿對角線折成三角形，右手捏著一端並高高拿著，左手從右手捏著的地方滑下來把袱紗順過一遍。<br/>
										順完後，將三角形的底邊朝上，左手也捏住另一端，並把左手拇指、食指置於袱紗的外側，剩下三根手指移到內側。<br/>
										將袱紗立起來，同時左手持續保持上述姿勢並順勢向上折一小塊。左手拇指把因立起來而垂下來的第三角握住。<br/>
										放開左手，再用從上往下滑道的方式滑到中間位置，以左手為支點將袱紗折半，然後再折半。<br/>
										將剛剛折好的袱紗再折半，讓中間部分突出，用突出的那一小塊地方來擦棗。</li>
										<li>擦棗的方式為右手依照平假名「こ」的筆劃擦拭，擦完後在蓋子上把手鬆開，以手掌壓住袱紗和棗，最後把右手往右移動，將袱紗從棗蓋上抽離。<br/>
										然後把棗放在托盤的 9 點鐘位置，袱紗放在 7 點鐘位置。<br/>
										以上 2. 和 3. 可參考<a href="https://www.youtube.com/watch?v=5jWL8jeA6F4" class="ref">這段影片</a>，真的和當天他們教的一模一樣。聽說茶道還有分等級的實踐方式，這個教小孩子的影片應該是最初級。
											<span class="image middle"><img src="../images/article_img/article_46_fukusa.jpg" />（袱紗）</span>
										</li>
										<li>擦完棗後擦茶杓，一樣要用袱紗來擦。<br/>
										袱紗要再重折一次，一樣折半三次，但這次要讓中間部分凹進去，用凹下的那一小塊地方包住茶杓擦拭。<br/>
										擦拭方式為先向前推，再往回拉，重複一次後，最後再向前推一次，順勢將袱紗抽出。可參考<a href="https://www.youtube.com/watch?v=Y4V_VrDbPwU" class="ref">此影片</a>。<br/>
										然後把茶杓放在托盤的 5 點鐘位置，袱紗再放回 7 點鐘位置。</li>
										<li>從爐上煮好水的茶壺中，用蓋置上的柄杓取水倒入茶碗，然後將那些水倒入建水中後，拿起事先放在托盤 1 點鐘位置的茶筅，以茶筅刷洗碗內，完成茶碗的清潔，並將柄杓放回蓋置，茶筅放回原位置。</li>
										<li>將事先已沿著短邊折成三分之一，擦拭茶碗用的茶巾半垂著茶碗邊緣，以右手壓住茶巾，左手轉碗 3 圈半，擦拭碗外。<br/>
										茶巾從碗邊取下後，再沿著長邊折半兩次。先以「い」的筆劃擦拭碗內，再以「り」的筆劃擦拭一次。擦完後取出茶巾放回原位（忘記是幾點鐘位置了）。<br/>
										也是這步讓我懷疑體驗活動教的流派是裏千家，查到的資料說表千家是用「ゆ」。</li>
										<li>用茶杓裝 1.5 ~ 2 匙抹茶粉到茶碗裡。</li>
										<li>再次用柄杓從爐上的茶壺中取水，倒入茶碗泡茶。<br/>
										當天的參加者不只我而已，所以有準備熱水壺給我們直接用。還記得我笨手笨腳到的時候把水灑出了一點QQ 幸好只有一點，所以榻榻米沒事。</li>
										<li>右手拿起茶筅，左手扶著放在地上的茶碗，用力攪拌茶碗內容物，以「M」字不斷來回刷（之前聽過一個說法是「W」啦，但其實一樣XD），努力產生出泡沫。<br/>
										刷到差不多後，以「の」的刷法做結尾拿出茶筅，放回托盤 1 點鐘位置。<br/>
										我目前刷過兩次，但都刷不出泡沫耶。第一次確實太小力，第二次明明就很暴力了還是沒有很多泡沫…</li>
										<li>給人喝，結束。</li>
									</ol>
								</p>
								<p>文化特講時有提到一件滿有趣的事：從茶道進行時的細微處，可以觀察到季節的變化。依照季節變化，茶室會有不同的變化，最主要有插花、菓子和爐子的變化。<br/>
								茶室的床の間上都會放有插花作品，可從花的種類得知現在的時節。像是下京中學的傳統文化社，他們除了茶道、歌牌和折紙，也有在做花道。當天也有欣賞一下他們的作品，有看到菊花和康乃馨，雖然康乃馨的時間好像不太對XD<br/>
								菓子也是一樣的道理，根據時節給予該時間對應的菓子。<br/>
								茶道用來燒水的爐子有 2 種，分別叫做「炉」和「風炉」，前者的擺放位置為榻榻米下挖出的洞，使用時期是 11 月到 4 月；後者的擺放位置為榻榻米之上，使用時期是 5 月到 10 月。</p>
								<span class="image left_2"><img src="../images/article_img/article_46_ro.jpg" />（炉）</span>
								<span class="image left_2"><img src="../images/article_img/article_46_furo.jpg" />（風炉）</span>
								<p>星期三確實看到他們是用在地板洞內的的炉，而仔細回想，上次 10 月的體驗活動也好像是在地上的風炉沒錯。</p>
								<p>這次在離開中學前，送了他們上次請家人寄來的鳳梨酥，除了是做國民外交，畢竟我也去白吃白喝兩次了XD 而且隔天的文化特講中，老師也提到去外面一場專業的茶會，大致上要價 1500 日圓…<br/>
								雖然那些學生們不是專業的，但也託他們的福，茶道進行時不管是要當客人還是亭主，大致都了解該如何做。尤其當客人的部份，現在很有把握不會搞不清楚狀況了！</p>
								<p>再次感謝下京中學校！讓我有這個難得的機會體驗茶道。</p>
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
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/article_46.jsp" data-numposts="5"></div>
								
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
