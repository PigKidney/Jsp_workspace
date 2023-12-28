<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="chap06.servlet.ApplicationServlet.Pizza" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도미노 피자</title>
<style type="text/css">
	#pizzalist{
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 10px;
		margin: 0 auto;
		width: 100%;
		/* border: solid 1px black; */
	}
	
	#pizzalist > div{
		/* border: solid 1px black; */
		margin: 0 auto;
		font-weight: 700;
	}
	
	#head{
		font-size: 100px;
		text-indent: 0.8em;
	}
	
	#table {
	
		margin: 0 auto;
		padding-top: 50px;
		
	}
	
	#bag {
		display: grid;
		grid-template-rows: repeat(4, 1fr);
	}
</style>
</head>
<body>


	<div id="head">Pizza Menu</div>
	<br>
	<div id="pizzalist">
		<% 
		for(Pizza pizza : (List<Pizza>)request.getAttribute("pizzas")){
			out.print("<div>");
			out.print(String.format("<img src=%s alt=%s width=\"300\", height=\"auto\"><br>", pizza.getImgURL(),pizza.getName()));
			out.print(String.format("<span>%s</span> <br>", pizza.getName()));
			out.print(String.format("<span>L %s</span> &nbsp;&nbsp;", pizza.getPrice().get("L")));
			out.print(String.format("<span>M %s</span>", pizza.getPrice().get("M")));
			out.print("</div>");
		}
		%> 
	</div>
	
	
	<table border="0" id="table">
		<tr>
			<td>종류: 
				<select name="name" id="name">
					<% 
					for(Pizza pizza : (List<Pizza>)request.getAttribute("pizzas")){
						out.print(String.format("<option value=%s>%s</option>", pizza.getName(), pizza.getName()));
					}
					%> 
				</select>
			</td>
			<td>크기 : 
				<select name="size" id="size">
					<option value="L">L</option>
					<option value="M">M</option>
				</select>
			</td>
			<td>갯수 : 
				<input type="number" min="0" max="10" step="1" value="0" name="count" id="count">
			</td>
			<td><button type="button" id="add">장바구니 추가</button> </td>
		</tr>
	</table>
	
	
	<h3>장바구니</h3>
	<div>
		<form action="/chap06/views/add" id="bag">
			
		<button type="submit" id="pay">결제하기</button>
		</form>
	</div>
	
	
	
	<script type="text/javascript">		
		const name = document.getElementById('name');
		const size = document.getElementById('size');
		const count = document.getElementById('count');
		const bag = document.getElementById('bag');
		
		const addBtn = document.getElementById('add');
		
		/* function createFristSpan(result) {
		    const span = document.createElement('span');
		    span.innerText = result.name +" "+result.size +" "+result.count ;
		    span.classList.add('box');
		    return span;
		} */
		
		function createFristSpan(result) {
		    const span = document.createElement('span');
		    span.innerText = result.name +" "+result.size +" "+result.count ;
		    span.classList.add('box');
		    return span;
		}
		
		const basket = [];
		addBtn.addEventListener('click', (e) => {
			let result = {};
			result.name = name.options[name.selectedIndex].text;
			result.size = size.options[size.selectedIndex].value;
			result.count = count.value;
			
			bag.appendChild(createFristSpan(result));
			basket.push(result);
			console.log(basket);
		});
		
		
		const payBtn = document.getElementById('pay');
		payBtn.addEventListener('click', (e) => {
			basket
		});
	</script>
	
</body>
</html>