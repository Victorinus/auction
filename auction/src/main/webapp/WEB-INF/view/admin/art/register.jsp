<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<h1>작품 등록</h1>


<div class="registerForm" align="center">
	<form action="register" method="post" enctype="multipart/form-data">
		<table border="1" width="1000px">
			<thead>
				<tr>
					<th>구분</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>작품명</th>
					<td>
						<input name="art_nm" type="text" placeholder="작품명을 입력하세요" size="100" maxlength="300">
					</td>
				</tr>
				<tr>
					<th>작품요약정보</th>
					<td>
						<input name="auction_info" type="text" placeholder="요약 정보를 입력하세요" size="100" maxlength="4000">
					</td>
				</tr>
				<tr>
					<th>작품장소</th>
					<td>
						<input name="auction_post" type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input name="auction_addr1" type="text" id="sample6_address" placeholder="주소">
						<input name="auction_addr2" type="text" id="sample6_address2" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>작품시작시간</th>
					<td>
						<input name="auction_start" class="datetimepicker" type="text">
						
					</td>
				</tr>
				<tr>
					<th>작품종료시간</th>
					<td>
						<input name="auction_end" class="datetimepicker" type="text">
					</td>
				</tr>
				<tr>
					<th>작품종류</th>
					<td>
						<select name="auction_type">
							<option value="online">온라인작품</option>
							<option value="offline">오프라인작품</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>대표이미지</th>
					<td>
						<input type="file" name="image">
					</td>
				</tr>
			</tbody>	
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
						<a href="list">
							<input type="button" value="취소">
						</a>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>