<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function up() {
		window.open("buy_login.jsp", "_self"); 
	}
	function update_mycart() {
		 window.open("shoppingServlet", "_self"); 
	}
	function down() {
		 window.open("UserServlet?m=buy_order", "_self"); 
	}
	/* function down() {
		 window.open("buy_orderfinish.jsp", "_self"); 
	} */
	 /* function down(){
	 window.open("shoppingServlet?m=updateGoods","_self");
	 }  */ 
</script>
<table width=100% border="1">
	<tr bgcolor="ffcccc" height="11">
		<td colspan="3"></td>
	</tr>
	<tr>
		<td><img src="images/head1.png"></td>
		<td><img src="images/head2.png"></td>
		<td>
			<table>
				<tr>
					<td><img src="images/head3.png"></td>
					<td align="left" class="head_font"><a href="buy_login.jsp">【我的账号】</a></td>
				</tr>
				<tr>
					<td><img src="images/head4.png"></td>
					<td align="left" class="head_font"><a href="#" onclick="update_mycart()">【我的购物】</a></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="ffcccc" height="11">
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3">
			<table width="100%" border="1">
				<tr>
					<td width="11%">&nbsp;</td>
					<td width="11%" bgcolor="66cc33" align="left" class="title_font"><a href="index.jsp" >首页</a></td>
					<td width="11%">&nbsp;</td>
					<td width="11%" bgcolor="66cc33" align="left" class="title_font"><a href="#">香港电影</a></td>
					<td width="11%">&nbsp;</td>
					<td width="11%" bgcolor="66cc33" align="left" class="title_font"><a href="#">大陆电影</a></td>
					<td width="11%">&nbsp;</td>
					<td width="11%" bgcolor="66cc33" align="left" class="title_font"><a href="#">关于我们</a></td>
					<td width="11%">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
