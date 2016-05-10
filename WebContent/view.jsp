<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="refresh" content="0;URL='upload?m=list'">

</head>
<body >

	<table>
			<thead>
				<tr>
					<td>id</td>
					<td>file</td>
					<td>price</td>
					<td>intro</td>
					<td>day</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${s}" var="stu">
					<tr>
						<td>${stu.id }</td>
						<td>${stu.file }
						<img alt="" src="images/${stu.file }">
						</td>
						<td>${stu.price }</td>
						<td>${stu.intro }</td>
						<td>${stu.day }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>