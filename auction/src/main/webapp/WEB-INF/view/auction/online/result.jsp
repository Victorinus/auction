<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<jsp:include page="/WEB-INF/view/template/header.jsp"/>

<style>
	/* 레이아웃 */
	.auction-online-result {
		margin: auto;
		width: 1000px;
	}
	.auction-online-result .title {
		margin-top: 20px;
		margin-bottom: 20px;
		padding: 10px;
		text-align: center;
	}
	
	/* 종료된 경매 목록 */
	.auction-online-result .gallery {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
		margin-top: 10px;
		margin-bottom: 10px;
		padding: 10px;
	}
	.auction-online-result .gallery-each {
		text-align: center;
		width: 47.5%;
        padding: 10px;
	}
	.auction-online-result .gallery-each .button {
		background-color: #F2F2F2;
		height: 40px;
		padding: 0px;
		padding-bottom: 10px;
		padding-right: 10px;
		text-align: right;
	}
	.auction-online-result .gallery-each .auction {
		background-color: #F2F2F2;
		padding: 0px;
		padding-top: 10px;
		padding-left: 10px;
		height: 100px;
		text-align: left;
	}
	.auction-online-result .gallery-each .auction p,
	.auction-online-result .gallery-each .auction h2 {
		margin-top: 1px; 
		margin-bottom: 1px;
	}
	.auction-online-result .result-btn {
		width: 120px;
		height: 40px;
		background-color: #FAFAFA;
		border: 1px solid #FAFAFA;
		color: black;
		cursor: pointer;
	}
	
	/* 네비게이터 */
    .auction-online-result .paging {
        text-align: center;
        font-size: 20px;
    }
	.auction-online-result .paging a {
		text-decoration: none;
		font-size: 20px;
		color: black;
	}
	.auction-online-result .paging a:hover {
		color: orange;
	}
</style>
 
<div class="auction-online-result">
	<div class="title">
		<h1>경매결과</h1>
	</div>
	<!-- 종료된 경매 목록 -->
	<div class="gallery">
		<c:forEach var="auction" items="${resultList}">
			<div class="gallery-each">
				<div class="image">
					<img src="${root}/image/auction?auction_image=${auction.auction_image}" width="465.5" height="450">
				</div>
				<div class="auction">
					<h2>${auction.auction_nm}</h2>
					<p>
						<fmt:parseDate var="parsed" value="${auction.auction_dt}" pattern="yyyy-MM-dd HH:mm"/>
						<%-- <fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시"/> --%>
						<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일 (E) KK:mm z"/>
					</p>
					<p>${auction.auction_addr1}</p>
				</div>
				<div class="button">
					<button class="result-btn" onclick="location.href='detail?no=${auction.auction_sq}';">상세결과보기</button>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 네비게이터 -->
    <div class="paging">
		<c:if test="${util.hasMorePrevPage()}">
			<a href="${root}/online/result?page=${util.getSb()-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${util.sb}" end="${util.fb}" step="1">
			<c:choose>
				<c:when test="${util.isCurrentPage(i) }">
					${i}
				</c:when>
				<c:otherwise>
					<a href="${root}/online/result?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${util.hasMoreNextPage()}">
			<a href="${root}/online/result?page=${util.getFb()+1}">[다음]</a>
		</c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"/>