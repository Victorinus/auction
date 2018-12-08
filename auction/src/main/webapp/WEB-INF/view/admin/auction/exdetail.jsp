<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>
<jsp:include page="/WEB-INF/view/admin/auction/menu.jsp"/>

<style>
	.admin-auction-exdetail{
		margin: 100px 0;
	}
	.admin-auction-exdetail *{
		vertical-align: middle;
		text-align: center;
	}
	.admin-auction-exdetail table{
		width: 60%;
		margin: auto;
		border-top: solid 2px;
		border-bottom: solid 2px;
		border-spacing: 0;
	}
	.admin-auction-exdetail th{
		border-bottom: solid 1px;
		border-color:silver;
		text-align: center;
		background-color: rgb(230, 230, 235);
	}
	.admin-auction-exdetail td{
		line-height: 40px;
		padding : 10px;
		border-top: solid 2px;
		text-align:center;
		vertical-align: middle;
	}
	.admin-auction-exdetail a{
		color:black;
	}
	.admin-auction-exdetail input{
		line-height: 25px;
		width:100%;
		padding : 3px 10px;
	}
	.admin-auction-exdetail input[type=text], .admin-auction-exdetail input[type=number]{
		text-align:left;
	}
	.admin-auction-exdetail input[type=button], .admin-auction-exdetail input[type=submit]{
		margin: 0 10px;
		font-size: 16px;
		height:35px;
		width:80px;
		color: white;
		border: none;
		background-color: #c33234;
		cursor:pointer;
	}
	.admin-auction-exdetail input[type=file]{
		padding: 3px 0;
	}
	
	.admin-auction-exdetail select{
		padding : 3px 10px;
		height: 35px;
	}
	
	.admin-auction-exdetail textarea{
		line-height: 21px;
		width:100%;
		height: 200px;
		text-align:left;
		padding : 5px 10px;
		resize: none;
	}
	.admin-auction-exdetail .foot-btn{
		text-align:center;
		line-height:50px;
		margin: 10px 0;
	}
	
	.admin-auction-exdetail .auction-image{
		width: 200px;
		height: 200px;
		padding:0;
		margin:10px;
	}
	.admin-auction-exdetail .auction-tit{
		display: inline-block;
		width:100%;
		padding:20px 50px;
	}
	.admin-auction-exdetail .tit-img-box, .admin-auction-exdetail .tit-info-box{
		margin:0;
		width:500px;
		float: left;
	}
	.admin-auction-exdetail .tit-img-box{
		
	}
	.admin-auction-exdetail .tit-img-box > img{
		vertical-align: middle;
	}
	.admin-auction-exdetail .tit-info-box > div{
		text-align:left;
		padding: 5px 10px;
		line-height:25px;
		font-size: 17px;
	}
	.admin-auction-exdetail .entry-tb, .admin-auction-exdetail .ex-tb{
		border: 1px solid silver;
		width:85%;
	}
	.admin-auction-exdetail .entry-tb th, .admin-auction-exdetail .entry-tb td{
		border: 0.5px solid silver;
	}
	.admin-auction-exdetail .ex-tb th, .admin-auction-exdetail .ex-tb td{
		border: 0.5px solid silver;
	}
	.admin-auction-exdetail .entry-tb td, .admin-auction-exdetail .ex-tb td{
		text-align: center;
	}
	.admin-auction-exdetail .entry-tb .artnm, .admin-auction-exdetail .ex-tb .artnm{
		text-align: left;
	}
	.admin-auction-exdetail .entry-tb-nm, .admin-auction-exdetail .ex-tb-nm{
		font-size:18px;
		font-weight: bold;
		margin: 15px 0;
	}
	.admin-auction-exdetail .auction-main-entry, .admin-auction-exdetail .auction-main-ex{
		border: 3px solid #d8dcdf;
		background-color: #f6f6f6;
		margin:50px 0;
	}
	.admin-auction-exdetail .auction-main th{
		height:50px;
	}
	.admin-auction-exdetail .ex-tb{
		margin:20px auto 50px; 
	}
	.admin-auction-exdetail .menu-btn {
		float: right;
		padding:20px 10px;
	}
	.admin-auction-exdetail  .entry-foot-bar input, .admin-auction-exdetail  .entry-foot-bar select{
		padding:0;
		margin: 0;
		line-height: 35px;
		height: 35px; 
		vertical-align: top;
	}
	.admin-auction-exdetail .search-bar{
		margin:0 auto 30px;
	}
	.admin-auction-exdetail .entry-foot-bar select{
		width:100px;
	}
	.admin-auction-exdetail .entry-foot-bar input[type=text]{
		width:300px;
	}
	.admin-auction-exdetail .nav-bar a{
		text-decoration: none;
	}
	.bold{
		font-weight: bold;
	}
	.red{
		color: red;
	}
	
</style>
<script>
	function editMenuColor(){
		$(".admin-menu-auction-exhibit").css("color","#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-auction-exdetail" align="center">
	<input type="hidden" name="auction_sq" value="${auction.auction_sq}">
		<table>
			<tbody>
				<tr>
					<td>
						<div class="auction-tit">
							<div class="tit-img-box">
								<img src="${root}/image/auction/${auction.auction_image}" class="auction-image">
							</div>
							<div class="tit-info-box">
								<div class="auction-type left">
									<c:choose>
										<c:when test="${auction.auction_type eq 'online'}">
											온라인경매
										</c:when>
										<c:otherwise>
											오프라인경매
										</c:otherwise>
									</c:choose>
								</div>
								<div class="auction-nm left">${auction.auction_nm}</div>
								<div class="auction-info left">${auction.auction_info}</div>
								<div class="auction-addr left">
									<c:if test="${not empty auction.auction_post}">[${auction.auction_post}] </c:if>
									${auction.auction_addr1} ${auction.auction_addr2}
								</div>
								<div class="auction-start left">${auction.auction_start}</div>
								<div class="auction-end left">${auction.auction_end}</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="menu-btn">
						<a	href="exhibit">
							<input type="button" value="목록"></a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="auction-main">
							<div class="auction-main-entry">
								<div class="entry-tb-nm left">출품대기 작품목록</div>
								<table class="entry-tb">
									<thead>
										<tr>
											<th style="width:10%">번호
												<c:choose>
													<c:when test="${empty param.sortType or param.sortType eq 'dt'}">
														<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=dtR&searchType=${param.searchType}&searchKey=${param.searchKey}">
															<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px;"></a>
													</c:when>
													<c:otherwise>
														<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=dt&searchType=${param.searchType}&searchKey=${param.searchKey}">
															<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
													</c:otherwise>
												</c:choose>
											</th>
											<th style="width:50%">작품명
											<c:choose>
												<c:when test="${param.sortType eq 'nm'}">
													<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=nmR&searchType=${param.searchType}&searchKey=${param.searchKey}">
														<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
												</c:when>
												<c:otherwise>
													<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=nm&searchType=${param.searchType}&searchKey=${param.searchKey}">
														<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
												</c:otherwise>
											</c:choose>
											</th>
											<th style="width:25%">작가명
											<c:choose>
												<c:when test="${param.sortType eq 'artist'}">
													<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=artistR&searchType=${param.searchType}&searchKey=${param.searchKey}">
														<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
												</c:when>
												<c:otherwise>
													<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=artist&searchType=${param.searchType}&searchKey=${param.searchKey}">
														<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
												</c:otherwise>
											</c:choose>
											</th>
											<th style="width: 15%">비고</th>
										</tr>
									<tbody>
										<c:forEach var="entry" items="${artEntry}">
											<tr>
												<td>${entry.art_sq}</td>
												<td class="artnm">
													<img src="${root}/image/art/${entry.art_image}" style="width: 50; height: 50;margin-right: 10px;">
													
													<a	href="${root}/admin/art/detail?art_sq=${entry.art_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
														<c:choose>
															<c:when test="${fn:length(entry.art_nm) > 40}">
																${fn:substring(entry.art_nm, 0, 40)}...
															</c:when>
															<c:otherwise>${entry.art_nm}</c:otherwise>
														</c:choose>
													</a>
												</td>
												<td>
												<c:choose>
													<c:when test="${fn:length(entry.art_artist) > 20}">
														${fn:substring(entry.art_artist, 0, 20)}...
													</c:when>
													<c:otherwise>${entry.art_artist}</c:otherwise>
												</c:choose>
												</td>
												<td>
													<a href="exreg?auction_sq=${auction.auction_sq}&art_sq=${entry.art_sq}">
														<input type="button" class="list-btn" value="출품하기"></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="entry-foot-bar">
									<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
										<c:if test="${page.curRange ne 1}">
											<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=1&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[처음]</a>
										</c:if>
										<c:if test="${page.curRange ne 1}">
											<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${page.startPage-1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[이전]</a>
										</c:if>
										<c:forEach var="pageNum" begin="${page.startPage}" end="${page.endPage}">
											<c:choose>
												<c:when test="${pageNum eq page.curPage}">
													<span class="bold red">${pageNum} 
													</span>
												</c:when>
												<c:otherwise>
													<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${pageNum}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">${pageNum}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
											<a href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${page.endPage+1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[다음]</a>
										</c:if>
										<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
											<a	href="${root}/admin/auction/exdetail?auction_sq=${auction.auction_sq}&curPage=${page.pageCnt}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[끝]</a>
										</c:if>
									</div>
									<div class="search-bar" style="min-height: 30px; padding: 10px 0;">
										<form action="exdetail" method="post">
											<input type="hidden" name="auction_sq" value="${auction.auction_sq}">
											<select name="searchType">
												<option value="art_nm" <c:if test="${param.searchType eq 'art_nm'}">selected</c:if>>작품명</option>
												<option value="art_sq" <c:if test="${param.searchType eq 'art_sq'}">selected</c:if>>작품번호</option>
												<option value="art_artist" <c:if test="${param.searchType eq 'art_artist'}">selected</c:if>>작가명</option>
											</select>
											<input class="left" name="searchKey" type="text" placeholder="검색어를 입력" value="${param.searchKey}">
											<input type="submit"	value="검색">
											<a href="exdetail?auction_sq=${auction.auction_sq}">
												<input type="button" value="목록"></a>
										</form>
									</div>
								</div>
							</div>
							<div class="auction-main-ex">
								<div class="ex-tb-nm left">현재 출품 목록</div>
								<table class="ex-tb">
									<thead>
										<tr>
											<th style="width:10%">번호	</th>
											<th style="width:50%">작품명</th>
											<th style="width:25%">작가명</th>
											<th style="width: 15%">비고</th>
										</tr>
									<tbody>
										<c:forEach var="map" items="${exList}">
											<tr>
												<td>${map.key}</td>
												<td class="artnm">
													<img src="${root}/image/art/${map.value.art_image}" style="width: 50; height: 50;margin-right: 10px;">
													
													<a	href="${root}/admin/art/detail?art_sq=${map.value.art_sq}">
														<c:choose>
															<c:when test="${fn:length(map.value.art_nm) > 40}">
																${fn:substring(map.value.art_nm, 0, 40)}...
															</c:when>
															<c:otherwise>${map.value.art_nm}</c:otherwise>
														</c:choose>
													</a>
												</td>
												<td>
												<c:choose>
													<c:when test="${fn:length(map.value.art_artist) > 20}">
														${fn:substring(map.value.art_artist, 0, 20)}...
													</c:when>
													<c:otherwise>${map.value.art_artist}</c:otherwise>
												</c:choose>
												</td>
												<td>
													<a href="exdel?auction_sq=${auction.auction_sq}&art_sq=${map.value.art_sq}">
														<input type="button" class="list-btn" value="출품취소"></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>