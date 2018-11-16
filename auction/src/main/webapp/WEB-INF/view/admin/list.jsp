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
					<td>${auction.auction_no}</td>
					<td>
						<a href="edit?auction_no=${auction.auction_no}">
							${auction.name}
						</a>
					</td>
					<td>${auction.summary}</td>
					<td>${auction.reg}</td>
					<td>
						[${auction.post}] ${auction.addr} ${auction.addr2}
					</td>
					<td>${auction.stime}</td>
					<td>${auction.etime}</td>
					<td>
						<c:choose>
							<c:when test="${auction.type == 'online'}">
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