<!DOCTYPE html>
<html>
<head>
	<title>Document</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<style>	
/*	비어있는 row*/
		.empty{
			height: 50px;
			clear: both;
		}
		
		/*	그리드 적용을 위한 wrapper*/	
		.wrapper{
			display: grid;
			grid-template-columns: 100%; 
			grid-template-rows:70px 950px 3020px 150px;
		}
		body{
			margin: 0;
		}
		h1{
			margin: 0;
			padding-top: 6px;
		}
/*	menu-list*/
		ul{
			list-style: none;
		}
		li{
				list-style: none;
				float: left;
				padding-left: 10px;
				padding-right: 10px;
			}
		.menu-link, .main-link{
			text-decoration: none;
			color: black;
		}
/*	Header관련*/
		.header{
			border-top: solid 0.5px;
		}
		.container{
			display: flex;
			justify-content: center;
		}	
		.container > div{
			flex: 1;
		}
		.container > .nav-content{
			padding-top: 10px;
			text-align: center;
		}
		.mini{
			font-size: 3px;
			
		}
		.sub-menu{
			font-size: 0.8em;
			
		}
		.separate{
			margin-left: 20px;
		}
/*	검색 관련*/
		.search-text{
			border: none;
			border-bottom: solid 0.5px;
			border-bottom-color: dimgray;
			font-size: 1em;
			width: 150px;
		}
		.search-btn{
			border: none;
			background: none;
			margin-left: 0px;
			margin-top: 5px;
		}
		
/*	메인 컨텐츠 관련*/
		.row{
			margin-top: 10px;
		}
		
		.row1 >.column {
			float: left;
			width: 30%;
			padding-right: 50px;
		}
		
		.row1 >.column-last{
			float: left;
			width: 30%;
			padding-right: 0px;
		}
		
		.row2 >.column{
			float: left;
			width: 50%;
			padding: 0px;
		}
		
		img{
			width: 100%;
			height: 100%;
		}
	</style>
</head>
<body>
	<div class="wrapper">
	
		<div class="header">
			<nav class="container">
			
				<div class="nav-content">
				<ul>
						<li>
							<span>
								<a href="#" class="menu-link"><b>Auction</b></a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link"><b>Online</b></a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link"><b>How To</b></a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link"><b>Service</b></a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link"><b>About</b></a>
							</span>
						</li>
					</ul>
				</div>
				
				<div class="nav-content">
					<a href="#" class="menu-link"><h1>Seoul Auction <span class="mini">ets1998</span></h1></a>
				</div>
				
				<div class="nav-content">
				<ul>
						<li>
							<span>
								<a href="#" class="menu-link"><span class="sub-menu" style="margin-left: 100px">ENG</span></a><span class="separate">|</span>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link"><span class="sub-menu">ACCOUNT</span></a><span class="separate">|</span>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link"><span class="sub-menu" style="margin-right: 30px;">LOGIN</span></a>
							</span>
						</li>
					</ul>
					<input class="search-text" type="text" placeholder="검색" style="float: left">
					<form>
					<button class="search-btn" type="submit" style="float: left"><i class="fas fa-search"></i></button>
					</form>
				</div>
				
			</nav>
		</div>
		
<!--		<div class="image" style="background-color: antiquewhite;">-->
			<img src="../image/cow.jpg" alt="미술품 사진" width="100%" style="max-height: 900px; padding-top: 5px;">
<!--		</div>-->
		
		<div class="main-content" style="max-width: 1200px; padding-top: 30px; margin-left: auto; margin-right: auto">
			<h2 style="font-size: 30px; font-weight: 600;">AUCTION</h2>
			<div class="row1" style="width: 1200px">
				<div class="column">
					<img src="../image/ROW1-1.jpg" alt="">
					<p>Auction</p>
					<p>27th HONG KONG SALE</p>
				</div>
				<div class="column">
					<img src="../image/ROW1-2.jpg" alt="">
					<p>Auction</p>
					<p>27th HONG KONG SALE</p>
				</div>
				<div class="column-last">
					<img src="../image/ROW1-3.jpg" alt="">
					<p>Auction</p>
					<p>27th HONG KONG SALE</p>
				</div>
			</div>
			
			<div class="empty"></div>
			
			<div class="row2" style="width: 1200px">
				<div class="column">
					<h2 style="font-size: 30px; font-weight: 600;">SA+</h2>
					<img src="https://placehold.it/576x310" alt="">
					<p>Auction</p>
					<p>27th HONG KONG SALE</p>
				</div>
				<div class="column">
					<h2 style="font-size: 30px; font-weight: 600;">전시장 보기 - HONG KONG SALE</h2>
					<img src="https://placehold.it/576x310" alt="">
					<p>Auction</p>
					<p>27th HONG KONG SALE</p>
				</div>
			</div>
	
			
			
		</div>
		
		
		
		<div class="footer" style="background-color: chartreuse; max-width: 1200px; padding-top: 30px; margin-left: auto; margin-right: auto">
			footer
		</div>
		
	</div>
	
</body>
</html>






































