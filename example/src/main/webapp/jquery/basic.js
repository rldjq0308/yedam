//document.addEventListener("DOMContentLoaded", loadFunc);

$(loadFunc);

function loadFunc(){
	var p = document.createElement('p'); // dom 
	var txt = document.createTextNode("sample"); // text node/
	p.appendChild(txt);
	document.querySelector('body').appendChild(p);
	
	
	
	var pTag = $('<p />'); // jquery 객체.
	pTag.text("jquery sample");
	$('body').append(pTag);
	
	console.log(p);
	console.log(pTag);
	
	var li = document.createElement('li');
	li.innerText = "Apple";
	document.querySelector('body ul#list1').appendChild(li);
	$('body ul#list1').append($('<li />').text('Banana'));
}