<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="model.DBConnection"%> 

<%!
	boolean isAdmin = false;
%>
<% 
	DBConnection dbc = new DBConnection();
	Connection conn = dbc.connect_mysql("KyotoExchangeDB");
	
	try {
		try {
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>11/26 ~ 11/28 EVA祭 | 京都の留學日誌</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/swipebox.css">
<!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
</head>
	<body>

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
									<li><a href="../addArticle.jsp" class="button big fit">New Article</a></li>
									<li><a href="../Logout" class="button big fit">Log Out</a></li>
									<% 
									}
									%>
								</ul>
							</section>

					</section>

				<!-- Main -->
					<div id="main">

						<!-- PostN -->
							<article class="post">
								<h2>11/26 ~ 11/28 EVA祭</h2>
								<h3>
									<p>電腦版：<br/>
									可觀看說明文字，可使用鍵盤左右鍵來瀏覽相片。<br/>
									點擊右上角 x 可關閉相簿視窗。</p>
									行動版：<br/>
									無法觀看說明文字，可使用觸控手勢左右移動來瀏覽相片。<br/>
									向上滑動可關閉相簿視窗。</p>
								</h3>
					<table id="photo_collection">
						<tr>
							<td>
								<a href="../images/album/05_EVA/01.jpg" class="swipebox" title="全部出店表">
									<img src="../images/album/05_EVA/01.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/02.jpg" class="swipebox" title="良心館出店表">
									<img src="../images/album/05_EVA/02.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/03.jpg" class="swipebox" title="櫻木請的甜甜圈">
									<img src="../images/album/05_EVA/03.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/04.jpg" class="swipebox" title="Mr Donut 和卡娜赫拉合作">
									<img src="../images/album/05_EVA/04.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/05.jpg" class="swipebox" title="田邊請的草莓泡芙">
									<img src="../images/album/05_EVA/05.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/06.jpg" class="swipebox" title="感覺很貴的草莓泡芙">
									<img src="../images/album/05_EVA/06.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/07.jpg" class="swipebox" title="草莓泡芙">
									<img src="../images/album/05_EVA/07.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/08.jpg" class="swipebox" title="攝影社展示">
									<img src="../images/album/05_EVA/08.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/09.jpg" class="swipebox" title="攝影社展示">
									<img src="../images/album/05_EVA/09.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/10.jpg" class="swipebox" title="攝影社展示">
									<img src="../images/album/05_EVA/10.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/11.jpg" class="swipebox" title="EVA祭第一天 ">
									<img src="../images/album/05_EVA/11.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/12.jpg" class="swipebox" title="猜拳輸而花300日圓買的炸義大利麵，難吃">
									<img src="../images/album/05_EVA/12.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/13.jpg" class="swipebox" title="たません，就是包著蛋的仙貝">
									<img src="../images/album/05_EVA/13.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/14.jpg" class="swipebox" title="女裝Bar的宣傳單，人氣超高，我感覺是最有多人排隊的店">
									<img src="../images/album/05_EVA/14.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/15.jpg" class="swipebox" title="另一個攝影社的展示">
									<img src="../images/album/05_EVA/15.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/16.jpg" class="swipebox" title="機器人研究社，裡面在展示機械手臂">
									<img src="../images/album/05_EVA/16.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/17.jpg" class="swipebox" title="我所屬的攝影社">
									<img src="../images/album/05_EVA/17.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/18.jpg" class="swipebox" title="校慶籌備會在門口發放校慶資料給入場的人，超大手筆，除了地圖、表演資訊等等之外，裡面還有一塊巧克力">
									<img src="../images/album/05_EVA/18.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/19.jpg" class="swipebox" title="原田請的草莓三明治">
									<img src="../images/album/05_EVA/19.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/20.jpg" class="swipebox" title="動畫聲優研究社的女僕咖啡廳門口">
									<img src="../images/album/05_EVA/20.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/21.jpg" class="swipebox" title="畫有皮卡丘的鬆餅">
									<img src="../images/album/05_EVA/21.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/22.jpg" class="swipebox" title="三人合照">
									<img src="../images/album/05_EVA/22.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/23.jpg" class="swipebox" title="帥氣地喝咖啡">
									<img src="../images/album/05_EVA/23.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/24.jpg" class="swipebox" title="和女僕合照">
									<img src="../images/album/05_EVA/24.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/25.jpg" class="swipebox" title="和女僕合照，一開始完全不會擺姿勢XD">
									<img src="../images/album/05_EVA/25.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/26.jpg" class="swipebox" title="前輩嘴角笑歪的合照">
									<img src="../images/album/05_EVA/26.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/27.jpg" class="swipebox" title="同志社第一猛男選拔，測試項目吹氣球（這和猛男根本沒關嘛XD）">
									<img src="../images/album/05_EVA/27.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/28.jpg" class="swipebox" title="同志社第一猛男選拔，除了背對著的那位以外都來鬧的吧">
									<img src="../images/album/05_EVA/28.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/29.jpg" class="swipebox" title="同志社第一猛男選拔，宣布冠軍是右二戴墨鏡那位">
									<img src="../images/album/05_EVA/29.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/30.jpg" class="swipebox" title="曾去過一次的羽球社賣的鯛魚燒">
									<img src="../images/album/05_EVA/30.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/31.jpg" class="swipebox" title="舞台上樂團在表演，還不錯。日本人在聽演唱會時好像都習慣舉手前後甩">
									<img src="../images/album/05_EVA/31.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/32.jpg" class="swipebox" title="EVA祭第三天">
									<img src="../images/album/05_EVA/32.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/33.jpg" class="swipebox" title="EVA祭第三天">
									<img src="../images/album/05_EVA/33.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/34.jpg" class="swipebox" title=",鐵道研究社">
									<img src="../images/album/05_EVA/34.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/35.jpg" class="swipebox" title="鐵道研究社">
									<img src="../images/album/05_EVA/35.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/36.jpg" class="swipebox" title="鐵道研究社，湯瑪士小火車很突兀XD">
									<img src="../images/album/05_EVA/36.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/37.jpg" class="swipebox" title="鐵道研究社除了展示鐵軌模型，還有鐵道攝影的展示。這張是我裡面最喜歡的一張">
									<img src="../images/album/05_EVA/37.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/38.jpg" class="swipebox" title="美術社鬼屋，還不錯，符合 300 日圓的水準。另外他們除了鬼屋也在旁邊幫人畫素描賺錢">
									<img src="../images/album/05_EVA/38.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/39.jpg" class="swipebox" title="推裡小說研究社的二手書店市，但裡面其實只有1/3是賣推理小說">
									<img src="../images/album/05_EVA/39.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/40.jpg" class="swipebox" title="推裡小說研究社的二手書店市">
									<img src="../images/album/05_EVA/40.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/41.jpg" class="swipebox" title="LoveLive研究社">
									<img src="../images/album/05_EVA/41.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/42.jpg" class="swipebox" title="喜劇研究社，裡面在表演漫才">
									<img src="../images/album/05_EVA/42.jpg" class="thumb_l" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/43.jpg" class="swipebox" title="鋼琴研究社賣的茶泡飯糰，我吃的是泡菜起司口味">
									<img src="../images/album/05_EVA/43.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/44.jpg" class="swipebox" title="VR研究社在展示他們做的遊戲，辦得很用心，但除了要付費的那款 RPG 之外都還好，都是簡單的小品遊戲，沒有很令人驚豔">
									<img src="../images/album/05_EVA/44.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/45.jpg" class="swipebox" title="再訪女僕咖啡廳，這次點餅乾吃">
									<img src="../images/album/05_EVA/45.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/46.jpg" class="swipebox" title="大合照">
									<img src="../images/album/05_EVA/46.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/47.jpg" class="swipebox" title="歌牌研究社賣的烤雞肉串，好吃">
									<img src="../images/album/05_EVA/47.jpg" class="thumb_l" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/48.jpg" class="swipebox" title="EVA祭最後的一項表演，雜技表演">
									<img src="../images/album/05_EVA/48.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../images/album/05_EVA/49.jpg" class="swipebox" title="雜技表演，相當精彩">
									<img src="../images/album/05_EVA/49.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/50.jpg" class="swipebox" title="雜技表演">
									<img src="../images/album/05_EVA/50.jpg" class="thumb" alt="image">
								</a>
							</td>
							<td>
								<a href="../images/album/05_EVA/51.jpg" class="swipebox" title="雜技表演">
									<img src="../images/album/05_EVA/51.jpg" class="thumb" alt="image">
								</a>
							</td>
						</tr>
					</table>
							</article>

						<!-- Pagination -->

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a class="logo"><img src="../images/avatar.png" alt="" /></a>
								<header>
									<h2>京都の留學日誌</h2>
									<p id="second_title">～ 在京都半年的生活體驗 ～</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>
								<h3>文章分類</h3>
								<div class="mini-posts">
									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../doshisha_list.jsp">同志社の校園生活</a></h3>
											</header>
											<a href="../doshisha_list.jsp" class="image"><img src="../images/tag/doshisha_minipost.jpg" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../kyoto_list.jsp">京都の古都記趣</a></h3>
											</header>
											<a href="../kyoto_list.jsp" class="image"><img src="../images/tag/kyoto_minipost.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../food_list.jsp">美食の食記</a></h3>
											</header>
											<a href="../food_list.jsp" class="image"><img src="../images/tag/food_minipost.JPG" alt="" /></a>
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
												<h3><a href="../travel_list.jsp">日本周遊の旅程</a></h3>
											</header>
											<a href="../travel_list.jsp" class="image"><img src="../images/tag/travel_minipost.JPG" alt="" /></a>
										</article>

								</div>
							</section>

							<!-- Posts List -->
							<section>
								<h3>文章月份</h3>
								<ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="../september.jsp">九月</a></h3>
												<time class="published" datetime="2017-09">September, 2017</time>
											</header>
											<a href="../september.jsp" class="image"><img src="../images/tag/Sep.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../october.jsp">十月</a></h3>
												<time class="published" datetime="2015-10-15">October, 2017</time>
											</header>
											<a href="../october.jsp" class="image"><img src="../images/tag/Oct.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../november.jsp">十一月</a></h3>
												<time class="published" datetime="2015-10-10">November, 2017</time>
											</header>
											<a href="../november.jsp" class="image"><img src="../images/tag/Nov.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../december.jsp">十二月</a></h3>
												<time class="published" datetime="2015-10-08">December, 2017</time>
											</header>
											<a href="../december.jsp" class="image"><img src="../images/tag/Dec.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../january.jsp">一月</a></h3>
												<time class="published" datetime="2015-10-06">January, 2018</time>
											</header>
											<a href="../january.jsp" class="image"><img src="../images/tag/Jan.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="../february.jsp">二月</a></h3>
												<time class="published" datetime="2015-10-06">February, 2018</time>
											</header>
											<a href="../february.jsp" class="image"><img src="../images/tag/Feb.jpg" alt="" /></a>
										</article>
									</li>
								</ul>
							</section>

						<!-- Footer -->
							<section id="footer">
								<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
							</section>

					</section>

			</div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="../assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>
			
			<!-- Gallery -->
			<!-- Notice: JQ ver.3 do not work -->
			<script src="../assets/js/jquery-2.1.0.min.js"></script>
			<script src="../assets/js/jquery.swipebox.js"></script>
			<script src="../assets/js/ios-orientationchange-fix.js"></script>
			<!-- Fire the Gallery -->
			<script type="text/javascript">
				$( document ).ready(function() {
					$( '.swipebox' ).swipebox();
				});
			</script>
	</body>
</html>
<%
		} catch (Exception ex) {
			System.out.println("can't read data");
			System.out.println(ex.toString());
		} finally{
			//dbc.cleanConnectionObj(rs, stmt, conn);
		}
	} catch (Exception e) {
		System.out.println("can't create statement");
		System.out.println(e.toString());
	}
%>
