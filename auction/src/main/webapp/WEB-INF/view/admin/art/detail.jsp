<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
	table{
		width: 60%;
		margin: auto;
		border-top: solid 2px;
		border-bottom: solid 2px;
	}
	th{
		border-bottom: solid 1px;
		border-color:silver;
		text-align: center;
		background-color: rgb(230, 230, 235);
	}
	td{
		line-height: 40px;
		padding : 10px;
		border-bottom: solid 1px;
		border-color:silver;
	}
	input{
		line-height: 25px;
		width:100%;
	}
	
	input[type=button]{
		margin: 0 10px;
		font-size: 16px;
		height:35px;
		width:80px;
		color: white;
		border: none;
		background-color: #c33234;
	}
	
	select{
		padding-top: 5px;
		padding-bottom: 5px;
	}
	
	textarea{
		line-height: 21px;
		width:100%;
		height: 200px;
	}
	.foot-btn{
		text-align:center;
		line-height:50px;
		margin: 10px 0;
	}
</style>

<h1>작품 상세정보</h1>


<div class="detailInfo" align="center">
	<table>
		<tbody>
			<tr>
				<th>작품명</th>
				<td><input name="art_nm" type="text"  maxlength="300" value='${art.art_nm}' readonly></td>
			</tr>
			<tr>
				<th>작품요약정보</th>
				<td><input name="art_info" type="text"	  maxlength="4000" value='${art.art_info}'  readonly></td>
			</tr>
			<tr>
				<th>작품설명</th>
				<td><textarea name="art_info2" maxlength="4000" readonly>${art.art_info2}</textarea></td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td><input name="art_size" type="text"	 maxlength="150" value='${art.art_size}' readonly></td>
			</tr>
			<tr>
				<th>제작연도</th>
				<td>
					<input name="art_cdt" type="text"  maxlength="150" value="${art.art_cdt}" readonly>
				</td>
			</tr>
			<tr>
				<th>낙찰가</th>
				<td>
					<input name="art_bp" type="text"  maxlength="150" readonly
						<c:choose>
							<c:when test="${art.art_bp eq 0}">
								value="낙찰된 금액이 없습니다"
							</c:when>
							<c:otherwise>
								value="KRW <fmt:formatNumber value='${art.art_bp}' pattern='#,###' />"
							</c:otherwise>
						</c:choose>>
				</td>
			</tr>
			<tr>
				<th>작가명</th>
				<td><input name="art_artist" type="text"  maxlength="90" value="${art.art_artist}" readonly></td>
			</tr>
			<tr>
				<th>작품이미지</th>
				<td>
					<img	src="${pageContext.request.contextPath}/image/art/${art.art_image}" style="width: 100; height: 100;">
					<span>${art.art_image.substring(37)}</span>
					<input type="hidden" name="art_image" value="${art.art_image}">
				</td>
			</tr>
			<tr>
				<th>제작지</th>
				<td>
					<input name="art_origin" type="text"  maxlength="150" value="${art.art_origin}" readonly>
				</td>
			</tr>
			<tr>
				<th>재질</th>
				<td><input name="art_medium" type="text"  maxlength="90" value="${art.art_medium}" readonly></td>
			</tr>
			<tr>
				<th>서명정보</th>
				<td><input name="art_sign" type="text"  maxlength="150" value='${art.art_sign}' readonly></td>
			</tr>
			<tr>
				<th>추정가</th>
				<td>
					<input name="art_ep" type="text"  maxlength="150" readonly
						<c:choose>
							<c:when test="${art.art_status eq '미감정'}">
								value="미감정 상품입니다"
							</c:when>
							<c:otherwise>
								value="KRW <fmt:formatNumber value='${art.art_ep}' pattern='#,###' />"
							</c:otherwise>
						</c:choose>>
				</td>
			</tr>
			<tr>
				<th>감정내용</th>
				<td>
					<input name="art_eval" type="text"  maxlength="150" readonly
						<c:choose>
							<c:when test="${art.art_status eq '미감정'}">
								value="미감정 상품입니다"
							</c:when>
							<c:otherwise>
								value="${art.art_eval}"
							</c:otherwise>
						</c:choose>>
				</td>
			</tr>
			<tr>
				<th>등록상태</th>
				<td>
					<input name="art_status" type="text"  maxlength="150" value="${art.art_status}" readonly>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
					<input name="art_dt" type="text"  maxlength="150" value="${fn:substring(art.art_dt, 0, 19)}" readonly>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="foot-btn">
		<a	href="edit?art_sq=${art.art_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
			<input type="button" value="수정"></a>
		<a	href="list?curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
			<input type="button" value="목록"></a>
		<a href="delete?art_sq=${art.art_sq}">
		<input type="button" value="삭제"></a>
	</div>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>