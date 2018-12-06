<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>

<style>
	.auction-online-result .gallery{
		/* border: 1px solid lightgray; */
		backgroundcolor: lightgray;
	}
	.auction-online-result .nav, .nav > a{
		text-decoration: none;    		
		font-size: 25px;
		color: black;
	}
</style>
 
<div class="auction-online-result">

    <div class="container-fluid">
        <!-- 종료된 경매 목록 -->
        <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
            	<c:forEach var="auction" items="${resultList}">
                <div class="col-md-6 gallery">
					<div>
						<img src="${root}/image/auction?auction_image=${auction.auction_image}" width="400" height="400">
					</div>
					<div class="col-md-9">
                        <h2>${auction.auction_nm}</h2>
                        <p>${auction.auction_dt}</p>
                        <p>${auction.auction_addr1}</p>
					</div>
					<div class="col-md-3">
						<button onclick="location.href='detail?no=${auction.auction_sq}';">상세결과보기</button>
					</div>
                </div>
                </c:forEach>
            </div>
        </div>
        <!-- 네비게이터 -->
        <div class="row">
        	<div class="col-md-8 col-md-offset-2 text-center">
        		<div class="nav">
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
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"/>