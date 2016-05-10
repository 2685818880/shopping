<%@page import="java.util.List"%>
<%@page import="com.Bean.java.MovieInfo"%>
<%@page import="com.Dao.java.MyCartBODao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MyCartBODao mtb = new MyCartBODao();
    String pageNum =(String)request.getAttribute("pageCount");
    int pageNow=1;
    if(pageNum!=null){//判断 是否点击了，连接的页数。
    	pageNow=Integer.parseInt(pageNum);
    }    
	List<MovieInfo> list = mtb.getInfo(6, pageNow);//分页信息

	int pageCount=mtb.getPageCount(6);	//得到总页数。
%>
<table width="100%" border="1" height="100%">
	<tr>
		<td colspan=3 align="left"><img src="images/right1.png"
			height="50" /></td>
	</tr>
	<%
		/*    for(int i=0;i<list.size();i++){
		   	MovieInfo mi=list.get(i);
		   } */

		int time = 0;
		for (int i = 0; i < 2; i++) {
	%>
	<tr>
		<%
		    MovieInfo mi=new MovieInfo();
			for (int j = 0; j < 3; j++) {
                  if(time>=list.size()){
                	 mi.setId(1);
                	 mi.setFile("none.jpg");
                	 mi.setPrice(0.0f);
                	 mi.setIntro("暂无放映信息");
                	 mi.setDay("");
                	 
                   }else{
   					 mi = list.get(time);
   					time++;  
                   }

		%>
		<td>
			<table>
				<tr>
					<td rowspan=3><img src="images/<%=mi.getFile()%>" height="110" /></td>
					<td>&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td><a href="upload?m=show_view&id=<%=mi.getId()%>"><%=mi.getId()%></a></td>
				</tr>
				<tr>
					<td>价格：$<%=mi.getPrice()%></td>
				</tr>
				<tr>
					<td colspan=2><%=mi.getIntro()%></td>
				</tr>
			</table>
		</td>
		<%
			}
		%>
	</tr>

	<%
		if (i == 0) {
	%>
	<tr height="9">
		<td colspan=3 width="100%" bgcolor="ffcccc"></td>
	</tr>
	<%
		}
		}
	%>

	<tr>
		<td colspan=3 width="100%">
		<% 
		 for(int i=1;i<=pageCount;i++){
			 %>
			 <a href="upload?m=show_page&pageNow=<%=i %>">【<%=i %>】</a>
			 <% 
		 }
		%>
		
		
		</td>
	</tr>
	<tr>
		<td colspan="3" class="right_font" align="left">最新活动：</td>
	</tr>
	<tr>
		<td><img src="images/right (1).jpg" height="90" width="210" /></td>
		<td><img src="images/right (2).jpg" height="90" width="210" /></td>
		<td><img src="images/right (3).jpg" height="90" width="210" /></td>
	</tr>
</table>