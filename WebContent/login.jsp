<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
fieldset {
	margin: 1em 0;
	padding: 1em;
	border: 1px solid #ccc;
	background: #f8f8f8;
}

legend {
	font-weight: bold;
}

label {
	display: block;
}
</style>
<script>
	function J(f) {
		if (f.email.value == "") {
			window.alert("请输入名字！");
			f.email.focus();
			return (false);
		}
		if (f.password.value == "") {
			window.alert("请输入密码");
			f.password.focus();
			return (false);
		}
	}
</script>


</head>
<body>
	<div align="center">
		<table align="center" width=80% border="1" cellspacing="0"
			cellpadding="0" class="listing">
			<tr>
				<td colspan="2" height="94"><jsp:include flush="false"
						page="head.jsp"></jsp:include></td>
			</tr>
			<tr>

				<td width=21% height="185">
					<div align="center" style="width: 600px;">
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

					</div>

				</td>
			</tr>


			<tr>
				<td colspan="2" height="62"><jsp:include flush="false"
						page="tail.jsp"></jsp:include></td>
			</tr>
		</table>
	</div>
</body>
</html>