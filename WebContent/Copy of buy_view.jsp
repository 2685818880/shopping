<%@page import="com.sun.java.swing.plaf.motif.resources.motif"%>
<%@page import="com.Bean.java.MovieInfo"%>
<%@page import="com.Dao.java.MyCartBODao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	ArrayList list=(ArrayList)request.getAttribute("list");
	//MyCartBODao mbo=(MyCartBODao)session.getAttribute("mycart");
	System.out.print(list);
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/my.css" />
<script type="text/javascript">
function delAll(){
	window.open("shoppingServlet?m=delAll","_self");
}
function down(){
	window.open("buy_login.jsp","_self");
}
/*  function update(){
	window.open("shoppingServlet?m=updateGoods","_self");
}  */
</script>

</head>
<body topmargin="0">
<div align="center">
	<table align="center" width=80% border="1" cellspacing="0"
		cellpadding="0" class="Listing">
		<tr>
			<td colspan="2" height="94"><jsp:include flush="false"
					page="head.jsp"></jsp:include></td>
		</tr>
		<tr>
			<td width=21% height="185">
			<form action="shoppingServlet">
			<input type="hidden" name="m" value="updateGoods">
			
				<table border="1">
					<tr>
						<td colspan="6" align="center"><img src="images/view1.png"
							height="55" width="100%"></td>
					</tr>
					<tr>
						<td width="25%" align="center">编号</td>
						<td width="25%" align="center">名称</td>
						<td width="25%" align="center">单位</td>
						<td width="25%" align="center" colspan="3">数量</td>
					</tr>
					<%-- <%
					for(int i=0;i<list.size();i++){
						MovieInfo mo=(MovieInfo)list.get(i);
						
					%>
						<tr>
							<td align="center"><%=mo.getId()%></td>
							<td align="center">非诚勿扰</td>
							<td align="center"><%=mo.getPrice() %></td>
							<td align="center" width=9%>
							<input name="goodsId" type="hidden" value="<%=mo.getId()%>" size="7">
							<input name="newNums" type="text" value="<%=mbo.geGoodsNumById(mo.getId()+"")%>" size="7">
							<input type="hidden" name="n" value="mo.getPrice()"></td>
							<td align="center" width=9%><a href="shoppingServlet?m=del&id=<%=mo.getId()%>">删除</a></td>
							<td align="center" width=9%><a href="upload?m=show_view&id=<%=mo.getId()%>">查看</a></td>
						</tr>
						<%
						}
						%> --%>
				 <c:forEach items="${list}" var="stu">
						<tr>
							<td align="center">${stu.id }
							
							</td>
							<td align="center">非诚勿扰</td>
							<td align="center">${stu.price }</td>
							<td align="center" width=9%>
							<input name="goodsId" type="hidden" value="${stu.id }" size="7">
							<%-- <input name="newNums" type="text" value=""<%=mbo.geGoodsNumById(mo.getId()+"")%>" size="7"> --%>
							<input type="hidden" name="n" value="${stu.price }"></td>
							<td align="center" width=9%><a href="shoppingServlet?m=del&id=${stu.id}">删除</a></td>
							<td align="center" width=9%><a href="upload?m=show_view&id=${stu.id}">查看</a></td>
						</tr>
					</c:forEach> 
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td align="center"><input onclick ="delAll();" name="delsubmit" type="button" value="删除全部书籍"></td>
						<td align="center"><input  name="updatesubmit" type="submit" value="修 改 数 量"></td>
						<td colspan="3">&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td colspan="6">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="6">
							<table border="1" width=100%>
								<tr>
									<td align="left">您共选择了价值￥<%-- <%=mbo.getAllPrice() %> --%>元的商品 ，点 <a href="index.jsp">此处继续购物。</a>
									</td>
									<td align="right" onclick="down()"><img src="images/view2-1.png"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td rowspan=2 ></td>
					</tr>

				</table>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="62" align="center" width=100%><jsp:include flush="false"
					page="tail.jsp"></jsp:include></td>
		</tr>
	</table>
	</div>
</body>
</html>