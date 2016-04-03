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
   <td width="20%" align="center"><a href="book_updata_1.jsp">图书管理</a></td>
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
	<td align="center"><a href="book_updata_1.jsp">图书查询</a></td>
</tr>
<tr>
	<td align="center"><a href="book_down.jsp">图书下架</a></td>
</tr>
</table>
<%
    List<List<String>> book_detail=null;
    if(session!= null){
    	book_detail = (List<List<String>>) session.getAttribute("book_detail");
     } 
%>
<table  width="70%" style="border-collapse:collapse;margin-top:100px;" border="1" align="center">
	<tr>
		<td align="center">索书号</td>
		<td align="center">书名</td>
		<td align="center">出版社</td>
		<td align="center">作者</td>
		<td align="center">类型</td>
		<td align="center">价格</td>
		<td align="center">数量</td> 
		<td align="center">剩余量</td> 
		<td align="center">修改</td>
		<td align="center">查询</td>
	 </tr>  
	 <% for(int i=0;i<book_detail.size();i++)
		{
		    String zan1=""+i;
		    String zan2=""+(i+20);
  			List<String> test =book_detail.get(i);
  			//System.out.println(search_id+"  "+test.get(0)+"  "+test.get(1)+"  "+test.get(2));
	 %>
  		<tr><td align="center"><%=test.get(0)%></td>
    		<td align="center"><%=test.get(1)%></td>
    		<td align="center"><%=test.get(2)%></td>
    		<td align="center"><%=test.get(3)%></td>
    		<td align="center"><%=test.get(4)%></td>
    		<td align="center"><%=test.get(5)%></td>
    		<td align="center"><%=test.get(6)%></td>
    		<td align="center"><%=test.get(7)%></td>
    		<form action="Book_updata_1" method="post"><input type="hidden" value=<%=zan2%> name="input">
    		<td align="center"><input type="submit" value="修改"></td></form>
    		<form action="Book_updata_1" method="post"><input type="hidden" value=<%=zan1%> name="input">
    		<td align="center"><input type="submit" value="查询"></td></form>
    	</tr>
	<%
		}
	%>   
</table>

</body>
</html>