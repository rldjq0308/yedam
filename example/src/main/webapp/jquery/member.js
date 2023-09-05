/**
 * member.js
 */

console.log("member.js");

document.addEventListener("DOMContentLoaded", function() {
	// members.json 데이터 활용해서 초기데이터.
	fetch('../AjaxMemberList.do')
		.then((result) => result.json())
		.then((json) => {
			json.forEach(ele => {
				document.getElementById('list').appendChild(makeTr(ele));
			})
		})
		.catch((err) => console.log(err))

	// 버튼 클릭 이벤트.
	document.getElementById('addBtn').addEventListener("click", addBtnFnc);
	document.getElementById('editBtn').addEventListener("click", editBtnFnc);

	function editBtnFnc() {
		let no = document.getElementById('no').value;
		let name = document.getElementById('name').value;
		let phone = document.getElementById('phone').value;
		let age = document.getElementById('age').value;

		const target = document.getElementById('mem_' + no);
		
		fetch('../AjaxMemberEdit.do',{
			method: 'post',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			body: "no="+no +"&name="+name+"&phone="+phone+"&age="+age			
		})
		.then(resolve => resolve.json())
		.then(result => {
			if(result.retCode=="Success"){
				target.children[1].textContent = name;
				target.children[2].textContent = phone;
				target.children[3].textContent = age;
			}else{
				alert(result.result);
			}
		})
		.catch(err=> console.log(err))

		
	} // end of editBtnFnc

	function addBtnFnc() {
		let no = document.getElementById('no').value;
		let name = document.getElementById('name').value;
		let phone = document.getElementById('phone').value;
		let age = document.getElementById('age').value;

		if (!no || !name || !phone || !age) {
			alert("값을 입력해주세요.");
			return;
		}

		const memb = { no, name, phone, age }
		// json -> obj : JSON.parse()
		// obj -> json : JSON.stringify()
		// ajax call.
		fetch("../AjaxMemberAdd.do", {
			method: 'post',
			headers: { 
				//'Content-Type': 'application/x-www-form-urlencoded'
				'Content-Type': 'appication/json'
				 },
			body: JSON.stringify(memb) //'no=' + no + '&name=' + name + '&phone=' + phone + '&age=' + age
		})
			.then(resolve => resolve.json())
			.then(result => {
				console.log(result);
				if(result.retCode == 'Success'){
					document.getElementById('list').appendChild(makeTr(result.result));
				}else if(result.retCode == 'Fail'){
					alert(result.result);
				}
			})
			.catch(console.log())
			
		// initialize.
		const nodelist = document.querySelectorAll('table input');
		nodelist.forEach(function(item) {
			item.value = '';
		})
	} // end of addBtnFnc

	function makeTr(member = {}) {
		let tr = document.createElement('tr');
		tr.setAttribute('id', 'mem_' + member.mbrId);
		tr.setAttribute('data-no',member.mbrId);
		tr.addEventListener('click', function() {
			document.getElementById('no').value = tr.children[0].innerHTML;
			document.getElementById('name').value = tr.children[1].innerHTML;
			document.getElementById('phone').value = tr.children[2].innerHTML;
			document.getElementById('age').value = tr.children[3].innerHTML;
		})
		for (let field in member) {
			let td = document.createElement('td');
			td.innerText = member[field];
			tr.appendChild(td);
		}
		// 삭제버튼 . td>button
		let btn = document.createElement('button');
		btn.addEventListener('click', deleteHandler);
		btn.innerText = '삭제';
		let td = document.createElement('td');
		td.appendChild(btn);
		tr.appendChild(td);
		return tr;
	} // end of makeTr
	
	function deleteHandler(e){
		e.stopPropagation(); // event 전파되는 것을 차단.
		console.log(this.parentElement.parentElement.dataset.no);
		let delNo = this.parentElement.parentElement.dataset.no;
		fetch('../AjaxMemberDel.do',{
			method: 'post',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			body: 'no='+ delNo	 		
		})
		.then(resolve => resolve.json())
		.then(result => {
			if(result.retCode == 'Success'){
				this.parentElement.parentElement.remove();
			}else{
				alert(result.result);
			}
		})
		.catch();
		
	}

})