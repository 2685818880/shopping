<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function cart(){
	window.open("test?m=all","_self");
}
</script>
</head>
<body>
<form action="test" method="post">
<input type="hidden" name="m" value="all">
<input type="submit" value="ok">
</form>
<input type="button" value="test" onclick="fm()"/>
</body>
</html>