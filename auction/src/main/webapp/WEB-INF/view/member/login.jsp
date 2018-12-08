<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
	.auction-member-login {
		margin: auto;
		width: 1000px;
	}
    .login-form {
 		margin-top: 150px;
		margin-bottom: 150px;
        padding: 10px;
        text-align: center;
    }
    .login-row {
        margin-top: 10px;
        margin-bottom: 10px;
        text-align: center;
        padding: 10px;
    }
    .login-input {
        width: 50%;
        height: 50px;
        padding: 10px;
        font-size: 20px;
        border: 2px solid lightgray;
    }
    .login-input:hover {
        border: 2px solid cadetblue;
    }
    .login-btn {
        width: 50%;
        height: 50px;
        font-size: 20px;
        background-color: cadetblue;
        border: 1px solid cadetblue;
        color: white;
        cursor: pointer;
    }
    .login-cfg {
        display: flex;
        flex-direction: row;
        margin: auto;
        width: 50%;
    }
    .login-cfg-left {
        padding: 10px;
        flex-grow: 1;
    }
    .login-cfg-right {
        padding: 10px;
        flex-grow: 1;
    }
    .login-cfg-right a,
    .login-cfg-right a:visited {
        text-decoration: none;
        color: black;
    }
</style>

<script src="${root}/library/js/sha256.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//클라이언트에서의 암호화 처리
	$(document).ready(function(){
	    $("input[type=password]").on("input", function(){
	        var origin = $(this).val()
	        var encrypt = SHA256(origin)
	        console.log("origin : "+origin)
	        console.log("encrypt : "+encrypt)
	        $("input[type=hidden]").attr("value", encrypt)
	        console.log("value : "+$("input[type=hidden]").attr("value"))
	    })
	    
	})
</script>

<div class="auction-member-login">
	<div class="login-form">
        <form action="login" method="post">
        	<input type="hidden" name="user_pw" value="">
            <div class="login-row">
                <input type="text" name="user_id" placeholder="아이디" class="login-input" required>
            </div>
            <div class="login-row">
                <input type="password" placeholder="비밀번호" class="login-input" required>
            </div>
            <div class="login-row">
                <input type="submit" value="로그인" class="login-btn">
            </div>
            <div class="login-row">
                <div class="login-cfg">
                    <div class="login-cfg-left">
                        <input type="checkbox" name="save_id" id="save_id">
                        <label for="save_id">아이디 저장</label>
                    </div>
                    <div class="login-cfg-right">
                        <a href="">아이디 찾기</a>
                        <span>|</span>
                        <a href="">비밀번호 찾기</a>
                        <span>|</span>
                        <a href="${root}/member/joinform">회원가입</a>
                    </div>
                </div>
            </div>
        </form>
	</div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>