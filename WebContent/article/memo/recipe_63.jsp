<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="model.DBConnection"%> 
<%@ page import="model.Guestbook"%> 

<%!
/*
	String article_title;
	ResultSet rs;
	ResultSet re_rs;
	
	int post_count = 0;
	ResultSet row_count;
*/
	boolean isAdmin = false;
%>
<%

	//Guestbook gb = new Guestbook();

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
			//post name for table
			
			//article_title = "article_1";
			//String sql = "SELECT * FROM guestbook WHERE page = '" + article_title + "'";
			//rs = stmt.executeQuery(sql);
			
			//row_count = stmt_row_count.executeQuery(sql);
			// like "index.jsp", it seems that "declaration tag" will only act once
			//post_count = 0;
			/*
			while (row_count.next()) {
				post_count ++;
			}
			*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>【食譜】乾煸四季豆 | 京都の留學日誌</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- FB Admin -->
<meta property="fb:admins" content="100001781553864"/>

<!--[if lte IE 8]><script src="../../assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../../assets/css/main.css" />
<link rel="stylesheet" href="../../assets/css/page.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<script type = "text/javascript" src = "../../assets/js/page.js"></script>
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
						<h1><a href="../../index.jsp">京都の留學日誌</a></h1>
						<nav class="links">
							<ul>
								<li><a href="../../about.jsp">關於站主</a></li>
								<li><a href="../../article.jsp">旅日札記</a></li>
								<li><a href="../../album.jsp">生活相簿</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="../../Search">
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
								<form class="search" method="get" action="../../Search">
									<input type="text" name="query" placeholder="Search" />
									<input type="submit" value="搜尋"/>
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
								<li>
										<a href="../../about.jsp">
											<h3>關於站主</h3>
										</a>
									</li>
									<li>
										<a href="../../article.jsp">
											<h3>旅日札記</h3>
										</a>
									</li>
									<li>
										<a href="../../album.jsp">
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
									<li><a href="../../login.jsp" class="button big fit">Log In</a></li>
									<% 
									}else{
									%>
									<li><a href="../../Logout" class="button big fit">Log Out</a></li>
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
										<h2>【食譜】乾煸四季豆</h2>
									</div>
									<div class="meta">
										<time class="published" datetime="2018-01-19">2018年1月19日</time>
									</div>
								</header>
								<!-- Content START -->
								<span class="image featured"><img src="../../images/recipe_img/recipe_51_cover.jpg" alt="" /></span>
								<p>【參考教學】<br/>
								<a href="https://icook.tw/recipes/220725" class="ref" target="_blank">乾煸四季豆-簡單快速又免油炸</a>
								</p>

								<span>【材料】</span>
								<ul>
									<li>四季豆（三度豆 / 隠元豆 さんどまめ / いんげんまめ） ----- 1 袋 ※1</li>
									<li>雞胸肉（鶏むね肉） ----- 1 塊</li>
									<li>蒜（にんにく） ----- 適量</li>
									<li>醬油（醤油） ----- 2 大匙</li>
									<li>料理酒（料理酒） ----- 1 大匙</li>
									<li>味淋（味醂） ----- 1 大匙</li>
									<li>鹽（塩） ----- 適量</li>
									<li>橄欖油（オリーブ油） ----- 適量</li>
								</ul>		

								<span>【作法】</span>
								<ol>
									<li>雞胸肉剁碎成絞肉，蒜用城蒜末，四季豆切段備用。</li>
									<li>加油熱鍋，中火炒四季豆，炒到有點變色後加鹽，再炒一下起鍋。</li>
									<li>鍋內改下絞肉和蒜末，炒到肉變色。</li>
									<li>加醬油、料理酒、味淋，炒到讓肉上色。</li>
									<li>把剛剛炒好的四季豆放回去一起拌炒，完成。</li>
								</ol>
								
								<p>
									<u>
									※1 三度豆是表示一年可收或三次的菜豆，主要用來表示いんげん豆，也就是四季豆；荷蘭豌豆叫做さやえんどう。參考自<a href="http://blog.xuite.net/selina.yang/071206/29403928-%E5%9B%9B%E5%AD%A3%E8%B1%86%E5%92%8C%E8%B1%8C%E8%B1%86%E5%A4%BE%E7%9A%84%E6%97%A5%E6%96%87%E8%A9%B2%E6%80%8E%E9%BA%BC%E8%AA%AA%3F%3F" class="ref" target="_blank">四季豆和豌豆夾的日文該怎麼說</a>。
									</u>
								</p>
								<p>【感想】<br/>
								肉吃起來就像照燒的味道，不過那個組合也跟之前做照燒醬一樣就是了。
								</p>
								<!-- Content END -->
								
								<!-- FB Comment -->
								<h2>以 Facebook 留言</h2>
								<div class="fb-comments" data-href="http://kyotoexchange-env.qe72ehkehh.ap-northeast-1.elasticbeanstalk.com/article/recipe/recipe_63.jsp" data-numposts="5"></div>
								</div>
							</article>
					</div>

				<!-- Footer -->
					<section id="footer">
						
						<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</section>

			</div>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/skel.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="../../assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../../assets/js/main.js"></script>

	</body>
</html>

<%

		} catch (Exception ex) {
			System.out.println("can't read data");
			System.out.println(ex.toString());
		} finally{
			//dbc.cleanConnectionObj(rs, stmt, conn);
			// Connection could be re-closed?
			//dbc.cleanConnectionObj(re_rs, re_stmt, conn);
		}
	} catch (Exception e) {
		System.out.println("can't create statement");
		System.out.println(e.toString());
	}

%>
