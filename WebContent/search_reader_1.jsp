<%@ page language="java" import="java.util.*;"contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>读者管理->读者查询</title>
</head>
<body>
<table width="100%" style="border-collapse:collapse;margin-top:30px;" border="0"  bgcolor="#c0c0c0">
<tr>
   <td width="20%" align="center"><a href="book_into.jsp">图书管理</a></td>
   <td width="20%" align="center">图书借还</td>
   <td width="20%" align="center"><a href="search_reader.jsp">读者管理</a></td>
   <td width="20%" align="center">管理员管理 </td>
   <td width="20%" align="center">注销</td>
</tr>
</table>
<hr>

<table  width="15%" height="550" style="border-collapse:collapse" border="0" align="left" bgcolor="#c0c0c0">
<tr>
	<td align="center"><a href="reader_register.jsp">注册</a></td>
</tr>
<tr>
	<td align="center"><a href="search_reader.jsp">读者查询</a></td>
</tr>
</table>
<%
    List<List<String>> reader_detail=null;
    if(session!= null){
    	reader_detail = (List<List<String>>) session.getAttribute("reader_detail");
     } 
%>
<table width="80%" align="center" style="border-collapse:collapse;margin-top:100px;" border="1" >
	<tr>
   	 	<td align="center">证件号</td>
    	<td align="center">姓名</td>
    	<td align="center">学院</td>
    	<td align="center">邮箱</td>
    	<td align="center">类型</td>
    	<td align="center">已借书量</td>
    	<td align="center">毕业时间</td>
    	<td align="center">修改</td>
    	<td align="center">删除</td>
    	<td align="center">注销</td>
	</tr>
	 <% for(int i=0;i<reader_detail.size();i++)
		{
		    String zan1=""+i;
		    String zan2=""+(i+1000);
		    String zan3=""+(i+2000);
  			List<String> test =reader_detail.get(i);
  			//System.out.println(search_id+"  "+test.get(0)+"  "+test.get(1)+"  "+test.get(2));
	 %>
  	<tr><td align="center"><%=test.get(0)%></td>
    	<td align="center"><%=test.get(1)%></td>
    	<td align="center"><%=test.get(2)%></td>
    	<td align="center"><%=test.get(3)%></td>
    	<td align="center"><%=test.get(4)%></td>
    	<td align="center"><%=test.get(5)%></td>
    	<td align="center"><%=test.get(6)%></td>
    	<form action="Search_reader_1" method="post"><input type="hidden" value=<%=zan1%> name="input">
    	<td align="center"><input type="submit" name="check" id="check" value="修改"></td></form>
    	<form action="Search_reader_1" method="post"><input type="hidden" value=<%=zan2%> name="input">
    	<td align="center"><input type="submit" name="check" id="check" value="删除"></td></form>
    	<form action="Search_reader_1" method="post"><input type="hidden" value=<%=zan3%> name="input">
    	<td align="center"><input type="submit" name="check" id="check" value="注销"></td></form>
    </tr>
	<%
		}
	%>   
</table>
</body>
</html>