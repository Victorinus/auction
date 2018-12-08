<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/template/header.jsp" />
<jsp:include page="/WEB-INF/view/admin/member/menu.jsp" />

<style>
.admin-member-edit {
	margin: 100px 0;
}

.admin-member-edit * {
	vertical-align: middle;
}

.admin-member-edit table {
	width: 60%;
	margin: auto;
	border-top: solid 2px;
	border-bottom: solid 2px;
	border-spacing: 0;
}

.admin-member-edit th {
	width: 150px;
	height: 40px;
	border-bottom: solid 1px;
	border-color: silver;
	text-align: center;
	background-color: rgb(230, 230, 235);
}

.admin-member-edit td {
	line-height: 40px;
	padding: 10px;
	border-bottom: solid 1px;
	border-color: silver;
}

.admin-member-edit input {
	padding: 3px 10px;
	margin: 0;
	line-height: 25px;
	width: 100%;
}

.gdRadio {
	padding: 0 10px;
	margin: 0px;
	text-align: left;
}

.admin-member-edit input[type=radio] {
	width: 25px;
}

.admin-member-edit #email_front, .admin-member-edit #domain {
	width: 160px;
	height: 30px;
}

.admin-member-edit #sample6_postcode {
	width: 100px;
}

.admin-member-edit input[type=button], .admin-member-edit input[type=submit]
	{
	vertical-align: top;
	margin: 0 10px;
	font-size: 16px;
	height: 35px;
	width: 80px;
	color: white;
	border: none;
	background-color: #c33234;
	cursor: pointer;
}

.admin-member-edit #post-btn {
	height: 29px;
	width: 130px;
	font-size: 14px;
	vertical-align: middle;
}

.admin-member-edit #sample6_address {
	margin: 5px 0 10px;
}

.admin-member-edit select {
	padding: 3px 5px;
	vertical-align: top;
	height: 35px;
	line-height: 25px;
}

.admin-member-edit textarea {
	line-height: 21px;
	width: 100%;
	height: 200px;
	resize: none;
}

.admin-member-edit .foot-btn {
	text-align: center;
	line-height: 50px;
	margin: 10px 0;
}
</style>

<script>
	function editMenuColor() {
		$(".admin-menu-member-edit").css("color", "#e41e21");
	}
	editMenuColor();

	function chooseEmail() {
		var select = document.getElementById("emaildomain");
		var domain = document.getElementById("domain");
		if (select.value == "직접입력") {
			domain.value = '';
			domain.setAttribute("placeholder", "이메일도메인(뒷부분)입력");
		} else {
			domain.value = '';
			domain.value = select.value;
		}
	}

	function submitEmail() {
		document.getElementById("user_email").value = document
				.getElementById("email_front").value
				+ '@' + document.getElementById("domain").value;
	}
</script>

<div class="admin-member-edit" align="center">
	<form action="edit" method="post">
		<input type="hidden" name="user_sq" value="${member.user_sq}">
		<input type="hidden" name="user_pw" value="${member.user_pw}">
		<input type="hidden" name="user_grade" value="${member.user_grade}">
		<input type="hidden" name="reg_dt" value="${member.reg_dt}">
		<%-- <input
			type="hidden" name="chg_dt" value="${member.chg_dt}"> --%>
		<table>
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input name="user_id" type="text" size="100"
						maxlength="300" value='${member.user_id}' readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="user_nm" type="text" size="100"
						maxlength="300" value='${member.user_nm}' readonly></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input name="user_birth" type="text"
						placeholder="생년월일 입력(yyyymmdd)" size="100" maxlength="300"
						value="${member.user_birth}"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<div class="gdRadio">
							<c:choose>
								<c:when test="${member.user_gender eq '남자' }">
									<input type="radio" name="user_gender" id="male" value="남자"
										checked>
									<label for="male">남자</label>
									<input type="radio" name="user_gender" id="female" value="여자">
									<label for="female">여자</label>
								</c:when>
								<c:otherwise>
									<input type="radio" name="user_gender" id="male" value="남자">
									<label for="male">남자</label>
									<input type="radio" name="user_gender" id="female" value="여자"
										checked>
									<label for="female">여자</label>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
				<tr>
					<th>휴대전화번호</th>
					<td><input type="tel" name="user_phone"
						placeholder="휴대전화번호 입력" value="${member.user_phone}"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" name="user_tel" placeholder="휴대전화번호 입력"
						value="${member.user_tel}"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><c:set var="split" value="${fn: split(member.user_email, '@')}"/>
							<input type="text" id="email_front" placeholder="이메일 앞부분 입력"
								value="${split[0]}"> @ <input type="text" id="domain"
								placeholder="이메일 도메인(뒷부분) 입력" value="${split[1]}">
						 <select id="emaildomain" onchange="chooseEmail();">
							<option value="직접입력">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
					</select> <input type="hidden" id="user_email" name="user_email" value="">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="user_post" type="text" id="sample6_postcode"
						placeholder="우편번호" value="${member.user_post}"> <input
						type="button" id="post-btn" onclick="sample6_execDaumPostcode()"
						value="우편번호 찾기"> <input name="user_addr1" type="text"
						id="sample6_address" placeholder="주소" value="${member.user_addr1}">
						<input name="user_addr2" type="text" id="sample6_address2"
						placeholder="상세주소" value="${member.user_addr2}"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><fmt:parseDate var="parsed" value="${member.reg_dt}"
							pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
							value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시 mm분" /></td>
				</tr>
				<tr>
					<th>최종 수정일자</th>
					<td><fmt:parseDate var="parsed" value="${member.chg_dt}"
							pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
							value="${parsed}" pattern="yyyy년 MM월 dd일(E) a hh시 mm분" /></td>
				</tr>
			</tbody>
		</table>
		<div class="foot-btn">
			<input type="submit" value="수정" onclick="submitEmail();"> <a
				href="list"> <input type="button" value="취소">
			</a>
		</div>
	</form>
</div>

<!-- 다음 주소검색 API 등록 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>

<jsp:include page="/WEB-INF/view/template/footer.jsp" />