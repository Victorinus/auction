<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/admin/member/menu.jsp" />

<style>
.admin-member-list {
	margin: 100px 0;
}

.admin-member-list * {
	vertical-align: middle;
	text-align: center;
}

.admin-member-list .totalCnt {
	width: 80%;
	text-align: right;
}

.admin-member-list #count {
	font-size: 15px;
	font-weight: 500;
	color: blue;
}

.admin-member-list a {
	color: black;
}

.admin-member-list table {
	width: 80%;
	margin: auto;
	border: 1px solid silver;
	table-layout: fixed;
	border-spacing: 0;
}

.admin-member-list th {
	padding: 10px;
	border: 0.5px solid silver;
	text-align: center;
	line-height: 30px;
	background-color: rgb(230, 230, 235);
}

.admin-member-list td {
	padding: 10px;
	border: 0.5px solid silver;
	/* line-height: 30px; */
	height: 30px;
}

.admin-member-list input, select {
	vertical-align: top;
	font-size: 15px;
	height: 35px;
	line-height: 35px;
}

.admin-member-list input[type=button], .admin-member-list input[type=submit]
	{
	margin: 0;
	padding: 0;
	color: white;
	border: none;
	width: 60px;
	background-color: #c33234;
	cursor: pointer;
}

.admin-member-list .nav-bar {
	line-height: 50px;
	font-size: 16px;
}

.admin-member-list .nav-bar a {
	text-decoration: none;
	font-size: 16px;
	/* 	color: black; */
}

.admin-member-list .nav-bar a:hover {
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
		$(".admin-menu-member-list").css("color", "#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-member-list" align="center">
	<div class="totalCnt">
		총 <span id="count">
			${util.count}
		</span> 명의 회원이 가입했습니다.
	</div>
	<table>
		<tr>
			<th style="width:7%">번호</th>
			<th style="width:10%">아이디</th>
			<th style="width:10%">이름</th>
			<th style="width:11%">휴대전화번호</th>
			<th style="width:15%">이메일</th>
			<th style="width:40%">주소</th>
			<th style="width:7%">관리</th>
		</tr>
		<c:forEach var="member" items="${list}" varStatus="status">
			<tr>
				<td>${member.rn}</td>
				<td>${member.user_id}</td>
				<td>${member.user_nm}</td>
				<td>${member.user_phone}</td>
				<td>${member.user_email}</td>
				<td class="left">[${member.user_post}] ${member.user_addr1}
					${member.user_addr2}</td>
				<td><a href="edit?user_sq=${member.user_sq}"> <input type="button" value="수정">
				</a></td>
			</tr>
		</c:forEach>
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
		<form action="list" method="get">
			<select name="searchType">
				<c:choose>
					<c:when test="${util.searchType eq 'user_nm'}">
						<option value="user_id">아이디</option>
						<option value="user_nm" selected>이름</option>
						<option value="user_email">이메일</option>
					</c:when>
					<c:when test="${util.searchType eq 'user_email'}">
						<option value="user_id">아이디</option>
						<option value="user_nm">이름</option>
						<option value="user_email" selected>이메일</option>
					</c:when>
					<c:otherwise>
						<option value="user_id" selected>아이디</option>
						<option value="user_nm">이름</option>
						<option value="user_email">이메일</option>
					</c:otherwise>
				</c:choose>
			</select> <input class="left" name="searchKey" type="text"
				placeholder="검색어를 입력하세요." value="${util.searchKey}"> <input type="submit"
				value="검색"> <a href="list"> <input type="button"
				value="목록">
			</a>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>