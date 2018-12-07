<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>

<style>
	/* 레이아웃 */
	.auction-online-detail {
		margin: auto;
        width: 1000px;
	}
	.auction-online-detail .title {
		margin-top: 20px;
		margin-bottom: 20px;
		padding: 10px;
		text-align: center;
	}
	
    /* 경매 개요*/
	.auction-online-detail .intro {
        display: flex;
        flex-direction: row;
        padding: 10px;
		border-top : 1px solid gray;
        border-bottom : 1px solid gray;
        min-height: 100px;
    }
	.auction-online-detail .intro-name {
        padding: 10px;
        flex-grow: 1;
        font-size: 25px;
	}
    .auction-online-detail .intro-sort {
        flex-grow: 1;
        padding: 10px;
        font-size: 20px;
        color: chocolate;
    }
    .auction-online-detail .intro-sort-inner {
        padding-top: 5px;
        padding-bottom: 5px;
    }
    .auction-online-detail .intro-detail {
        flex-grow: 10;
        padding: 10px;
        font-size: 20px;
	}
    .auction-online-detail .intro-detail-inner {
        padding-top: 5px;
        padding-bottom: 5px;
    }
    
    /* 검색창 */
    .auction-online-detail .search {
        border-bottom: 2px solid gray;
        margin-top: 25px;
        margin-bottom: 25px;
        min-height: 100px;
    }
    .auction-online-detail .search-type {
        display: flex;
        flex-direction: row;
        margin-top: 10px;
        margin-bottom: 10px;
        font-size: 15px;
    }
    .auction-online-detail .search-type-text {
    	height: 30px;
    }
    .auction-online-detail .search-type-dt1,
    .auction-online-detail .search-type-dt2,
    .auction-online-detail .search-type-dt4 {
        flex-grow: 1;
    }
    .auction-online-detail .search-type-dt3 {
    	flex-grow: 7;
    }
    .auction-online-detail .search-btns {
        margin-top: 10px;
        margin-bottom: 10px;
        text-align: center;
    }
    .auction-online-detail .search-btn {
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 5px;
        padding-bottom: 5px;
        background-color: dimgrey;
        border: 1px solid dimgrey;
        color: white;
        cursor: pointer;
    }
    
    /* 슬라이더바 */
	.auction-online-detail .sliderBar {
		display: flex;
		flex-direction: row;
	}
	.auction-online-detail .sliderEp {
		/* flex-grow: 1; */
		width: 30%;
		text-align: center;
	}
	.auction-online-detail .sliderRange {
		/* flex-grow: 3; */
		/* width: 150px; */
		width: 70%;
	}
	.auction-online-detail #value {
		text-align: center;
	}
	.auction-online-detail .noUi-target {
		width: 100%;
	}
	.auction-online-detail .noUi-connect {
		border: 10px solid skyblue;
	}
	.auction-online-detail .noUi-horizontal .noUi-handle {
		border: transparent;
		padding: 6px;
		background-image: url("/auction/image/icon/handle.png");
		background-repeat: no-repeat;
		background-origin: content-box;
		background-size: 20px;
		background-position: 0;
		background-color: transparent;
	}
	.auction-online-detail
	.noUi-horizontal .noUi-handle:before,
	.noUi-horizontal .noUi-handle:after {
		background: transparent;
	}
	
    /* 갤러리 */
	.auction-online-detail .gallery {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
		margin-top: 10px;
		margin-bottom: 10px;
		padding: 10px;
	}
	.auction-online-detail .gallery-each {
        /* flex-grow: 1; */
        width: 30%;
        padding: 10px;
    }
    .auction-online-detail .gallery-each-lot,
    .auction-online-detail .gallery-each-info {
    	text-align: center;
    }
    .auction-online-detail .gallery-each-info p {
    	margin-top: 1px;
    	margin-bottom: 1px;
	}
    .auction-online-detail .gallery-each-info a:link,
    .auction-online-detail .gallery-each-info a:visited {
    	text-decoration: none;
    	color: black;
    }
    .auction-online-detail .gallery-each-info .artist {
    	border-bottom: 1px solid gray;
    	height: 150px;
    	padding: 10px;
    }
    .auction-online-detail .gallery-each-info .info {
    	border-bottom: 1px solid gray;
    	height: 100px;
    	padding: 10px;
    }
    .auction-online-detail .gallery-each-info .time {
    	height: 75px;
    	padding: 10px;
    }
    .auction-online-detail .gallery-each-info .artist,
    .auction-online-detail .gallery-each-info .info,
    .auction-online-detail .gallery-each-info .time {
    	text-align: left;
    }
    
    /* 네비게이터 */
    .auction-online-detail .paging {
        text-align: center;
        font-size: 20px;
    }
	.auction-online-detail .paging a {
		text-decoration: none;
		font-size: 20px;
		color: black;
	}
	.auction-online-detail .paging a {
		color: orange;
	}
</style>
<script>
	window.onload = function(){
		//슬라이더바
		var slider = document.getElementById('slider');
	
		var value = [ document.getElementById('lower'),
				document.getElementById('upper'), ]
	
		var epriceMin = document.getElementById('eprice_min')
		var epriceMax = document.getElementById('eprice_max')
	
		var paramMin = ${util.art_eprice_min}
		var paramMax = ${util.art_eprice_max}
	
		//사용자가 추정가 이용하여 검색했는지 여부에 따라 조건문 처리
		if (paramMin != 100000 && paramMax != 50000000) {
			noUiSlider.create(slider, {
				start : [ paramMin, paramMax ],
				connect : true,
				step : 100000,
				range : {
					'min' : [ 100000 ],
					'max' : [ 50000000 ]
				},
				format : wNumb({
					decimals : 0,
					thousand : ',',
					prefix : '￦',
				})
			})
		} else {
			noUiSlider.create(slider, {
				start : [ 100000, 50000000 ],
				connect : true,
				step : 100000,
				range : {
					'min' : [ 100000 ],
					'max' : [ 50000000 ]
				},
				format : wNumb({
					decimals : 0,
					thousand : ',',
					prefix : '￦',
				})
			})
		}
	
		slider.noUiSlider.on('update', function(values, handle) {
			value[handle].innerHTML = values[handle]
			epriceMin.value = values[0]
			epriceMax.value = values[1]
		})
	
		//검색 초기화
		$(".reset").click(function() {			
			$("input[name=art_artist]").val("");
			$("input[name=art_nm]").val("");
			$("input[name=lot]").val("");
		});
	};
</script>

<div class="auction-online-detail">
	<div class="title">
		<h1>종료경매</h1>
	</div>
	<!-- 경매 개요 -->
	<div class="intro">
        	<div class="intro-name">${auction.auction_nm}</div>
            <div class="intro-sort">
                <div class="intro-sort-inner">전시장소</div>
                <div class="intro-sort-inner">경매시작일</div>
                <div class="intro-sort-inner">경매종료일</div>
            </div>
        	<div class="intro-detail">
                <div class="intro-detail-inner">${auction.auction_addr1}</div>
                <div class="intro-detail-inner">
                	<fmt:parseDate var="parsed" value="${auction.auction_start}" pattern="yyyy-MM-dd HH:mm"/>
					<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시"/>					                	
                </div>
                <div class="intro-detail-inner">
                	<fmt:parseDate var="parsed" value="${auction.auction_end}" pattern="yyyy-MM-dd HH:mm"/>
					<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시"/>
                </div>
        	</div>
        </div>
	<!-- 검색창 -->
	<div class="search">
		<form action="detail" method="get">
			<input type="hidden"  name="no" value="${util.no}">
			<input type="hidden" name="art_eprice_min" value="" id="eprice_min">
			<input type="hidden" name="art_eprice_max" value="" id="eprice_max">
			<div class="search-type">
				<div class="search-type-dt1">
					<span>작가명</span>
					<input class="search-type-text" name="art_artist" type="text" value="${util.art_artist }" placeholder="작가명 입력하여 찾기">
				</div>
				<div class="search-type-dt2">
					<span>작품명</span>
					<input class="search-type-text" name="art_nm" type="text" value="${util.art_nm}" placeholder="작품명 입력하여 찾기">
				</div>
				<div class="search-type-dt3">
					<div class="sliderBar">
						<div class="sliderEp">추정가</div>
						<div class="sliderRange">
							<div id="slider"></div>
							<div id="value">
								<span id="lower"></span>~<span id="upper"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="search-type-dt4">
					<span>LOT.</span>
					<c:choose>
						<c:when test="${util.lot eq 0}">
							<input class="search-type-text" name="lot" type="text" value="" placeholder="번호 입력하여 찾기">
						</c:when>
						<c:otherwise>
							<input class="search-type-text" name="lot" type="text" value="${util.lot}" placeholder="번호 입력하여 찾기">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="search-btns">
				<input class="search-btn reset" type="button" value="초기화">
				<input class="search-btn" type="submit" value="검색">
			</div>
		</form>
	</div>
    <!-- 네비게이터/정렬 -->
	<!-- 갤러리 -->
	<div class="gallery">
		<c:forEach var="view" items="${detailList}">
			<div class="gallery-each">
				<div class="gallery-each-lot">
					<h1>LOT. <span class="lot">${view.lot}</span></h1>	
				</div>
				<div class="gallery-each-info">
					<div class="image">
						<img src="${root}/image/art?art_image=${view.art_image}" width="275" height="275">
					</div>
					<div class="artist">
                        <h2 class="art_artist">${view.art_artist}</h2>
                        <h4 class="art_nm">${view.art_nm}</h4>
                        <h4 class="art_cdt">${view.art_cdt}</h4>
					</div>
					<div class="info">
                        <p>${view.art_medium}</p>
                        <p>${view.art_size}</p>
                        <p>${view.art_origin}</p>
					</div>
					<div class="price">
                        <p>추정가 ${view.art_eprice}</p>
                        <p>낙찰가 </p>
                    </div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 네비게이터 -->
	<div class="paging">
		<c:if test="${util.hasMorePrevPage()}">
			<a href="${root}/online/detail?page=${util.getSb()-1}${util.param}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${util.sb}" end="${util.fb}" step="1">
			<c:choose>
				<c:when test="${util.isCurrentPage(i) }">
					${i}
				</c:when>
				<c:otherwise>
					<a href="${root}/online/detail?page=${i}${util.param}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${util.hasMoreNextPage()}">
			<a href="${root}/online/detail?page=${util.getFb()+1}${util.param}">[다음]</a>
		</c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"/>