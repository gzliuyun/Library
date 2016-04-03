<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="GBK">
<title>登录界面</title>
<script language="javascript"> 
function loadimage(){ 
	 document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
function check_denglu(id){	 
	 if(id=="denglu_id"){
		   var dlname=document.getElementById(id).value;
		   for(var i=0;i<dlname.length;i++){
		    	 if((dlname.charAt(i)>=0&&dlname.charAt(i)<=9)||(dlname.charAt(i)>='A'&&dlname.charAt(i)<='Z')||(dlname.charAt(i)>='a'&&dlname.charAt(i)<='z')||(dlname.charAt(i)=='_')) continue;
		   		 else{
					   alert("账户只允许输入字母（含大小写）、数字和下划线,且长度为6~10位");
		   		       break;
		    	}
		   }
	}
	 if(id=="denglu_password"){
		   var dlname=document.getElementById(id).value;
		   for(var i=0;i<dlname.length;i++){
		    	 if((dlname.charAt(i)>=0&&dlname.charAt(i)<=9)||(dlname.charAt(i)>='A'&&dlname.charAt(i)<='Z')||(dlname.charAt(i)>='a'&&dlname.charAt(i)<='z')||(dlname.charAt(i)=='_')) continue;
		   		 else{
					   alert("密码允许输入字母（含大小写）、数字和下划线,且长度为6位");
		   		       break;
		    	}
		   }
	}
}
</script> 
</head>
<body>
<form action="validate.jsp" method="post" name="loginForm" >
      <input type="hidden" value="denglu" name="input">
<table width="30%" height="30%" style="border-collapse:collapse;margin-top:250px;" border="0" align="center" bgcolor="#c0c0c0">
<tr>
	<td colspan="3" align="center">用户登录</td>
</tr>
<tr>
   <td >账号</td>
   <td><input type="text"  name="denglu_id" id="denglu_id" onKeyUp= check_denglu(this.id)></td>
   <td ></td>
</tr>
<tr>
   <td >密  码</td>
   <td><input type="password"  name="denglu_password" id="denglu_password" onKeyUp= check_denglu(this.id)></td>
   <td ></td>
</tr>
<tr>
	<td> 验证码 </td>
	<td  valign="middle" ><input type="text" name="rand" size="4"> 
	    <img alt="code..." name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"></td> 
	<td height="36" colspan="2" align="center" valign="middle"><a href="javascript:loadimage();"><font class=pt95>看不清点我</font></a></td> 
</tr>
<tr>
  	<td colspan="3" align="center"><input type="submit" value="登录" name="登录"><input type="reset" value="重置"></td>
</tr>
</table>
</form>
</body>
</html>