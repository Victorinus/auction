<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<html>
    <head>
    <title>KG AUCTION l 미술품 경매</title>
    
    <script src="${root}/library/js/sha256.js"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="${root}/library/js/nouislider.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.0.4/wNumb.min.js'></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/library/datetimepicker/jquery.datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="${root}/library/css/nouislider.css">

    <style>
    /* header,  .search, nav, section, footer 등 각 영역의 구분 */
        header,
        .search {
            margin: 15px 0;
            padding: 15px 0;
        }
        header {
        	margin-bottom: 30px;
        }
        body{
        	margin:0;
        }
        section {
        	
        }
        footer{
        	padding: 0;
        }

        header,
        nav {
        	padding:15px 0 0;
            margin: auto;
            
        }

        header,
        header>.title {
            text-align: center;
            font-size: 30px;
        }
        
        .search, form {
            text-align: right;
            margin: -5px;
            margin-right: 10px;
            padding: 0px;
        }
        
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            border-bottom: 2px solid #c33234; 
            /* background-color: #333; */
        }
        footer ul{
        	border: none;
        }

        li {
            float: left;
        }

        li a,
        .dropbtn {
            display: inline-block;
            color: black;
            text-align: center;
            font-size: 20px;
            padding: 14px 16px;
            text-decoration: none;
        }
        li > a{
        	font-weight: bold;
        }

        li a:hover:not(.active),
        .dropdown:hover .dropbtn {
            text-decoration: none;
            color:#c33234;
            /*background-color: #111;*/
        }
        
        nav li a:hover{
			color:#c33234;
			font-weight:bold;
            text-decoration: none;
            /* background-color: lightcyan; */
            
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 20;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .active {
            /*background-color: darkcyan;*/
        }

        section {
            min-height: 750px;
        }

        footer {
            margin: auto;
        }

        footer .info-about,
        footer .info-menu {
            list-style-type: none;
            margin: 0px;
            padding: 10px 20px;
            overflow: hidden;
            line-height:20px;
            background-color: black;
            color: silver;
            font-size: 12px;
        }
        footer .info-about li{
        	margin-right: 10px;
        }
        footer .info-menu-li:not(.active) {
            padding: 0px;
            margin-right: 15px;
            color: silver;
            font-size: 12px;
        }
        
        /* 각종 버튼 */
        .submit-btn {
        	background-image: url('/auction/image/icon/search.png');
        	background-position: 0px 0px;
        	background-repeat: no-repeat;
        	background-color: white;
        	width:32px;
        	height: 32px;
        	border: 0px;
        	cursor: pointer;
        	outline: 0;
        	vertical-align: middle;
        }
        .input-text {
        	width: 200px;
        	padding: 5px;
        	box-sizing: border-box;
        	border: none;
        	border-bottom: 2px solid black;
        	font-size: 15px;
        	vertical-align: middle;
        }
        .bold {
        	font-weight: bold;
        }
        .user-id{
        	color: #c33234;
        }
        
        /* 홈 메뉴*/
        .home {
        	width:100%;
        	height: 100%;
        }
        .home .bgimage{
       		width:100%;
       		height: 100%;
        	background-color:white;
        	background-image: url("${root}/image/about/home.jpeg");
        	background-position: top;
        	background-repeat: no-repeat;
        	background-size: cover;
        }
        .home .adv{
        	z-index:10;
        	color:white;
        	padding:20px;
        	position: absolute;
        	top: 300px;
        	left: 150px;
        	width: 350px;
        	height: 280px;
        	background-color: rgba(0, 0, 0, 0.7);
        }
        .home .adv-tit{
        	margin:15px 0 20px;
        	font-weight: bold;
        	font-size: 25px;
        	line-height:35px;
        	color: #ff595b;
       	}
        .home .adv-con{
        	margin:10px 0;
        	font-size: 16px;
        	line-height:25px;
       	}
       	.home .adv-btn{
       		margin:15px 0;
       		width:100%;
       	}
   	    .home .adv-btn input[type=button]{
   	    	margin:0 5px;
   	    	float:right;
			width:80px;
			height: 35px;
			color: silver;
			background-color: rgba(0, 0, 0, 0.8);
			border: 1px solid silver;
       	}
       	
        /* 관리자 메뉴 바 */
        .admin-menu {
        	line-height:70px;
        	width:800px;
        	height:70px;
        	font-size:17px;
        	padding:0 20px;
        	margin: 30px auto;
        	vertical-align:middle;
        	text-align: center;
        	border: 4px solid #d8dcdf;
        	background-color: #f6f6f6;
        }
        .admin-menu span{
        	float:left;
       	    list-style-type: none;
		    margin: 0 20px;
		    padding: 0;
        }
        .admin-menu a{
        	text-decoration: none;
        	color: black;
        	font-weight: bold;
        }
        .admin-menu .blank{
        	margin: 0 15px;
        	color:silver;
        }
        
        /* 통계 메뉴 바*/
        .admin-side{
        	line-height:25px;
        	float:left;
        	padding: 0px;
        	margin:0;
        	vertical-align:middle;
        	border: 2px solid #d8dcdf;
        	background-color:#f6f6f6;
        	width:250px;
        	height: 600px;
        }
        .admin-side a{
        	text-decoration: none;
        	color: black;
        	font-weight: bold;
        }
       .admin-side .main{
       		padding:20px 15px;
       		font-size: 18px;
       		background-color:#dddddd;
        }
        .admin-side .sub{
       		padding:15px 10px;
       		font-size: 17px;
       		
        /* 사용자 메뉴 바 */
		.member-menu {
        	line-height:70px;
        	width:800px;
        	height:70px;
        	font-size:17px;
        	padding:0 20px;
        	margin: 30px auto;
        	vertical-align:middle;
        	text-align: center;
        	border: 4px solid #d8dcdf;
        	background-color: #f6f6f6;
        }
        .member-menu span{
        	float:left;
       	    list-style-type: none;
		    margin: 0 20px;
		    padding: 0;
        }
        .member-menu a{
        	text-decoration: none;
        	color: black;
        	font-weight: bold;
        }
        .member-menu .blank{
        	margin: 0 15px;
        	color:silver;
        }
    </style>
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <!-- datetimepicker (날짜 및 시간 입력 라이브러리) -->
    <script src="${pageContext.request.contextPath}/library/datetimepicker/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/library/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
    <script>
        $(document).ready(function() {
			
            //홈 광고 닫기 버튼 클릭하면 숨기기
            $(".adv-close-btn").click(function(){
            	$(".adv").hide();
            });
        	
            // datetimepicker 라이브러리 사용
            var nowTime = new Date();
            var addrFlag = document.getElementById('sample6_postcode').value;

            if (addrFlag) {
                //console.log(addrFlag);
                $('.datetimepicker').datetimepicker({
                    // 옵션추가 기본값 : 현재시간으로
                    format: 'Y-m-d H:i'
                });
            } else {
                //console.log(addrFlag);
                $('.datetimepicker').datetimepicker({
                    // 옵션추가 기본값 : 현재시간으로
                    defaultDate: nowTime,
                    value: nowTime,
                    format: 'Y-m-d H:i'
                });
            }
            $.datetimepicker.setLocale('ko');
            
            
        });
    </script>
</head>

<body>
    <header>
        <div class="title">
        	<a href="${root}">
        		<img src="${root}/image/about/kg.png">
        	</a>
       	</div>
        <%-- <div class="title" style="cursor: pointer;" onclick="location.href='${root}';">Auction project</div> --%>
    </header>
    <div class="search">
        <form action="${root}/search" method="get">
        	<c:if test="${!empty user_id}">
	        	<span class="welcome-msg">
	        		<span class="bold user-id">${user_id}</span>
	        		 님, 방문을 환영합니다.
	        	</span>
        	</c:if>
            <input type="text" name="keyword" placeholder="검색어를 입력하세요." class="input-text">
           	<input type="submit" value="" class="submit-btn">
        </form>
    </div>
    <nav>
    	<c:choose>
    		<c:when test="${empty user_id}">
		        <ul>
		            <li><a class="active" href="${root}">Home</a></li>
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">온라인경매</a>
		                <div class="dropdown-content">
		                    <a href="${root}/online/current">진행경매</a>
		                    <a href="${root}/online/upcoming">예정경매</a>
		                    <a href="${root}/online/result">경매결과</a>
		                    <a href="${root}">온라인경매 안내</a>
		                </div>
		            </li>
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">위탁</a>
		                <div class="dropdown-content">
		                    <a href="#">위탁안내</a>
		                    <a href="#">프라이빗세일</a>
		                </div>
		            </li>
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">서비스</a>
		                <div class="dropdown-content">
		                    <a href="#">아카데미</a>
		                    <a href="#">미술품보관</a>
		                    <a href="#">담보대출</a>
		                </div>
		            </li>
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">회사소개</a>
		                <div class="dropdown-content">
		                    <a href="#">소개</a>
		                    <a href="#">연혁</a>
		                    <a href="#">공지사항</a>
		                    <a href="#">위치안내</a>
		                    <a href="#">FAQ</a>
		                </div>
		            </li>
		            <li style="float:right"><a class="active" href="${root}/member/login">Login</a></li>
		            <li style="float:right"><a class="active" href="${root}/member/joinform">Join</a></li>
		        </ul>
	        </c:when>
	        <c:otherwise>
				<ul>
		            <li><a class="active" href="${root}">Home</a></li>	
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">온라인경매</a>
		                <div class="dropdown-content">
		                    <a href="${root}/online/current">진행경매</a>
		                    <a href="${root}/online/upcoming">예정경매</a>
		                    <a href="${root}/online/result">경매결과</a>
		                    <a href="${root}">온라인경매 안내</a>
		                </div>
		            </li>
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">위탁</a>
		                <div class="dropdown-content">
		                    <a href="#">위탁안내</a>
		                    <a href="#">프라이빗세일</a>
		                </div>
		            </li>
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">서비스</a>
		                <div class="dropdown-content">
		                    <a href="#">아카데미</a>
		                    <a href="#">미술품보관</a>
		                    <a href="#">담보대출</a>
		                </div>
		            </li>
		            <li class="dropdown">
		                <a href="javascript:void(0)" class="dropbtn">회사소개</a>
		                <div class="dropdown-content">
		                    <a href="#">소개</a>
		                    <a href="#">연혁</a>
		                    <a href="#">공지사항</a>
		                    <a href="#">위치안내</a>
		                    <a href="#">FAQ</a>
		                </div>
		            </li>
		            <li style="float:right"><a class="active" href="${root}/member/logout">Logout</a></li>
		            <c:if test="${user_grade eq '준회원'}">
			            <li class="dropdown" style="float:right">
			            	<a class="active dropbtn" href="${root}/member/mypage">Mypage</a>
			            	<div class="dropdown-content">
			            		<a href="">회원정보수정</a>
			            		<a href="">회원탈퇴</a>
			            		<a href="">온라인경매 응찰내역</a>
			            		<a href="${root}/member/myfav">관심작품 목록</a>
			            	</div>
			            </li>
		            </c:if>
		            <c:if test="${user_grade eq '관리자'}">
			            <li class="dropdown" style="float:right">
			            	<a href="javascript:void(0)" class="active dropbtn">관리자</a>
			            		<div class="dropdown-content">
			            			<a href="${root}/admin/art/list">작품관리</a>
			            			<a href="${root}/admin/auction/list">경매관리</a>
			            			<a href="${root}/admin/member/list">회원관리</a>
			            			<a href="${root}/admin/statis/aucsts">통계</a>
			            		</div>
			            </li>
		            </c:if>
		        </ul>
	        </c:otherwise>
        </c:choose>
    </nav>
	<section> 