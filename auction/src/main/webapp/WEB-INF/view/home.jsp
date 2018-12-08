<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<div class="home">
	<div class="adv">
		<div class="adv-tit">KG Auction에서<br>미술품 위탁을 받습니다.</div>
		<div class="adv-con">한국 근ㆍ현대 미술품이나 고서화, 목기, 민예품 등의 한국 고미술 작품들 그리고 해외 미술품 및 그 외의 각종 희귀자료나 예술관련 물품 등을 위탁 받고 있습니다.</div>
		<div class="adv-btn">
			<input type="button" class="adv-close-btn" value="닫기">
			<input type="button" class="adv-cons-btn" value="위탁신청">
		</div>
	</div>
	<div class="bgimage"></div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>