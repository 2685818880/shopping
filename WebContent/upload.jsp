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
	<div align="center" style="width: 400px;">
		<form action="upload?m=insert_info" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>Insert Info</legend>
				<font color="red">${oo}</font>
				<table>
					<tr>
						<td><label for="file">file:</label></td>
						<td><input type="file" name="filename" value="info" style="width: 200px; height: 20px"></td>
						<td><font color="red">*</font></td>
					</tr>


					<tr>
						<td><label for="price">price:</label></td>
						<td><input type="text" name="price" value="100"
							 style="width: 200px; height: 20px" /></td>
						<td><font color="red">*</font></td>
					</tr>
					<tr>
						<td><label for="name">intro:</label></td>
						<td>
						<textarea rows="5" cols="30"  name="intro"  
							onFocus="this.value=''" style="width: 200px; height: 50px"></textarea>
		                 </td>
						<td><font color="red">*</font></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" style="width: 100px; height: 25px"
							value="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="reset" style="width: 100px; height: 25px" value="reset"></td>
					</tr>
				</table>
			</fieldset>

		</form>

	</div>

</body>
</html>