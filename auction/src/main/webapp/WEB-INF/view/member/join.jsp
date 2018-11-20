<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
	table{
		width: 60%;
		margin: auto;
	}
</style>
<div class="join-title">
	<h1>회원가입 페이지</h1>
</div>
<div class="join-form">
	<form action="join">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id" placeholder="아이디 입력"><td>
				<td><input type="button" value="ID중복확인"></td>
			</tr>
			<tr>
				<th>비밀번호 입력</th>
				<td>
					<input type="password" name="user_pw" placeholder="비밀번호 입력하기">
					<input type="password" placeholder="비밀번호 재입력">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_nm" placeholder="이름"></td>
							</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="user_birth" placeholder="yyyymmdd"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<input type="radio" name="user_gender" value="남자">남자
				<input type="radio" name="user_gender" value="여자">여자
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>
					<label for="subject">제목</label>
					<input id="subject" name="subject" type="text" />
				</td>
			</tr>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>
