<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<h1>경매 목록</h1>

<div class="auctionList" align="center">

	<table border="1" width="1400px">
		<thead>
			<tr>
				<td colspan="8">
					<div class="sortNav" style="text-align: right;min-height: 30px;padding: 10px 20px;color: gray;">
						<span style="margin-right: 5px">
							<a href="${pageContext.request.contextPath}/list?curPage=${param.curPage}&sortType=dt">등록순</a> 
						</span>
						<span style="margin-right: 5px">
							<a href="${pageContext.request.contextPath}/list?curPage=${param.curPage}&sortType=nm">경매명</a> 
						</span>
						<span style="margin-right: 5px">
							<a href="${pageContext.request.contextPath}/list?curPage=${param.curPage}&sortType=type">경매종류</a> 
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>경매명</th>
				<th>요약정보</th>
				<th>등록일</th>
				<th>주소</th>
				<th>경매시작시간</th>
				<th>경매종료시간</th>
				<th>경매종류</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="auction" items="${list}">
				<tr>
					<td>${auction.auction_sq}</td>
					<td>
						<img src="${pageContext.request.contextPath}/image/auction/${auction.auction_image}" style="width:50;height:50;">
						<a href="edit?auction_sq=${auction.auction_sq}">
							${auction.auction_nm}
						</a>
					</td>
					<td>${auction.auction_info}</td>
					<td>${auction.auction_dt}</td>
					<td>
						<c:if test="${not empty auction.auction_post}">
							[${auction.auction_post}] 
						</c:if>
						${auction.auction_addr1} ${auction.auction_addr2}
					</td>
					<td>${auction.auction_start}</td>
					<td>${auction.auction_end}</td>
					<td>
						<c:choose>
							<c:when test="${auction.auction_type eq 'online'}">
								온라인
							</c:when>
							<c:otherwise>
								오프라인
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>	
		<tfoot>
			<tr>
				<th colspan="8" style="text-align: center;">
					<div class="nav-bar" style="min-height: 30px;padding:10px 0;">
						<c:if test="${page.curRange ne 1}">
							<a href="${pageContext.request.contextPath}/list?curPage=1">[처음] </a>
						</c:if>
						<c:if test="${page.curPage ne 1}">
							<a href="${pageContext.request.contextPath}/list?curPage=${page.prevPage}">[이전] </a>
						</c:if>
						<c:forEach var="pageNum" begin="${page.startPage}" end="${page.endPage}">
							<c:choose>
								<c:when test="${pageNum eq page.curPage}">
									<span>
										<b>${pageNum} </b>
									</span>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/list?curPage=${pageNum}">${pageNum} </a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${page.curPage ne page.pageCnt && page.pageCnt > 0}">
							<a href="${pageContext.request.contextPath}/list?curPage=${page.nextPage}">[다음] </a>
						</c:if>
						<c:if test="${page.curRange ne page.rangeCnt && page.rangeCnt > 0}">
							<a href="${pageContext.request.contextPath}/list?curPage=${page.endPage}">[끝]</a>
						</c:if>
					</div>
				</th>
			</tr>
		</tfoot>
	</table>
</div>



<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>