<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/admin/member/menu.jsp" />

<style>
.admin-member-myfav {
	margin: 100px 0;
}

.admin-member-myfav * {
	vertical-align: middle;
	text-align: center;
}

.admin-member-myfav .totalCnt {
	width: 80%;
	text-align: right;
}

.admin-member-myfav #count {
	font-size: 15px;
	font-weight: bold;
	color: blue;
}

.admin-member-myfav a {
	color: black;
}

.admin-member-myfav table {
	width: 80%;
	margin: auto;
	border: 1px solid silver;
	table-layout: fixed;
	border-spacing: 0;
}

.admin-member-myfav th {
	padding: 10px;
	border: 0.5px solid silver;
	text-align: center;
	line-height: 30px;
	background-color: rgb(230, 230, 235);
}

.admin-member-myfav td {
	padding: 10px;
	border: 0.5px solid silver;
	/* line-height: 30px; */
	height: 30px;
}

.admin-member-myfav input, select {
	vertical-align: top;
	font-size: 15px;
	height: 35px;
	line-height: 35px;
}

.admin-member-myfav input[type=button], .admin-member-myfav input[type=submit]
	{
	margin: 0 5px;
	padding: 0;
	color: white;
	border: none;
	width: 70px;
	height:35px;
	background-color: #c33234;
	cursor: pointer;
}

.admin-member-myfav .nav-bar {
	line-height: 50px;
	font-size: 16px;
}

.admin-member-myfav .nav-bar a {
	text-decoration: none;
	font-size: 16px;
	/* 	color: black; */
}

.admin-member-myfav .nav-bar a:hover {
	color: orange;
}

.center {
	text-align: center;
}

.left {
	text-align: left;
}

.right {
	text-align: right;
}

.bold {
	font-weight: bold;
}

.topBar {
	min-height: 50px;
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

<script>
	function editMenuColor() {
		$(".admin-menu-member-myfav").css("color", "#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-member-myfav" align="center">
	<div class="totalCnt">
		총 <span id="count">
			${util.count}
		</span> 건의 작품이 관심작품으로 등록되었습니다.
	</div>
	<table>
		<tbody>
			<tr>
				<th style="width:7%">번호</th>
				<th style="width:13%">아이디</th>
				<th style="width:18%">경매명</th>
				<th style="width:18%">작품명</th>
				<th style="width:18%">작가명</th>
				<th style="width:13%">등록일자</th>
				<th style="width:13%">관리</th>
			</tr>
			<c:forEach var="view" items="${list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${view.fav_user_id}</td>
					<td>${view.fav_auction_nm}</td>
					<td>${view.fav_art_nm}</td>
					<td>${view.fav_art_artist}</td>
					<td>
						<fmt:parseDate var="parsed" value="${view.fav_dt}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
						<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시 mm분"/>
					</td>
					<td>
						<a href=""> 
							<input type="button" value="바로가기"></a>
						<a href=""> 
							<input type="button" value="삭제"></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 네비게이터 -->
	<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
		<c:if test="${util.hasMorePrevPage()}">
			<a
				href="${root}/admin/member/list?page=${util.getSb()-1}${util.param}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${util.sb}" end="${util.fb}" step="1">
			<c:choose>
				<c:when test="${util.isCurrentPage(i) }">
					<span class="bold">${i}</span>
				</c:when>
				<c:otherwise>
					<a href="${root}/admin/member/list?page=${i}${util.param}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${util.hasMoreNextPage()}">
			<a
				href="${root}/admin/member/list?page=${util.getFb()+1}${util.param}">[다음]</a>
		</c:if>
	</div>
	<!-- 검색창 -->
	<div class="search-bar" style="min-height: 30px; padding: 10px 0;">
		<form action="myfav" method="get">
			<select name="searchType">
				<c:choose>
					<c:when test="${util.searchType eq 'user_nm'}">
						<option value="fav_user_id">아이디</option>
						<option value="fav_art_nm" selected>작품명</option>
						<option value="fav_art_artist">작가명</option>
					</c:when>
					<c:when test="${util.searchType eq 'user_email'}">
						<option value="fav_user_id">아이디</option>
						<option value="fav_art_nm">작품명</option>
						<option value="fav_art_artist" selected>작가명</option>
					</c:when>
					<c:otherwise>
						<option value="fav_user_id" selected>아이디</option>
						<option value="fav_art_nm">작품명</option>
						<option value="fav_art_artist">작가명</option>
					</c:otherwise>
				</c:choose>
			</select> <input class="left" name="searchKey" type="text"
				placeholder="검색어를 입력하세요." value="${util.searchKey}"> <input
				type="submit" value="검색"> <a href="myfav"> <input
				type="button" value="목록">
			</a>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/view/template/footer.jsp" />