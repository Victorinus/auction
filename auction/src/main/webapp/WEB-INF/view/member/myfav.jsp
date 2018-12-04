<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>미술품 경매 | 관심작품 현황</title>
    <style>
    
    	div{
    		margin-top: 15px;
    		margin-bottom: 15px;
    	}
    	
    	#count {
    		font-size: 15px;
    		font-weight: 500;
    		color: blue;
    	}
    	
		.form-submit {
        	display: inline-block;
        }
    	
    	.form-unfav-button {
            width: 100px;
            background-color: cornflowerblue;
            padding: 2px;
            border: 1px solid cornflowerblue;
            color: white;
            font-family: 견고딕;
            font-size: 15px;    
        }
    	
    	.form-link-button {
            width: 100px;
            background-color: cornflowerblue;
            padding: 2px;
            border: 1px solid cornflowerblue;
            color: white;
            font-family: 견고딕;
            font-size: 15px;    
        }
    	
    </style>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script>
    	$(document).ready(function(){
    		//바로가기 → 응찰페이지 연계?
    		$(".form-link-button").click(function(){
				
    		})
    		
    		//관심해제
    		$(".form-unfav-button").click(function(){
    			var target = this
    			var auction_no = $(target).attr("data-auction_no")
    			var art_no = $(target).attr("data-art_no")
    			if(!confirm("관심작품을 삭제하시겠습니까?")){
    				return;
    			}
    			
    			$.ajax({
    				type: "post",
    				url: "/auction/myfav/register",
    				data : {
    					a_sq: auction_no,
    					art_sq: art_no
    				},
    				success : function(a){
    					console.log(a)
    				}
    			})
    			
    			$(target).parents("tr").remove();
    		})
    	})
    </script>
</head>
<body>
	<div class="container-fluid">
        <div class="row text-center">
            <h1>관심작품 현황</h1>
        </div>
        <div class="row">
        	<div class="col-md-8 col-md-offset-2">
        		<table class="table">
        			<thead>
        				<tr>
        					<td colspan="6">
        						<span id="count">
        							<c:set var="count" value="${fn:length(myfavList)}"></c:set>
        							${count}
        						</span>
        						 건의 작품의 내역이 있습니다.
        					</td>
        				</tr>
        				<tr>
        					<th>번호</th>
        					<th>경매명</th>
        					<th>작품명</th>
        					<th>작가명</th>
        					<th>등록일자</th>
        					<th></th>
        				</tr>
        			</thead>
        			<tbody>
        				<c:forEach var="view" items="${myfavList}" varStatus="status">
	        				<tr>
	        					<td width="10%">${status.count}</td>
        						<td>${view.fav_auction_nm}</td>
	        					<td>${view.fav_art_nm}</td>
	        					<td>${view.fav_art_artist}</td>
	        					<td>
	        						<fmt:parseDate var="parsed" value="${view.fav_dt}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
									<fmt:formatDate value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss"/>
	        					</td>
	        					<td>
	        						<div class="form-submit">
	        							<button class="form-link-button" 
	        												onclick="location.href='${root}/online/current?<%-- ${view.fav_art_no} --%>';">
	        								<div>바로가기</div>
	        							</button>
	        						</div>
	        						<button class="form-unfav-button"
	        												data-auction_no="${view.fav_auction_no}"
	        												data-art_no="${view.fav_art_no}">
	        							<div>관심해제</div>
	        						</button>
	        					</td>
	        				</tr>
        				</c:forEach>
        			</tbody>
        		</table>
        	</div>
        </div>
    </div>
</body>
</html>