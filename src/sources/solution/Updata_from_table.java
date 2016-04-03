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
public class Updata_from_table extends HttpServlet{
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
		if(request.getParameter("input").equals("book_updata_updata")){
			String book_price=request.getParameter("book_price");
			String book_name=request.getParameter("book_name");
			String book_type=request.getParameter("book_type");
			String publisher=request.getParameter("publisher");
			String author=request.getParameter("author");
			
			List<List<String>> book_detail=null;
			int n=0;
			book_detail = (List<List<String>>) session.getAttribute("book_detail");
			n=Integer.parseInt((String)session.getAttribute("numberup"));
			
			String search_id=book_detail.get(n).get(0);
			connect.updata_t_book(search_id, book_price, book_type, author, book_name, publisher);
			out.println("<script language = javascript>location.href='book_updata.jsp';");
			out.println("alert('修改成功')</script>");
			
		}
		else if(request.getParameter("input").equals("search_reader_updata")){
			List<List<String>> reader_detail=null;
			int n=0;
			reader_detail = (List<List<String>>) session.getAttribute("reader_detail");
	    	n=Integer.parseInt((String)session.getAttribute("n"));
	    	String id = reader_detail.get(n).get(0);
			String reader_id=request.getParameter("reader_id");
			String reader_name=request.getParameter("reader_name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String day=request.getParameter("day");
			String date=year+"-"+month+"-"+day;
			String sex=request.getParameter("sex");
			String college_value=request.getParameter("college");
			int college=Integer.parseInt(college_value);
			String type=request.getParameter("type");			
		//	System.out.println(reader_id+"  "+reader_name+"  "+email+"  "+date+"  "+sex+"  "+college+"  "+type);
			connect.updata_t_reader(id,reader_id, reader_name, sex, college, email, phone, type, date);
			out.println("<script language = javascript>location.href='search_reader.jsp';");
			out.println("alert('修改成功')</script>");
		}

	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws
    ServletException,IOException{
		response.setContentType(CONTENT_TYPE);
		PrintWriter out =response.getWriter();
		Enumeration e=request.getParameterNames();
		HttpSession session = request.getSession();
		String xiajia=request.getParameter("xiajia");
		List<List<String>> book=null;
		book = (List<List<String>>) session.getAttribute("book");
		for(int i=0;i<xiajia.length();i++){
			connect.updata_t_book_xiajia( book.get(xiajia.charAt(i)-'0').get(0));
		}
		
		out.println("<script language = javascript>location.href='book_down_1.jsp';");
		out.println("alert('下架成功')</script>");
		
	}
}
