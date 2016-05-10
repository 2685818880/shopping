<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/my.css" />
</head>
<body topmargin="0">
	<div align="center">
		<table align="center" width=80% border="1" cellspacing="0"
			cellpadding="0">
			<tr>
				<td colspan="2" height="94"><jsp:include flush="false" page="head.jsp"></jsp:include></td>
			</tr>
			<tr>
				<td width=21% height="185"><jsp:include flush="false" page="left.jsp"></jsp:include></td>
				<td width=79%><jsp:include flush="false" page="right.jsp"></jsp:include></td>
			</tr>
			<tr>
				<td colspan="2" height="62"><jsp:include flush="false" page="tail.jsp"></jsp:include></td>
			</tr>
		</table>
	</div>
</body>
</html>