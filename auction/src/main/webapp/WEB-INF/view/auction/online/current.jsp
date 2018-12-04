<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
    <head>
    <title>미술품 경매 | 진행경매</title>
    <style>
		.content {
            width: 500px;
            margin: auto;
        }
    
        .row {
            margin-top: 5px;
            margin-bottom: 5px;
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
        
        .left > p{
        	text-align: left;
        	font-size: 15px;
        }
        
        .form-submit {
        	display: inline-block;
        }
        
		.form-fav-button {
            width: 125px;
            background-color: cornflowerblue;
            padding: 0px;
            border: 1px solid cornflowerblue;
            color: white;
            font-family: 견고딕;
            font-size: 15px;    
        }
        
        .form-bid-button {
            width: 125px;
            background-color: lightblue;
            padding: 0px;
            border: 1px solid lightblue;
            color: white;
            font-family: 견고딕;
            font-size: 15px;    
        }
        
        .text {
            display: inline-block;
            padding-top: 5px;
            padding-bottom: 5px;
            vertical-align: middle;
        }
        
        .img {
            display: inline-block;
            padding-top: 5px;
            padding-bottom: 5px;
            vertical-align: middle;
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
        	//슬라이더바
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
            //console.log(value)
            slider.noUiSlider.on('update', function (values, handle, positions) {
                value[handle].innerHTML = values[handle]
                epriceMin.value = values[0]
                epriceMax.value = values[1]
            });          
            
            //검색 초기화
            $(".reset").click(function(){
            	$("input[name=art_artist]").val("");
            	$("input[name=art_nm]").val("");
            	$("input[name=lot]").val("");
            });
          	
            //남은 시간
			var a= new Array();
			<c:forEach var="view" items="${currentList}">
				a.push("${view.a_end}");
			</c:forEach>
          		
			setInterval(timer, 1000);
            function timer(){
                var sysdate = new Date();
                var end = new Date(a[0]);
                var gap = Math.round((end - sysdate) / 1000);
                var D = Math.floor(gap / (60 * 60 * 24));
                var H = Math.floor((gap - D*(60 * 60 * 24)) / (60 * 60) % (60 * 60));
                var M = Math.floor((gap - H*(60 * 60)) / 60 % 60);
                var S = Math.floor((gap - M*60) % 60);
                
                //document.querySelector(".timeleft").innerHTML = D+"일 "+H+"시간 "+M+"분 "+S+"초";    
                var timeleft = document.querySelectorAll(".timeleft");
                //console.log(timeleft);
                for(i=0; i<timeleft.length; i++){
                	timeleft[i].innerHTML = D+"일 "+H+"시간 "+M+"분 "+S+"초";
                }
            };
            
            //관심작품
			var status = 
				[true, true, true, true, true, true, true, true, true, true];
            
            $(".form-fav-button").click(function(){
				var target = this;
				var index = $(target).attr("data-index");
				var a_sq = $(target).attr("data-a_sq");
				var art_sq = $(target).attr("data-art_sq");
				var lot = $(target).attr("data-lot");
				var img = $(target).children(".img").children("img").attr("src")
				console.log(img)
				
				$.ajax({
            		type: "post",
            		url: "/auction/myfav/register",
            		data : {
            			a_sq: a_sq,
            			art_sq: art_sq,
            			lot: lot
            		},
            		success : function(xml){
            			console.log("데이터 전송 완료")
            		}
            	});
				
				if(status[index]){
					if(img.endsWith("/fav.png")){
						var tag = $("<img/>")
						.attr("src", "${root}/image/icon/unfav.png")
						.attr("width", "50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					}
					else{
						var tag = $("<img/>")
						.attr("src", "${root}/image/icon/fav.png")
						.attr("width", "50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					}
				}
				else{
					if(img.endsWith("/unfav.png")){
						var tag = $("<img/>")
						.attr("src", "${root}/image/icon/fav.png")
						.attr("width", "50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					}
					else{
						var tag = $("<img/>")
						.attr("src", "${root}/image/icon/unfav.png")
						.attr("width", "50%");
						$(this).children(".img").empty();
						$(this).children(".img").prepend(tag);
					}
				}
				
                status[index] = !status[index];
            })
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
        <!-- 갤러리 -->
        <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
            	<c:forEach var="view" items="${currentList}" varStatus="status">
	                <div class="col-md-3 gallery">	                	
	                	<div>
	                        <h4>LOT. <span class="lot">${view.lot}</span></h4>
	                    </div>
	                    <div style="border: 1px solid lightgray;">
	                        <div class="margin">
	                            <!-- <img src="http://dummyimage.com/200x200"> -->
	                            <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
	                            <img src="${root}/image/art?art_image=${view.art_image}" width="200" height="200"></a>
	                        </div>
	                        <div class="left">
		                        <h3 class="art_artist">
		                        <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
		                        ${view.art_artist}</a></h3>
		                        <h4 class="art_nm">
		                        <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
		                        ${view.art_nm}</a></h4>
		                        <h4>
		                        <a href="${root}/online/curdetail?art_sq=${view.art_sq}&auction_sq=${view.a_sq}&lot=${view.lot}">
		                        ${view.art_cdt}</a></h4>
		                        <hr>
		                        <p>재질 : ${view.art_medium}</p>
		                        <p>규격 : ${view.art_size}</p>
		                        <p>추정가 : ${view.art_eprice}</p>
		                        <hr>
		                        <div class="left">
			                        <p>
			                        	종료시간 :
										<fmt:parseDate var="parsed" value="${view.a_end}" pattern="yyyy-MM-dd HH:mm"/>
										<fmt:formatDate value="${parsed}" pattern="yyyy년 MM월 dd일 a hh시"/>
									</p>
									<p>
										남은시간 : 
										<span class="timeleft"></span>
									</p>
									<p>총 O회 응찰</p>
									<p>시작가 : </p>
									<p>현재가 : </p>
								</div>
	                        </div>
							<div>
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
									<button class="form-bid-button">
										<div class="text">응찰하기</div>
		            				</button>
								</div>
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
