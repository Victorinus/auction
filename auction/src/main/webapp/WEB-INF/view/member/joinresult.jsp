<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
	.auction-member-joinresult {
		margin: auto;
		width: 1000px;
	}
	
	.welcome-img,
    .welcome-link {
 		margin-top: 150px;
		margin-bottom: 150px;
        padding: 10px;
        text-align: center;
	}
    
    .welcome-link a,
    .welcome-link a:visited {
    	text-decoration: none;
    }
    
    .welcome-btn {
        width: 150px;
        height: 75px;
        background-color: cadetblue;
        border: 1px solid cadetblue;
        color: white;
        font-size: 25px;
        cursor: pointer;
    }
</style>

<div class="auction-member-joinresult">
	<div class="welcome-img">
		<div class="image">
			<img src="${root}/image/member/welcome.png">
		</div>
	</div>
    <div class="welcome-link">
        <input type="button" value="홈으로" onclick="location.href='${root}';" class="welcome-btn">
        <input type="button" value="로그인" onclick="location.href='${root}/member/login';" class="welcome-btn">
    </div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>