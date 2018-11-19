<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
    <head>
    <title>미술품 경매 | 진행경매</title>
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
                        <h5>${currentAuction.auction_no}</h5>
                    </div>
                    <div>
                        <h4>${currentAuction.name}</h4>
                    </div>
                </div>
                <div class="col-md-6">
                    <div>
                        <p>	AUCTION : ${currentAuction.reg}</p>
                    </div>
                    <div>
                        <p>VENUE : ${currentAuction.addr}</p>
                    </div>
                    <div>
                        <h3>응찰자 주의사항</h3>
                    </div>
                </div>
            </div>
        </div>
        <!-- 검색창 -->
        <form action="current" method="get">
            <input type="hidden" name="eprice_min" value="" id="eprice_min">
            <input type="hidden" name="eprice_max" value="" id="eprice_max">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
                        작가명
                        <input name="artist" type="text" placeholder="작가명 입력하여 찾기">
                    </div>
                    <div class="col-md-3">
                        작품명
                        <input name="title" type="text" placeholder="작품명 입력하여 찾기">
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
                        <input name="lot" type="text" placeholder="번호 입력하여 찾기">
                    </div>
                </div>
                <div class="col-md-10 col-md-offset-1 search text-center">
                    <input type="submit" value="검색">
                </div>
            </div>
        </form>
        <!-- 페이징 -->
        <div class="row"></div>
        <!-- 갤러리 -->
        <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
            	<c:forEach var="view" items="${currentList}">
                <div class="col-md-3 gallery">
                    <div>
                        <h4>${view.lot}</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>${view.artist}</h3>
                        <h4>${view.title}</h4>
                        <hr>
                        <p>${view.medium}</p>
                        <p>${view.dimension}</p>
                        <p>${view.eprice}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        <!-- 페이징 -->
        <div></div>
    </div>
</body>
</html>
    