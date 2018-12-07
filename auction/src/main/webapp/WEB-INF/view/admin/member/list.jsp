<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>
<jsp:include page="/WEB-INF/view/admin/member/menu.jsp"/>

<style>
	/* 레이아웃 */
	/* .admin-member-list {
		margin: auto;
		width: 1000px;
	} */
	.admin-member-list{
		margin: 100px 0;
	}
	.admin-member-list *{
		vertical-align: middle;
		text-align: center;
	}
	.admin-member-list a{
		color:black;
	}
	
	/* 테이블 */
	.admin-member-list table {
		width: 70%;
		margin: auto;
		border: 1px solid silver;
		/* table-layout:fixed; */
		border-spacing: 0;	
	}
	.admin-member-list th{
		padding : 10px;
		border: 0.5px solid silver;
		text-align: center;
		line-height:30px;
		background-color: rgb(230, 230, 235);
	}
	.admin-member-list td{
		padding : 10px;
		border: 0.5px solid silver;
		line-height:30px;
	}
	.admin-member-list .edit-btn,
	.admin-member-list .delete-btn {
		text-align: center;
        font-size: 15px;
        vertical-align: middle;
        
		padding-left: 15px;
        padding-right: 15px;
        padding-top: 5px;
        padding-bottom: 5px;
        background-color: dimgrey;
        border: 1px solid dimgrey;
        color: white;
        cursor: pointer;
	}
	
	/* 네비게이터 */
	.admin-member-list .paging {
		text-align: center;
		margin-top: 25px;
		margin-bottom: 25px;
        font-size: 20px;
    }
	.admin-member-list .paging a {
		text-decoration: none;
		font-size: 20px;
		color: black;
	}
	.admin-member-list .paging a:hover {
		color: orange;
	}
	
	/* 검색창 */
	.admin-member-list .search-wrap {
		text-align: center;
		vertical-align: middle;
	}
	.admin-member-list .search {
		text-align: center;
		border-bottom: 2px solid gray;
        margin-top: 25px;
        margin-bottom: 25px;
        min-height: 100px;
        vertical-align: middle;
	}
	.search-type {
		width: 75px;
		height: 30px;
		text-align: center;
        font-size: 15px;
	}
	.search-key {
		width: 200px;
		height: 30px;
		text-align: left;
        font-size: 15px;
	}
	.search-btn {
		text-align: center;
        font-size: 15px;
                
		padding-left: 15px;
        padding-right: 15px;
        padding-top: 5px;
        padding-bottom: 5px;
        background-color: dimgrey;
        border: 1px solid dimgrey;
        color: white;
        cursor: pointer;
	}
	
</style>
<div class="admin-member-list">
	<div class="table">
		<table>
			<tr>	
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대전화번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>관리<th>
			</tr>
			<c:forEach var="member" items="${list}" varStatus="status">
				<tr>
					<td>${member.rn}</td>
					<td>${member.user_id}</td>
					<td>${member.user_nm}</td>
					<td>${member.user_phone}</td>
					<td>${member.user_email}</td>
					<td>[${member.user_post}] ${member.user_addr1} ${member.user_addr2}</td>
					<td>
						<a href="">
							<input type="button" class="edit-btn" value="수정">
						</a>
						<a href="delete?user_sq=${member.user_sq}">
							<input type="button" class="delete-btn" value="탈퇴">
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 네비게이터 -->
	<div class="paging">
		<c:if test="${util.hasMorePrevPage()}">
			<a href="${root}/admin/member/list?page=${util.getSb()-1}${util.param}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${util.sb}" end="${util.fb}" step="1">
			<c:choose>
				<c:when test="${util.isCurrentPage(i) }">
					${i}
				</c:when>
				<c:otherwise>
					<a href="${root}/admin/member/list?page=${i}${util.param}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${util.hasMoreNextPage()}">
			<a href="${root}/admin/member/list?page=${util.getFb()+1}${util.param}">[다음]</a>
		</c:if>
	</div>
	<!-- 검색창 -->
	<div class="search-wrap">
		<form action="list" method="get" class="search">
			<select name="searchType" class="search-type">
				<c:choose>
					<c:when test="${util.param eq 'user_nm'}">
						<option value="user_id">아이디</option>
						<option value="user_nm" selected>이름</option>
						<option value="user_email">이메일</option>
					</c:when>
					<c:when test="${util.param eq 'user_email'}">
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
			</select>
			<input class="search-key" name="searchKey" type="text" placeholder="검색어를 입력하세요." value="">
			<input class="search-btn" type="submit" value="검색">
			<a href="#">
				<input class="search-btn" type="button" value="목록">
			</a>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>