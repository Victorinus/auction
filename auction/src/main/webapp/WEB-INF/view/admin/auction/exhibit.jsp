<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>
<jsp:include page="/WEB-INF/view/admin/auction/menu.jsp"/>

<style>
	.admin-auction-exhibit{
		margin: 100px 0;
	}
	.admin-auction-exhibit *{
		vertical-align: middle;
		text-align: center;
	}
	.admin-auction-exhibit a{
		color:black;
	}
	.admin-auction-exhibit table{
		width: 70%;
		margin: auto;
		border: 1px solid silver;
		table-layout:fixed;
		border-spacing: 0;	
	}
	.admin-auction-exhibit th{
		padding : 10px;
		border: 0.5px solid silver;
		text-align: center;
		line-height:30px;
		background-color: rgb(230, 230, 235);
	}
	.admin-auction-exhibit td{
		padding : 10px;
		border: 0.5px solid silver;
		line-height:30px;
	}
	.admin-auction-exhibit input, select{
		vertical-align:top;
		font-size: 15px;
		height:35px;
		line-height: 35px;
	}
	.admin-auction-exhibit .search-bar input[type=button], .admin-auction-exhibit .search-bar input[type=submit]{
		margin:0;
		padding:0;
		color: white;
		border: none;
		width:60px;
		background-color: #c33234;
	}
	.admin-auction-exhibit .list-btn{
		width:100px;
		height:35px;
		line-height: 35px;
		font-size:16px;
		margin:0;
		padding:0;
		color: white;
		border: none;
		background-color: #c33234;
	}
	.admin-auction-exhibit .nav-bar{
		line-height: 50px;
		font-size:16px;
	}
	.admin-auction-exhibit .nav-bar a{
		text-decoration: none;
	}
	.bold{
		font-weight: bold;
	}
	.red{
		color: red;
	}
	.center{
		text-align: center;
	}
	.left{
		text-align:left;
	}
	.right{
		text-align:right;
	}
	.bold{
		font-weight: bold;
	}
	.topBar{
		min-height: 50px;
	}
	.w100p{
		width:100%;
	}
	.w90p{
		width:90%;
	}
	.w80p{
		width:80%;
	}
	.w70p{
		width:70%;
	}
	.w60p{
		width:60%;
	}
	.w50p{
		width:50%;
	}
	.w40p{
		width:40%;
	}
	.w30p{
		width:30%;
	}
	.w20p{
		width:20%;
	}
	.w10p{
		width:10%;
	}
</style>
<script>
	function editMenuColor(){
		$(".admin-menu-auction-exhibit").css("color","#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-auction-exhibit" align="center">
	<table>
		<thead>
			<tr>
				<th style="width:8%">번호
				<c:choose>
					<c:when test="${empty param.sortType or param.sortType eq 'dt'}">
						<a	href="${root}/admin/auction/exhibit?curPage=${param.curPage}&sortType=dtR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px;"></a>
					</c:when>
					<c:otherwise>
						<a href="${root}/admin/auction/exhibit?curPage=${param.curPage}&sortType=dt&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:10%">경매종류
				<c:choose>
					<c:when test="${param.sortType eq 'type'}">
						<a	href="${root}/admin/auction/exhibit?curPage=${param.curPage}&sortType=typeR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/auction/exhibit?curPage=${param.curPage}&sortType=type&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:37%">경매명
				<c:choose>
					<c:when test="${param.sortType eq 'nm'}">
						<a	href="${root}/admin/auction/exhibit?curPage=${param.curPage}&sortType=nmR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
					<a	href="${root}/admin/auction/exhibit?curPage=${param.curPage}&sortType=nm&searchType=${param.searchType}&searchKey=${param.searchKey}">
						<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:15%">경매시작시간</th>
				<th style="width:15%">경매종료시간</th>
				<th style="width:15%">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="auction" items="${list}">
				<tr>
					<td>${auction.auction_sq}</td>
					<td>
						<c:choose>
							<c:when test="${auction.auction_type eq 'online'}">
								온라인
							</c:when>
							<c:otherwise>
								오프라인
							</c:otherwise>
						</c:choose>
					</td>
					<td class="left">
						<img	src="${root}/image/auction/${auction.auction_image}" style="width: 50; height: 50;">
						<a	href="edit?auction_sq=${auction.auction_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<c:choose>
								<c:when test="${fn:length(auction.auction_nm) > 20}">
									${fn:substring(auction.auction_nm, 0, 20)}...
								</c:when>
								<c:otherwise>${auction.auction_nm}</c:otherwise>
							</c:choose></a>
					</td>
					<td>${auction.auction_start}</td>
					<td>${auction.auction_end}</td>
					<td>
						<a href="exdetail?auction_sq=${auction.auction_sq}">
							<input type="button" class="list-btn" value="작품목록"></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
		<c:if test="${page.curRange ne 1}">
			<a
				href="${root}/admin/auction/exhibit?curPage=1&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[처음]
			</a>
		</c:if>
		<c:if test="${page.curRange ne 1}">
			<a
				href="${root}/admin/auction/exhibit?curPage=${page.startPage-1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[이전]
			</a>
		</c:if>
		<c:forEach var="pageNum" begin="${page.startPage}"
			end="${page.endPage}">
			<c:choose>
				<c:when test="${pageNum eq page.curPage}">
					<span class="bold red">${pageNum} 
					</span>
				</c:when>
				<c:otherwise>
					<a
						href="${root}/admin/auction/exhibit?curPage=${pageNum}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">${pageNum}
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if
			test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
			<a
				href="${root}/admin/auction/exhibit?curPage=${page.endPage+1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[다음]
			</a>
		</c:if>
		<c:if
			test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
			<a
				href="${root}/admin/auction/exhibit?curPage=${page.pageCnt}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[끝]</a>
		</c:if>
	</div>
	<div class="search-bar" style="min-height: 30px; padding: 10px 0;">
		<form action="exhibit" method="post">
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
			</select>
			<input class="left" name="searchKey" type="text" placeholder="검색어를 입력" value="${param.searchKey}">
			<input type="submit" value="검색">
			<a href="exhibit">
				<input type="button" value="목록"></a>
		</form>
	</div>
</div>



<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>