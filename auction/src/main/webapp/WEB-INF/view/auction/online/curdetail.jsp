<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
    <head>
    <title>미술품 경매 | 진행경매 작품정보</title>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.0.4/wNumb.min.js'></script>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <style>
    
   		th, td {
   			vertical-align: inherit;
		}
    	
   		th{
			padding: 0;
			display: table-row;
		}
		
		tbody{
			vertical-align: middle;
		}
		#mask {
			position: absolute;
			z-index: 9000;
			background-color: #000;
			display: none;
			left: 0;
			top: 0;
		}
		
		.frame {
			display: none;
			position: absolute;
			top: 15%;
			left: 25%;
			width: 50%;
			height: 70%;
			padding: 0px;
			z-index: 10000;
			background-color: white;
			overflow: auto;
		}
		
		.info-bar {
			width: 100%;
			min-height: 40px;
			background-color: #c33234;
			padding: 10px 10px;
			font-size: 20px;
			color: white;
			display: block;
		}
		
		.info-bar-name {
			display: block;
			padding-left: 20px;
		}
		
		.wrap-info {
			height: 92%;
			display: block;
			overflow: hidden;
		}
		
		.auction-info, .art-info, .bid-info {
			width: 300px;
			height: 100%;
			display: inline-block;
		}
		
		.left {
			text-align: left;
		}
		
		.center {
			text-align: center;
		}
		
		.right {
			text-align: right;
		}
		
		.bold {
			font-weight: bold;
		}
		
		.head {
			font-size: 18px;
			line-height: 25px;
			border-bottom: 2px solid black;
			padding: 10px 0;
		}
		
		.mar-topbot-35px{
			margin: 35px 0;
		}
		
		.w100p {
			width: 100%;
		}
		.w90p {
			width: 90%;
		}
		.w80p {
			width: 80%;
		}
		.w70p {
			width: 70%;
		}
		.w60p {
			width: 60%;
		}
		.w50p {
			width: 50%;
		}
		.w40p {
			width: 40%;
		}
		.w30p {
			width: 30%;
		}
		.w20p {
			width: 20%;
		}
		.w10p {
			width: 10%;
		}
		
		.container{
			display:block;
			align:center;
		}
		
		.art-main{
			min-height: 600px;
		}
		
		.art-detail{
			display: inline-block;
		}
		.image-prev{
			padding:1px;
			vertical-align:inherit;
			display: block;
			width:600px;
			height: 500px;
		}
		.auction-image-tb{
			width: 100%;
		}
		.body-tb{
			width: 100%;
		}
		.auction-info-tb{
			width:100%;
		}
		.art-detail.name{
			width:100%;
		}
</style>
    
   <script>
	$(document).ready(function() {
		function wrapWindowByMask() {
			//화면의 높이와 너비를 구한다
			var maskHeight = $(document).height();
			var maskWidth = $(window).width();

			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다
			$('#mask').css({
				'width' : maskWidth,
				'height' : maskHeight
			});

			//애니메이션 효과 - 일단 0.5초동안 까맣게 됐다가 80% 불투명도로 간다
			$('#mask').fadeIn(500);
			$('#mask').fadeTo("slow", 0.8);

			//화면을 보여준다
			$('.frame').show();
		}

		//검은 막 띄우기
		$('.openMask').click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.frame .info-bar .close').click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다
			e.preventDefault();
			$('#mask, .frame').hide();
		});

		//검은 막을 눌렀을 때
		$('#mask').click(function() {
			$(this).hide();
			$('.frame').hide();
		});
	});
</script>
</head>
<body>
	
	<div class="container w80p">
        <div class="left head w100p bold mar-topbot-35px">
            진행경매 작품정보
        </div>
        <div class="body w100p">
        	<table class="body-tb">
        		<tbody>
        			<tr>
						<td>
							<table class="auction-image-tb">
								<tbody>
									<tr>
										<td>
											<div class="image-prev center">
	        									<img src="${root}/image/art?art_image=${view.art_image}" style="width:500; height:400;">
	        								</div>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td>
			        		<table class="auction-info-tb">
			        			<tbody>
			        				<tr>
			        					<td>
						        			<div class="art-detail-name">
						        				작품명
						        			</div>
						        			<div class="auction-detail-time">
						        				경매 시작시간
						        			</div>
						        			<div class="auction-detail-menu">
							        			<input type="button" class="openMask" value="응찰하기">
						        			</div>
			        					</td>
			        				</tr>
			        			</tbody>
			        		</table>
						</td>
        			</tr>
        		</tbody>
        	</table>
        </div>
	</div>
        		

    <!-- 응찰 기능 -->
    <div id="mask" align="center"></div>
	<div class="frame" align="center">
		<div class="info-bar">
			<span class="info-bar-name left">경매 응찰하기
				<span class="right">
					<input type="button" class="close" value="닫기"/>
				</span>
			</span>
		</div>
		<div class="wrap-info">
			<div class="auction-info">
				<table class="auction-info-tb w100p">
					<tbody>
						<tr>
							<th>
								<div class="left bold head w100p">작품정보</div>
							</th>
						</tr>
						<tr>
							<td>
								<div class="center">
									<img src="http://placehold.it/280x280">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="left">
								
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="art-info">
				<table class="w100p">
					<tbody>
						<tr>
							<th>
								<div class="left bold head w100p">경매정보</div>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="bid-info">
				<table class="w100p">
					<tbody>
						<tr>
							<th>
								<div class="left bold head w100p">응찰현황</div>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
    
</body>
</html>