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
public class Book_updata_1 extends HttpServlet{
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
		if(request.getParameter("input")!=null){  //图书信息
			int number=Integer.parseInt(request.getParameter("input"));
				List<List<String>> book_detail=null;
				List<List<String>> detail=null;
				book_detail = (List<List<String>>) session.getAttribute("book_detail");
		    if(number<20){
				String id=book_detail.get(number).get(0);
				detail=connect.select_t_book_search(id);
				session.setAttribute("detail", detail);
				session.setAttribute("number", ""+number);	
				response.sendRedirect("book_updata_2.jsp");  //跳转到查询页
			}else{
				Cookie cook=new Cookie("book_type",book_detail.get(number-20).get(4));
				response.addCookie(cook);
				session.setAttribute("numberup", ""+(number-20));
				response.sendRedirect("book_updata_updata.jsp");//跳转到修改页
			}
		}
	}
}
