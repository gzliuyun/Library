<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>图书管理->查询</title>
</head>
<body>
<table width="100%" style="border-collapse:collapse;margin-top:30px;" border="0"  bgcolor="#c0c0c0">
<tr>
   <td width="20%" align="center"><a href="book_updata.jsp">图书管理</a></td>
   <td width="20%" align="center">借还</td>
   <td width="20%" align="center"><a href="reader_register.jsp">读者管理</a></td>
   <td width="20%" align="center">管理员管理 </td>
   <td width="20%" align="center">注销</td>
</tr>
</table>
<hr>

<table  width="15%" height="550" style="border-collapse:collapse" border="0" align="left" bgcolor="#c0c0c0">
<tr>
	<td align="center"><a href="book_into.jsp">图书入库</a></td>
</tr>
<tr>
	<td align="center"><a href="book_updata.jsp">图书查询</a></td>
</tr>
<tr>
	<td align="center"><a href="book_down.jsp">图书下架</a></td>
</tr>
</table>
<b align="center" ><form action="Select_from_table" method="post"><input type="hidden" value="book_updata1" name="input">
                                                                         索书号:<input type="text" id="search_id" name="search_id">
						  <input type="submit" value="检索" name="search_id"></form></b>
<b align="center"><form action="Select_from_table" method="post"><input type="hidden" value="book_updata2" name="input">
	  			                  书&nbsp;&nbsp;名:<input type="text" id="book_name" name="book_name">
                          <input type="submit" value="检索" name="name"></form></b>

</body>
</html>