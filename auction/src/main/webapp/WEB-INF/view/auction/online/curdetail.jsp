<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>

<style>
	.auction-online-curdetail{
		margin: auto;
	}
	.auction-online-curdetail th, .auction-online-curdetail td {
		vertical-align: inherit;
	}
	.auction-online-curdetail th{
		padding: 0;
		display: table-row;
	}
	.auction-online-curdetail tbody{
		vertical-align: middle;
	}
	.auction-online-curdetail #mask {
		position: absolute;
		z-index: 9000;
		background-color: #000;
		display: none;
		left: 0;
		top: 0;
	}
	.auction-online-curdetail .frame {
		display: none;
		position: fixed;
		top: 15%;
		left: 25%;
		width: 50%;
		height: 70%;
		padding: 0px;
		z-index: 10000;
		background-color: white;
		overflow: auto;
	}
	.auction-online-curdetail .info-bar {
		min-height: 40px;
		background-color: #c33234;
		padding: 10px 10px;
		font-size: 20px;
		color: white;
		display: block;
	}
	
	.auction-online-curdetail .close{
		background-color: #c33234;
		border:1px solid white;
		color:white;
		width:60px;
		height: 35px;
		font-size:15px;
	}
	.auction-online-curdetail .info-bar-name {
		display: block;
		padding-left: 20px;
	}
	.auction-online-curdetail .wrap-info {
		height: 91%;
		display: block;
		overflow: hidden;
	}
	.auction-online-curdetail .auction-info, .auction-online-curdetail .art-info, .auction-online-curdetail .bid-info {
		width: 300px;
		height: 100%;
		display: inline-block;
	}
	.auction-online-curdetail .head {
		font-size: 18px;
		line-height: 25px;
		border-bottom: 2px solid black;
		padding: 10px 0;
		margin: 10px 0;
	}
	.auction-online-curdetail .body{
		margin: auto;
	}
	.auction-online-curdetail .mar-topbot-35px{
		margin: 35px 0;
	}
	.auction-online-curdetail .container{
		display:block;
	}
	.auction-online-curdetail .art-detail{
		display: inline-block;
	}
	.auction-online-curdetail .image-prev{
		padding:50px 50px;
		vertical-align:inherit;
		display: block;
		width:600px;
		height: 500px;
		margin: auto;
	}
	.auction-online-curdetail .auction-image-tb{
		width: 100%;
	}
	.auction-online-curdetail .body-tb{
		width: 100%;
	}
	.auction-online-curdetail .body-tb tbody tr td{
		width:50%;
	}
	.auction-online-curdetail .art-info-tb{
		margin: 20px 0;
		width:100%;
	}
	.auction-online-curdetail .art-detail.name{
		width:100%;
	}
	.auction-online-curdetail .state-auction-info{
		margin: auto;
	}
	.auction-online-curdetail .state-auction{
		padding: 15px 15px;
		background-color: #dcdcdc;
		margin: 15px 50px;
		line-height: 100px;
	}
	.auction-online-curdetail .hr{
		margin:35px 0;
	}
	.auction-online-curdetail .hr-bold{
		margin:50px 0;
		height: 2px;
		background-color: black;
	}
	.auction-online-curdetail .art-detailInfo-menu{
		margin:20px 20px 0px;
		border-bottom: 2px solid gray;
	}
	.auction-online-curdetail .bidding{
		width:300px;
	}
	.auction-online-curdetail .bidding-btn{
		margin: 20px 0 0;
		background-color: #c33234;
		color:white;
		border: 0px solid;
		width: 100%;
		height: 50px;
	}
	.auction-online-curdetail .btn1{
		background-color: #c33234;
		color:white;
		border: 0px solid;
		width: 100px;
		height: 50px;
	}
	.auction-online-curdetail .btn2{
		background-color: #c33234;
		color:white;
		border: 0px solid;
		width: 150px;
		height: 40px;
	}
	.auction-online-curdetail .bid-info-list{
		height:430px;
		overflow: auto;
		border: 1px solid gray;
	}
	.auction-online-curdetail .art-info-warning{
		color: #c33234;
		font-size:15px;
		font-weight: bold;
		padding:20 0 0px;
	}
	.auction-online-curdetail .bidbtn{
		background-color: #555;
		color: #fff;
		font-size: 13px;
		height: 24px;
		width: 80px;
		border: 0px;
		margin: 5px 0;
	}
	.auction-online-curdetail .bid-info-list-val{
		padding:20px 15px;
	}
	.auction-online-curdetail .bidhr, .auction-online-curdetail .dthr{
		background-color: #dcdcdc;
		height: 1px;
	}
	.auction-online-curdetail .bgc{
		background-color: #e6e6fa;
	}
	.auction-online-curdetail .bid-art-detail{
		padding: 10px;
		font-size: 14px;
	}
	.auction-online-curdetail .bid-art-detail-lot, .auction-online-curdetail .bid-art-detail-nm, .auction-online-curdetail .bid-art-detail-artist{
		font-size : 18px;
	}
	.auction-online-curdetail .art-detailInfo-info2{
		margin:0 20px;
		padding:40px;
		background-color: #dcdcdc;
		line-height: 1.5em;
	}
	.lh25{
		line-height: 25px;
	}
	.mg0{
		margin:0px;
	}
	.mg5{
		margin:5px;
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
	.float-r{
		float: right;
	}
	.float-l{
		float: left;
	}
	.float-i{
		float: inherit;
	}
	.float-n{
		float: none;
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
</style>

<div class="auction-online-curdetail w80p">
	<div class="container">
        <div class="left head bold mar-topbot-35px ft25">
            진행경매 작품정보
        </div>
        <div class="body">
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
							        			<div class="art-detail-ep lh25 ft15">
							        				<input type="button" class="bidbtn" value="추정가"> 
							        				KRW <fmt:formatNumber value="${view.art_ep}" pattern="#,###" /> 이상
							        			</div>
							        			<div class="art-detail-sp lh25 ft15">
							        				<input type="button" class="bidbtn" value="시작가"> 
							        				KRW <fmt:formatNumber value="${view.art_ep}" pattern="#,###" />
							        			</div>
							        			<div class="art-detail-np lh25 ft15">
							        				<input type="button" class="bidbtn" value="현재가"> 
							        				<span class="bidPrice red">KRW <span class="bidPriceVal"></span></span>
							        			</div>
							        			<div class="hr"><hr class="dthr"></div>
							        			<div class="art-detail-menu">
								        			<input type="button" class="openMask btn1" value="응찰하기">
								        			<input type="button" class="addLike btn1" value="관심작품">
								        			<a href="current">
									        			<input type="button" class="goList btn1" value="목록">
								        			</a>
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
        					<div class="hr-bold"></div>
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
				<span class="float-r">
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
											<c:when test="${view.art_ep>=100000000}">
												<c:set var="bidUnit" value="500000"/>
											</c:when>
											<c:when test="${view.art_ep>=30000000}">
												<c:set var="bidUnit" value="400000"/>
											</c:when>
											<c:when test="${view.art_ep>=5000000}">
												<c:set var="bidUnit" value="200000"/>
											</c:when>
											<c:when test="${view.art_ep>=3000000}">
												<c:set var="bidUnit" value="100000"/>
											</c:when>
											<c:when test="${view.art_ep>=1000000}">
												<c:set var="bidUnit" value="50000"/>
											</c:when>
											<c:when test="${view.art_ep>=500000}">
												<c:set var="bidUnit" value="30000"/>
											</c:when>
											<c:when test="${view.art_ep>=200000}">
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
										<c:choose>
											<c:when test="${empty bid}">
												<span class="bidNow red bold">
													<fmt:formatNumber value="${view.art_ep}" pattern="#,###" />
												</span>
												<input type="hidden" class="bidNowVal" value="${view.art_ep}">
											</c:when>
											<c:otherwise>
												<c:forEach var="bid" items="${bid}" varStatus="status">
													<c:if test="${status.first}">
														<span class="bidNow red bold">
															<fmt:formatNumber value="${bid.bid_bp + bidUnit}" pattern="#,###" />
														</span>
														<input type="hidden" class="bidNowVal" value="${bid.bid_bp+bidUnit}">
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
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
</div>

<script>
		
		function wrapWindowByMask() {
			//화면의 높이와 너비를 구한다
			var maskHeight = $(window).height();
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
			var bidPrice = "${view.art_ep}";
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
		
		//마우스이벤트 버튼색상 변경
		$(".openMask").mouseover(function(){
			$(".openMask").css("background-color","white");
			$(".openMask").css("color","#c33234");
			$(".openMask").css("border","1px solid #c33234");
		});
		$(".openMask").mouseout(function(){
			$(".openMask").css("background-color","#c33234");
			$(".openMask").css("color","white");
			$(".openMask").css("border","0px");
		});
		$(".addLike").mouseover(function(){
			$(".addLike").css("background-color","white");
			$(".addLike").css("color","#c33234");
			$(".addLike").css("border","1px solid #c33234");
		});
		$(".addLike").mouseout(function(){
			$(".addLike").css("background-color","#c33234");
			$(".addLike").css("color","white");
			$(".addLike").css("border","0px");
		});
		$(".goList").mouseover(function(){
			$(".goList").css("background-color","white");
			$(".goList").css("color","#c33234");
			$(".goList").css("border","1px solid #c33234");
		});
		$(".goList").mouseout(function(){
			$(".goList").css("background-color","#c33234");
			$(".goList").css("color","white");
			$(".goList").css("border","0px");
		});
		$(".bidding-btn").mouseover(function(){
			$(".bidding-btn").css("background-color","white");
			$(".bidding-btn").css("color","#c33234");
			$(".bidding-btn").css("border","1px solid #c33234");
		});
		$(".bidding-btn").mouseout(function(){
			$(".bidding-btn").css("background-color","#c33234");
			$(".bidding-btn").css("color","white");
			$(".bidding-btn").css("border","0px");
		});
		
		//창 크기 변경되면 이벤트
		$(window).resize(function(){
			var maskHeight = $(window).height();
			var maskWidth = $(window).width();
			$('#mask').css({'width' : maskWidth,'height' : maskHeight});
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
		
		
		//웹소켓 접속
		webInit();
		
		//타이머 출력
		timer = setInterval(getTime, 1000);
		
		//현재가 출력
		setBidPrice();
		
</script>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>