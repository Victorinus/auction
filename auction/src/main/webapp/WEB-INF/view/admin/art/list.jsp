<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
	th{
		text-align: center;
		padding: 3px 3px;
	}
</style>

<h1>작품목록</h1>

<div class="artList" align="center">

	<table border="1" width="1600px">
		<thead>
			<tr>
				<td colspan="9">
					<div class="topBar" style="text-align: right; min-height: 50px; padding: 10px 10px;"></div>
				</td>
			</tr>
			<tr>
				<th>번호
				<c:choose>
					<c:when test="${empty param.sortType or param.sortType eq 'dt'}">
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=dtR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px;"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=dt&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>작품명
				<c:choose>
					<c:when test="${param.sortType eq 'nm'}">
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=nmR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${pageContext.request.contextPath}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=nm&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>작품간략정보</th>
				<th>제작연도</th>
				<th>추정가
				<c:choose>
					<c:when test="${param.sortType eq 'ep'}">
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=epR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${pageContext.request.contextPath}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=ep&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>낙찰가
				<c:choose>
					<c:when test="${param.sortType eq 'bp'}">
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=bpR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${pageContext.request.contextPath}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=bp&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>작가명
				<c:choose>
					<c:when test="${param.sortType eq 'artist'}">
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=artistR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${pageContext.request.contextPath}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=artist&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>제작지
				<c:choose>
					<c:when test="${param.sortType eq 'origin'}">
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=originR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img src="${pageContext.request.contextPath}/image/icon/sortReverse.png" style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=origin&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
				<th>작품상태
				<c:choose>
					<c:when test="${param.sortType eq 'status'}">
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=statusR&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"style="width: 13px; height: 13px"></a>
					</c:when>
					<c:otherwise>
						<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${param.curPage}&sortType=status&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px"></a>
					</c:otherwise>
				</c:choose>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="art" items="${list}">
				<tr>
					<td>${art.art_sq}</td>
					<td><img src="${pageContext.request.contextPath}/image/art/${art.art_image}"	style="width: 50; height: 50;">
						<a	href="detail?art_sq=${art.art_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
							${art.art_nm}
						</a>
					</td>
					<td>${art.art_info}</td>
					<td>${art.art_cdt}</td>
					<td>${art.art_ep}</td>
					<td>${art.art_bp}</td>
					<td>${art.art_artist}</td>
					<td>${art.art_origin}</td>
					<td>${art.art_status}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="9" style="text-align: center;">
					<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
						<c:if test="${page.curRange ne 1}">
							<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=1&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[처음]</a>
						</c:if>
						<c:if test="${page.curRange ne 1}">
							<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${page.startPage-1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[이전]</a>
						</c:if>
						<c:forEach var="pageNum" begin="${page.startPage}" end="${page.endPage}">
							<c:choose>
								<c:when test="${pageNum eq page.curPage}">
									<span> <b>${pageNum} </b>
									</span>
								</c:when>
								<c:otherwise>
									<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${pageNum}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">${pageNum}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
							<a href="${pageContext.request.contextPath}/admin/art/list?curPage=${page.endPage+1}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[다음]</a>
						</c:if>
						<c:if	test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
							<a	href="${pageContext.request.contextPath}/admin/art/list?curPage=${page.pageCnt}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">[끝]</a>
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
							<input name="searchKey" type="text" placeholder="검색어를 입력" value="${param.searchKey}">
							<input type="submit"	value="검색">
							<a href="list">
								<input type="button" value="목록"></a>
						</form>
					</div>
				</th>
			</tr>
		</tfoot>
	</table>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>