<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>

<style>
	/* 레이아웃 */
	.auction-online-upcoming {
		margin: auto;
        width: 1000px;
	}
	.auction-online-upcoming .title {
		margin-top: 20px;
		margin-bottom: 20px;
		padding: 10px;
		text-align: center;
	}
</style>

<div class="auction-online-upcoming">
	<div class="title">
		<h1>예정경매</h1>
	</div>
	<!-- 경매 개요 -->
	<div class="row">
		<c:forEach var="auction" items="${upcomingList}">
			<div class="col-md-12">
				<h2>${auction.auction_nm}</h2>
			</div>					

					<div class="col-md-12">
						<h4>[AUCTION]</h4>
						<h4>${auction.auction_dt}</h4>
						<h4>${auction.auction_addr1}</h4>
					</div>
					<div class="col-md-12">
						<div>
							<h2>프리뷰 안내</h2>
						</div>
						<div class="col-md-6 text-center">
							<img src="http://www.dummyimage.com/500x500">
						</div>
						<div class="col-md-6 text-center">
							<h4>프리뷰 기간(관리자 입력)</h4>
							<h4>전시장소(관리자 입력)</h4>
							<h4>다음지도 API</h4>
						</div>
					</div>
				</c:forEach>
        </div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"/>