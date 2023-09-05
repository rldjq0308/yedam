<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/faq.css" rel="stylesheet" type="text/css">
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
				<a href="home.do">Home</a> / FAQ
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<section class="faq-section">
		<div class="container">
			<div class="row">
				<!-- ***** FAQ Start ***** -->
				<div class="col-md-12 offset-md-1">

					<div class="faq-title text-center pb-3">
						<h2>FAQ</h2>
					</div>
				</div>
				<div class="col-md-12 offset-md-1">
					<div class="faq" id="accordion">
						
						<c:if test="${not empty faqs }">
							<c:forEach items="${faqpages }" var="f">					
							<div class="card">
								<div class="card-header" id="faqHeading-${f.faqId }">
									<div class="mb-0">
										<h5 class="faq-title" data-toggle="collapse"
											data-target="#faqCollapse-${f.faqId }" data-aria-expanded="true"
											data-aria-controls="faqCollapse-${f.faqId }">
											<span class="badge">${f.faqId }</span>${f.faqTitle }
										</h5>
									</div>
								</div>
								<div id="faqCollapse-${f.faqId }" class="collapse"
									aria-labelledby="faqHeading-${f.faqId }" data-parent="#accordion">
									<div class="card-body" onclick="selectFaq(${f.faqId })">
										<p>${f.faqSubject }</p>
									</div>
								</div>
							</div>				
							</c:forEach>
						</c:if>
						
					</div>
				</div>
			</div>
			<!-- ============= 페이징 ===============  -->
		<div class="site-pagination" id="pagination" style="margin-left:400px; margin-top:50px;">
			<c:forEach var="num" begin="${pagingVO.startPage }"
				end="${pagingVO.endPage }">
				<a href="faqlist.do?pageNum=${num}&amount=${pagingVO.amount}" style="color:#E91E63;"
					class="${pagingVO.pageNum eq num ? 'active' : '' }">${num}</a>
			</c:forEach>
		</div>
		<!-- ============= 페이징 끝 ===============  -->
		</div>	
	</section>
	
	

	<br>
	<div align="right">
		<c:if test="${author eq 'ADMIN' }">
		<button type="button" class="site-btn"
			onclick="location.href='faqform.do'">글쓰기</button>
		</c:if>
	</div>
	<div>
		<form id="faqfrm" method="post">
			<input type="hidden" id="faqId" name="faqId" />
		</form>
	</div>
	<script type="text/javascript">
	function selectFaq(n){
		var author = "${author}";
		console.log(author);
		if(author != 'ADMIN'){
			return;
		}
		document.getElementById("faqId").value = n;
		document.getElementById("faqfrm").action ="faqselect.do"; 
		document.getElementById("faqfrm").submit();
	}
		
 	const items = document.querySelectorAll(".accordion button");

 	function toggleAccordion() {
 	  const itemToggle = this.getAttribute('aria-expanded');
 	  
 	  for (i = 0; i < items.length; i++) {
 	    items[i].setAttribute('aria-expanded', 'false');
 	  }
 	  
 	  if (itemToggle == 'false') {
 	    this.setAttribute('aria-expanded', 'true');
 	  }
 	}

 	items.forEach(item => item.addEventListener('click', toggleAccordion));
 	
</script>
</body>
</html>