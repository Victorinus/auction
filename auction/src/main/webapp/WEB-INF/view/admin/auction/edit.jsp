<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<h1>경매 정보수정</h1>

<div class="editForm" align="center">
	<form action="edit" method="post" enctype="multipart/form-data">
		<input type="hidden" name="auction_sq" value="${auction.auction_sq}">
		<table border="1" width="1000px">
			<thead>
				<tr>
					<th>구분</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>경매명</th>
					<td><input name="auction_nm" type="text"
						placeholder="경매명을 입력하세요" size="100" maxlength="300"
						value="${auction.auction_nm}" required></td>
				</tr>
				<tr>
					<th>경매요약정보</th>
					<td><input name="auction_info" type="text"
						placeholder="요약 정보를 입력하세요" size="100" maxlength="4000"
						value="${auction.auction_info}"></td>
				</tr>
				<tr>
					<th>경매장소</th>
					<td><input name="auction_post" type="text"
						id="sample6_postcode" placeholder="우편번호"
						value="${auction.auction_post}"> <input type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input name="auction_addr1" type="text" id="sample6_address"
						placeholder="주소" value="${auction.auction_addr1}"> <input
						name="auction_addr2" type="text" id="sample6_address2"
						placeholder="상세주소" value="${auction.auction_addr2}"></td>
				</tr>
				<tr>
					<th>경매시작시간</th>
					<td><input name="auction_start" class="datetimepicker"
						type="text" value="${auction.auction_start}" required></td>
				</tr>
				<tr>
					<th>경매종료시간</th>
					<td><input name="auction_end" class="datetimepicker"
						type="text" value="${auction.auction_end}" required></td>
				</tr>
				<tr>
					<th>경매종류</th>
					<td><select name="auction_type" required>
							<c:choose>
								<c:when test="${auction.auction_type ne 'online'}">
									<option value="online">온라인경매</option>
									<option value="offline">오프라인경매</option>
								</c:when>
								<c:otherwise>
									<option value="online">온라인경매</option>
									<option value="offline" selected>오프라인경매</option>
								</c:otherwise>
							</c:choose>
					</select></td>
				</tr>
				<tr>
					<th>대표이미지</th>
					<td><input type="file" name="image"></td>
				</tr>
				<c:if test="${not empty auction.auction_image}">
					<tr>
						<th>기존이미지</th>
						<td><img
							src="${pageContext.request.contextPath}/image/auction/${auction.auction_image}"
							style="width: 100; height: 100;"> <span>${auction.auction_image.substring(37)}</span>
							<input type="hidden" name="prevImage"
							value="${auction.auction_image}"></td>
					</tr>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2"><input type="submit" value="수정"> <a
						href="list?curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<input type="button" value="취소">
					</a> <a href="delete?auction_sq=${auction.auction_sq}"> <input
							type="button" value="삭제"></a></th>
				</tr>
			</tfoot>
		</table>
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

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>