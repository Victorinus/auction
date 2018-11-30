<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
	.empty{
		height: 50px;
	}
	table{
		margin-left : auto;
		margin-right : auto;		
		width:80%;
		border-top: solid 2px;
		border-bottom: solid 2px;
	}
	
	th{
		text-align: center;
		background-color: silver;
		padding: 5px;
		border-bottom: solid 1px;
	}
	td{
		text-align: center;
		padding: 3px;
		border-bottom: solid 1px;
	}
	
	.subBtn{
		border: none;
		background-color: black;
		color: white;
	}
	.addrRow{
		text-align: left;
	}
	.paging{
		margin-top :10px;
		text-align: center;
		font-size: 1.5em;
	}
</style>

<h1>회원목록</h1>
<div>
  	<a href="#">전체목록</a>
  	총 회원수 00명<br>
  	<form action="#">
  	<select>
  		<option>아이디</option>
  		<option>이름</option>
  		<option>핸드폰번호</option>
  		<option>이메일</option>
  		<option>주소</option>
  	</select>
  	<input type="text" style="margin-right: 10px">
  	<input type="submit" class="subBtn" value="검색">
  	</form>
</div>
<div class="empty"></div>
<div class="user-list">
<table>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>핸드폰번호</th>
		<th>이메일</th>
		<th>주소</th>
		<th>관리<th>
	</tr>
	<c:forEach var="member" items="${list}">
	<tr>
		<td>${member.user_id}</td>
		<td>${member.user_nm}</td>
		<td>${member.user_phone}</td>
		<td>${member.user_email}</td>
		<td class="addrRow">${member.user_post} ${member.user_addr1} ${member.user_addr2}</td>
		<td>
			<a href="#">
			<input type="button" class="subBtn" value="수정">
			</a>
		</td>
	</tr>
	</c:forEach>
</table>
<div class="paging">
	<c:if test="${page.curRange ne 1}">
		<a	href="${pageContext.request.contextPath}/art/list?curPage=1&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[처음]</a>
	</c:if>
	<c:if test="${page.curRange ne 1}">
		<a	href="${pageContext.request.contextPath}/art/list?curPage=${page.startPage-1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[이전]</a>
	</c:if>
	<c:forEach var="pageNum" begin="${page.startPage}" end="${page.endPage}">
		<c:choose>
			<c:when test="${pageNum eq page.curPage}">
				<span> <b>${pageNum} </b>
				</span>
			</c:when>
			<c:otherwise>
				<a	href="${pageContext.request.contextPath}/art/list?curPage=${pageNum}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">${pageNum}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
		<a href="${pageContext.request.contextPath}/art/list?curPage=${page.endPage+1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[다음]</a>
	</c:if>
	<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
		<a	href="${pageContext.request.contextPath}/art/list?curPage=${page.pageCnt}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[끝]</a>
	</c:if>
</div>

</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>