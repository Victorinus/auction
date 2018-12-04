<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			height: 91%;
			display: block;
			overflow: auto;
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
			margin: 10px 0;
		}
		.body{
			margin: auto;
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
		}
		
		.art-main{
			min-height: 600px;
		}
		
		.art-detail{
			display: inline-block;
		}
		.image-prev{
			padding:50px 50px;
			vertical-align:inherit;
			display: block;
			width:600px;
			height: 500px;
			margin: auto;
		}
		.auction-image-tb{
			width: 100%;
		}
		.body-tb{
			width: 100%;
		}
		.body-tb tbody tr td{
			width:50%;
		}
		.art-info-tb{
			width:100%;
		}
		.art-detail.name{
			width:100%;
		}
		.state-auction-info{
			margin: auto;
		}
		.state-auction{
			padding: 15px 15px;
			min-height: 100px;
			background-color: #dcdcdc;
			margin: 15px 50px;
		}
		.hr{
			margin:35px 0;
		}
		.hr-bold{
			margin:50px 0;
			height: 3px;
			background-color: black;
		}
		.art-detailInfo-menu{
			margin:20px 20px 0px;
			border-bottom: 2px solid gray;
		}
		.bidding{
			width:300px;
		}
		.bidding-btn{
			margin: 30px 0 0;
			background-color: #c33234;
			color:white;
			border: 0px solid;
			width: 100%;
			height: 50px;
		}
		.btn1{
			background-color: #c33234;
			color:white;
			border: 0px solid;
			width: 100px;
			height: 50px;
		}
		.btn2{
			background-color: #c33234;
			color:white;
			border: 0px solid;
			width: 150px;
			height: 40px;
		}
		.bid-info-list{
			height:430px;
			overflow: auto;
			border: 1px solid gray;
		}
		.art-info-warning{
			color: #c33234;
			font-size:15px;
			font-weight: bold;
			padding:20 0 0px;
		}
		.bidbtn{
			background-color: #555;
			color: #fff;
			font-size: 13px;
			height: 24px;
			width: 80px;
			border: 0px;
			margin: 5px 0;
		}
		.bid-info-list-val{
			padding:20px 15px;
		}
		.bidhr, dthr{
			background-color: #dcdcdc;
			height: 1px;
		}
		.lh25{
			line-height: 25px;
		}
		.mg0{
			margin:0px;
		}
		.mg5{
		
		}
		.bgc{
			background-color: #e6e6fa;
		}
		.bid-art-detail{
			padding: 10px;
			font-size: 14px;
		}
		.bid-art-detail-lot, .bid-art-detail-nm, .bid-art-detail-artist{
			font-size : 18px;
		}
		.red{
			color: red;
		}
		.gray{
			color:gray;
		}
		.ft15{
			font-size: 15px;
		}
		.ft20{
			font-size: 20px;
		}
		.ft25{
			font-size: 25px;
		}
		.ft30{
			font-size: 30px;
		}
		.art-detailInfo-info2{
			margin:0 20px;
			padding:40px;
			background-color: #dcdcdc;
			line-height: 1.5em;
		}
</style>
    
<script>
	$(document).ready(function() {
		
		//웹소켓 접속
		webInit();
		function wrapWindowByMask() {
			//화면의 높이와 너비를 구한다
			var maskHeight = $(document).height();
			var maskWidth = $(window).width();

			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다
			$('#mask').css({
				'width' : maskWidth,
				'height' : maskHeight
			});

			//애니메이션 효과 - 까맣게 됐다가 살짝 어둡게
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
			e.preventDefault();
			$('#mask, .frame').hide();
		});

		//검은 막을 눌렀을 때
		$('#mask').click(function() {
			$(this).hide();
			$('.frame').hide();
			webFinish();
		});
		
		//경매의 남은시간을 계산하는 함수
		 function getTime() { 
	        var now = new Date();
            var rTime = new Date("${view.a_end}"); 
	                
            //계산
	        var gap = Math.round((rTime - now.getTime()) / 1000);
	        var D = Math.floor(gap / (60 * 60 * 24));
	        var H = Math.floor((gap - D * (60 * 60 * 24)) / (60 * 60) % (60 * 60));
	        var M = Math.floor((gap - H * (60 * 60)) / 60 % 60);
	        var S = Math.floor((gap - M * 60) % 60);
	        
            $(".counter").html(D + "일 " + H + "시간 " + M + "분 " + S + "초"); 
        };
        
        //웹소켓 시작
		function webInit(){
			var uri = "ws://localhost:8080/auction/echo";
			if(!window.websocket){
				websocket = new WebSocket(uri);
				//console.log("웹소켓 : " + websocket);
				
				//연결 수립 이후에 특정 상태에서 실행할 콜백 함수를 지정
				websocket.onopen = function(e){
					//console.log("연결되었습니다");
				};
				websocket.onclose = function(e){
					//console.log("연결이 종료되었습니다");
				};
				websocket.onerror = function(e){
					//console.log("연결 중 오류가 발생하였습니다");
				}
				websocket.onmessage = function(e){
					var serverMsg = JSON.parse(e.data)
					var bid_date = serverMsg.bid_date;
					var bid_price = serverMsg.bid_price;
					var bid_user = serverMsg.bid_user;
					//console.log("serverMsg : " + serverMsg);//테스트
					//console.log("bid_date : " + bid_date);//테스트
					//console.log("bid_price : " + bid_price);//테스트
					//	console.log("bid_user : " + bid_user);//테스트
					addDiv(bid_date, bid_price, bid_user);
					editBidNow(bid_price);
					
					$(".bidTotalVal").text(Number($(".bidTotalVal").text())+1);
				}
			}
		};

		//경매와 작품의 SQ를 보내는 함수
		function webSendMsg(){
			websocket.send(JSON.stringify(bidInfo));
		};

		//금액 형식 변환
		var moneyForm = wNumb({
            decimals: 0,
            thousand: ','
            //prefix: 'KRW '
        });
		
		//아이디 절반 비공개 처리
		function halfId(id){
			var halfVal = "";
			var halfLength = Math.ceil(id.length/2);
			for(var i = 0; i < halfLength; i++){
				halfVal += "*";
			}
			halfVal += id.substring(halfLength, id.length);
			return halfVal;
		}
		
		//응찰 정보를 받아 입력하는 함수
		function addDiv(bid_date, bid_price, bid_user) {
			var hr = document.createElement('hr');
			hr.classList.add('mg0');
			hr.classList.add('bidhr');
			var div = document.createElement('div');
			div.classList.add('bid-info-list-val');
			div.innerHTML= 
				"<div class='lh25'>" + halfId(bid_user) + 
				"<span style='float:right;'><img src='${root}/image/icon/new.png'></span>" + 
				"<div class='lh25'>Price KRW " + moneyForm.to(Number(bid_price)) + "</div>" + 
				"<div class='lh25'>Date <span class='bid-info-list-val-dt'>" + bid_date + "</span></div>";
			$(".bid-info-list").prepend(hr);
			$(".bid-info-list").prepend(div);
		};
		
		//초기 현재가를 설정하는 함수
		function setBidPrice(){
			var bidPrice;
			<c:forEach  var="bid" items="${bid}" varStatus="status">
				<c:if test="${status.first}">
					bidPrice = ${bid.bid_bp};
				</c:if>
			</c:forEach>
			$(".bidPriceVal").html(moneyForm.to(Number(bidPrice)));
		}
		
		
		//응찰 가격을 받아 현재가를 수정하는 함수
		function editBidNow(bid_price){
			var bidUnit = $(".bidUnitVal").val();
			//console.log("bidUnit : "+bidUnit);//테스트
			var bidNow = Number(bid_price) + Number(bidUnit);
			//console.log("bidNow : "+bidNow);//테스트
			var result = moneyForm.to(bidNow);
			//console.log("result : "+result);//테스트
			$(".bidNowVal").val(bidNow);
			$(".bidNow").text(result);
			$(".bidPriceVal").html(result);
		}
		
		
		
		//응찰 버튼 눌렀을때
		$(".bidding-btn").click(function() {
			var bid_result = confirm("응찰하시겠습니까?");

			if(bid_result) {
				//응찰정보를 보내는 함수 실행
				bidInfo = {
					a_sq : "${view.a_sq}",
					art_sq : "${view.art_sq}",
					bid_user : "test",
					bid_price : $(".bidNowVal").val()
				};
				webSendMsg();
			} else {
				
			}

		});
		
		//페이지를 나가게되면
		$(window).on("beforeunload", function(){
			clearInterval(timer);
			if(window.websocket){
				webFinish();
			}
		});
		//웹소켓을 종료하는 함수
		function webFinish() {
			window.websocket.close();
			window.websocket = null;
		};
		
		//타이머 출력
		timer = setInterval(getTime, 1000);
		
		//현재가 출력
		setBidPrice();
		
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
						<td colspan="2">
							<div class="state-auction">
								<div class="state-auction-info">
									<div class="state-auction-nm lh25">${view.a_nm}</div>
									<div class="state-auction-addr lh25">${view.a_addr1} ${view.a_addr2}</div>
									<div class="state-auction-count lh25">
										<span class="counter"></span> / 
										<span class="bidTotal">총 <span class="bidTotalVal">${fn:length(bid)}</span>회 응찰</span> / 
										<span class="bidPrice red">현재가 KRW <span class="bidPriceVal"></span></span>
									</div>
								</div>
							</div>
						</td>
        			</tr>
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
			        		<table class="art-info-tb">
			        			<tbody>
			        				<tr>
			        					<td>
			        						<div class="art-detail left w100p">
							        			<div class="art-detail-lot lh25 ft20 gray">
							        				LOT. ${param.lot}
							        			</div>
							        			<div class="art-detail-artist lh25 ft25">
							        				${view.art_artist}
							        			</div>
							        			<div class="art-detail-cdt lh25 ft20">
							        				${view.art_cdt}
							        			</div>
							        			<div class="hr"><hr class="dthr"></div>
							        			<div class="art-detail-nm lh25 ft20">
							        				${view.art_nm}
							        			</div>
							        			<div class="art-detail-medium lh25 ft15">
							        				${view.art_medium}
							        			</div>
							        			<div class="art-detail-size lh25 ft15">
							        				${view.art_size}
							        			</div>
							        			<div class="hr"><hr class="dthr"></div>
							        			<div class="art-detail-bp lh25 ft15">
							        				추정가 KRW ${view.art_bp}
							        			</div>
							        			<div class="hr"><hr class="dthr"></div>
							        			<div class="art-detail-menu">
								        			<input type="button" class="openMask btn1" value="응찰하기">
								        			<input type="button" class="addLike btn1" value="관심작품">
							        			</div>
			        						</div>
			        					</td>
			        				</tr>
			        			</tbody>
			        		</table>
						</td>
        			</tr>
        			<tr>
        				<td colspan="2">
        					<div class="hr-bold"><hr></div>
        					<div class="art-detailInfo">
        						<div class="art-detailInfo-menu">
        							<input type="button" class="btn2" value="작품설명">
        						</div>
			        			<div class="art-detailInfo-info2">
			        				${view.art_info2}
			        			</div>
        					</div>
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
			<span class="info-bar-name left bold">
				경매 응찰하기
				<span style="font-weight: normal;font-size:15px;">[${view.a_nm}]</span>
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
							<td>
								<div class="left bold head w100p">작품정보</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="art-img center">
									<img src="${root}/image/art?art_image=${view.art_image}" style="width:280; height:280;">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="bid-art-detail left">
									<div class="bid-art-detail-lot lh25">
				        				LOT. ${param.lot}
				        			</div>
				        			<div class="bid-art-detail-artist lh25 bold">
				        				${view.art_artist}
				        			</div>
				        			<div class="bid-art-detail-nm lh25 bold">
				        				${view.art_nm}
				        			</div>
				        			<div class="bid-art-detail-cdt lh25">
				        				${view.art_cdt}
				        			</div>
				        			<div class="bid-art-detail-medium lh25">
				        				${view.art_medium}
				        			</div>
				        			<div class="bid-art-detail-size lh25">
				        				${view.art_size}
				        			</div>
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
							<td>
								<div class="left bold head w100p">경매정보</div>
								
							</td>
							<tr>
						</tr>
						<tr>
							<td>
								<div class="art-info-warning">
									응찰 및 낙찰 이후에는 취소 할 수 없습니다.<br>
									신중한 응찰 부탁드립니다.<br><br>
									응찰 후 반드시 새로고침 버튼을 클릭하여<br>
									응찰현황을 확인하시기 바랍니다.								
								</div>
								<div class="hr"><hr class="bidhr"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="art-info-count">
									<input type="button" class="bidbtn" value="남은시간">
									<span class="counter"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="art-info-start">
									<input type="button" class="bidbtn" value="시작시간">
									<span>${view.a_start}</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="art-info-end">
									<input type="button" class="bidbtn" value="종료시간"> 
									<span>${view.a_end}</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="hr"><hr class="bidhr"></div>
								<div class="art-bidding-info">
									<div class="art-bidding-info-bid">
										<input type="button" class="bidbtn" value="응찰단위"> 
										KRW 
										<c:choose>
											<c:when test="${art.ep>100000000}">
												<c:set var="bidUnit" value="500000"/>
											</c:when>
											<c:when test="${art.ep>30000000}">
												<c:set var="bidUnit" value="400000"/>
											</c:when>
											<c:when test="${art.ep>5000000}">
												<c:set var="bidUnit" value="200000"/>
											</c:when>
											<c:when test="${art.ep>3000000}">
												<c:set var="bidUnit" value="100000"/>
											</c:when>
											<c:when test="${art.ep>1000000}">
												<c:set var="bidUnit" value="50000"/>
											</c:when>
											<c:when test="${art.ep>500000}">
												<c:set var="bidUnit" value="30000"/>
											</c:when>
											<c:when test="${art.ep>200000}">
												<c:set var="bidUnit" value="20000"/>
											</c:when>
											<c:otherwise>
												<c:set var="bidUnit" value="10000"/>
											</c:otherwise>
										</c:choose>
										<span class="bidUnit">
											<fmt:formatNumber value="${bidUnit}" pattern="#,###" />
										</span>
										<input type="hidden" class="bidUnitVal" value="${bidUnit}">
									</div>
									<div class="art-bidding-info-now">
										<input type="button" class="bidbtn" value="현재가"> 
										<span class="red bold">KRW </span>
										<c:forEach var="bid" items="${bid}" varStatus="status">
											<c:if test="${status.first}">
												<span class="bidNow red bold">
													<fmt:formatNumber value="${bid.bid_bp + bidUnit}" pattern="#,###" />
												</span>
												<input type="hidden" class="bidNowVal" value="${bid.bid_bp+bidUnit}">
											</c:if>
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="bidding center w100p">
									<input type="button" class="bidding-btn" value="즉시응찰">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="bid-info">
				<table class="w100p">
					<tbody>
						<tr>
							<td>
								<div class="left bold head w100p">
									응찰현황
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="bid-info-list">
									<c:forEach var="bid" items="${bid}">
										<div class="bid-info-list-val">
											<div class="lh25">
												<c:set var="length" value="${fn:length(bid.user_id)}"/>
												<c:set var="halfLength" value="${fn:length(bid.user_id)/2}"/>
												<c:set var="CeilHalfLength" value="${halfLength+(1-(halfLength%1))%1}"/>
												<c:forEach begin="1" end="${CeilHalfLength}" step="1">*</c:forEach>${fn:substring((bid.user_id),CeilHalfLength,length)}
											</div>
											<div class="lh25">Price KRW <fmt:formatNumber value="${bid.bid_bp}" pattern="#,###" /></div>
											<div class="lh25">Date <span class="bid-info-list-val-dt">${bid.bid_dt.substring(0, 19)}</span></div>
										</div>
										<hr class="mg0 bidhr">
									</c:forEach>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
    
</body>
</html>