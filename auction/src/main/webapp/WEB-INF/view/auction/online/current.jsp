<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
    <head>
    <title>미술품 경매 | 진행경매 출품목록</title>
    <style>
        .row {
            padding: 15px;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .gallery {
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .margin {
            margin-top: 15px;
        }
        
		.navLower, .navLower > a{
    		text-decoration: none;    		
    		font-size: 25px;
    		color: black;
    	}
    	
    	.navUpper, .navUpper > a{
    		text-decoration: none;    		
    		font-size: 20px;
    		color: black;
    	}
        
    </style>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${root}/library/js/nouislider.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.0.4/wNumb.min.js'></script>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${root}/library/css/nouislider.css">
    <script>
        window.onload = function(){
            var slider = document.getElementById('slider');
            noUiSlider.create(slider, {
                start: [100000, 50000000],
                connect: true,
                range: {
                    'min': [100000],
                    'max': [50000000]
                },
                format: wNumb({
                    decimals: 0,
                    thousand: ',',
                    prefix: '￦',
                })
            });
            var value = [
                document.getElementById('lower'),
                document.getElementById('upper'),
            ];
            var epriceMin = document.getElementById('eprice_min')
            var epriceMax = document.getElementById('eprice_max')
            console.log(value)
            slider.noUiSlider.on('update', function (values, handle, positions) {
                value[handle].innerHTML = values[handle]
                epriceMin.value = values[0]
                epriceMax.value = values[1]
            });          
            
            $(".reset").click(function(){
            	console.log($(this))
            	$("input[name=art_artist]").val("");
            	$("input[name=art_nm]").val("");
            	$("input[name=lot]").val("");
            });
            
        };
    </script>
</head>

<body>
    <div class="container-fluid">
        <div class="row text-center header">
            <h1>진행경매</h1>
        </div>
        <!-- 경매 개요 -->
        <div class="row title">
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-3">
                    <div>
                        <h5>경매회차</h5>
                    </div>
                    <div>
                        <h4>경매명</h4>
                    </div>
                </div>
                <div class="col-md-6">
                    <div>
                        <p>경매일자</p>
                    </div>
                    <div>
                        <p>경매장소</p>
                    </div>
                    <div>
                        <h3>응찰자 주의사항</h3>
                    </div>
                </div>
            </div>
        </div>
        <!-- 검색창 -->
        <form action="current" method="get">
            <input type="hidden" name="art_eprice_min" value="" id="eprice_min">
            <input type="hidden" name="art_eprice_max" value="" id="eprice_max">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
						작가명
                        <input name="art_artist" type="text" value="${util.art_artist}" placeholder="작가명 입력하여 찾기">
                    </div>
                    <div class="col-md-3">
						작품명
                   		<input name="art_nm" type="text" value="${util.art_nm}" placeholder="작품명 입력하여 찾기">
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="col-md-3">추정가</div>
                        <div class="col-md-9" id="slider"></div>
                        <span id="lower"></span>
                        ~
                        <span id="upper"></span>
                    </div>
                    <div class="col-md-2">
						번호 
						<c:choose>
							<c:when test="${util.lot eq 0}">
								<input name="lot" type="text" value="" placeholder="번호 입력하여 찾기">
							</c:when>
							<c:otherwise>
								<input name="lot" type="text" value="${util.lot}" placeholder="번호 입력하여 찾기">
							</c:otherwise>
						</c:choose> 
                    </div>
                </div>
                <div class="col-md-10 col-md-offset-1 search text-center">
                	<input class="reset" type="button" value="초기화">
                    <input type="submit" value="검색">
                </div>
            </div>
        </form>
        <!-- 네비게이터/정렬 -->
        <div class="row">
        	<div class="col-md-10 col-md-offset-1">
        		<div class="col-md-6 text-left">
             		네비게이터
        		</div>
        		<form action="current" method="post">
	        		<div class="col-md-6 text-right">
	        			정렬
	        			<select name="sortType">
							<option value="lot asc">번호 오름차순</option>
			        		<option value="lot desc">번호 내림차순</option>
			        		<option value="art_artist asc">작가명 오름차순 </option>
			        		<option value="art_artist desc">작가명 내림차순</option>
			        		<option value="art_nm asc">작품명 오름차순 </option>
			        		<option value="art_nm desc">작품명 내림차순</option>
	        			</select>
	        			<input type="submit" value="보기">
	        		</div>
        		</form>
        	</div>
        </div>
        <!-- 갤러리 -->
        <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
            	<c:forEach var="view" items="${currentList}">
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. ${view.lot}</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <div>
	                        <h3>${view.art_artist}</h3>
	                        <h4>${view.art_nm}</h4>
	                        <h4>${view.art_dt}</h4>
	                        <hr>
	                        <p>${view.art_medium}</p>
	                        <p>${view.art_size}</p>
	                        <p>${view.art_eprice}</p>
	                        <p>시작가</p>
	                        <hr>
	                        <p>
			                    <fmt:parseDate var="a_end_parsed" value="${view.a_end}" pattern="yy/MM/dd"/>
			                    <fmt:formatDate value="${a_end_parsed}" type="both" timeStyle="long"/>
								종료
							</p>
							<h4>총 O회 응찰</h4>
							<h4>낙찰가</h4>
                        </div>
                        <div>
                        	<input type="button" value="응찰하기" onclick="location.href='bidding?lot=${view.lot}'">
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        <!-- 네비게이터 -->
        <div class="row">
        	<div class="col-md-8 col-md-offset-2 text-center">
        		<div class="navLower">
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
        </div>
    </div>
</body>
</html>
