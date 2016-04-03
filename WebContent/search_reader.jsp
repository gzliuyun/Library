<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>读者管理->读者查询</title>
 <script language="javascript">
 function check_reader(id){
		// alert("登录名过长");	 
		 if(id=="reader_id"){
			 var dlname=document.getElementById(id).value;
		 	 for(var i=0;i<dlname.length;i++){
		    		if((dlname.charAt(i)>=0&&dlname.charAt(i)<=9)||(dlname.charAt(i)>='A'&&dlname.charAt(i)<='Z')||(dlname.charAt(i)>='a'&&dlname.charAt(i)<='z')||(dlname.charAt(i)=='_')) continue;
		   			else{
					     alert("证件号只允许输入字母（含大小写）、数字和下划线,且长度为6~10位");
		   		    	 break;
		    		}
		 	}
		 }
		 if(id=="reader_name"){
			var dlname=document.getElementById(id).value;
		 	for(var i=0;i<dlname.length;i++){
		    	if(dlname.charAt(i)=='!'||dlname.charAt(i)=='@'||dlname.charAt(i)=='#'||dlname.charAt(i)=='$'||dlname.charAt(i)=='%'||dlname.charAt(i)=='^'||dlname.charAt(i)=='&'||dlname.charAt(i)=='*'||dlname.charAt(i)=='<'||dlname.charAt(i)=='>'||dlname.charAt(i)=='('||dlname.charAt(i)==')') {
		    	 	 alert("姓名不能输入以下特殊符号:!，@、#、$、%、^、&、*、<、>,(,)且长度为40个字符以内");
				 	 break;
		    	}
		    }
		 }
 }
</script>	
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
<table width="70%" style="border-collapse:collapse;margin-top:150px;" border="0" align="center">
<tr>
	<form action="Select_from_table" method="post"><input type="hidden" value="search_reader1" name="input">                 
	<td align="center" width="60%">证件号:<input type="text" name="reader_id" id="reader_id" onKeyUp= check_reader(this.id)>
       <input type="submit" value="查询"></td></form>
	<td align="center" width="40%" name="_id" id="_id">&nbsp;</td>
</tr>
<tr>	
	<form action="Select_from_table" method="post"><input type="hidden" value="search_reader2" name="input">
	<td align="center" width="60%">读者姓名:<input type="text" name="reader_name" id="reader_name" onKeyUp= check_reader(this.id) >
		<input type="submit" value="查询"></td></form>
	<td align="center" width="40%" name="_id" id="_id">&nbsp;</td>
</tr>
</table>
</body>
</html>