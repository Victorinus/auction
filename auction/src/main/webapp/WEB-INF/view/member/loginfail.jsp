<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
.member-loginfail {
	margin: 100px 0;
}

.member-loginfail * {
	vertical-align: middle;
	text-align: center;
}

.member-loginfail a {
	color: black;
}

.member-loginfail table {
	width: 80%;
	margin: auto;
	border: 1px solid silver;
	table-layout: fixed;
	border-spacing: 0;
}

.member-loginfail th {
	padding: 10px;
	border: 0.5px solid silver;
	text-align: center;
	line-height: 30px;
	background-color: rgb(230, 230, 235);
}

.member-loginfail td {
	padding: 10px;
	border: 0.5px solid silver;
	/* line-height: 30px; */
	height: 30px;
}

.member-loginfail input, select {
	vertical-align: top;
	font-size: 15px;
	height: 35px;
	line-height: 35px;
}

.member-loginfail input[type=button], .member-loginfail input[type=submit]
	{
	margin: 0;
	padding: 0;
	color: white;
	border: none;
	width: 60px;
	background-color: #c33234;
	cursor: pointer;
}

.center {
	text-align: center;
}

.left {
	text-align: left;
}

.right {
	text-align: right;
}

.bold {
	font-weight: bold;
}

.topBar {
	min-height: 50px;
}

.w100p {
	width: 100%;
}

.w90p {
	width: 90%;
}

.w80p {
	width: 80%;
}

.w70p {
	width: 70%;
}

.w60p {
	width: 60%;
}

.w50p {
	width: 50%;
}

.w40p {
	width: 40%;
}

.w30p {
	width: 30%;
}

.w20p {
	width: 20%;
}

.w10p {
	width: 10%;
}
</style>

<div class="member-loginfail">0
	<h1>로그인 실패!</h1>
	<div>
		<a href="joinform"><input type="button" value="회원가입"></a>
		<a href="login"><input type="button" value="로그인"></a>
	</div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>