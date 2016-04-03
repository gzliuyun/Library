<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>读者管理->注册</title>
 <script language="javascript">
 function check_reader(id){
		// alert("登录名过长");	 
		 if(id=="reader_id"){
			 var dlname=document.getElementById(id).value;
		 	 for(var i=0;i<dlname.length;i++){
		    		if((dlname.charAt(i)>=0&&dlname.charAt(i)<=9)||(dlname.charAt(i)>='A'&&dlname.charAt(i)<='Z')) continue;
		   			else{
					     alert("证件号只允许输入大写字母、数字");
		   		    	 break;
		    		}
		 	}
		 	 if(dlname.length==0)
		 			document.getElementById("_id").innerHTML=" "
		 	 else if(dlname.length==8){
		 		document.getElementById("_id").innerHTML="<b style=\"color:green\">√</b>"
		 	 }
		 	 else{
		 		document.getElementById("_id").innerHTML="<b style=\"color:red\">× 长度为8个字符</b>"
		 	 }
		 }
		 if(id=="reader_name"){
			var dlname=document.getElementById(id).value;
		 	for(var i=0;i<dlname.length;i++){
		    	if(dlname.charAt(i)=='!'||dlname.charAt(i)=='@'||dlname.charAt(i)=='#'||dlname.charAt(i)=='$'||dlname.charAt(i)=='%'||dlname.charAt(i)=='^'||dlname.charAt(i)=='&'||dlname.charAt(i)=='*'||dlname.charAt(i)=='<'||dlname.charAt(i)=='>'||dlname.charAt(i)=='('||dlname.charAt(i)==')'||(dlname.charAt(i)>='0'&&dlname.charAt(i)<='9')) {
		    	 	 alert("姓名不能输入以下特殊符号:!，@、#、$、%、^、&、*、<、>,(,)以及数字");
				 	 break;
		    	}
		    }
	 		if(dlname.length==0)
	 			document.getElementById("_name").innerHTML=" "
	 		else if(dlname.length<=40){
		 		document.getElementById("_name").innerHTML="<b style=\"color:green\">√</b>"
		 	 }
		 	else{
		 		document.getElementById("_name").innerHTML="<b style=\"color:red\">× 长度为40个字符以内</b>"
		 	 }
		 }
		if(id=="email"){
				var dlname=document.getElementById(id).value;
			 	for(var i=0;i<dlname.length;i++){
			    	if(dlname.charAt(i)=='!'||dlname.charAt(i)=='#'||dlname.charAt(i)=='$'||dlname.charAt(i)=='%'||dlname.charAt(i)=='^'||dlname.charAt(i)=='&'||dlname.charAt(i)=='*'||dlname.charAt(i)=='<'||dlname.charAt(i)=='>'||dlname.charAt(i)=='('||dlname.charAt(i)==')') {
			    	 	 alert("邮箱不能输入以下特殊符号:!、#、$、%、^、&、*、<、>,(,)");
					 	 break;
			    	}
			    }
	 			if(dlname.length==0)
		 			document.getElementById("_email").innerHTML=" "
		 		else if(dlname.length<=40){	 		
			 		document.getElementById("_email").innerHTML="<b style=\"color:green\">√</b>"

			 	 }
			 	 else{
			 		 
			 		document.getElementById("_email").innerHTML="<b style=\"color:red\">× 长度为40个字符以内</b>"
			 	 }
		}
		if(id=="phone"){
				var dlname=document.getElementById(id).value;
			 	for(var i=0;i<dlname.length;i++){
			    	if((dlname.charAt(i)<'0'||dlname.charAt(i)>'9')) {
			    	 	 alert("手机号只能输入数字");
					 	 break;
			    	}
			    }
		 		if(dlname.length==0)
		 			document.getElementById("_phone").innerHTML=""
		 		else if(dlname.length==11){
			 		document.getElementById("_phone").innerHTML="<b style=\"color:green\">√</b>"
			 	 }
			 	 else{
			 		document.getElementById("_phone").innerHTML="<b style=\"color:red\">× 长度为11个字符以内</b>"

			 	 }
		}
		if(id=="year"||id=="moth"||id=="day"){
			 var dlname=document.getElementById(id).value;
		 	 for(var i=0;i<dlname.length;i++){
		    	if((dlname.charAt(i)<'0'||dlname.charAt(i)>'9')) {
		    	 	 alert("日期输入只能为数字");
				 	 break;
		    	}
		    }
		}
}
function enter(){
	var _id=document.getElementById("reader_id").value;
	var _name=document.getElementById("reader_name").value;
	var _email=document.getElementById("email").value;
	var _phone=document.getElementById("phone").value;
	var _year=document.getElementById("year").value;
	var _month=document.getElementById("month").value;
	var _day=document.getElementById("day").value;
	if(_id==""||_id==null||_name==""||_name==null||_email==""||_email==null||_phone==""||_phone==null||year==""||year==null||month==""||month==null||day==""||day==null){
		alert("带*处不能为空!");
		return false;
	}
	else if(_id.length!=8){
		alert("证件号输入有误!");
		return false;
	}
	else if(_phone.length!=11){
		alert("手机号输入有误!");
		return false;
	}
	else if(_name.length>40){
		alert("姓名输入输入有误!");
		return false;
	}
	else if(_email.length>40){
		alert("邮箱输入有误!");
		return false;
	}
	else
		 return true;

 }
</script>
</head>
<body>
<table width="100%" style="border-collapse:collapse;margin-top:30px;" border="0"  bgcolor="#c0c0c0">
<tr>
   <td width="20%" align="center"><a href="book_into.jsp">图书管理</a></td>
   <td width="20%" align="center">借还</td>
   <td width="20%" align="center"><a href="reader_register.jsp">读者管理</a></td>
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
<form action="Add_into_table" method="post"><input type="hidden" value="reader_register" name="input">
<table  width="70%" style="border-collapse:collapse;margin-top:100px;" border="0" align="center">
<tr>
 	<td width="30%"><font color="red">*</font>证件号:</td>
 	<td width="30%"><input type="text" id="reader_id" name="reader_id" onKeyUp= check_reader(this.id)></td>
 	<td id="_id"  name="_id" align="left" width="40%">&nbsp;</td>
</tr>
<tr>
 	<td><font color="red">*</font>姓名:</td>
 	<td><input type="text" id="reader_name" name="reader_name" onKeyUp=check_reader(this.id)></td>
 	<td id="_name" name="_name" align="left">&nbsp;</td>
</tr>
<tr>
	<td><font color="red">*</font>邮箱:</td>
 	<td><input type="text" id="email" name="email" onKeyUp=check_reader(this.id)></td>
 	<td id="_email" name="_email" align="left">&nbsp;</td>
</tr>
<tr>
 	<td>手机号:</td>
 	<td><input type="text" id="phone" name="phone" onKeyUp=check_reader(this.id)></td>
	<td id="_phone" name="_phone" align="left">&nbsp;</td>
</tr>
<tr>
 	<td><font color="red">*</font>毕业时间:</td>
 	<td><input type="text" id="year" name="year" size="2" onKeyUp=check_reader(this.id)>年
 		<input type="text" id="month" name="month" size="2" onKeyUp=check_reader(this.id)>月
 		<input type="text" id="day" name="day" size="2" onKeyUp=check_reader(this.id) >日</td>
 	<td id="_time" name="_time" align="left">&nbsp;</td>
</tr>	
<tr>
	<td><font color="red">*</font>类型:</td>
 	<td><select name="type" id="type">
    	<option value="学生" selected="selected">学生</option>
        <option value="教员">教员</option></td>
    <td>&nbsp;</td>
</tr>
<tr>
	<td><font color="red">*</font>性别:</td>
 	<td><input type="radio" id="sex" name="sex" value="男" checked="checked">男 <input type="radio" id="sex" name="sex" value="女">女</td>
 	<td>&nbsp;</td>
</tr>
<tr>
 	 <td><font color="red">*</font>学院:</td>
 	 <td><select name="college" id="college">
    	<option  selected="selected" value="1">计算机</option>
        <option  value="2">软件</option>
        <option  value="3">医学</option>
        <option  value="4">文新</option>
        <option  value="5">历史</option>
        <option  value="6">电子</option>
        <option  value="7">农学</option>
        <option  value="8">法学</option>
        <option  value="9">建环</option>
        <option  value="10">外国语</option>
        </td>
      <td>&nbsp;</td>
</tr>
<tr>
		<td>初始密码:</td>
 	    <td>000000</td>
 	    <td>&nbsp;</td>
</tr>
<tr>
	<td colspan="3" align="center"><input type="submit" value="提交" onclick="return enter()"><input type="reset" value="重置"></td>
</tr>
</table>
</form>
</body>
</html>