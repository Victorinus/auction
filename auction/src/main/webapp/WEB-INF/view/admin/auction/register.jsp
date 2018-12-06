<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
	.admin-auction-register table{
		width: 60%;
		margin: auto;
		border-top: solid 2px;
		border-bottom: solid 2px;
	}
	.admin-auction-register th{
		width:150px;
		border-bottom: solid 1px;
		border-color:silver;
		text-align: center;
		background-color: rgb(230, 230, 235);
	}
	.admin-auction-register td{
		line-height: 40px;
		padding : 10px;
		border-bottom: solid 1px;
		border-color:silver;
	}
	.admin-auction-register input{
		padding:3px 10px;
		margin:0;
		line-height: 25px;
		width:100%;
	}
	.admin-auction-register #sample6_postcode{
		width:100px;
	}
	.admin-auction-register input[type=button], .admin-auction-register input[type=submit]{
		vertical-align:top;
		margin: 0 10px;
		font-size: 16px;
		height:35px;
		width:80px;
		color: white;
		border: none;
		background-color: #c33234;
	}
	.admin-auction-register input[type=file]{
		padding:3px 0;
		height: 35px;
	}
	.admin-auction-register #post-btn{
		height:35px;
		width:130px;
		font-size:14px;
		vertical-align: middle;
	}
	.admin-auction-register #sample6_address{
		margin: 5px 0 10px;
	}
	.admin-auction-register select{
		padding:3px 5px;
		vertical-align:top;
		height:35px;
		line-height: 25px;
	}
	.admin-auction-register textarea{
		line-height: 21px;
		width:100%;
		height: 200px;
	}
	.admin-auction-register .foot-btn{
		text-align:center;
		line-height:50px;
		margin: 10px 0;
	}
</style>

<h1>경매 등록</h1>

<div class="admin-auction-register" align="center">
	<form action="register" method="post" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<th>경매명</th>
					<td><input name="auction_nm" type="text"
						placeholder="경매명을 입력하세요" size="100" maxlength="300" required></td>
				</tr>
				<tr>
					<th>경매요약정보</th>
					<td><input name="auction_info" type="text"
						placeholder="요약 정보를 입력하세요" size="100" maxlength="4000"></td>
				</tr>
				<tr>
					<th>경매장소</th>
					<td>
						<input name="auction_post" type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" id="post-btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						<input name="auction_addr1" type="text" id="sample6_address" placeholder="주소">
						<input name="auction_addr2" type="text" id="sample6_address2" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>경매시작시간</th>
					<td><input name="auction_start" class="datetimepicker"
						type="text" required></td>
				</tr>
				<tr>
					<th>경매종료시간</th>
					<td><input name="auction_end" class="datetimepicker"
						type="text" required></td>
				</tr>
				<tr>
					<th>경매종류</th>
					<td><select name="auction_type" required>
							<option value="online">온라인경매</option>
							<option value="offline">오프라인경매</option>
					</select></td>
				</tr>
				<tr>
					<th>대표이미지</th>
					<td><input type="file" name="image"></td>
				</tr>
			</tbody>
		</table>
		<div class="foot-btn">
			<input type="submit" value="등록">
			 <a href="list">
			 	<input type="button" value="취소"></a>
		</div>
	</form>
</div>

<!-- 다음 주소검색 API 등록 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
            function sample6_execDaumPostcode() {
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
                        if(data.userSelectedType === 'R'){
                            //법정동명이 있을 경우 추가한다.
                            if(data.bname !== ''){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if(data.buildingName !== ''){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>