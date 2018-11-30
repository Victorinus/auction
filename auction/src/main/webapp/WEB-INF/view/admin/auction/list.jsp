<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<!-- 테스트 -->
<div class="timerTest" align="center">
	<h2>
		경매 시작까지 남은시간 : 
		<span id="counter"></span>
	</h2>
</div>
<script>
	var stime;
	webInit();
	function webInit(){
		var uri = "ws://localhost:8080/auction/echo";
			if(!window.websocket){
				websocket = new WebSocket(uri);
				//console.log("웹소켓 : " + websocket);
				
				//연결 수립 이후에 특정 상태에서 실행할 콜백 함수를 지정
				websocket.onopen = function(e){
					//console.log("연결되었습니다");
					websocket.send('23');//테스트를위해  Auction_sq를 임의지정
				};
				websocket.onclose = function(e){
					//console.log("연결이 종료되었습니다");
				};
				websocket.onerror = function(e){
					//console.log("연결 중 오류가 발생하였습니다");
				}
				websocket.onmessage = function(e){
					stime = e.data;
					console.log(stime);//테스트
					setInterval(getTime, 1000);
					window.websocket.close();
					window.websocket = null;
				}
			}

	};
	$(window).on("beforeunload", function(){
		if(window.websocket){
			window.websocket.close();
			window.websocket = null;
		}
	});
	
	function getTime() { 
        var now = new Date();
		var rTime = new Date(stime); 
		
		//계산
        var gap = Math.round((rTime - now.getTime()) / 1000);
        var D = Math.floor(gap / (60 * 60 * 24));
        var H = Math.floor((gap - D * (60 * 60 * 24)) / (60 * 60) % (60 * 60));
        var M = Math.floor((gap - H * (60 * 60)) / 60 % 60);
        var S = Math.floor((gap - M * 60) % 60);
		
		document.getElementById("counter").innerHTML = D + "일	 " + H + "시간 " + M + "분 " + S + "초"; 
	};
    
</script>

<style>
	th{
		text-align: center;
		padding: 3px 3px;
	}
</style>

<h1>경매 목록</h1>
<div class="auctionList" align="center">

	<table border="1" width="1600px">
		<thead>
			<tr>
				<th colspan="8">
					<div class="topBar" style="text-align: right; min-height: 50px; padding: 10px 10px; color: gray;"></div>
				</th>
			</tr>
			<tr>
				<th style="padding: 3px 3px;">번호
				<c:choose>
					<c:when test="${empty param.sortType or param.sortType eq 'dt'}">
						<a	href="${pageContext.request.contextPath}/admin/auction/list?curPage=${param.curPage}&sortType=dtR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px;"></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/admin/auction/list?curPage=${param.curPage}&sortType=dt&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>경매명
				<c:choose>
					<c:when test="${param.sortType eq 'nm'}">
						<a	href="${pageContext.request.contextPath}/admin/auction/list?curPage=${param.curPage}&sortType=nmR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${pageContext.request.contextPath}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
					<a	href="${pageContext.request.contextPath}/admin/auction/list?curPage=${param.curPage}&sortType=nm&searchType=${param.searchType}&searchKey=${param.searchKey}">
						<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>요약정보</th>
				<th>등록일</th>
				<th>주소</th>
				<th>경매시작시간</th>
				<th>경매종료시간</th>
				<th>경매종류
				<c:choose>
					<c:when test="${param.sortType eq 'type'}">
						<a	href="${pageContext.request.contextPath}/admin/auction/list?curPage=${param.curPage}&sortType=typeR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/auction/list?curPage=${param.curPage}&sortType=type&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="auction" items="${list}">
				<tr>
					<td>${auction.auction_sq}</td>
					<td><img
						src="${pageContext.request.contextPath}/image/auction/${auction.auction_image}"
						style="width: 50; height: 50;"> <a
						href="edit?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
							${auction.auction_nm} </a></td>
					<td>${auction.auction_info}</td>
					<td>${auction.auction_dt}</td>
					<td><c:if test="${not empty auction.auction_post}">
                                                        [${auction.auction_post}] 
                                                </c:if>
						${auction.auction_addr1} ${auction.auction_addr2}</td>
					<td>${auction.auction_start}</td>
					<td>${auction.auction_end}</td>
					<td><c:choose>
							<c:when test="${auction.auction_type eq 'online'}">
                                                                온라인
                                                        </c:when>
							<c:otherwise>
                                                                오프라인
                                                        </c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="8" style="text-align: center;">
					<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
						<c:if test="${page.curRange ne 1}">
							<a
								href="${pageContext.request.contextPath}/admin/auction/list?curPage=1&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[처음]
							</a>
						</c:if>
						<c:if test="${page.curRange ne 1}">
							<a
								href="${pageContext.request.contextPath}/admin/auction/list?curPage=${page.startPage-1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[이전]
							</a>
						</c:if>
						<c:forEach var="pageNum" begin="${page.startPage}"
							end="${page.endPage}">
							<c:choose>
								<c:when test="${pageNum eq page.curPage}">
									<span> <b>${pageNum} </b>
									</span>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/admin/auction/list?curPage=${pageNum}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">${pageNum}
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if
							test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
							<a
								href="${pageContext.request.contextPath}/admin/auction/list?curPage=${page.endPage+1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[다음]
							</a>
						</c:if>
						<c:if
							test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
							<a
								href="${pageContext.request.contextPath}/admin/auction/list?curPage=${page.pageCnt}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[끝]</a>
						</c:if>
					</div>
					<div class="search-bar" style="min-height: 30px; padding: 10px 0;">
						<form action="list" method="post">
							<select name="searchType">
								<c:choose>
									<c:when test="${param.searchType eq 'auction_sq'}">
										<option value="auction_nm">경매명</option>
										<option value="auction_sq" selected>경매번호</option>
										<option value="auction_info">경매요약정보</option>
									</c:when>
									<c:when test="${param.searchType eq 'auction_info'}">
										<option value="auction_nm">경매명</option>
										<option value="auction_sq">경매번호</option>
										<option value="auction_info" selected>경매요약정보</option>
									</c:when>
									<c:otherwise>
										<option value="auction_nm" selected>경매명</option>
										<option value="auction_sq">경매번호</option>
										<option value="auction_info">경매요약정보</option>
									</c:otherwise>
								</c:choose>
							</select> <input name="searchKey" type="text" placeholder="검색어를 입력"
								value="${param.searchKey}"> <input type="submit"
								value="검색"> <a href="list"><input type="button"
								value="목록"></a>
						</form>
					</div>
				</th>
			</tr>
		</tfoot>
	</table>
</div>



<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>