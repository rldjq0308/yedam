<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/4.jpg">
		<div class="page-info">
			<h2>Support</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Q&A</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!-- table section -->
	<section class="review-section">
		<div class="container">
			<div>
				<!-- <div align="left">
					<form id="searchfrm" class="newsletter-form">
						<div class="select">
							<select name="key" id="key">
								<option value="title">제목</option>
								<option value="subject">내용</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<br> <input type="text" id="val" name="val"
							placeholder="검색할 내용입력" />
						<button type="button" onclick="searchlist()" class="btn btn-primary btn-circle">
							검색 <img src="usertemplet/img/icons/double-arrow.png" alt="#" />
						</button>
					</form>
				</div> -->

				<table class="tbl_row ord_detail first table_toggle">
					<caption>문의게시판</caption>
					<colgroup>
						<col style="width: 16%">
						<col style="width: 16%">
						<col style="width: 16%">
						<col style="width: 16%">
						<col style="width: 16%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col" style="text-align: center">순번</th>
							<th scope="col" style="text-align: center">제목</th>
							<th scope="col" style="text-align: center">이름</th>
							<th scope="col" style="text-align: center">날짜</th>
							<th scope="col" style="text-align: center">답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty qnapages}">
							<c:forEach items="${qnapages}" var="q">
								<tr
									onclick="handleClickEvent('${q.qnaWriterId}', '${id}', '${q.qnaId}', '${author}')">
									<td class="subject"
										style="text-align: center; cursor: pointer;">${q.qnaId}</td>
									<td style="text-align: center; cursor: pointer;">${q.qnaTitle}</td>
									<td style="text-align: center; cursor: pointer;">${q.qnaWriter}</td>
									<td style="text-align: center; cursor: pointer;">${q.qnaDate}</td>
									<td style="text-align: center; cursor: pointer;">${q.qnaDone}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty qnapages }">
							<tr>
								<td colspan="4" align="center">문의 내역이 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>

			</div>
			<br>
			<div align="right">
				<c:if test="${not empty id }">
					<button type="button" class="_1h8gH51Art N=a:qna.write"
						onclick="location.href='qnaform.do'">Q&A 작성하기</button>
					<button type="button" class="_1h8gH51Art _228Dp2q_V1 N=a:qna.ask"
						onclick="location.href='qnalist.do?key=${id}'">나의 Q&A 조회</button>
				</c:if>
			</div>
			<!-- ============= 페이징 ===============  -->
			<div class="site-pagination" id="pagination">
				<c:if test="${pagingVO.prev }">
					<c:set var="prevPageLink"
						value="qnalist.do?pageNum=${pagingVO.pageNum - 1 }&amount=${pagingVO.amount}" />
					<c:choose>
						<c:when test="${not empty param.key}">
							<c:set var="prevPageLink"
								value="${prevPageLink}&key=${param.key}" />
						</c:when>
					</c:choose>
					<a href="${prevPageLink}">이전</a>
				</c:if>
				<c:forEach var="num" begin="${pagingVO.startPage}"
					end="${pagingVO.endPage}">
					<c:set var="pageLink"
						value="qnalist.do?pageNum=${num}&amount=${pagingVO.amount}" />
					<c:choose>
						<c:when test="${not empty param.key}">
							<c:set var="pageLink" value="${pageLink}&key=${param.key}" />
						</c:when>
					</c:choose>
					<a href="${pageLink}"
						class="${pagingVO.pageNum eq num ? 'active' : ''}">${num}</a>
				</c:forEach>
				<c:if test="${pagingVO.next}">
					<c:set var="nextPageLink"
						value="qnalist.do?pageNum=${pagingVO.endPage + 1}&amount=${pagingVO.amount}" />
					<c:choose>
						<c:when test="${not empty param.key}">
							<c:set var="nextPageLink"
								value="${nextPageLink}&key=${param.key}" />
						</c:when>
					</c:choose>
					<li><a href="${nextPageLink}">다음</a></li>
				</c:if>
			</div>
			<!-- ============= 페이징 끝 ===============  -->
			<div>
				<form id="qnafrm" method="post">
					<input type="hidden" id="qnaId" name="qnaId" /> <input
						type="hidden" id="key" name="key" value="${id }">
				</form>
			</div>
		</div>
	</section>
	<!-- End Table Section -->
	<script type="text/javascript">
		function selectQna(n) {
			document.getElementById("qnaId").value = n;
			document.getElementById("qnafrm").action = "qnaselect.do";
			document.getElementById("qnafrm").submit();
		}

		function handleClickEvent(qnaWriterId, id, qnaId, author) {
		    if (author === "ADMIN" || qnaWriterId === id) {
		        selectQna(qnaId);
		    }
		}
	</script>

</body>
</html>