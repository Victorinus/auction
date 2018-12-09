<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="auction" value="${currentAuction}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp" />

<style>
/* 레이아웃 */
.auction-online-current {
	margin: auto;
	width: 1000px;
}

.auction-online-current .title {
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 10px;
	text-align: center;
}

/* 경매 개요*/
.auction-online-current .intro {
	display: flex;
	flex-direction: row;
	padding: 10px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	min-height: 100px;
}

.auction-online-current .intro-name {
	padding: 10px;
	flex-grow: 1;
	font-size: 25px;
}

.auction-online-current .intro-sort {
	flex-grow: 1;
	padding: 10px;
	font-size: 20px;
	color: #c33234;
	font-weight: bold;
}

.auction-online-current .intro-sort-inner {
	padding-top: 5px;
	padding-bottom: 5px;
}

.auction-online-current .intro-detail {
	flex-grow: 10;
	padding: 10px;
	font-size: 20px;
}

.auction-online-current .intro-detail-inner {
	padding-top: 5px;
	padding-bottom: 5px;
}

/* 검색창 */
.auction-online-current .search {
	border-bottom: 2px solid gray;
	margin-top: 25px;
	margin-bottom: 25px;
	min-height: 100px;
}

.auction-online-current .search-type {
	display: flex;
	flex-direction: row;
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 15px;
}

.auction-online-current .search-type-text {
	height: 30px;
}

.auction-online-current .search-type-dt1, .auction-online-current .search-type-dt2,
	.auction-online-current .search-type-dt4 {
	flex-grow: 1;
}

.auction-online-current .search-type-dt3 {
	flex-grow: 7;
}

.auction-online-current .search-btns {
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
}

.auction-online-current .search-btn {
	padding-left: 15px;
	padding-right: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
	background-color: #c33234;
	border: 1px solid #c33234;
	color: white;
	cursor: pointer;
}

/* 슬라이더바 */
.auction-online-current .sliderBar {
	display: flex;
	flex-direction: row;
}

.auction-online-current .sliderEp {
	/* flex-grow: 1; */
	width: 30%;
	text-align: center;
}

.auction-online-current .sliderRange {
	/* flex-grow: 3; */
	/* width: 150px; */
	width: 70%;
}

.auction-online-current #value {
	text-align: center;
}

.auction-online-current .noUi-target {
	width: 100%;
}

.auction-online-current .noUi-connect {
	border: 10px solid #c33234;
}

.auction-online-current .noUi-horizontal .noUi-handle {
	border: transparent;
	padding: 6px;
	background-image: url("/auction/image/icon/handle.png");
	background-repeat: no-repeat;
	background-origin: content-box;
	background-size: 20px;
	background-position: 0;
	background-color: transparent;
}

.auction-online-current
	.noUi-horizontal .noUi-handle:before, .noUi-horizontal .noUi-handle:after
	{
	background: transparent;
}

/* 갤러리 */
.auction-online-current .gallery {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 10px;
}

.auction-online-current .gallery-each {
	/* flex-grow: 1; */
	width: 30%;
	padding: 10px;
}

.auction-online-current .gallery-each-lot, .auction-online-current .gallery-each-info
	{
	text-align: center;
}

.auction-online-current .gallery-each-info p {
	margin-top: 1px;
	margin-bottom: 1px;
}

.auction-online-current .gallery-each-info a:link,
	.auction-online-current .gallery-each-info a:visited {
	text-decoration: none;
	color: black;
}

.auction-online-current .gallery-each-info .artist {
	border-bottom: 1px solid gray;
	height: 150px;
	padding: 10px;
}

.auction-online-current .gallery-each-info .info {
	border-bottom: 1px solid gray;
	height: 100px;
	padding: 10px;
}

.auction-online-current .gallery-each-info .time {
	height: 75px;
	padding: 10px;
}

.auction-online-current .gallery-each-info .artist,
	.auction-online-current .gallery-each-info .info,
	.auction-online-current .gallery-each-info .time {
	text-align: left;
}

/* 관심작품/응찰하기 버튼 */
.auction-online-current .form-submit {
	display: inline-block;
}

.auction-online-current .form-fav-button {
	width: 125px;
	height: 50px;
	background-color: cornflowerblue;
	padding: 0px;
	border: 1px solid cornflowerblue;
	color: white;
	font-size: 15px;
	cursor: pointer;
}

.auction-online-current .form-bid-button {
	width: 125px;
	height: 50px;
	background-color: cornflowerblue;
	padding: 0px;
	border: 1px solid cornflowerblue;
	color: white;
	font-size: 15px;
	cursor: pointer;
}

.auction-online-current .text {
	display: inline-block;
	padding-top: 5px;
	padding-bottom: 5px;
	vertical-align: middle;
}

.auction-online-current .img {
	display: inline-block;
	padding-top: 5px;
	padding-bottom: 5px;
	vertical-align: middle;
}

.auction-online-current .notuser1,
 .auction-online-current .notuser2 {
	width: 100%;
	height: 50px;
	padding: 0px;
	background-color: beige;
	border: 1px solid beige;
	color: black;
	font-size: 15px;
}

.auction-online-current .notuser1 {

}

.auction-online-current .notuser-btn {
	width: 100px;
	height: 25px;
	padding: 0px;
	background-color: white;
	border: 1px solid white;
	cursor: pointer;
	
    /* 경매 개요*/
	.auction-online-current .intro {
        display: flex;
        flex-direction: row;
        padding: 10px;
		border-top : 1px solid gray;
        border-bottom : 1px solid gray;
        min-height: 100px;
    }
	.auction-online-current .intro-name {
        padding: 10px;
        flex-grow: 1;
        font-size: 25px;
	}
    .auction-online-current .intro-sort {
        flex-grow: 1;
        padding: 10px;
        font-size: 20px;
        color: #c33234;
    }
    .auction-online-current .intro-sort-inner {
        padding-top: 5px;
        padding-bottom: 5px;
    }
    .auction-online-current .intro-detail {
        flex-grow: 10;
        padding: 10px;
        font-size: 20px;
	}
    .auction-online-current .intro-detail-inner {
        padding-top: 5px;
        padding-bottom: 5px;
    }
    
    /* 검색창 */
    .auction-online-current .search {
        border-bottom: 2px solid gray;
        margin-top: 25px;
        margin-bottom: 25px;
        min-height: 100px;
    }
    .auction-online-current .search-type {
        display: flex;
        flex-direction: row;
        margin-top: 10px;
        margin-bottom: 10px;
        font-size: 15px;
    }
    .auction-online-current .search-type-text {
    	height: 30px;
    }
    .auction-online-current .search-type-dt1,
    .auction-online-current .search-type-dt2,
    .auction-online-current .search-type-dt4 {
        flex-grow: 1;
    }
    .auction-online-current .search-type-dt3 {
    	flex-grow: 7;
    }
    .auction-online-current .search-btns {
        margin-top: 10px;
        margin-bottom: 10px;
        text-align: center;
    }
    .auction-online-current .search-btn {
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 5px;
        padding-bottom: 5px;
        background-color: #c33234;
        border: 1px solid #c33234;
        color: white;
        cursor: pointer;
    }
    
    /* 슬라이더바 */
	.auction-online-current .sliderBar {
		display: flex;
		flex-direction: row;
	}
	.auction-online-current .sliderEp {
		/* flex-grow: 1; */
		width: 30%;
		text-align: center;
	}
	.auction-online-current .sliderRange {
		/* flex-grow: 3; */
		/* width: 150px; */
		width: 70%;
	}
	.auction-online-current #value {
		text-align: center;
	}
	.auction-online-current .noUi-target {
		width: 100%;
	}
	.auction-online-current .noUi-connect {
		border: 10px solid #c33234;
	}
	.auction-online-current .noUi-horizontal .noUi-handle {
		border: transparent;
		padding: 6px;
		background-image: url("/auction/image/icon/handle.png");
		background-repeat: no-repeat;
		background-origin: content-box;
		background-size: 20px;
		background-position: 0;
		background-color: transparent;
	}
	.auction-online-current
	.noUi-horizontal .noUi-handle:before,
	.noUi-horizontal .noUi-handle:after {
		background: transparent;
	}
	
    /* 갤러리 */
	.auction-online-current .gallery {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
		margin-top: 10px;
		margin-bottom: 10px;
		padding: 10px;
	}
	.auction-online-current .gallery-each {
        /* flex-grow: 1; */
        width: 30%;
        padding: 10px;
    }
    .auction-online-current .gallery-each-lot,
    .auction-online-current .gallery-each-info {
    	text-align: center;
    }
    .auction-online-current .gallery-each-info p {
    	margin-top: 1px;
    	margin-bottom: 1px;
	}
    .auction-online-current .gallery-each-info a:link,
    .auction-online-current .gallery-each-info a:visited {
    	text-decoration: none;
    	color: black;
    }
    .auction-online-current .gallery-each-info .artist {
    	border-bottom: 1px solid gray;
    	height: 150px;
    	padding: 10px;
    }
    .auction-online-current .gallery-each-info .info {
    	border-bottom: 1px solid gray;
    	height: 100px;
    	padding: 10px;
    }
    .auction-online-current .gallery-each-info .time {
    	height: 75px;
    	padding: 10px;
    }
    .auction-online-current .gallery-each-info .artist,
    .auction-online-current .gallery-each-info .info,
    .auction-online-current .gallery-each-info .time {
    	text-align: left;
    }
    
    /* 관심작품/응찰하기 버튼 */
    .auction-online-current .form-submit {
		display: inline-block;
	}
	.auction-online-current .form-fav-button {
		width: 125px;
		height: 50px;
		background-color: #c33234;
		padding: 0px;
		border: 1px solid #c33234;
		color: white;
		font-size: 15px;
		cursor: pointer;
	}
	.auction-online-current .form-bid-button {
		width: 125px;
		height: 50px;
		background-color: #c33234;
		padding: 0px;
		border: 1px solid #c33234;
		color: white;
		font-size: 15px;
		cursor: pointer;
	}
	.auction-online-current .text {
		display: inline-block;
		padding-top: 5px;
		padding-bottom: 5px;
		vertical-align: middle;
	}
	.auction-online-current .img {
		display: inline-block;
		padding-top: 5px;
		padding-bottom: 5px;
		vertical-align: middle;
	}
    
    /* 네비게이터 */
    .auction-online-current .paging {
        text-align: center;
        font-size: 20px;
    }
	.auction-online-current .paging a {
		text-decoration: none;
		font-size: 20px;
	}
	.auction-online-current .paging a:hover {
		color: orange;
	}
</style>

<script>
	window.onload = function() {
	//슬라이더바
	var slider = document.getElementById('slider');

	var value = [ document.getElementById('lower'),
			document.getElementById('upper'), ]

	var epriceMin = document.getElementById('eprice_min')
	var epriceMax = document.getElementById('eprice_max')

	var paramMin = ${util.art_eprice_min}
	var paramMax = ${util.art_eprice_max}
	console.log(paramMin)
	console.log(paramMax)
	
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

	//남은 시간
	var a = new Array();
	<c:forEach var="view" items="${currentList}">
	a.push("${view.a_end}");
	</c:forEach>

	setInterval(timer, 1000);
	function timer() {
		var sysdate = new Date();
		var end = new Date(a[0]);
		var gap = Math.round((end - sysdate) / 1000);
		var D = Math.floor(gap / (60 * 60 * 24));
		var H = Math.floor((gap - D * (60 * 60 * 24)) / (60 * 60) % (60 * 60));
		var M = Math.floor((gap - H * (60 * 60)) / 60 % 60);
		var S = Math.floor((gap - M * 60) % 60);

		//document.querySelector(".timeleft").innerHTML = D+"일 "+H+"시간 "+M+"분 "+S+"초";    
		var timeleft = document.querySelectorAll(".timeleft");
		//console.log(timeleft);
		for (i = 0; i < timeleft.length; i++) {
			timeleft[i].innerHTML = D + "일 " + H + "시간 " + M + "분 " + S + "초";
		}
	};

	//관심작품
	var status = [ true, true, true, true, true, true, true, true, true, true ];

	$(".form-fav-button").click(
			function() {
				var target = this;
				var index = $(target).attr("data-index");
				var a_sq = $(target).attr("data-a_sq");
				var art_sq = $(target).attr("data-art_sq");
				var lot = $(target).attr("data-lot");
				var img = $(target).children(".img").children("img")
						.attr("src")
				console.log(a_sq)
				console.log(art_sq)
				//console.log(img)

				$.ajax({
					type : "post",
					url : "/auction/myfav/register",
					data : {
						a_sq : a_sq,
						art_sq : art_sq,
						lot : lot
					},
					success : function() {
						console.log("데이터 전송 완료")
					}
				});

				if (status[index]) {
					if (img.endsWith("/fav.png")) {
						var tag = $("<img/>").attr("src",
								"${root}/image/icon/unfav.png").attr("width",
								"50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					} else {
						var tag = $("<img/>").attr("src",
								"${root}/image/icon/fav.png").attr("width",
								"50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					}
				} else {
					if (img.endsWith("/unfav.png")) {
						var tag = $("<img/>").attr("src",
								"${root}/image/icon/fav.png").attr("width",
								"50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					} else {
						var tag = $("<img/>").attr("src",
								"${root}/image/icon/unfav.png").attr("width",
								"50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					}
				}
				status[index] = !status[index];
			})
	};
</script>

<div class="auction-online-current">
	<div class="title">
		<h1>진행경매</h1>
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
				<fmt:parseDate var="parsed" value="${auction.auction_start}"
					pattern="yyyy-MM-dd HH:mm" />
				<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시" />
			</div>
			<div class="intro-detail-inner">
				<fmt:parseDate var="parsed" value="${auction.auction_end}"
					pattern="yyyy-MM-dd HH:mm" />
				<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시" />
			</div>
		</div>
	</div>
	<!-- 검색창 -->
	<div class="search">
		<form action="current" method="get">
			<input type="hidden" name="art_eprice_min" value="" id="eprice_min">
			<input type="hidden" name="art_eprice_max" value="" id="eprice_max">
			<div class="search-type">
				<div class="search-type-dt1">
					<span>작가명</span> <input class="search-type-text" name="art_artist"
						type="text" value="${util.art_artist}" placeholder="작가명 입력하여 찾기">
				</div>
				<div class="search-type-dt2">
					<span>작품명</span> <input class="search-type-text" name="art_nm"
						type="text" value="${util.art_nm}" placeholder="작품명 입력하여 찾기">
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
							<input class="search-type-text" name="lot" type="text" value=""
								placeholder="번호 입력하여 찾기">
						</c:when>
						<c:otherwise>
							<input class="search-type-text" name="lot" type="text"
								value="${util.lot}" placeholder="번호 입력하여 찾기">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="search-btns">
				<input class="search-btn reset" type="button" value="초기화"> <input
					class="search-btn" type="submit" value="검색">
			</div>
		</form>
	</div>
	<!-- 네비게이터/정렬 -->
	<!-- 갤러리 -->
	<div class="gallery">
		<c:forEach var="view" items="${currentList}" varStatus="status">
			<div class="gallery-each">
				<div class="gallery-each-lot">
					<h1>
						LOT. <span class="lot">${view.lot}</span>
					</h1>
				</div>
				<div class="gallery-each-info">
					<div class="image">
						<a
							href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
							<img src="${root}/image/art?art_image=${view.art_image}"
							width="275" height="275">
						</a>
					</div>
					<div class="artist">
						<h2 class="art_artist">
							<a
								href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
								${view.art_artist}</a>
						</h2>
						<h4 class="art_nm">
							<a
								href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
								${view.art_nm}</a>
						</h4>
						<h4>
							<a
								href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
								${view.art_cdt}</a>
						</h4>
					</div>
					<div class="info">
						<p>${view.art_medium}</p>
						<p>${view.art_size}</p>
						<p>${view.art_origin}</p>
					</div>
					<div class="time">
						<p>
							마감 :
							<fmt:parseDate var="parsed" value="${view.a_end}"
								pattern="yyyy-MM-dd HH:mm" />
							<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일 a hh시" />
						</p>
						<p>
							남은시간 : <span class="timeleft"></span>
						</p>
					</div>
					<div class="">
						<c:choose>
							<c:when test="${user_grade eq '준회원'}">
								<div class="row">
									<div class="form-submit">
										<button class="form-fav-button" data-index="${status.index}"
											data-a_sq="${view.a_sq}" data-art_sq="${view.art_sq}"
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
									<a
										href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
										<button class="form-bid-button">
											<div class="text">응찰하기</div>
										</button>
									</a>
								</div>
							</c:when>
							<c:when test="${user_grade eq '관리자'}">
								<div class="notuser1">
									관리자모드
								</div>
							</c:when>
							<c:otherwise>
								<div class="notuser2">
									응찰하기는 로그인 후 확인할 수 있습니다.
									<div>
										<a href="${root}/member/login">
											<input type="button" class="notuser-btn" value="로그인">
										</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 네비게이터 -->
	<div class="paging">
		<c:if test="${util.hasMorePrevPage()}">
			<a href="${root}/online/current?page=${util.getSb()-1}${util.param}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${util.sb}" end="${util.fb}" step="1">
			<c:choose>
				<c:when test="${util.isCurrentPage(i) }">
						${i}
					</c:when>
				<c:otherwise>
					<a href="${root}/online/current?page=${i}${util.param}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${util.hasMoreNextPage()}">
			<a href="${root}/online/current?page=${util.getFb()+1}${util.param}">[다음]</a>
		</c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp" />