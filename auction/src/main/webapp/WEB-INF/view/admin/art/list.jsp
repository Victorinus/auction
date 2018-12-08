<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>
<jsp:include page="/WEB-INF/view/admin/art/menu.jsp"/>

<style>
	.admin-art-list{
		margin: 100px 0;
	}
	.admin-art-list *{
		vertical-align: middle;
		text-align: center;
	}
	.admin-art-list a{
		color:black;
	}
	.admin-art-list table{
		width: 70%;
		margin: auto;
		border: 1px solid silver;
		table-layout:fixed;
		border-spacing: 0;	
	}
	.admin-art-list th{
		padding : 10px;
		border: 0.5px solid silver;
		text-align: center;
		line-height:30px;
		background-color: rgb(230, 230, 235);
	}
	.admin-art-list td{
		padding : 10px;
		border: 0.5px solid silver;
		line-height:30px;
	}
	.admin-art-list input, .admin-art-list select{
		vertical-align:top;
		font-size: 15px;
		height:35px;
		line-height: 35px;
	}
	.admin-art-list input[type=button], .admin-art-list input[type=submit]{
		margin:0;
		padding:0;
		color: white;
		border: none;
		width:60px;
		background-color: #c33234;
	}
	.admin-art-list .nav-bar{
		line-height: 50px;
		font-size:16px;
	}
	.admin-art-list .search-bar{
		line-height: 35px;
	}
	.admin-art-list form{
		line-height: 35px;
	}
	.admin-art-list .topBar{
		min-height: 50px;
	}
	.admin-art-list .nav-bar a{
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
		$(".admin-menu-art-list").css("color","#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-art-list" align="center">
	<table>
		<thead>
			<tr>
				<th style="width:6%">번호
				<c:choose>
					<c:when test="${empty param.sortType or param.sortType eq 'dt'}">
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=dtR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px;"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=dt&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:28%">작품명
				<c:choose>
					<c:when test="${param.sortType eq 'nm'}">
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=nmR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=nm&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:10%">작품간략정보</th>
				<th style="width:8%">제작연도</th>
				<th style="width:10%">추정가
				<c:choose>
					<c:when test="${param.sortType eq 'ep'}">
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=epR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=ep&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:10%">낙찰가
				<c:choose>
					<c:when test="${param.sortType eq 'bp'}">
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=bpR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=bp&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:10%">작가명
				<c:choose>
					<c:when test="${param.sortType eq 'artist'}">
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=artistR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=artist&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:9%">제작지
				<c:choose>
					<c:when test="${param.sortType eq 'origin'}">
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=originR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${root}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=origin&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th style="width:9%">작품상태
				<c:choose>
					<c:when test="${param.sortType eq 'status'}">
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=statusR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${param.curPage}&sortType=status&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${root}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="art" items="${list}">
				<tr>
					<td>${art.art_sq}</td>
					<td class="left">
						<img src="${root}/image/art/${art.art_image}" style="width: 50; height: 50;margin-right: 10px;">
						
						<a	href="detail?art_sq=${art.art_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<c:choose>
								<c:when test="${fn:length(art.art_nm) > 30}">
									${fn:substring(art.art_nm, 0, 30)}...
								</c:when>
								<c:otherwise>${art.art_nm}</c:otherwise>
							</c:choose>
						</a>
					</td>
					<td>
						<c:choose>
							<c:when test="${fn:length(art.art_info) > 20}">
								${fn:substring(art.art_info, 0, 20)}...
							</c:when>
							<c:otherwise>${art.art_info}</c:otherwise>
						</c:choose>
					</td>
					<td>${art.art_cdt}</td>
					<td><fmt:formatNumber value="${art.art_ep}" pattern="#,###" /></td>
					<td><fmt:formatNumber value="${art.art_bp}" pattern="#,###" /></td>
					<td>
					<c:choose>
						<c:when test="${fn:length(art.art_artist) > 10}">
							${fn:substring(art.art_artist, 0, 10)}...
						</c:when>
						<c:otherwise>${art.art_artist}</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${fn:length(art.art_origin) > 10}">
							${fn:substring(art.art_origin, 0, 10)}...
						</c:when>
						<c:otherwise>${art.art_origin}</c:otherwise>
					</c:choose>
					
					</td>
					<td>${art.art_status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="foot-bar">
		<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
			<c:if test="${page.curRange ne 1}">
				<a	href="${root}/admin/art/list?curPage=1&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[처음]</a>
			</c:if>
			<c:if test="${page.curRange ne 1}">
				<a	href="${root}/admin/art/list?curPage=${page.startPage-1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[이전]</a>
			</c:if>
			<c:forEach var="pageNum" begin="${page.startPage}" end="${page.endPage}">
				<c:choose>
					<c:when test="${pageNum eq page.curPage}">
						<span class="bold red">${pageNum} 
						</span>
					</c:when>
					<c:otherwise>
						<a	href="${root}/admin/art/list?curPage=${pageNum}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">${pageNum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
				<a href="${root}/admin/art/list?curPage=${page.endPage+1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[다음]</a>
			</c:if>
			<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
				<a	href="${root}/admin/art/list?curPage=${page.pageCnt}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[끝]</a>
			</c:if>
		</div>
		<div class="search-bar" style="min-height: 30px; padding: 10px 0;">
			<form action="list" method="post">
				<select name="searchType">
					<option value="art_nm" <c:if test="${param.searchType eq 'art_nm'}">selected</c:if>>작품명</option>
					<option value="art_sq" <c:if test="${param.searchType eq 'art_sq'}">selected</c:if>>작품번호</option>
					<option value="art_info" <c:if test="${param.searchType eq 'art_info'}">selected</c:if>>작품간략정보</option>
					<option value="art_info2" <c:if test="${param.searchType eq 'art_info2'}">selected</c:if>>작품정보</option>
					<option value="art_cdt" <c:if test="${param.searchType eq 'art_cdt'}">selected</c:if>>제작연도</option>
					<option value="art_ep" <c:if test="${param.searchType eq 'art_ep'}">selected</c:if>>추정가</option>
					<option value="art_bp" <c:if test="${param.searchType eq 'art_bp'}">selected</c:if>>낙찰가</option>
					<option value="art_artist" <c:if test="${param.searchType eq 'art_artist'}">selected</c:if>>작가명</option>
					<option value="art_origin" <c:if test="${param.searchType eq 'art_origin'}">selected</c:if>>제작지</option>
					<option value="art_medium" <c:if test="${param.searchType eq 'art_medium'}">selected</c:if>>재질</option>
					<option value="art_sign" <c:if test="${param.searchType eq 'art_sign'}">selected</c:if>>서명</option>
					<option value="art_eval" <c:if test="${param.searchType eq 'art_eval'}">selected</c:if>>감정내용</option>
					<option value="art_status" <c:if test="${param.searchType eq 'status'}">selected</c:if>>작품상태</option>
				</select>
				<input class="left" name="searchKey" type="text" placeholder="검색어를 입력" value="${param.searchKey}">
				<input type="submit"	value="검색">
				<a href="list">
					<input type="button" value="목록"></a>
			</form>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>