package sources.solution;
import java.util.*;

import connect.data.dblibrary.ConnectionData;

import java.sql.*;
import java.util.Date;

import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.DriverManager ;
import java.sql.SQLException ;
import java.util.Enumeration;
public class Delete_from_table extends HttpServlet{
	public static final String CONTENT_TYPE="text/html;charset=GBK";
	private static ConnectionData connect;
	public void init()throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws
	    SecurityException,IOException{
		response.setContentType(CONTENT_TYPE);
		PrintWriter out =response.getWriter();
		Enumeration e=request.getParameterNames();
		HttpSession session = request.getSession();


	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws
    ServletException,IOException{
		response.setContentType(CONTENT_TYPE);
		PrintWriter out =response.getWriter();
		Enumeration e=request.getParameterNames();
		HttpSession session = request.getSession();
		String shanchu=request.getParameter("shanchu");
		List<List<String>> detail=null;
		detail = (List<List<String>>) session.getAttribute("detail");
		for(int i=0;i<shanchu.length();i++){
			connect.delect_t_book(detail.get(shanchu.charAt(i)-'0').get(0));
		}
		connect.updata_t_book_number(shanchu.length(), detail.get(0).get(0));
		out.println("<script language = javascript>location.href='book_updata.jsp';");
		out.println("alert('É¾³ý³É¹¦')</script>");
		
	}
}
