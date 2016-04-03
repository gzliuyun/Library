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
import java.io.*;
import java.sql.DriverManager ;
import java.sql.SQLException ;
import java.util.Enumeration;
public class Add_into_table extends HttpServlet{
	public static final String CONTENT_TYPE="text/html;charset=GBK";
	private static ConnectionData connect;
	public void init()throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws
	    SecurityException,IOException{
		response.setContentType(CONTENT_TYPE);
		PrintWriter out =response.getWriter();
		Enumeration e=request.getParameterNames();
		if(request.getParameter("input").equals("reader_register")){
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
		//	System.out.println(college_value);
			int college=Integer.parseInt(college_value);
			String type=request.getParameter("type");			
		//	System.out.println(reader_id+"  "+reader_name+"  "+email+"  "+date+"  "+sex+"  "+college+"  "+type);
			connect.add_t_reader(reader_id, reader_name, sex, college, email, phone, type, date);
			out.println("<script language = javascript>location.href='reader_register.jsp';");
			out.println("alert('注册成功')</script>");
		}
		if(request.getParameter("input").equals("book_into")){
			String book=request.getParameter("book_id");
			String book_price=request.getParameter("book_price");
			String book_name=request.getParameter("book_name");
			String book_type=request.getParameter("book_type");
			int type=Integer.parseInt(book_type);
			String search_id=request.getParameter("search_id");
			String publisher=request.getParameter("publisher");
			String author=request.getParameter("author");
			String num=request.getParameter("number");
			int number=0;
			if(num.length()!=0)
				number=Integer.parseInt(num);
			String book_id=null;
			for(int i=1;i<=number;i++){
				book_id=book+i;
				connect.add_t_book(book_id, book_name, search_id, author, publisher, book_price, type);
			}
			connect.add_t_book_number(search_id, number);
			out.println("<script language = javascript>location.href='book_into.jsp';");
			out.println("alert('入库成功')</script>");
		//	System.out.println(book_id+"  "+book_price+"  "+book_name+"  "+book_type+"  "+search_id+"  "+publisher+"  "+author+"  "+number);
		}
	}
}
