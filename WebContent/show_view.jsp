<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/my.css" />
<script type="text/javascript">
function fm(){
	window.open("index.jsp","_self");
}
/* //响应购买事件
function cart(id){
	window.open("shoppingServlet?m=add&id="+id,"_self");
} */
</script>
</head>
<body topmargin="0">

	<div align="center">
	<form action="shoppingServlet">
	<input type="hidden" name="m" value="add">
	<input type="hidden" name="id" value="${show_view.id }">
	<input type="hidden" name="price" value="${show_view.price }">
		<table align="center" width=80% border="1" cellspacing="0"
			cellpadding="0" class="listing">
			<tr>
				<td colspan="2" height="94"><jsp:include flush="false" page="head.jsp"></jsp:include></td>
			</tr>
			<tr>
			
				<td width=21% height="185">
				<table border="1">
				<tr ><td rowspan="9"><img src="images/${show_view.file}" height="200" width="250"></td></tr>
				<tr><td width="100%">非诚勿扰</td></tr>
				<tr><td>${show_view.price }</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>ISBN:2</td></tr>
				<tr><td></td></tr>
				<tr><td>录入时间：${show_view.day }</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr ><td  height="62">${show_view.intro }</td></tr>
				<tr><td rowspan=2 colspan="2" align="left">
				<%-- <input type="button" onclick="cart(${show_view.id})" value="购买"/> --%>
				<input type="submit"  value="购买"/>
				<input type="button" value="返回购物大厅" onclick="fm()"/></td></tr>
				
				</table>
                </td>
			</tr>
			<tr>
				<td colspan="2" height="62">
				<jsp:include flush="false" page="tail.jsp"></jsp:include>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>