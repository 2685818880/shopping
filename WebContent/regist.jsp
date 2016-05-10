<%@page import="com.Util.java.CodeController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%
    CodeController cc = new CodeController();
   // cc.getRandcode(request, response);
   // String c=cc.getRandomString(5);
   // System.out.print(c);
   // String pageNum =(String)request.getAttribute("pageCount");

%> --%>

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
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/js/jquery.validate.js"></script>
</head>
<body>
	<div align="center">
		<table align="center" width=80% border="1" cellspacing="0"
			cellpadding="0" class="listing">
			<tr>
				<td colspan="2" height="94"><jsp:include flush="false" page="head.jsp"></jsp:include></td>
			</tr>
			<tr>
			
				<td width=21% height="150">
<div align="center" style="width: 600px;">
		<form action="UserServlet" method="post">
			<input type="hidden" name="m" value="regist">
			<fieldset>
				<legend>regist</legend>
				<font color="red">${info}</font>
				<table width="100%" border="0" align="left" cellpadding="5"
					cellspacing="3">
					<tr>
						<td width="13%" align="right">用户名</td>
						<td width="87%"><input name="username" type="text" size="25" style="width: 300px; height: 20px"
							id="username" onblur="is_registered(this.value);" class="inputBg" />
							<span id="username_notice" style="color: #FF0000"> *</span></td>
					</tr>
					<tr>
						<td align="right">email</td>
						<script>
							$(function() {
								$("#form")
										.validate(
												{
													rules : {
														username : {
															required : true
														},
														email : {
															required : true,
															email : true,
															remote : { //验证用户名是否存在
																type : "POST",
																url : "UserServlet/exists", //servlet
																data : {
																	name : function() {
																		return $(
																				"#email")
																				.val();
																	}
																}
															}
														},
														password : {
															required : true
														},
														confirm_password : {
															required : true,
															equalTo : "#password"
														}
													},
													messages : {
														username : "请输入姓名",
														email : {
															required : "请输入Email地址",
															email : "请输入正确的email地址",
															remote : "邮箱已经存在"
														},
														password : "请输入密码",
														confirm_password : {
															required : "请输入确认密码",
															equalTo : "必须和密码一致"
														}
													}
												});
							});
							/* $(function(){
								 $("#form").form("validate");
								$("#email").blur(function(){
									if($("#email")==""){
										alert("邮箱必填");
									}else{
										//ajax
										$.post(
												"validEmail.jhtml",
												 {email:$("#email").val()},
												  
												  function(data){
													 if(data!="success"){
														 alert(data);
													 }
										});
									}
								});
							}); */
						</script>
						<td><input name="email" type="text" size="25" id="email" style="width: 300px; height: 20px"
							class="inputBg" /> <span style="color: #FF0000"> *</span></td>
					</tr>
					<tr>
						<td align="right">密码</td>
						<td><input name="password" type="password" id="password"
							class="inputBg" style="width: 300px; height: 20px" /> <span
							style="color: #FF0000" id="password_notice"> *</span></td>
					</tr>
					<tr>
						<td align="right">确认密码</td>
						<td><input name="confirm_password" type="password"
							id="conform_password" style="width: 300px; height: 20px"
							onblur="check_conform_password(this.value);" class="inputBg"
							style="width: 179px;" /> <span style="color: #FF0000"
							id="conform_password_notice"> *</span>
						</td>
					</tr>
						<tr>
						<td align="right">验证码	</td>
						<td>
						<table>
						<tr><td><input name="code"style="width: 60px;" /></td>
						<td>
						<jsp:include flush="false" page="authcode.jsp"></jsp:include>
						</td>
						<td>
							 <a href="regist.jsp">reflesh</a> 
						<!-- <form action="UserServlet?m=code">
								<input type="submit" value="reflesh"/>
						</form> -->
						<!-- <input type="button"
								value="refesh" id="reflesh" />  -->
						</td></tr>
						</table>
		                <!--     <script>
						$(function() {
							$("#reflesh").click(function() {
								var timenow = new Date().getTime();
								var url = "UtilServlet?m=code&&?time=" + timenow;
								$("#code").attr("src", url);
							});

						});
					</script>  --> 
						<!-- //	<a href="UserServlet?m=code">reflesh</a>	 -->
					</td>
					</tr> 
					
		<%-- 			<tr>
						<td align="right">验证码<input name="validateCode"
							style="width: 60px;" /></td>
						<td><img id="validateCode" style="width: 80px;" />
						<%cc.getRandcode(request, response);%> 
						<jsp:include flush="false" page="authcode.jsp"></jsp:include>
						<span style="color: #FF0000"
							id="conform_password_notice"> *<input type="button"
								value="refesh" id="reflesh" /></span></td>
					</tr> --%>
			
					<tr><td>
					<%
					%>
					</td></tr>			 
				
					<tr>
						<td>&nbsp;</td>
						<td align="left">
						<input name="act" style="width: 100px; height: 25px" type="submit" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="reset" style="width: 100px; height: 25px" value="reset">
						</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td class="actionSub"><a href="#">我已有账号，我要登录</a><br /> <a
							href="#">您忘记密码了吗？</a></td>
					</tr>
				</table>
			</fieldset>

		</form>

	</div>
                </td>
			</tr>
			<tr>
				<td colspan="2" height="62">
				<jsp:include flush="false" page="tail.jsp"></jsp:include>
				</td>
			</tr>
		</table>
	</div>
	

</body>
</html>