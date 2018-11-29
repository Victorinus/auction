<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>


<h1>작품 정보수정</h1>


<div class="editForm" align="center">
	<form action="edit" method="post" enctype="multipart/form-data">
		<input type="hidden" name="art_sq" value="${art.art_sq}">
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
					<td><input name="art_nm" type="text" placeholder="작품명을 입력하세요"
						size="100" maxlength="300" value="${art.art_nm}" required></td>
				</tr>
				<tr>
					<th>작품요약정보</th>
					<td><input name="art_info" type="text"
						placeholder="요약 정보를 입력하세요" size="100" maxlength="4000" value="${art.art_info}"></td>
				</tr>
				<tr>
					<th>작품설명</th>
					<td><textarea name="art_info2" placeholder="작품설명을 입력하세요"
							rows="15" cols="100" maxlength="4000">${art.art_info2}</textarea></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td><input name="art_size" type="text"
						placeholder="사이즈를 입력하세요" size="100" maxlength="150" value="${art.art_size}" required></td>
				</tr>
				<tr>
					<th>제작연도</th>
					<td>
						<input name="art_cdt" type="text" placeholder="제작연도를 입력하세요" size="100" maxlength="150" value="${art.art_cdt}" required>
					</td>
				</tr>
				<tr>
					<th>낙찰가</th>
					<td>
						<input name="art_bp" type="text" size="100" maxlength="150" placeholder="낙찰가를 입력하세요" value="${art.art_bp}">
					</td>
				</tr>
				<tr>
					<th>작가명</th>
					<td>
						<input name="art_artist" type="text" placeholder="작가명을 입력하세요" size="100" maxlength="90" value="${art.art_artist}" required>
					</td>
				</tr>
				<tr>
					<th>작품 이미지</th>
					<td><input type="file" name="image"></td>
				</tr>
				<c:if test="${not empty art.art_image}">
					<tr>
						<th>기존이미지</th>
						<td>
							<img	src="${pageContext.request.contextPath}/image/art/${art.art_image}" style="width: 100; height: 100;">
							<span>${art.art_image.substring(37)}</span>
							<input type="hidden" name="prevImage" value="${art.art_image}">
						</td>
					</tr>
				</c:if>
				<tr>
					<th>제작지</th>
					<td>
						<input name="art_origin" type="text" placeholder="제작지를 입력하세요" size="100" maxlength="150" value="${art.art_origin}">
					</td>
				</tr>
				<tr>
					<th>재질</th>
					<td><input name="art_medium" type="text" placeholder="재질을 입력하세요"
						size="100" maxlength="90" value="${art.art_medium}"></td>
				</tr>
				<tr>
					<th>서명정보</th>
					<td><input name="art_sign" type="text" placeholder="서명 정보를 입력하세요"
						size="100" maxlength="150" value='${art.art_sign}'></td>
				</tr>
			<tr>
				<th>추정가</th>
				<td>
					<input name="art_ep" type="text" size="100" maxlength="150" placeholder="추정가를 입력하세요" value="${art.art_ep}">
				</td>
			</tr>
			<tr>
				<th>감정내용</th>
				<td>
					<input name="art_eval" type="text" size="100" maxlength="150" placeholder="감정내용을 입력하세요" value="${art.art_eval}">
				</td>
			</tr>
				<tr>
					<th>등록상태</th>
					<td>
						<select name="art_status" required>
							<c:choose>
								<c:when test="${art.art_status eq '출품대기'}">
									<option value="미감정">미감정</option>
									<option value="출품대기" selected>출품대기</option>
									<option value="출품">출품</option>
									<option value="판매완료">판매완료</option>
								</c:when>
								<c:when test="${art.art_status eq '출품'}">
									<option value="미감정">미감정</option>
									<option value="출품대기">출품대기</option>
									<option value="출품" selected>출품</option>
									<option value="판매완료">판매완료</option>
								</c:when>
								<c:when test="${art.art_status eq '판매완료'}">
									<option value="미감정">미감정</option>
									<option value="출품대기">출품대기</option>
									<option value="출품">출품</option>
									<option value="판매완료" selected>판매완료</option>
								</c:when>
								<c:otherwise>
									<option value="미감정" selected>미감정</option>
									<option value="출품대기">출품대기</option>
									<option value="출품">출품</option>
									<option value="판매완료">판매완료</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>
						<input name="art_dt" type="text" size="100" maxlength="150" value="${art.art_dt}" readonly>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="submit" value="변경">
						<a	href="detail?art_sq=${art.art_sq}&curPage=${param.curPage}&sortType=${param.sortType}&searchType=${param.searchType}&searchKey=${param.searchKey}">
							<input type="button" value="취소"></a>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>