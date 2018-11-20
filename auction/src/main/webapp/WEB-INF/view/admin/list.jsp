<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<h1>경매 목록</h1>

<div class="auctionList" align="center">
	<table border="1" width="1400px">
		<thead>
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
						<img src="${pageContext.request.contextPath}/image/auction/${auction.auction_image}" style="width:100;height:100;">
						<a href="edit?auction_sq=${auction.auction_sq}">
							${auction.auction_nm}
						</a>
					</td>
					<td>${auction.auction_info}</td>
					<td>${auction.auction_dt}</td>
					<td>
						[${auction.auction_post}] ${auction.auction_addr1} ${auction.auction_addr2}
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
				<th>
					
				</th>
			</tr>
		</tfoot>
	</table>
</div>



<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>