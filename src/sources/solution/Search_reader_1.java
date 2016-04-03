package sources.solution;
import java.util.*;

import connect.data.dblibrary.ConnectionData;

import java.sql.*;
import java.util.Date;

import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.DriverManager ;
import java.sql.SQLException ;
import java.util.Enumeration;
public class Search_reader_1 extends HttpServlet{
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
		if(request.getParameter("input")!=null){   //读者证件号查询
			List<List<String>> reader_detail=null;
			reader_detail = (List<List<String>>) session.getAttribute("reader_detail");
			int va=Integer.parseInt((String)request.getParameter("input"));
			if(va<1000){
				int n = va;
				session.setAttribute("n", n+"");
				response.sendRedirect("search_reader_updata.jsp");
			}
			else if(va>=1000&&va<2000){
				int n = va-1000;
				String reader_id=reader_detail.get(n).get(0);
				connect.delect_t_reader(reader_id);
				out.println("<script language = javascript>location.href='search_reader.jsp';");
				out.println("alert('删除成功!')</script>");
			}
			else if(va>=2000){
				int n = va-2000;
				String reader_id=reader_detail.get(n).get(0);
				connect.updata_t_reader_setright(reader_id);
				out.println("<script language = javascript>location.href='search_reader.jsp';");
				out.println("alert('注销成功!')</script>");
				//response.sendRedirect("search_reader.jsp");
			}
		}
		
	}
}
