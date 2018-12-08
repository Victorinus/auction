<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/template/header.jsp"/>
<jsp:include page="/WEB-INF/view/admin/art/menu.jsp"/>

<style>
	.admin-art-evalreg{
		margin: 100px 0;
	}
	.admin-art-evalreg *{
		vertical-align: middle;
		text-align: center;
	}
	.admin-art-evalreg table{
		width: 60%;
		margin: auto;
		border-top: solid 2px;
		border-bottom: solid 2px;
		border-spacing: 0;
	}
	.admin-art-evalreg th{
		border-bottom: solid 1px;
		border-color:silver;
		text-align: center;
		background-color: rgb(230, 230, 235);
	}
	.admin-art-evalreg td{
		line-height: 40px;
		padding : 10px;
		border-bottom: solid 1px;
		border-color:silver;
		text-align:left;
		vertical-align: middle;
	}
	.admin-art-evalreg input{
		line-height: 25px;
		width:100%;
		padding : 3px 10px;
	}
	.admin-art-evalreg input[type=text], .admin-art-evalreg input[type=number]{
		text-align:left;
	}
	.admin-art-evalreg input[type=button], .admin-art-evalreg input[type=submit]{
		margin: 0 10px;
		font-size: 16px;
		height:35px;
		width:80px;
		color: white;
		border: none;
		background-color: #c33234;
	}
	.admin-art-evalreg input[type=file]{
		padding: 3px 0;
	}
	
	.admin-art-evalreg select{
		padding : 3px 10px;
		height: 35px;
	}
	
	.admin-art-evalreg textarea{
		line-height: 21px;
		width:100%;
		height: 200px;
		text-align:left;
		padding : 5px 10px;
		resize: none;
	}
	.admin-art-evalreg .foot-btn{
		text-align:center;
		line-height:50px;
		margin: 10px 0;
	}
</style>
<script>
	function editMenuColor(){
		$(".admin-menu-art-eval").css("color","#e41e21");
	}
	editMenuColor();
</script>

<div class="admin-art-evalreg" align="center">
	<form action="evalreg" method="post" enctype="multipart/form-data">
		<input type="hidden" name="art_sq" value="${art.art_sq}">
		<table>
			<tbody>
				<tr>
					<th>작품명</th>
					<td><input name="art_nm" type="text" value='${art.art_nm}' readonly></td>
				</tr>
				<tr>
					<th>작가명</th>
					<td><input name="art_artist" type="text" value='${art.art_artist}' readonly></td>
				</tr>
				<tr>
				<th>작품이미지</th>
					<td>
						<img	src="${pageContext.request.contextPath}/image/art/${art.art_image}" style="width: 100; height: 100;">
						<span>${art.art_image.substring(37)}</span>
						<input type="hidden" name="art_image" value="${fn:escapeXml(art.art_image)}">
					</td>
				</tr>
				<tr>
					<th>추정가</th>
					<td>
						<input name="art_ep" type="number" value='0' required>
					</td>
				</tr>
				<tr>
					<th>감정내용</th>
					<td>
						<textarea name="art_eval" maxlength="1333"></textarea>
					</td>
				</tr>
				<tr>
					<th>등록상태</th>
					<td>
						<select name="art_status" required>
							<option value="미감정" disabled>미감정</option>
							<option value="출품대기" selected>출품대기</option>
							<option value="출품" disabled>출품</option>
							<option value="판매완료" disabled>판매완료</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="foot-btn">
			<input type="submit" value="등록">
			<a	href="eval">
				<input type="button" value="취소"></a>
		</div>
	</form>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>