<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
    <head>
    <title>미술품 경매 | 홈</title>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    
    <!-- datetimepicker (날짜 및 시간 입력 라이브러리) -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/library/datetimepicker/jquery.datetimepicker.css"/>

    <style>
        .kg-body{
            min-height: 800;
        }
    </style>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <!-- datetimepicker (날짜 및 시간 입력 라이브러리) -->
    <script src="${pageContext.request.contextPath}/library/datetimepicker/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/library/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
	
	<script>
	    $(document).ready(function(){
	    	
	    	<!-- datetimepicker 라이브러리 사용 -->
    		var nowTime = new Date();
	    	$('.datetimepicker').datetimepicker({
	    		<!-- 옵션추가 기본값 : 현재시간으로 -->
	    		defaultDate:nowTime,
	    		value:nowTime
	    	});
	    	$.datetimepicker.setLocale('ko');
	    	
	    });
	</script>
</head>

<body>
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">KG Auction</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-right">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="검색어를 입력하세요">
                        </div>
                        <button type="submit" class="btn btn-default">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>입력
                        </button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Join</a></li>
                        <li><a href="#">Login</a></li>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </header>
    <div class="container-fluid">
        <div class="row">
            <div class="kg-body">
 