
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
  
	<!-- Select Account Author Start -->
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<h2 class="tm-block-title">List of Accounts</h2>
					<p class="text-white">Accounts</p>
					<select class="custom-select" name="selectauthor" id="selectauthor"
						onchange="javascript:searchList()">
						<option>Select account</option>
						<option value="All">All</option>
						<option value="ADMIN">Admin</option>
						<option value="USER">User</option>
					</select>
				</div>
			</div>
		</div>
		<!-- Select Account Author Start -->
		<!-- User List Start -->
		<div class="col-13 tm-block-col" id="userlist" name="userlist"
			style="display: none">
			<div
				class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">

				<h2 class="tm-block-title">Member List</h2>
				<table class="table" id="table11">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">Birth</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Email</th>
							<th scope="col">Author</th>
							<th scope="col">Edate</th>
						</tr>
					</thead>
					<tbody id="tablebody">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- User List End -->
		<!-- row -->

		<div class="row tm-content-row" name="singleuser" id="singleuser" style="display: none">
			<div class="tm-block-col tm-col-avatar">
				<div class="tm-bg-primary-dark tm-block tm-block-avatar">
					<h2 class="tm-block-title">Change Avatar</h2>
					<div class="tm-avatar-container">
						<img id="avatarimg" name="avatarimg"
							src="adminmaster/img/noman.png" alt="Avatar"
							class="tm-avatar img-fluid mb-4" /> <a href="#"
							class="tm-avatar-delete-link"> <i
							class="far fa-trash-alt tm-product-delete-icon"></i>
						</a>
					</div>
					<input class="btn btn-primary btn-block text-uppercase"
						value="Upload New Photo">

				</div>
			</div>
			<div class="tm-block-col tm-col-account-settings">
				<div class="tm-bg-primary-dark tm-block tm-block-settings">
					<h2 class="tm-block-title">Account Settings</h2>
					<form action="" class="tm-signup-form row">
						<div class="form-group col-lg-6">
							<label for="name">Account Name</label> <input id="name2"
								name="name2" type="text" class="form-control validate"
								placeholder="" />
						</div>
						<div class="form-group col-lg-6">
							<label for="birth">Account Birth</label> <input id="birth2"
								name="birth2" type="text" class="form-control validate" />
						</div>
						<div class="form-group col-lg-6">
							<label for="phone">Account Phone</label> <input id="phone2"
								name="phone2" type="text" class="form-control validate" />
						</div>
						<div class="form-group col-lg-6">
							<label for="address">Account Address</label> <input id="address2"
								name="address2" type="text" class="form-control validate" />
						</div>
						<div class="form-group col-lg-6">
							<label for="email">Account Email</label> <input id="email2"
								name="email2" type="text" class="form-control validate" />
						</div>
						<div class="form-group col-lg-6">
							<label for="author">Account Author</label> <input id="author2"
								name="author2" type="text" class="form-control validate" />
						</div>

						<div class="form-group col-lg-6">
							<label class="tm-hide-sm">&nbsp;</label>
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">
								Update Your Profile</button>
						</div>
						<div class="form-group col-lg-6">
							<label class="tm-hide-sm">&nbsp;</label>
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase" onclick="deleteuser()">
								Delete Your Account</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- row End -->
	</div>

	<script type="text/javascript">

   	       	     	
     	function searchList(){
			
			//ajax를 이용해 검색결과 가져와 화면을 재구성
			
			let val = document.getElementById("selectauthor").value;
			let payload = "val="+val;
			let url = "ajaxmembersearch.do"
				if(val != null){
	     			document.getElementById("userlist").style.display = "block";
	     		} 
			fetch(url, {method:"POST", headers:{"content-Type":"application/x-www-form-urlencoded",}, body: payload})
				.then(response => response.json())
				.then(json => htmlConvert(json));
		}
		
     	function htmlConvert(datas) {
     	    const tbody = document.querySelector('tbody');
     	    tbody.innerHTML = datas.map(data => htmlView(data)).join('');
     	    
     	    // 클릭 이벤트 다시 등록
     	    const rows = tbody.querySelectorAll('tr');
     	    rows.forEach(row => {
     	        row.style.cursor = 'pointer';
     	       const memberIdCell = row.querySelector('td:first-child');
     	      if (memberIdCell) {
     	          const memberId = memberIdCell.textContent;
     	          row.addEventListener('click', () => selectUser(memberId));
     	      }
     	    });
     	}
		
		function htmlView(data){			
			return `
			<tr >
			<td id="\${data.memberId}" name="key">\${data.memberId}</td>
			<td>\${data.memberName}</td>
			<td>\${data.memberBirth}</td>
			<td>\${data.memberPhone}</td>
			<td>\${data.memberAddress}</td>
			<td>\${data.memberEmail}</td>
			<td>\${data.memberAuthor}</td>
			<td>\${data.memberEdate}</td>
		</tr>
				`
		}
				
		function selectUser(memberId) {
			let key = document.getElementById(memberId).textContent;
			
			if(key != null){
     			document.getElementById("singleuser").style.display = "block";
     		} 
			
			let payload = "key="+key;
			let url = "memberselect.do";
			
			fetch(url,{
				method:"post",
				headers:{
					'content-type' : 'application/x-www-form-urlencoded'					
				},
				body: payload
			}).then(response => response.json())
			  .then(json => populateFormData(json));
	        
	}	
		function populateFormData(data) {
			if (data) {
		        document.getElementById("name2").value = data.memberName;
		        document.getElementById("birth2").value = data.memberBirth;
		        document.getElementById("phone2").value = data.memberPhone;
		        document.getElementById("address2").value = data.memberAddress;
		        document.getElementById("email2").value = data.memberEmail;
		        document.getElementById("author2").value = data.memberAuthor;
		    }
		}
  		     	
      </script>
</body>
</html>