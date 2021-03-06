<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
.member-joinform {
	margin: auto;
	width: 1000px;
}
.member-joinform .join-title {
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 10px;
	text-align: center;
}
table {
	width: 100%;
	margin: auto;
	border-top: solid 2px;
	border-bottom: solid 2px;
	border-spacing: 0;
}

th {
	border-bottom: solid 1px;
	border-color: silver;
	text-align: center;
	background-color: rgb(230, 230, 235);
	width:150px;
}

td {
	line-height: 40px;
	padding : 10px;
	border-bottom: solid 1px;
	border-color:silver;
	text-align:left;
	vertical-align: middle;
}

input {
	line-height: 25px;
	padding : 3px 10px;
}

#user_post, #deliver_post {
	margin-bottom: 1px;
}

#user_addr1, #deliver_addr1 {
	margin-top: 1px;
	margin-bottom: 1px;
	width: 100%;
}

#user_addr2, #deliver_addr2 {
	margin-top: 1px;
	width: 100%;
}

input[type=button] {
	margin: 0 10px;
	font-size: 14px;
	height: 30px;
	width: 100px;
	color: white;
	border: none;
	background-color: #c33234;
}

select {
	padding-top: 5px;
	padding-bottom: 5px;
}

.addr_alert {
	margin-left: 20px;
	font-size: 5px;
}

label {
	padding-top: 5px;
	padding-bottom: 5px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.gdRadio {
	padding: 0 10px;
}

.joinConfirm {
	margin: 25px 0;
	text-align: center;
}
.join-form{
	margin: 10px 0 50px;
}
.joinConfirm>input[type=submit], .joinConfirm>a>input[type=button] {
	font-size: 18px;
	width: 120px;
	height: 40px;
	border: none;
	color: white;
	background-color: #c33234;
}
</style>

<script src="${root}/library/js/sha256.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function chooseEmail() {
		var select = document.getElementById("emaildomain");
		var domain = document.getElementById("domain");
		if(select.value=="직접입력"){
			domain.value = '';
			domain.setAttribute("placeholder", "이메일도메인(뒷부분)입력");	
		}else{
			domain.value = '';
			domain.value = select.value;
		}
	}
	function submitEmail(){
		document.getElementById("user_email").value=
			document.getElementById("email_front").value+'@'+document.getElementById("domain").value;
	}
	//클라이언트에서의 암호화 처리
	$(document).ready(function(){
    	$("#password").on("input", function(){
        var origin = $(this).val()
        var encrypt = SHA256(origin)
        console.log("origin : "+origin)
        console.log("encrypt : "+encrypt)
        $("#encrypt").attr("value", encrypt)
        console.log("value : "+$("#encrypt").attr("value"))
    	})
	})
	
</script>
<div class="member-joinform">
	<div class="join-title">
		<h1>회원가입 페이지</h1>
	</div>
	<div class="join-form">
		<form action="joinform" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="user_id" placeholder="아이디 입력"><input
						type="button" value="중복확인"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="password" placeholder="비밀번호 입력">
						<input type="hidden" id="encrypt" name="user_pw" value="">
						<input type="password" placeholder="비밀번호 재입력"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="user_nm" placeholder="이름 입력"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="user_birth"
						placeholder="yyyymmdd" maxlength="8"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<div class="gdRadio">
							<input type="radio" name="user_gender" id="male" value="남자">
							<label for="male">남자</label> <input type="radio"
								name="user_gender" id="female" value="여자"> <label
								for="female">여자</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><input type="tel" name="user_phone"
						placeholder="휴대전화번호 입력"> <input type="button" value="중복확인">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" name="user_tel" placeholder="전화번호 입력">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email_front"
						placeholder="이메일 앞부분 입력"> @ <input type="text" id="domain"
						placeholder="이메일 도메인(뒷부분) 입력"> <select id="emaildomain"
						onchange="chooseEmail();">
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
					<td><input id="user_post" name="user_post" type="text"
						placeholder="우편번호" readonly="readonly"><input
						type="button" onclick="userFindPost()" value="주소검색"><span
						class="addr_alert">※주소를 입력해 주세요</span><br> <input
						id="user_addr1" name="user_addr1" type="text" width="500px"
						placeholder="기본주소"><br> <input id="user_addr2"
						name="user_addr2" type="text" placeholder="상세주소"> <input
						type="hidden" name="user_grade" value="준회원"></td>
				</tr>
			</table>
			<div class="joinConfirm">
				<input type="submit" value="회원가입" onclick="submitEmail();">
				<a href="${root}"> <input type="button" value="취소">
				</a>
			</div>
		</form>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
		function userFindPost() {
			new daum.Postcode({
				oncomplete: function(data) {
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
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.querySelector('#user_post').value = data.zonecode; //5자리 새우편번호 사용
					document.querySelector('#user_addr1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.querySelector('#user_addr2').focus();
				}
			}).open();
		}
		function deliverFindPost() {
			new daum.Postcode({
				oncomplete: function(data) {
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
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.querySelector('#deliver_post').value = data.zonecode; //5자리 새우편번호 사용
					document.querySelector('#deliver_addr1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.querySelector('#deliver_addr2').focus();
				}
			}).open();
		}
	</script>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>
