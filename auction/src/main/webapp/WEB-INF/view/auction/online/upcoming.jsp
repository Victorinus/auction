<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>미술품 경매 | 예정경매</title>
    <style>
    	div{
    		margin-top: 15px;
    		margin-bottom: 15px;
    	}
    </style>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
        <div class="row text-center header">
            <h1>예정경매</h1>
        </div>
        <!-- 경매 개요 -->
        <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
				<c:forEach var="auction" items="${upcomingList}">
					<div class="col-md-12">
						<h2>${auction.name}</h2>
					</div>					
					<hr>
					<div class="col-md-12">
						<h4>[AUCTION]</h4>
						<h4>${auction.reg}</h4>
						<h4>${auction.addr}</h4>
					</div>
					<div class="col-md-12">
						<div>
							<h2>프리뷰 안내</h2>
						</div>
						<div class="col-md-6 text-center">
							<img src="http://www.dummyimage.com/500x500">
						</div>
						<div class="col-md-6 text-center">
							<h4>프리뷰 기간(관리자 입력)</h4>
							<h4>전시장소(관리자 입력)</h4>
							<h4>다음지도 API</h4>
						</div>
					</div>
				</c:forEach>
            </div>
        </div>
    </div>
</body>
</html>