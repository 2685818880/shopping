<%@page import="com.sun.java.swing.plaf.motif.resources.motif"%>
<%@page import="com.Bean.java.MovieInfo"%>
<%@page import="com.Dao.java.MyCartBODao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/my.css" />
<script type="text/javascript">
function delAll(){
	window.open("shoppingServlet?m=delAll","_self");
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
			<table border="1">
			<tr>
						<td colspan="6" align="center"><img src="images/view2.PNG"
							height="55" width="100%"></td>
					</tr>
			</table>
			<div align="center" >
						<form action="UserServlet" method="post" onsubmit="return J(f);">
							<input type="hidden" name="m" value="login">
							<fieldset>
								<legend>login</legend>
								<font color="red">${info}</font>
								<table>
								
									<tr>
										<td><label for="email">email</label></td>
										<td><input type="text" name="email"
											style="width: 300px; height: 20px" onblur="" /></td>
										<td><font color="red">*</font></td>
									</tr>
									<tr>
										<td><label for="password">password</label></td>
										<td><input type="text" name="password"
											style="width: 300px; height: 20px" /></td>
										<td><font color="red">*</font></td>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td><input type="submit"
											style="width: 100px; height: 25px" value="submit">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
											style="width: 100px; height: 25px" value="reset"></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td><a href="regist.jsp">注册新用户</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#">忘记密码</a></td>
										<td></td>
									</tr>
									
								</table>
							</fieldset>

						</form>
						<table border="1" width=100%>
							<tr>
								<td align="left" style="width: 90%;"></td>
								<td align="right"><img src="images/view2-1.png"></td>
							</tr>
						</table>
					</div>
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