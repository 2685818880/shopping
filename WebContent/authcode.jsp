<%@page import="com.Util.java.CodeController"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%CodeController cc = new CodeController();
cc.getRandcode(request, response); %>
<table >
<tr><td>

<%-- <img id="validateCode" src="<%cc.getRandcode(request, response);%>" />
11<%cc.getRandcode(request, response);%>  --%>
${code} 
</td></tr>
</table>
