<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
<link href="css/boardedit.css" rel="stylesheet" type="text/css">
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
		</div>
	</section>
	<!-- End Page top section -->

	<!-- Table Section -->
	<section class="review-section">
		<div class="container">
			<div>
				<div align="center">
					<h2 class="text-white">게시글 수정</h2>
				</div>
				<br>
				<div>
					<form id="frm" action="postedit.do" method="post"
						enctype="multipart/form-data">
						
						<div class="card">
							<div class="card-edit">
								<div class="myinfo">
								아이디<input type="text" id="postWriterId" name="postWriterId"
										value="${n.postWriterId }" readonly />
								작성자명<input type="text" id="postWriter" name="postWriter"
										value="${n.postWriter }" readonly />
								작성일자<input type="date" id="postCreateDate"
										name="postCreateDate" readonly="readonly" />
								</div>
								<div class="title">
								제목<input type="text" id="postTitle" name="postTitle" value="${n.postTitle }" />
								</div>
								<div class="msg">
								내용<textarea id="summernote"
											name="postSubject">${n.postSubject }</textarea> <script>
												$('#summernote')
														.summernote(
																{
																	codeviewFilter : false, // 코드 보기 필터 비활성화
																	codeviewIframeFilter : false, // 코드 보기 iframe 필터 비활성화

																	height : 500, // 에디터 높이
																	minHeight : null, // 최소 높이
																	maxHeight : null, // 최대 높이
																	focus : true, // 에디터 로딩 후 포커스 설정
																	lang : 'ko-KR', // 언어 설정 (한국어)

																	toolbar : [
																			[
																					'style',
																					[ 'style' ] ], // 글자 스타일 설정 옵션
																			[
																					'fontsize',
																					[ 'fontsize' ] ], // 글꼴 크기 설정 옵션
																			[
																					'font',
																					[
																							'bold',
																							'underline',
																							'clear' ] ], // 글자 굵게, 밑줄, 포맷 제거 옵션
																			[
																					'color',
																					[ 'color' ] ], // 글자 색상 설정 옵션
																			[
																					'table',
																					[ 'table' ] ], // 테이블 삽입 옵션
																			[
																					'para',
																					[
																							'ul',
																							'ol',
																							'paragraph' ] ], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
																			[
																					'height',
																					[ 'height' ] ], // 에디터 높이 조절 옵션
																			[
																					'insert',
																					[
																							'link',
																							'video' ] ], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
																			[
																					'view',
																					[
																							'codeview',
																							'fullscreen',
																							'help' ] ], // 코드 보기, 전체 화면, 도움말 옵션
																	],

																	fontSizes : [
																			'8',
																			'9',
																			'10',
																			'11',
																			'12',
																			'14',
																			'16',
																			'18',
																			'20',
																			'22',
																			'24',
																			'28',
																			'30',
																			'36',
																			'50',
																			'72', ], // 글꼴 크기 옵션

																	styleTags : [
																			'p', // 일반 문단 스타일 옵션
																			{
																				title : 'Blockquote',
																				tag : 'blockquote',
																				className : 'blockquote',
																				value : 'blockquote',
																			}, // 인용구 스타일 옵션
																			'pre', // 코드 단락 스타일 옵션
																			{
																				title : 'code_light',
																				tag : 'pre',
																				className : 'code_light',
																				value : 'pre',
																			}, // 밝은 코드 스타일 옵션
																			{
																				title : 'code_dark',
																				tag : 'pre',
																				className : 'code_dark',
																				value : 'pre',
																			}, // 어두운 코드 스타일 옵션
																			'h1',
																			'h2',
																			'h3',
																			'h4',
																			'h5',
																			'h6', // 제목 스타일 옵션
																	]
																});
											</script>
								첨부파일 ${n.postAttach}
								<input type="file" id="file" name="file"
										value="${n.postAttach }" />
								</div>
							</div>
						</div>
						<div align="right">
							<button class="btn btn-primary btn-jelly btn-lg" type="submit">
								수정
							</button>
							<button class="btn btn-danger btn-jelly btn-lg" type="button"
								onclick="location.href='postlist.do'">
								취소
							</button>
						</div>
						<input type="hidden" id="postId" name="postId"
							value="${n.postId }" />
					</form>
					<div></div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Table Section -->
	<script type="text/javascript">
	document.getElementById('postCreateDate').value = new Date().toISOString().substring(0, 10);;
	</script>
</body>
</html>