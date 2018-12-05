<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	
	input[type=button], input[type=submit]{
		margin: 0 10px;
		font-size: 16px;
		height:35px;
		width:80px;
		color: white;
		border: none;
		background-color: #c33234;
	}
	input[type=file]{
		
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


<h1>작품 등록</h1>


<div class="registerForm" align="center">
	<form action="register" method="post" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<th>작품명</th>
					<td><input name="art_nm" type="text" placeholder="작품명을 입력하세요"
						size="100" maxlength="300" required></td>
				</tr>
				<tr>
					<th>작품요약정보</th>
					<td><input name="art_info" type="text"
						placeholder="요약 정보를 입력하세요" size="100" maxlength="4000"></td>
				</tr>
				<tr>
					<th>작품설명</th>
					<td><textarea name="art_info2" placeholder="작품설명을 입력하세요"
							rows="15" cols="100" maxlength="4000"></textarea></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td><input name="art_size" type="text"
						placeholder="사이즈를 입력하세요" size="100" maxlength="150" required></td>
				</tr>
				<tr>
					<th>제작연도</th>
					<td>
						<input name="art_cdt" type="text" placeholder="제작연도를 입력하세요" size="100" maxlength="150" required>
					</td>
				</tr>
				<tr>
					<th>작가명</th>
					<td><input name="art_artist" type="text" placeholder="작가명을 입력하세요"
						size="100" maxlength="90" required></td>
				</tr>
				<tr>
					<th>작품 이미지</th>
					<td><input type="file" name="image" required></td>
				</tr>
				<tr>
					<th>제작지</th>
					<td><input name="art_origin" type="text" placeholder="제작지를 입력하세요"
						size="100" maxlength="150"></td>
				</tr>
				<tr>
					<th>재질</th>
					<td><input name="art_medium" type="text" placeholder="재질을 입력하세요"
						size="100" maxlength="90"></td>
				</tr>
				<tr>
					<th>서명정보</th>
					<td><input name="art_sign" type="text" placeholder="서명 정보를 입력하세요"
						size="100" maxlength="150"></td>
				</tr>
				<tr>
					<th>등록상태</th>
					<td><select name="art_status" required>
							<option value="미감정">미감정</option>
							<option value="출품대기" disabled>출품대기</option>
							<option value="출품" disabled>출품</option>
							<option value="판매완료" disabled>판매완료</option>
					</select></td>
				</tr>
			</tbody>
		</table>
		<div class="foot-btn">
			<input type="submit" value="등록">
			<a	href="list">
				<input type="button" value="취소"></a>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>