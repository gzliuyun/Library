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
public class Select_from_table extends HttpServlet{
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
		if(request.getParameter("input").equals("search_reader1")){   //读者证件号查询
			String reader_id=request.getParameter("reader_id");
			List<List<String>> reader_detail=null;
			reader_detail = connect.select_t_reader_id_name(reader_id,"READER_ID"); 
			session.setAttribute("reader_detail", reader_detail);
			response.sendRedirect("search_reader_1.jsp");
		}
		if(request.getParameter("input").equals("search_reader2")){   //读者姓名查询
			String reader_name=request.getParameter("reader_name");
			List<List<String>> reader_detail=null;
			reader_detail = connect.select_t_reader_id_name(reader_name,"READER_NAME"); 
			session.setAttribute("reader_detail", reader_detail);
			response.sendRedirect("search_reader_1.jsp");
		}
		else if(request.getParameter("input").equals("book_updata1")){  //图书索书号查询
			String search_id=request.getParameter("search_id");
			List<List<String>> book_detail=null;
			book_detail = connect.select_t_book_search_id(search_id); 
			session.setAttribute("book_detail", book_detail);
			response.sendRedirect("book_updata_1.jsp");
		}
		else if(request.getParameter("input").equals("book_updata2")){  //图书索书名
			String book_name=request.getParameter("book_name");
			List<List<String>> book_detail=null;
			book_detail = connect.select_t_book_book_name(book_name);
			session.setAttribute("book_detail", book_detail);
			response.sendRedirect("book_updata_1.jsp");
		}
		else if(request.getParameter("input").equals("book_down")){   //图书下架
			String search=request.getParameter("search");
			List<List<String>> book=null;
			book = connect.select_t_book_book(search);
			session.setAttribute("book",book);
			response.sendRedirect("book_down_1.jsp");
		}
		else if(request.getParameter("input")!=null){  //图书信息
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
