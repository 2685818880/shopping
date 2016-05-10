<%@page import="com.Util.java.CodeController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%CodeController cc = new CodeController();
 %>
<table >
<tr><td>
<img id="validateCode"  src="validateCode.jhtml" style="width:80px;" />
<img id="validateCode" src="<%cc.getRandcode(request, response);%>" />
${code} 
</td></tr>
</table>
</body>
</html>