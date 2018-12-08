<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>
<jsp:include page="/WEB-INF/view/admin/art/menu.jsp"/>

<style>
	.admin-art-eval{
		margin: 100px 0;
	}
	.admin-art-eval *{
		vertical-align: middle;
		text-align: center;
	}
	.admin-art-eval a{
		color:black;
	}
	.admin-art-eval table{
		width: 70%;
		margin: auto;
		border: 1px solid silver;
		table-layout:fixed;
		border-spacing: 0;	
	}
	.admin-art-eval th{
		padding : 10px;
		border: 0.5px solid silver;
		text-align: center;
		line-height:30px;
		background-color: rgb(230, 230, 235);
	}
	.admin-art-eval td{
		padding : 10px;
		border: 0.5px solid silver;
		line-height:30px;
	}
	.admin-art-eval input, .admin-art-eval select{
		vertical-align:top;
		font-size: 15px;
		height:35px;
		line-height: 35px;
	}
	.admin-art-eval .edit-btn{
		width:100px;
		height:35px;
		line-height: 35px;
		font-size:16px;
		margin:0;
		padding:0;
		color: white;
		border: none;
		background-color: #c33234;
		cursor:pointer;
	}
	.admin-art-eval .nav-bar{
		line-height: 50px;
		font-size:16px;
	}
	.admin-art-eval .search-bar{
		line-height: 35px;
	}
	.admin-art-eval .search-bar input[type=button], .admin-art-eval .search-bar input[type=submit]{
		margin:0;
		padding:0;
		color: white;
		border: none;
		width:60px;
		background-color: #c33234;
		cursor:pointer;
	}
	.admin-art-eval form{
		line-height: 35px;
	}
	.admin-art-eval .topBar{
		min-height: 50px;
	}
	.admin-art-eval .nav-bar a{
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
		$(".admin-menu-art-eval").css("color","#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-art-eval" align="center">
		<table>
			<thead>
				<tr>
					<th style="width:8%">번호
						<c:choose>
							<c:when test="${empty param.sortType or param.sortType eq 'dt'}">
								<a	href="${root}/admin/art/eval?curPage=${param.curPage}&sortType=dtR&searchType=${param.searchType}&searchKey=${param.searchKey}">
									<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px;"></a>
							</c:when>
							<c:otherwise>
								<a	href="${root}/admin/art/eval?curPage=${param.curPage}&sortType=dt&searchType=${param.searchType}&searchKey=${param.searchKey}">
									<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
							</c:otherwise>
						</c:choose>
					</th>
					<th style="width:50%">작품명
					<c:choose>
						<c:when test="${param.sortType eq 'nm'}">
							<a	href="${root}/admin/art/eval?curPage=${param.curPage}&sortType=nmR&searchType=${param.searchType}&searchKey=${param.searchKey}">
								<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
						</c:when>
						<c:otherwise>
							<a	href="${root}/admin/art/eval?curPage=${param.curPage}&sortType=nm&searchType=${param.searchType}&searchKey=${param.searchKey}">
								<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
						</c:otherwise>
					</c:choose>
					</th>
					<th style="width:27%">작가명
					<c:choose>
						<c:when test="${param.sortType eq 'artist'}">
							<a	href="${root}/admin/art/eval?curPage=${param.curPage}&sortType=artistR&searchType=${param.searchType}&searchKey=${param.searchKey}">
								<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
						</c:when>
						<c:otherwise>
							<a	href="${root}/admin/art/eval?curPage=${param.curPage}&sortType=artist&searchType=${param.searchType}&searchKey=${param.searchKey}">
								<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
						</c:otherwise>
					</c:choose>
					</th>
					<th style="width:15%">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eval" items="${list}">
					<tr>
						<td>${eval.art_sq}</td>
						<td class="left">
							<img src="${root}/image/art/${eval.art_image}" style="width: 50; height: 50;margin-right: 10px;">
							
							<a	href="detail?art_sq=${eval.art_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
								<c:choose>
									<c:when test="${fn:length(eval.art_nm) > 60}">
										${fn:substring(eval.art_nm, 0, 60)}...
									</c:when>
									<c:otherwise>${eval.art_nm}</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td>
						<c:choose>
							<c:when test="${fn:length(eval.art_artist) > 30}">
								${fn:substring(eval.art_artist, 0, 30)}...
							</c:when>
							<c:otherwise>${eval.art_artist}</c:otherwise>
						</c:choose>
						</td>
						<td>
							<a href="evalreg?art_sq=${eval.art_sq}">
								<input type="button" class="edit-btn" value="감정등록"></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<div class="foot-bar">
		<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
			<c:if test="${page.curRange ne 1}">
				<a	href="${root}/admin/art/eval?curPage=1&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[처음]</a>
			</c:if>
			<c:if test="${page.curRange ne 1}">
				<a	href="${root}/admin/art/eval?curPage=${page.startPage-1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[이전]</a>
			</c:if>
			<c:forEach var="pageNum" begin="${page.startPage}" end="${page.endPage}">
				<c:choose>
					<c:when test="${pageNum eq page.curPage}">
						<span class="bold red">${pageNum} 
						</span>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/eval?curPage=${pageNum}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
				<a href="${root}/admin/art/eval?curPage=${page.endPage+1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[다음]</a>
			</c:if>
			<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
				<a	href="${root}/admin/art/eval?curPage=${page.pageCnt}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[끝]</a>
			</c:if>
		</div>
		<div class="search-bar" style="min-height: 30px; padding: 10px 0;">
			<form action="eval" method="post">
				<select name="searchType">
					<option value="art_nm" <c:if test="${param.searchType eq 'art_nm'}">selected</c:if>>작품명</option>
					<option value="art_sq" <c:if test="${param.searchType eq 'art_sq'}">selected</c:if>>작품번호</option>
					<option value="art_artist" <c:if test="${param.searchType eq 'art_artist'}">selected</c:if>>작가명</option>
				</select>
				<input class="left" name="searchKey" type="text" placeholder="검색어를 입력" value="${param.searchKey}">
				<input type="submit"	value="검색">
				<a href="eval">
					<input type="button" value="목록"></a>
			</form>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>