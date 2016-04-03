<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>图书管理->查询</title>
<script language="javascript">
function check(){
	 var sc=[],shanchu="";
     for(var k=0;k<document.getElementsByName("check").length;k++){//获得选定的兴趣爱好
          sc[k]=document.getElementsByName("check")[k];
          if(sc[k].checked){
        	  shanchu+=sc[k].value;
          }
     }  
	window.location ="http://localhost:8080/library/Delete_from_table?shanchu="+shanchu;

}
function whether(){
	var pass1,pass2,xiajia,guihuan;
	 var sc=[];
     for(var k=0;k<document.getElementsByName("check").length;k++){//获得选定的兴趣爱好
          sc[k]=document.getElementsByName("check")[k];
          if(sc[k].checked){
        	  xiajia=document.getElementById("xiajia").value;
        	  guihuan=document.getElementById("shanchu").value;
        	  if(guihuan=="否"){
        		  alert("该书还未归还，不能删除！");
        		  document.getElementsByName("check")[k].checked=false;
        	  }
          }
     }  
}
</script>
</head>
<body>
<table width="100%" style="border-collapse:collapse;margin-top:30px;" border="0"  bgcolor="#c0c0c0">
<tr>
   <td width="20%" align="center"><a href="book_updata_2.jsp">图书管理</a></td>
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
	<td align="center"><a href="book_updata_2.jsp">图书查询</a></td>
</tr>
<tr>
	<td align="center"><a href="book_down.jsp">图书下架</a></td>
</tr>
</table>
<%
    List<List<String>> book_detail=null;
	List<List<String>> detail=null;
	int n=0;
    if(session!= null){
    	book_detail = (List<List<String>>) session.getAttribute("book_detail");
    	detail = (List<List<String>>) session.getAttribute("detail");
    	n=Integer.parseInt((String)session.getAttribute("number"));
     } 
%>
<h3 align=center>索书号:<%=book_detail.get(n).get(0)%></h3>
<table  width="70%" style="border-collapse:collapse;margin-top:80px;" border="1" align="center">
	<tr>
		<td align="center">书号</td>
		<td align="center">书名</td>
		<td align="center">出版社</td>
		<td align="center">作者</td>
		<td align="center">类型</td>
		<td align="center">下架与否</td>
		<td align="center">归还与否</td>  
		<td align="center">删除</td>
	 </tr>  
	 <% for(int i=0;i<detail.size();i++)
		{
		    String zan=""+i;
		    String h=""+(i+1000);
  			List<String> test =detail.get(i);
  			//System.out.println(search_id+"  "+test.get(0)+"  "+test.get(1)+"  "+test.get(2));
	 %>
  		<tr><td align="center"><%=test.get(0)%></td>
    		<td align="center"><%=book_detail.get(n).get(1)%></td>
    		<td align="center"><%=book_detail.get(n).get(2)%></td>
    		<td align="center"><%=book_detail.get(n).get(3)%></td>
    		<td align="center"><%=book_detail.get(n).get(4)%></td>
    		<td align="center"><%=test.get(1)%><input type="hidden",name="xiajia" id="xiajia" value=<%=test.get(1)%>></td>
    		<td align="center"><%=test.get(2)%><input type="hidden",name="shanchu" id="shanchu" value=<%=test.get(2)%>></td>
    		<td align="center"><input type="checkbox" name="check" id="check" value=<%=zan%> onclick="whether()"></td>
    	</tr>
	<%
		}
	%>   
	<tr>
			<td colspan="9" align="center"><input type="submit" value="确认删除" onclick="return check()"></td>
	</tr>
</table>

</body>
</html>