<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" type="text/css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="./js/bootstrap.min.js" ></script>	
	
<style>
</style>

</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 작성</h1>
		</div>
		<div>
			<div>
				<table border="1">
					<tr>
						<th width="100">작성자</th>
						<td align="center">${n.noticeWriter }</td>
						<th width="100">작성일자</th>
						<td align="center">${n.noticeDate }</td>
						<th width="100">조회수</th>
						<td align="center">${n.noticeHit }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">${n.noticeTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5"><textarea id="noticeSubject"
								name="noticeSubject" cols="80" rows="4" readonly="readonly">${n.noticeSubject }</textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="5">${n.noticeAttach }</td>
					</tr>
				</table>
			</div>
			<br>
			<div>
				<c:if test="${name eq n.noticeWriter }">
					<button type="button" onclick="noticeUpdate('E')">수정</button>&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="noticeUpdate('D')">삭제</button>&nbsp;&nbsp;&nbsp;			
			</c:if>
				<button type="button" onclick="location.href='noticelist.do'">목록</button>
			</div>
			<div>
				<form id="frm" method="post">
					<input type="hidden" id="noticeId" name="noticeId"
						value="${n.noticeId }" />
				</form>
			</div>
		</div>
	</div>
	<div>
	<label>내용<input id="reply"></label>
	<label>작성자<input id="replyer"></label>
	<button id="addRow">댓글 작성</button>
	</div>
	<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>댓글번호</th>
                <th>댓글내용</th>
                <th>작성자</th>
                <th>작성일자</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>댓글번호</th>
                <th>댓글내용</th>
                <th>작성자</th>
                <th>작성일자</th>
            </tr>
        </tfoot>
    </table>

	<script type="text/javascript">
		function noticeUpdate(str) {
			if (str == 'E') {
				document.getElementById("frm").action = "noticeeditform.do";
			} else {
				document.getElementById("frm").action = "noticedelete.do";
			}

			document.getElementById("frm").submit();
		}
	</script>

	<script src="./js/reply.js"></script>
	<script>
		var noticeId = '<c:out value="${n.noticeId }" />'
		console.log(noticeId);
		var reply = new Reply();
		
		function addNewRow() {
			
			var content = $('input[id=reply]').val();
			var replyer = $('input[id=replyer]').val();
			
			console.log(replyer);
			
			var param = {noticeId, reply:content, replyer}
			reply.replyAdd(param, function(data){
				console.log(data);
				table.row
		        .add({
		        	replyId:data.data.replyId,
		        	reply:data.data.reply,
		        	replyer:data.data.replyer,
		        	replyDate:data.data.replyDate
		        })
		        .draw(false);
			});    
			
		}
		
		// datatable 목록 출력.
		const table = new DataTable('#example', {
		    ajax: './jquery/AjaxDatatable.do',
		    columns:[
		    	{data: 'replyId'},
		    	{data: 'reply'},
		    	{data: 'replyer'},
		    	{data: 'replyDate'}
		    ]
		});
		
		document.querySelector('#addRow').addEventListener('click', addNewRow);
		
		addNewRow();
	</script>
</body>
</html>