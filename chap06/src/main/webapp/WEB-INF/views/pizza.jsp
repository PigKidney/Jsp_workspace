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
</style>
</head>
<body>

<%-- 	<% 
		for(Pizza pizza : (List<Pizza>)request.getAttribute("pizzas")){
			out.print(String.format("<img src=%s alt=%s width=\"300\", height=\"auto\"><br>", pizza.getImgURL(),pizza.getName()));
			out.print(String.format("<div>%s</div> <br>", pizza.getName()));
			out.print(String.format("<span>L %s M %s</span><br>", pizza.getPrice().get("L"),pizza.getPrice().get("M")));

		}
	%>  --%>
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
	
	
	<form action="/chap06/views/add">
	<table border="0" id="table">
		<tr>
			<td>종류: 
				<span name="name" id="name">
					<% 
						out.print((List<Pizza>)request.getAttribute("pizzas") );
					%> 
				</span>
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
	
	</form>
	<script type="text/javascript">
		const pizzalist = document.getElementById('pizzalist');
		
		/* const createPizzaDiv = () => {
			const pizza = document.createElement('div');
		    /* boxs.classList.add('zone'); */
		    pizzalist.appendChild(pizza);
		}
		 
		const size = document.getElementById('size');
		const count = document.getElementById('count');
		const sizeValue = size.innerText;
		const countValue = count.value;
		const addBtn = document.getElementById('add');
		<% 
			HashMap<String, Integer> pick = new HashMap<>();
			HashMap<String,HashMap<String, Integer>> select = new HashMap<>();
		
		%> 
		addBtn.addEventListener('click', (e) => {
			
		});
	</script>
	
</body>
</html>