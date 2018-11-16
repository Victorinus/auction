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
            <h1>미술품 경매</h1>
        </div>
        <!-- 경매 개요 -->
        <div class="row title">
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-3">
                    <div>
                        <h5>경매회차(auction/rownum)</h5>
                    </div>
                    <div>
                        <h4>경매명(auction)</h4>
                    </div>
                </div>
                <div class="col-md-6">
                    <div>
                        <p>AUCTION : 경매일자(auction)</p>
                    </div>
                    <div>
                        <p>VENUE : 경매장소(auction)</p>
                    </div>
                    <div>
                        <h3>응찰자 주의사항</h3>
                    </div>
                </div>
            </div>
        </div>
        <!-- 검색창 -->
        <form action="current" method="post">
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
                        <input name="" type="text" placeholder="번호 입력하여 찾기">
                    </div>
                </div>
                <div class="col-md-10 col-md-offset-1 search text-center">
                    <input type="button" value="검색 초기화">
                    <input type="submit" value="검색">
                </div>
            </div>
        </form>
        <!-- 페이지네이션 -->
        <div class="row paging"></div>
        <!-- 갤러리 -->
        <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 1(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 2(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 3(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 4(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
            </div>
            <div class="col-md-10 col-md-offset-1 text-center">
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 5(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 6(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 7(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
                <div class="col-md-3 gallery">
                    <div>
                        <h4>LOT. 8(auction/rownum)</h4>
                    </div>
                    <div style="border: 1px solid lightgray;">
                        <div class="margin">
                            <img src="http://dummyimage.com/200x200">
                        </div>
                        <h3>작가명</h3>
                        <h4>작품명</h4>
                        <hr>
                        <p>재질</p>
                        <p>규격</p>
                        <p>추정가</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 페이지네이션 -->

    </div>
</body>
</html>
    