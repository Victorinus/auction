<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>
<jsp:include page="/WEB-INF/view/admin/auction/menu.jsp"/>

<style>
	.admin-auction-exdetail{
		margin: 100px 0;
	}
	.admin-auction-exdetail *{
		vertical-align: middle;
		text-align: center;
	}
	.admin-auction-exdetail table{
		width: 60%;
		margin: auto;
		border-top: solid 2px;
		border-bottom: solid 2px;
		border-spacing: 0;
	}
	.admin-auction-exdetail th{
		border-bottom: solid 1px;
		border-color:silver;
		text-align: center;
		background-color: rgb(230, 230, 235);
	}
	.admin-auction-exdetail td{
		line-height: 40px;
		padding : 10px;
		border-top: solid 2px;
		text-align:left;
		vertical-align: middle;
	}
	.admin-auction-exdetail input{
		line-height: 25px;
		width:100%;
		padding : 3px 10px;
	}
	.admin-auction-exdetail input[type=text], .admin-auction-exdetail input[type=number]{
		text-align:left;
	}
	.admin-auction-exdetail input[type=button], .admin-auction-exdetail input[type=submit]{
		margin: 0 10px;
		font-size: 16px;
		height:35px;
		width:80px;
		color: white;
		border: none;
		background-color: #c33234;
	}
	.admin-auction-exdetail input[type=file]{
		padding: 3px 0;
	}
	
	.admin-auction-exdetail select{
		padding : 3px 10px;
		height: 35px;
	}
	
	.admin-auction-exdetail textarea{
		line-height: 21px;
		width:100%;
		height: 200px;
		text-align:left;
		padding : 5px 10px;
		resize: none;
	}
	.admin-auction-exdetail .foot-btn{
		text-align:center;
		line-height:50px;
		margin: 10px 0;
	}
	
	.admin-auction-exdetail .auction-image{
		width: 200px;
		height: 200px;
		padding:0;
		margin:10px;
	}
	.admin-auction-exdetail .auction-tit{
		display: inline-block;
		width:100%;
		padding:20px 50px;
	}
	.admin-auction-exdetail .tit-img-box, .admin-auction-exdetail .tit-info-box{
		margin:0;
		width:500px;
		float: left;
	}
	.admin-auction-exdetail .tit-img-box{
		
	}
	.admin-auction-exdetail .tit-info-box{
		
	}
	
	    /* 갤러리 */
	.admin-auction-exdetail .gallery {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
		margin-top: 10px;
		margin-bottom: 10px;
		padding: 10px;
	}
	.admin-auction-exdetail .gallery-each {
        /* flex-grow: 1; */
        width: 30%;
        padding: 10px;
    }
    .admin-auction-exdetail .gallery-each-lot,
    .admin-auction-exdetail .gallery-each-info {
    	text-align: center;
    }
    .admin-auction-exdetail .gallery-each-info p {
    	margin-top: 1px;
    	margin-bottom: 1px;
	}
    .admin-auction-exdetail .gallery-each-info a:link,
    .admin-auction-exdetail .gallery-each-info a:visited {
    	text-decoration: none;
    	color: black;
    }
    .admin-auction-exdetail .gallery-each-info .artist {
    	border-bottom: 1px solid gray;
    	height: 150px;
    	padding: 10px;
    }
    .admin-auction-exdetail .gallery-each-info .info {
    	border-bottom: 1px solid gray;
    	height: 100px;
    	padding: 10px;
    }
    .admin-auction-exdetail .gallery-each-info .time {
    	height: 75px;
    	padding: 10px;
    }
    .admin-auction-exdetail .gallery-each-info .artist,
    .admin-auction-exdetail .gallery-each-info .info,
    .admin-auction-exdetail .gallery-each-info .time {
    	text-align: left;
    }
</style>
<script>
	function editMenuColor(){
		$(".admin-menu-auction-exhibit").css("color","#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-auction-exdetail" align="center">
	<form action="exhibit" method="post" enctype="multipart/form-data">
		<input type="hidden" name="auction_sq" value="${auction.auction_sq}">
		<table>
			<tbody>
				<tr>
					<td>
						<div class="auction-tit">
							<div class="tit-img-box">
								<img src="${root}/image/auction/${auction.auction_image}" class="auction-image">
							</div>
							<div class="tit-info-box">
								<div class="auction-type left">
									<c:choose>
										<c:when test="${auction.auction_type eq 'online'}">
											온라인경매
										</c:when>
										<c:otherwise>
											오프라인경매
										</c:otherwise>
									</c:choose>
								</div>
								<div class="auction-nm left">${auction.auction_nm}</div>
								<div class="auction-info left">${auction.auction_info}</div>
								<div class="auction-addr left">
									<c:if test="${not empty auction.auction_post}">[${auction.auction_post}] </c:if>
									${auction.auction_addr1} ${auction.auction_addr2}
								</div>
								<div class="auction-start left">${auction.auction_start}</div>
								<div class="auction-end left">${auction.auction_end}</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="auction-main">
							<div class="gallery">
				            	<c:forEach var="view" items="${currentList}" varStatus="status">
					                <div class="gallery-each">	                	
					                	<div class="gallery-each-lot">
					                        <h1>LOT. <span class="lot">${view.lot}</span></h1>
					                    </div>
					                    <div class="gallery-each-info">
					                        <div class="image">
					                            <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
					                            <img src="${root}/image/art?art_image=${view.art_image}" width="275" height="275"></a>
					                        </div>
					                        <div class="artist">
						                        <h2 class="art_artist">
						                        <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
						                        ${view.art_artist}</a></h2>
						                        <h4 class="art_nm">
						                        <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
						                        ${view.art_nm}</a></h4>
						                        <h4>
						                        <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
						                        ${view.art_cdt}</a></h4>
											</div>
											<div class="info">
						                        <p>${view.art_medium}</p>
						                        <p>${view.art_size}</p>
						                        <p>${view.art_origin}</p>
											</div>
											<div class="time">
												<p>
													마감 :
													<fmt:parseDate var="parsed" value="${view.a_end}" pattern="yyyy-MM-dd HH:mm"/>
													<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일 a hh시"/>
												</p>
												<p>
													남은시간 : 
														<span class="timeleft"></span>
												</p>
											</div>
											<div class="">
					        					<div class="row">
					        						<div class="form-submit">
									            		<button class="form-fav-button" 
									            								data-index="${status.index}"
									            								data-a_sq="${view.a_sq}"
									            								data-art_sq="${view.art_sq}"
									            								data-lot="${view.lot}">
									                		<div class="img">
									                		<c:choose>
									                			<c:when test="${myfavList.contains(view.art_sq)}">
									                				<img src="${root}/image/icon/fav.png" width="50%">
									                			</c:when>
									                			<c:otherwise>
									                				<img src="${root}/image/icon/unfav.png" width="50%">
									                			</c:otherwise>
									                		</c:choose>
									                		</div>
									                		<div class="text">관심작품</div>
									            		</button>
								            		</div>
								            		<a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
														<button class="form-bid-button">
															<div class="text">응찰하기</div>
							            				</button>
						            				</a>
												</div>
					        				</div>
					                    </div>
					                </div>
				                </c:forEach>
				        </div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="foot-btn">
			<input type="submit" value="등록">
			<a	href="exhibit">
				<input type="button" value="취소"></a>
		</div>
	</form>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>