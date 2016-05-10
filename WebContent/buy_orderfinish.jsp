<%@page import="com.Bean.java.User"%>
<%@page import="com.sun.java.swing.plaf.motif.resources.motif"%>
<%@page import="com.Bean.java.MovieInfo"%>
<%@page import="com.Dao.java.MyCartBODao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <% Object list=
request.getAttribute("list");
 Object num=
	 request.getAttribute("num");
User u=(User)request.getAttribute("user");
%> 	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/my.css" />
<script type="text/javascript">


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
							<td colspan="6" align="center"><img src="images/view4.PNG"
								height="55" width="100%"></td>

						</tr>

					</table>
					
					<div align="center">
						<form action="UserServlet" method="post">
							<input type="hidden" name="m" value="login">
							<fieldset>
								<legend>订单详细信息</legend>
								<table  border="1" width=100% >
									<tr>
										<td  align="center">订单号</td>
										<td  align="center">收货人</td>
										<td align="center">收货地址</td>
										<td  align="center">邮编</td>
										<td  align="center">电话</td>
										<td  align="center">总价</td>
										<td  align="center">用户名</td>
										<td align="center">电子邮箱</td>
										<td  align="center"></td>
									</tr>
						<tr>
							<td align="center"> <%=num %> </td>
							<td align="center"><%=u.getReal_name() %></td>
							<td align="center"><%=u.getReal_address() %></td>
							<td align="center"><%=u.getReal_postcode() %></td>
							<td align="center"><%=u.getReal_phone() %></td>
							 <td align="center"><%=list %></td> 
							<td align="center"><%=u.getName()%> </td>
							<td align="center"> <%=u.getEmail()%> </td>
							
							<td align="center" width=9%><a href="upload?m=show_view&id=<%=u.getId() %>">查看邮箱</a></td> 
						</tr>
								</table>
							</fieldset>

						</form>
						<table border="1" width=100%>
							<tr>
								<td align="left" style="width: 100%;">
									您的订单已经完成，服务器将在稍后时候向您的电子邮箱发送确认信息，并确认订单信息。</td>
							</tr>
						</table>
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