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
</head>
<body>
<div align="center" style="width=300px">
		<form action="upload" method="post"
			enctype="multipart/form-data">
			<fieldset>
					<legend>upload</legend>
			<table >
			 <font color="red">${oo}</font>
				<tr>
					<td>info</td>
					<td><input type="file" name="filename" value="info"></td>
					<td><input type="submit" value="upload"></td>
				</tr>
			</table>
			</fieldset>
			
		</form>

	</div>

</body>
</html>