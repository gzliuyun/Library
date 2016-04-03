<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>图书管理->查询</title>
 <script language="javascript">
function check_book(id){
	 if(id=="book_price"){
		var dlname=document.getElementById(id).value;
	 	for(var i=0;i<dlname.length;i++){
	 		if((dlname.charAt(i)>='0'&&dlname.charAt(i)<='9')||dlname.charAt(i)=='.') continue;
	 		else{
	    	 	 alert("价格只能为数字!");
			 	 break;
	    	}
	    }
	 	 if(dlname.length==0)
	 			document.getElementById("_price").innerHTML=" "
	 	 else if(dlname.length<7&&dlname.charAt(dlname.length-3)=='.'){
	 		document.getElementById("_price").innerHTML="<b style=\"color:green\">√</b>"
	 	 }
	 	 else{
	 		document.getElementById("_price").innerHTML="<b style=\"color:red\">× 最多5位有效数字,小数点后2位</b>"
	 	 }
	 }	
	 if(id=="book_name"){
			var dlname=document.getElementById(id).value;
		 	for(var i=0;i<dlname.length;i++){
		    	if(dlname.charAt(i)=='!'||dlname.charAt(i)=='@'||dlname.charAt(i)=='#'||dlname.charAt(i)=='$'||dlname.charAt(i)=='%'||dlname.charAt(i)=='^'||dlname.charAt(i)=='&'||dlname.charAt(i)=='*') {
		    	 	 alert("姓名不能输入以下特殊符号:!，@、#、$、%、^、&、*");
				 	 break;
		    	}
		    }
		 	 if(dlname.length==0)
		 			document.getElementById("_name").innerHTML=" "
		 	 else if(dlname.length<50){
		 		document.getElementById("_name").innerHTML="<b style=\"color:green\">√</b>"
		 	 }
		 	 else{
		 		document.getElementById("_name").innerHTML="<b style=\"color:red\">× 最长长度为50个字符</b>"
		 	 }
	}
	if(id=="search_id"){
		 var dlname=document.getElementById(id).value;
	 	 for(var i=0;i<dlname.length;i++){
	    		if((dlname.charAt(i)>=0&&dlname.charAt(i)<=9)||(dlname.charAt(i)>='A'&&dlname.charAt(i)<='Z')) continue;
	   			else{
				     alert("索书号只允许输入大写字母、数字");
	   		    	 break;
	    		}
	 	}
	 	 if(dlname.length==0)
	 			document.getElementById("_search").innerHTML=" "
	 	 else if(dlname.length==8){
	 		document.getElementById("_search").innerHTML="<b style=\"color:green\">√</b>"
	 	 }
	 	 else{
	 		document.getElementById("_search").innerHTML="<b style=\"color:red\">× 长度为8个字符</b>"
	 	 }
	 }
	 if(id=="publisher"){
			var dlname=document.getElementById(id).value;
		 	for(var i=0;i<dlname.length;i++){
		    	if(dlname.charAt(i)=='!'||dlname.charAt(i)=='@'||dlname.charAt(i)=='#'||dlname.charAt(i)=='$'||dlname.charAt(i)=='%'||dlname.charAt(i)=='^'||dlname.charAt(i)=='&'||dlname.charAt(i)=='*') {
		    	 	 alert(" 出版社不能输入以下特殊符号:!，@、#、$、%、^、&、*");
				 	 break;
		    	}
		    }
		 	 if(dlname.length==0)
		 			document.getElementById("_publisher").innerHTML=" "
		 	 else if(dlname.length<30){
		 		document.getElementById("_publisher").innerHTML="<b style=\"color:green\">√</b>"
		 	 }
		 	 else{
		 		document.getElementById("_publisher").innerHTML="<b style=\"color:red\">× 长度为30个字符以内</b>"
		 	 }
	}
	 if(id=="author"){
			var dlname=document.getElementById(id).value;
		 	for(var i=0;i<dlname.length;i++){
		    	if(dlname.charAt(i)=='!'||dlname.charAt(i)=='@'||dlname.charAt(i)=='#'||dlname.charAt(i)=='$'||dlname.charAt(i)=='%'||dlname.charAt(i)=='^'||dlname.charAt(i)=='&'||dlname.charAt(i)=='*'||(dlname.charAt(i)>='0'&&dlname.charAt(i)<='9')) {
		    	 	 alert("作者不能输入以下特殊符号:!，@、#、$、%、^、&、*以及数字");
				 	 break;
		    	}
		    }
		 	 if(dlname.length==0)
		 			document.getElementById("_author").innerHTML=" "
		 	 else if(dlname.length<40){
		 		document.getElementById("_author").innerHTML="<b style=\"color:green\">√</b>"
		 	 }
		 	 else{
		 		document.getElementById("_author").innerHTML="<b style=\"color:red\">× 长度为40个字符以内</b>"
		 	 }
	}
	 if(id=="number"){
			var dlname=document.getElementById(id).value;
		 	for(var i=0;i<dlname.length;i++){
		 		if(dlname.charAt(i)>='0'&&dlname.charAt(i)<='9')   continue;
		 		else{
		 			alert("数量输入只能为整数");
				 	break;
		    	}
		    }
		 	 if(dlname.length==0)
		 			document.getElementById("_number").innerHTML=" "
		 	 else if(dlname.length<=3){
		 		document.getElementById("_number").innerHTML="<b style=\"color:green\">√</b>"
		 	 }
		 	 else{
		 		document.getElementById("_number").innerHTML="<b style=\"color:red\">× 数量最大为1000</b>"
		 	 }
	}

}
function sure(){
	var book_id=document.getElementById("book_id").value;
	var book_price=document.getElementById("book_price").value;
	var book_name=document.getElementById("book_name").value;
	var search_id=document.getElementById("search_id").value;
	var publisher=document.getElementById("publisher").value;
	var author=document.getElementById("author").value;
	var number=document.getElementById("number").value;
	if(book_id==""||book_id==null||book_price==""||book_price==null||book_name==""||book_name==null||search_id==""||search_id==null||publisher==""||publisher==null||author==""||author==null||number==""||number==null){
		alert("带*处不能为空!");
		return false;
	}
	else if(book_id.length!=7){
		alert("书号输入有误!");
		return false;
	}
	else if(search_id.length!=8){
		alert("索书号输入有误!");
		return false;
	}
	else if(author.length>40){
		alert("作者输入输入有误!");
		return false;
	}
	else 
		return true;
}
</script>
</head>
<body onload="hoho()">
<table width="100%" style="border-collapse:collapse;margin-top:30px;" border="0"  bgcolor="#c0c0c0">
<tr>
   <td width="20%" align="center"><a href="book_updata_updata.jsp">图书管理</a></td>
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
	<td align="center"><a href="book_updata_updata.jsp">图书查询</a></td>
</tr>
<tr>
	<td align="center"><a href="book_down.jsp">图书下架</a></td>
</tr>
</table>
<%
    List<List<String>> book_detail=null;
	int n=0;
	String type=null;
    if(session!= null){
    	book_detail = (List<List<String>>) session.getAttribute("book_detail");
    	n=Integer.parseInt((String)session.getAttribute("numberup"));
    	type=book_detail.get(n).get(4);
     } 
 %>
<form action="Updata_from_table" method="post" name="form1"><input type="hidden" value="book_updata_updata" name="input">
<table  width="70%" style="border-collapse:collapse;margin-top:100px;" border="0" align="center">
<tr>
	<td width="30%"><font color="red">*</font>索书号:</td>
 	<td width="30%" id="search_id" name="search_id"><%=book_detail.get(n).get(0)%></td>	
	<td width="40%" name="_search" id="_search">&nbsp;</td>
</tr>
<tr>
 	<td><font color="red">*</font>书名:</td>
 	<td><input type="text" id="book_name" name="book_name" value=<%=book_detail.get(n).get(1) %> onKeyUp=check_book(this.id)></td>
 	<td name="_name" id="_name">&nbsp;</td>
</tr>
<tr>
 	<td><font color="red">*</font>作者:</td>
 	<td><input type="text" id="author" name="author" value=<%=book_detail.get(n).get(3) %> onKeyUp=check_book(this.id)></td>
	<td name="_author" id="_author">&nbsp;</td>
</tr>
<tr>
	<td><font color="red">*</font>价格:</td>
 	<td><input type="text" id="book_price" name="book_price" value=<%=book_detail.get(n).get(5) %> onKeyUp=check_book(this.id)></td>
	<td name="_price" id="_price">&nbsp;</td>
</tr>
<tr>
	 <td><font color="red">*</font>类型:</td>
 	 <td><select name="book_type" id="book_type">
     	<option  value="1" >文科类</option>
        <option  value="2" >理科类</option>
        <option  value="3" >工科类</option>
        <option  value="4" >农科类</option>
        <option  value="5" >医学类</option>
        <option  value="6" >法学类</option>
        </td>
      <td name="_type" id="_type">&nbsp;</td>
</tr>
<script language="javascript">
function hoho(){
	var hehe= "<%=type %>";
	var n= "<%=n %>"; 
	if(hehe=="文科类")
		document.forms["form1"].elements["book_type"].selectedIndex=0;
	else if(hehe=="理科类")
		document.forms["form1"].elements["book_type"].selectedIndex=1;
	else if(hehe=="工科类")
		document.forms["form1"].elements["book_type"].selectedIndex=2;
	else if(hehe=="农科类")
		document.forms["form1"].elements["book_type"].selectedIndex=3;
	else if(hehe=="医学类")
		document.forms["form1"].elements["book_type"].selectedIndex=4;
	else if(hehe=="法学类")
		document.forms["form1"].elements["book_type"].selectedIndex=5;
}
</script>
<tr>
	<td><font color="red">*</font>出版社:</td>
 	<td><input type="text" id="publisher" name="publisher" value=<%=book_detail.get(n).get(2) %> onKeyUp=check_book(this.id)></td>
	<td name="_publisher" id="_publisher">&nbsp;</td>
</tr>
<tr>
	<td colspan="3" align="center"><input type="submit" value="修改" onclick="return sure()"></td>
</tr>
</table>
</form>
</body>
</html>