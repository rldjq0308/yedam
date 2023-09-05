<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="css/search.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.postsubject {
  overflow: hidden;
  white-space: normal;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  word-break: keep-all;   
}
</style>
</head>
<body>


	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/2.jpg">
		<div class="page-info">
			<h2>Community</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / Discussion
			</div>
			<!-- 검색창 영역 -->
			<div class="serchtab">
				<form id="searchfrm">											
					<div class="wrap">
					   <div class="search">
						   <div class="select">
							<select name="key" id="key">
								<option value="title">제목</option>
								<option value="subject">내용</option>
								<option value="writer">작성자</option>
							</select>
							</div>&nbsp;&nbsp;
					      <input type="text" id="val" name="val" class="searchTerm" placeholder="검색할 내용 입력.">
					      <button type="button" class="searchButton" onclick="searchlistPaging()">
					        <i class="fa fa-search"></i>
					     </button>
					   </div>
					</div>				
				</form>
			</div>
			<!-- 검색창 영역 end -->
		</div>
	</section>
	<!-- Page top end-->

	<!-- Review section -->
	<section class="review-section">
		<div class="container">
			<div id="contents-p">
				<div id="contents">
					<c:if test="${not empty posts }">
						<c:forEach items="${postpages }" var="d">
							<div class="review-item">
								<div class="row">
									<div class="col-lg-4">
										<div class="review-pic">
											<c:if test="${not empty d.postAttach}">
												<img src="attach/post/${d.postAttach }" height="300"
													width="500">
											</c:if>
											<c:if test="${empty d.postAttach}">
												<img src="attach/post/noimg.jpg" height="300" width="500">
											</c:if>
										</div>
									</div>
									<div class="col-lg-8">
										<div class="review-content text-box text-white">
											<div class="top-meta">${d.postCreateDate }
												/ 작성자 <a href="">${d.postWriter }</a>
											</div>
											<h3>${d.postTitle }</h3>
											<div class="postsubject">
											<div id="${d.postId }">
											<p>${d.postSubject }</p>
											</div>
											</div>
											<a href="#" onclick="selectPost(${d.postId })"
												class="read-more">Read More <img
												src="usertemplet/img/icons/double-arrow.png" alt="#" /></a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<!-- ============= 페이징 ===============  -->
			<div id="paging-p">
				<div class="site-pagination" id="pagination">
					<c:forEach var="num" begin="${pagingVO.startPage }"
						end="${pagingVO.endPage }">
						<c:set var="pageLink"
								value="postlist.do?pageNum=${num}&amount=${pagingVO.amount}" />
							<c:choose>
								<c:when test="${not empty param.key && not empty param.val}">
									<c:set var="pageLink" value="${pageLink}&key=${param.key}&val=${param.val}" />
								</c:when>
							</c:choose>		
						<a href="${pageLink}"
							class="${pagingVO.pageNum eq num ? 'active' : '' }">${num}</a>
					</c:forEach>
					<input type="hidden" id="page" value=${pagingVO.pageNum } />
				</div>
			</div>		
			<!-- ============= 페이징 끝 ===============  -->
			
			
			<div align="right">
			<c:if test="${not empty id }">
				<button class="btn btn-primary btn-jelly btn-lg" type="button"
					onclick="location.href='postform.do'">
					글쓰기
				</button>
			</c:if>
			</div>
			<div>
				<form id="postfrm" method="post">
					<input type="hidden" id="postId" name="postId" value="${d.postId }" />
				</form>
			</div>
		</div>

		<script type="text/javascript">
	<c:forEach items="${postpages }" var="item">
		removeHtml(${item.postId});
	</c:forEach>
	
	function removeHtml(id){
		const $el = document.getElementById(id);
		const newText = $el.innerHTML.replace(/(<([^>]+)>)/gi, "");
		$el.innerHTML = newText;
		console.log(newText);
	}
		
	function selectPost(p){
		document.getElementById("postId").value = p;
		document.getElementById("postfrm").action ="postselect.do"; 
		document.getElementById("postfrm").submit();
	}
	
 	function searchlist(){
		//ajax를 이용해서 검색결과를 가져오고 화면을 재구성한다
 		let key = document.getElementById("key").value;
		let val = document.getElementById("val").value;
		
		let payload = "key="+key+"&val="+val;
		let url = "ajaxpostsearch.do";
		
		fetch(url,{
			method:"post",
			headers:{
				'content-type' :'application/x-www-form-urlencoded'
			},
			body: payload
		}).then(response => response.json())
		   .then(json => htmlConvert(json));
	} 
 	
 	function searchlistPaging(){
 		let key = document.getElementById("key").value;
		let val = document.getElementById("val").value;
		
		location.href = "postlist.do?key="+key+"&val="+val;
 	}
	
 	function htmlConvert(datas){
		var myDiv = document.getElementById("contents");
		var parent = myDiv.parentElement;
		parent.removeChild(myDiv);
  		
		var newDiv = document.createElement("div");
		newDiv.id = 'contents';
 		// tbody에 데이터 추가
 		newDiv.innerHTML = datas.map(data=>htmlView(data)).join(''); 

		var p = document.getElementById("contents-p");
		p.appendChild(newDiv);
 	}
 	
  	function htmlView(data){
 		return `
		 <div class="review-item" >
					<div class="row">
						<div class="col-lg-4">
							<div class="review-pic">
								<img src="attach/post/\${data.postAttach }" height="300" width="500">
							</div>
						</div>
						<div class="col-lg-8">
							<div class="review-content text-box text-white">
								<div class="top-meta">\${data.postCreateDate } /  작성자 <a href="">\${data.postWriter }</a></div>
								<h3>\${data.postTitle }</h3>
								<p>content</p>
								<a href="#" onclick="selectPost(\${data.postId })" class="read-more">Read More  <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></a>
							</div>
						</div>
					</div>
				</div>
 		`
 	} 

</script>
	</section>
	<!-- Review section end-->


</body>
</html>