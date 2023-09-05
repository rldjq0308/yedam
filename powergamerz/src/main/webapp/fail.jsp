<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>


<%
 String message = request.getParameter("message");
  String code = request.getParameter("code");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제 실패</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <style type="text/css">
  		body{
    		display:flex;
    		flex-direction: column;
    	}
    	.container{
    		width: 300px;
    		margin: auto;
    		padding: 20px;
    		border: 2px solid #0a3afa;
    		border-radius: 10px;
    		box-shadow: 0 4px 6px rbga(0,0,0,0.24);
    		background: #fffadb;
    		text-align: center;    		
    	}
    	h1{
    		font-weight: bold;
    		color: 00071f;
    		margin-bottom: 30px;
    	}
    	span{
    		display:block;
    		color: #888;
    		margin-bottom: 20px;
    	}
    	p{
    		color: #888;
    		margin-bottom: 10px;
    	}
    	button{
	    	background: #0a3afa;
	    	color: #fffadb;
	    	border: none;
	    	padding: 5px 10px;
	    	border-radius: 5px;
	    	box-shadow: 0 1px 1px 0 rbga(0,0,0,0.1);
        }
        button:hover {
			background-color: #353191;
		}
    </style>
</head>
<body>
<section>
	<div class="container">
    <h1>결제 실패</h1>
    <p><%= message %></p>
    <span>에러코드: <%= code %></span>
   <form action="cart.do" id="backC" method="post" >
   <button type="submit">돌아가기</button></form>
    </div>
    

</section>
</body>
</html>