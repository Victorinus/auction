<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
	.auction-member-joinfail {
		margin: auto;
		width: 1000px;
	}
	
	.fail-img,
    .fail-link {
 		margin-top: 150px;
		margin-bottom: 150px;
        padding: 10px;
        text-align: center;
	}
    
    .fail-link a,
    .fail-link a:visited {
    	text-decoration: none;
    }
    
    .fail-btn {
        width: 120px;
        height: 60px;
        background-color: #c33234;
        border: 1px solid #c33234;
        color: white;
        font-size: 20px;
        cursor: pointer;
    }
    .fail-tit{
    	margin:200px 0;
    	text-align: center;
    	font-size:40px;
    }
</style>

<div class="auction-member-joinfail">
	<div class="fail-tit">회원가입 실패!</div>
    <div class="fail-link">
        <input type="button" value="홈으로" onclick="location.href='${root}';" class="fail-btn">
        <input type="button" value="회원가입" onclick="location.href='${root}/member/joinform';" class="fail-btn">
    </div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>