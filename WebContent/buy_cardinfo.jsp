<%@page import="com.Bean.java.User"%>
<%@page import="com.sun.java.swing.plaf.motif.resources.motif"%>
<%@page import="com.Bean.java.MovieInfo"%>
<%@page import="com.Dao.java.MyCartBODao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	ArrayList a1=(ArrayList)request.getAttribute("list");
	///MyCartBODao mbo=(MyCartBODao)session.getAttribute("mycart");
	///System.out.print(a1);
	MyCartBODao mbo=(MyCartBODao)session.getAttribute("mycart");
	User u=(User)request.getAttribute("user");
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/my.css" />
<script type="text/javascript">
	function up() {
		window.open("buy_login.jsp", "_self"); 
	}
	function update_mycart() {
		 window.open("shoppingServlet", "_self"); 
	}
	function down() {
		 window.open("UserServlet?m=buy_order", "_self"); 
	}
	/* function down() {
		 window.open("buy_orderfinish.jsp", "_self"); 
	} */
	 /* function down(){
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
					<table border="1">
						<tr>
							<td colspan="6" align="center"><img src="images/view3.png"
								height="55" width="100%"></td>
						</tr>
					</table>
					<div align="center">
						<form action="UserServlet" method="post"">
							<input type="hidden" name="m" value="update">
							<input type="hidden" name="id" value="<%=u.getId() %>">
							<fieldset>
								<legend>购买人信息</legend>
								<table border="1" width=60%>
									<tr>
										<td><label for="name">用户名称</label></td>
										<td><input type="text" name="name" value="<%=u.getName() %>"
											style="width: 300px; height: 20px" onblur="" /></td>
										<td><font color="red">*</font></td>
									</tr>
									<tr>
										<td><label for="unique">真实姓名</label></td>
										<td><input type="text" name="real_name" value="<%=u.getReal_name() %>"
											style="width: 300px; height: 20px" /></td>
										<td><font color="red">*</font></td>
									</tr>
									<tr>
										<td><label for="address">家庭地址</label></td>
										<td><input type="text" name="real_address"value="<%=u.getReal_address() %>"
											style="width: 300px; height: 20px" onblur="" /></td>
										<td><font color="red">*</font></td>
									</tr>
									<tr>
										<td><label for="phone">联系电话</label></td>
										<td><input type="text" name="real_phone" value="<%=u.getReal_phone() %>"
											style="width: 300px; height: 20px" /></td>
										<td><font color="red">*</font></td>
									</tr>
									<tr>
										<td><label for="email">电子邮件</label></td>
										<td><input type="text" name="email" value="<%=u.getEmail() %>"
											style="width: 300px; height: 20px" onblur="" /></td>
										<td><font color="red">*</font></td>
									</tr>
									<tr>
										<td><label for="postcode">邮编号码</label></td>
										<td><input type="text" name="real_postcode" value="<%=u.getReal_postcode() %>"
											style="width: 300px; height: 20px" /></td>
										<td><font color="red">*</font></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td><input onclick="delAll();" name="delsubmit"
											type="button" value="完成订单"> 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="updatesubmit" type="submit" value="修 改 信息"></td>
									</tr>									
								</table>
							</fieldset>

						</form>
					
						<fieldset>
								<legend>购物车信息</legend>
				 <table border="1">
				
					<tr>
						<td width="25%" align="center">编号</td>
						<td width="25%" align="center">名称</td>
						<td width="25%" align="center">单位</td>
						<td width="25%" align="center" colspan="3">数量</td>
					</tr>
					<%
					for(int i=0;i<a1.size();i++){
						MovieInfo mo=(MovieInfo)a1.get(i);
						
					%>
						<tr>
							<td align="center"><%=mo.getId()%></td>
							<td align="center">非诚勿扰</td>
							<td align="center"><%=mo.getPrice() %></td>
							<td align="center" width=9%>
							<input name="goodsId" type="hidden" value="<%=mo.getId()%>" size="7">
						   <%=mbo.geGoodsNumById(mo.getId()+"")%>
							<input type="hidden" name="n" value="mo.getPrice()"></td>
						</tr>
						<%
						}
						%>
					<tr>
						<td colspan="6">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="6">
							<table border="1" width=100%>
								<tr>
									<td align="left">您共选择了价值￥<%=mbo.getAllPrice() %>元的商品 ，点 <a href="index.jsp">此处继续购物。</a>
									</td>
								</tr>
							</table>
							<table border="1" width=100%>
								<tr>
									<td align="center"><input onclick="update_mycart()" type="button" value="返回修改我的购物车"></a>
									</td>
								</tr>
							</table>
						</td>
					</tr>

				</table> 
				<table border="1" width=100%>
							<tr>
								<td align="left" style="width: 85%;"></td>
								<td align="right" onclick="up()"><img src="images/up1-1.PNG"></td>
								<td align="right" ><img src="images/down1-1.PNG"></td>
								<td align="right" >
								<form action="UserServlet" method="post">
								<input type="hidden" name="m" value="buy_order" >
								<input type="hidden" name="email" value="<%=u.getEmail() %>">
								 <input type="submit"  value="下一步">
								</form>
								</td>
							
							</tr>
						</table>
						</fieldset>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="62" align="center" width=100%><jsp:include
						flush="false" page="tail.jsp"></jsp:include></td>
			</tr>
		</table>
	</div>
</body>
</html>