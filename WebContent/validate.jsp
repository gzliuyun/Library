<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %> 
<%@ page import="connect.data.dblibrary.ConnectionData" %> 
<% 
    final  ConnectionData connect=null;
	String rand = (String)session.getAttribute("rand");
    String denglu_id=request.getParameter("denglu_id");
    String denglu_password=request.getParameter("denglu_password");
	String input = request.getParameter("rand"); 
	//System.out.println(connect.select_t_reader(denglu_id, "PASSWORD"));
	if(connect.select_t_admin(denglu_id, "PASSWORD")==null)
		out.print("<script>alert('�û������ڣ������µ�¼��');location.href='index.jsp';</script>");
	else if(rand.equals(input)&&connect.select_t_admin(denglu_id, "PASSWORD").equals(denglu_password)){ 
		out.print("<script>location.href='book_into.jsp';</script>"); 
	}
	else if(!connect.select_t_admin(denglu_id, "PASSWORD").equals(denglu_password)){
		out.print("<script>alert('��¼����');location.href='index.jsp';</script>");
	}
	else if(!rand.equals(input)){ 
		out.print("<script>alert('��������ȷ����֤�룡');location.href='index.jsp';</script>"); 
	} 
%> 