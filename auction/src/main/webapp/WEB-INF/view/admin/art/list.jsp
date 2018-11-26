<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<h1>작품목록</h1>

<div class="artList" align="center">

	<table border="1" width="1400px">
		<thead>
			<tr>
				<td colspan="8">
					<div class="sortNav"
						style="text-align: right; min-height: 30px; padding: 10px 10px; color: gray;">
						<span style="margin-right: 5px"> <c:choose>
							<c:when test="${empty param.sortType or param.sortType eq 'dt'}">
								<a	href="${pageContext.request.contextPath}/art/list?curPage=${param.curPage}&sortType=dtReverse&searchType=${param.searchType}&searchKey=${param.searchKey}">
									등록순
									<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px;">
								</a>
							</c:when>
							<c:otherwise>
								<a	href="${pageContext.request.contextPath}/art/list?curPage=${param.curPage}&sortType=dt&searchType=${param.searchType}&searchKey=${param.searchKey}">
									등록순
									<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px">
								</a>
							</c:otherwise>
						</c:choose>
						</span> <span style="margin-right: 5px">
						<c:choose>
							<c:when test="${param.sortType eq 'nm'}">
								<a	href="${pageContext.request.contextPath}/art/list?curPage=${param.curPage}&sortType=nmReverse&searchType=${param.searchType}&searchKey=${param.searchKey}">
									작품명 <img src="${pageContext.request.contextPath}/image/icon/sortReverse.png" style="width: 13px; height: 13px">
								</a>
							</c:when>
							<c:otherwise>
								<a	href="${pageContext.request.contextPath}/art/list?curPage=${param.curPage}&sortType=nm&searchType=${param.searchType}&searchKey=${param.searchKey}">
									작품명
									<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px">
								</a>
							</c:otherwise>
						</c:choose>
						<span style="margin-right: 5px"></span>
						<c:choose>
								<c:when test="${param.sortType eq 'type'}">
									<a	href="${pageContext.request.contextPath}/art/list?curPage=${param.curPage}&sortType=statusReverse&searchType=${param.searchType}&searchKey=${param.searchKey}">
										작품상태
										<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"style="width: 13px; height: 13px">
									</a>
								</c:when>
								<c:otherwise>
									<a	href="${pageContext.request.contextPath}/art/list?curPage=${param.curPage}&sortType=status&searchType=${param.searchType}&searchKey=${param.searchKey}">
										작품상태
										<img	src="${pageContext.request.contextPath}/image/icon/sortReverse.png"	style="width: 13px; height: 13px">
									</a>
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>작품명</th>
				<th>작품간략정보</th>
				<th>제작연도</th>
				<th>낙찰가</th>
				<th>작가명</th>
				<th>제작지</th>
				<th>등록상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="art" items="${list}">
				<tr>
					<td>${art.art_sq}</td>
					<td><img src="${pageContext.request.contextPath}/image/art/${art.art_image}"	style="width: 50; height: 50;">
						<a	href="edit?art_sq=${art.art_sq}&curPage=${param.curPage}&sortType=${sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
							${art.art_nm}
						</a>
					</td>
					<td>${art.art_info}</td>
					<td>${art.art_cdt}</td>
					<td>${art.art_bp}</td>
					<td>${art.art_artist}</td>
					<td>${art.art_origin}</td>
					<td>${art.art_status}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="8" style="text-align: center;">
					<div class="nav-bar" style="min-height: 30px; padding: 10px 0;">
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
					<div class="search-bar" style="min-height: 30px; padding: 10px 0;">
						<form action="list" method="post">
							<select name="searchType">
								<c:choose>
									<c:when test="${param.searchType eq 'art_sq'}">
										<option value="art_nm">작품명</option>
										<option value="art_sq" selected>작품번호</option>
										<option value="art_info">작품요약정보</option>
									</c:when>
									<c:when test="${param.searchType eq 'art_info'}">
										<option value="art_nm">작품명</option>
										<option value="art_sq">작품번호</option>
										<option value="art_info" selected>작품요약정보</option>
									</c:when>
									<c:otherwise>
										<option value="art_nm" selected>작품명</option>
										<option value="art_sq">작품번호</option>
										<option value="art_info">작품요약정보</option>
									</c:otherwise>
								</c:choose>
							</select>
							<input name="searchKey" type="text" placeholder="검색어를 입력" value="${param.searchKey}">
							<input type="submit"	value="검색">
							<a href="list">
								<input type="button" value="목록">
							</a>
						</form>
					</div>
				</th>
			</tr>
		</tfoot>
	</table>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>