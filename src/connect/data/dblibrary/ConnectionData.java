package connect.data.dblibrary;
import java.sql.Connection ;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;

import javax.naming.*;

import java.io.*;
import java.sql.DriverManager ;
import java.sql.SQLException ;
public class ConnectionData{
	// 定义MySQL的数据库驱动程序
//	public static final String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
	public static final String DBDRIVER = "com.mysql.jdbc.Driver" ;
	// 定义MySQL数据库的连接地址
	public static final String DBURL = "jdbc:mysql://localhost:3306/dblibrary?useUnicode=true&characterEncoding=GBK" ;
	                                   //useUnicode=true&characterEncoding=GBK;  URl加上这句才能存储中文
	// MySQL数据库的连接用户名
	public static final String DBUSER = "root" ;
	// MySQL数据库的连接密码
	public static final String DBPASS = null ;
	private static Connection conn = null ;		// 数据库连接
	public static void start(){
		
		try{
			Class.forName(DBDRIVER) ;	// 加载驱动程序
		}catch(ClassNotFoundException e){
			e.printStackTrace() ;
		}
		try{
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
		}catch(SQLException e){
			e.printStackTrace() ;
		}
		//System.out.println(conn) ;	// 如果此时可以打印表示连接正常
	}
	public static void close(){
		try{
			conn.close() ;			// 数据库关闭
		}catch(SQLException e){
			e.printStackTrace() ;
		}
	}
	public static String select_t_reader(String key,String col)// 显示数据库
	{  start();
	    ResultSet rs;
	    String str=null;
		try{
			String sql="select "+col+" from t_reader where READER_ID ='"+key+"'";
		//	System.out.println(sql);
			Statement st=conn.createStatement();			
			rs=st.executeQuery(sql);
			if(rs.wasNull())
				return str;     
			rs.first();
			str=rs.getString(col);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
		return str;
	}
	public static String select_t_admin(String key,String col)// 显示数据库
	{  start();
	    ResultSet rs;
	    String str=null;
		try{
			String sql="select "+col+" from t_admin where ADMIN_ID ='"+key+"'";
		//	System.out.println(sql);
			Statement st=conn.createStatement();			
			rs=st.executeQuery(sql);	
		    if(rs.wasNull())
				return str;    
		    rs.first();
			str=rs.getString(col);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
		return str;
	}
	public static List<List<String>> select_t_book_search_id(String key)// 显示数据库
	{   start();
	    ResultSet rs1,rs2,rs3;
	    List<List<String>> book_detail = null;
	    List<String> pass = null;
	    book_detail=new ArrayList<List<String>>(20);
	    pass=new ArrayList<String>(8);
		try{
			String sql1="select *from t_book where SEARCH_ID ='"+key+"'";
			String sql2="select *from t_book_number where SEARCH_ID ='"+key+"'";
		//	System.out.println(sql1);
			Statement st1=conn.createStatement();			
			rs1=st1.executeQuery(sql1);	
		    if(rs1.wasNull())
				return book_detail;    
		    rs1.first();
		    	pass.clear();
		    	pass.add(key);//SEARCH_ID
		    	pass.add((String)rs1.getString("BOOK_NAME"));
		           //  System.out.println((String)rs1.getString("BOOK_NAME"));
		    	pass.add((String)rs1.getString("PUBLISHER"));
		    	pass.add((String)rs1.getString("AUTHOR"));
		    	
		    	String str=(String)rs1.getString("BOOK_TYPE");
		    	String sql3="select *from t_book_type where BOOK_TYPE ='"+str+"'";
		    	Statement st3=conn.createStatement();			
				rs3=st3.executeQuery(sql3);
		    	rs3.first();
		    	
		    	pass.add((String)rs3.getString("TYPE_NAME"));
		    	pass.add((String)rs1.getString("PRICE"));
			
		
		    	Statement st2=conn.createStatement();			
		    	rs2=st2.executeQuery(sql2);
		    	rs2.first();
		    	pass.add((String)rs2.getString("ALL_NUMBER"));
		    	pass.add((String)rs2.getString("LEFT_NUMBER"));
		      //	System.out.println(pass.get(0)+"  "+pass.get(1)+"  "+pass.get(2));
		    	book_detail.add(pass);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
		return book_detail;
	}
	public static List<List<String>> select_t_book_book(String key)// 显示数据库
	{   start();
	    ResultSet rs1,rs3;
	    List<List<String>> book_detail = null;
	    List<String> pass = null;
	    book_detail=new ArrayList<List<String>>(1000);

		try{
			String sql1="select *from t_book where SEARCH_ID ='"+key+"'";
		//	System.out.println(sql1);
			Statement st1=conn.createStatement();			
			rs1=st1.executeQuery(sql1);	
		    if(rs1.wasNull())
				return book_detail;    
		    while(rs1.next()){
			    pass=new ArrayList<String>(5);
		    	pass.add((String)rs1.getString("BOOK_ID"));//BOOK_ID
		    	pass.add((String)rs1.getString("BOOK_NAME"));
		           //  System.out.println((String)rs1.getString("BOOK_NAME"));
		    	pass.add((String)rs1.getString("PUBLISHER"));
		    	pass.add((String)rs1.getString("AUTHOR"));
		    	
		    	String str=(String)rs1.getString("BOOK_TYPE");
		    	String sql3="select *from t_book_type where BOOK_TYPE ='"+str+"'";
		    	Statement st3=conn.createStatement();			
				rs3=st3.executeQuery(sql3);
		    	rs3.first();
		    	
		    	pass.add((String)rs3.getString("TYPE_NAME"));					
		    	book_detail.add(pass);
		    }
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
		return book_detail;
	}
	public static List<List<String>> select_t_book_search(String key)// 显示数据库
	{   start();
	    ResultSet rs;
	    List<List<String>> detail = null;
	    List<String> pass = null;
	    detail=new ArrayList<List<String>>(100);
		try{
			String sql="select *from t_book where SEARCH_ID ='"+key+"'";
		    Statement st=conn.createStatement();			
			rs=st.executeQuery(sql);	
		    if(rs.wasNull())
				return detail;    
		    while(rs.next()){
		    	pass=new ArrayList<String>(3);
		    	pass.add((String)rs.getString("BOOK_ID"));
		    	
		    	String av=(String)rs.getString("AVAILABLE");
		    	if(av.equals("0"))
			    	pass.add("否");
		    	else pass.add("是");
		    	
		    	String bo=(String)rs.getString("BORROWED");
		    	if(bo.equals("0"))
		    		pass.add("否");
		    	else pass.add("是");
		    	detail.add(pass);
		    }
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
		return detail;
	}
	public static List<List<String>> select_t_book_book_name(String key)// 显示数据库
	{   start();
	    ResultSet rs1,rs2,rs3;
	    List<List<String>> book_detail = null;
	    List<String> pass = null;
	    book_detail=new ArrayList<List<String>>(20);
		try{
			String sql1="select distinct SEARCH_ID,AUTHOR,PUBLISHER,PRICE,BOOK_TYPE from t_book where BOOK_NAME ='"+key+"'";
		//	System.out.println(sql1);
			Statement st1=conn.createStatement();			
			rs1=st1.executeQuery(sql1);	
		    if(rs1.wasNull())
				return book_detail;    
		    while(rs1.next()){
		    	pass=new ArrayList<String>(8);
		    	String str1=(String)rs1.getString("SEARCH_ID");
		    	pass.add(str1);
		    	pass.add(key);//BOOK_NAME
		           //  System.out.println((String)rs1.getString("BOOK_NAME"));
		    	pass.add((String)rs1.getString("PUBLISHER"));
		    	pass.add((String)rs1.getString("AUTHOR"));
		    	
		       String str2=(String)rs1.getString("BOOK_TYPE");
		    	String sql3="select *from t_book_type where BOOK_TYPE ='"+str2+"'";
		    	Statement st3=conn.createStatement();			
				rs3=st3.executeQuery(sql3);
		    	rs3.first();
		    	pass.add((String)rs3.getString("TYPE_NAME"));
		    	
		    	pass.add((String)rs1.getString("PRICE"));
			
		    	String sql2="select *from t_book_number where SEARCH_ID ='"+str1+"'";
		    	Statement st2=conn.createStatement();			
		    	rs2=st2.executeQuery(sql2);
		    	rs2.first();
		    	pass.add((String)rs2.getString("ALL_NUMBER"));
		    	pass.add((String)rs2.getString("LEFT_NUMBER"));
		      	//System.out.println(pass.get(0)+"  "+pass.get(1)+"  "+pass.get(2)+"  "+pass.get(3)+"  "+pass.get(4)+"  "+pass.get(5)+"  "+pass.get(6)+"  "+pass.get(7));
		    	book_detail.add(pass);
		    	
		    }
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
		return book_detail;
	}
	public static List<List<String>> select_t_reader_id_name(String key,String col)// 显示数据库
	{   start();
	    ResultSet rs1,rs2;
	    List<List<String>> reader_detail = null;
	    List<String> pass = null;
	    reader_detail=new ArrayList<List<String>>(20);
		try{
			String sql1="select *from t_reader where "+col+" ='"+key+"'";
			Statement st1=conn.createStatement();			
			rs1=st1.executeQuery(sql1);	
		    if(rs1.wasNull())
				return reader_detail;    
		    while(rs1.next()){
		    	pass=new ArrayList<String>(10);
		    	pass.add((String)rs1.getString("READER_ID"));
		    	pass.add((String)rs1.getString("READER_NAME"));
		    	
		        String str2=(String)rs1.getString("COLLEGE");
		    	String sql2="select *from t_college where COLLEGE ='"+str2+"'";
		    	Statement st2=conn.createStatement();			
				rs2=st2.executeQuery(sql2);
		    	rs2.first();
		    	pass.add((String)rs2.getString("COLLEGE_NAME"));
		    	
		    	pass.add((String)rs1.getString("EMAIL"));
		    	pass.add((String)rs1.getString("READER_TYPE"));
		    	pass.add((String)rs1.getString("BORROW_NUMBER"));
		    	pass.add((String)rs1.getString("GRADUATE_TIME"));
		    	pass.add((String)rs1.getString("SEX"));
		    	pass.add((String)rs1.getString("PHONE"));
		    	pass.add((String)rs1.getString("PASSWORD"));
		    	reader_detail.add(pass);
		    	
		    }
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
		return reader_detail;
	}
	public static void add_t_reader(String reader_id,String reader_name,String sex,int college,String email,String phone,String reader_type, String graduate_time){ //增加项
		start();
		try{
			String sql="insert into t_reader (READER_ID,READER_NAME,SEX,COLLEGE,EMAIL,PHONE,READER_TYPE,GRADUATE_TIME) values( '"+reader_id+"', '"+reader_name+"', '"+sex+"','"+college+"', '"+email+"','"+phone+"','"+reader_type+"','"+graduate_time+"')";
			
		//	System.out.println(sql);
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public static void add_t_book(String book_id,String book_name,String search_id,String author,String publisher,String price,int book_type){ //增加项
		start();
		try{
			String sql="insert into t_book (BOOK_ID,BOOK_NAME,SEARCH_ID,AUTHOR,PUBLISHER,PRICE,BOOK_TYPE) values( '"+book_id+"', '"+book_name+"', '"+search_id+"','"+author+"', '"+publisher+"','"+price+"','"+book_type+"')";
			
		//	System.out.println(sql);
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public static void add_t_book_number(String search_id,int number){ //增加项
		start();
		try{
			String sql="insert into t_book_number (SEARCH_ID,ALL_NUMBER,LEFT_NUMBER) values( '"+search_id+"', '"+number+"', '"+number+"')";
			
		//	System.out.println(sql);
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	
	
	public  static void delect_t_book(String book_id){ //删除项
		start();
		try{
			String sql="delete from t_book where BOOK_ID='"+book_id+"'";
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public  static void delect_t_reader(String reader_id){ //删除项
		start();
		try{
			String sql="delete from t_reader where READER_ID = '"+reader_id+"'";
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public  static void updata_t_reader_setright(String reader_id ){ //更新项
		start();
		try{
			System.out.println(reader_id);
			String sql = "update t_reader set RIGHT = 1  where READER_ID = '"+reader_id+"'";
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public  static void updata_t_book_number(int n, String book_id ){ //更新项
		start();
		ResultSet rs1,rs2;
		try{
			String s1="select *from t_book where BOOK_ID ='"+book_id+"'";
	    	Statement st1=conn.createStatement();			
			rs1=st1.executeQuery(s1);
	    	rs1.first();
			String search_id=(String)rs1.getString("SEARCH_ID");
			System.out.println(search_id);
			
			String s2="select *from t_book_number where SEARCH_ID ='"+search_id+"'";
	    	Statement st2=conn.createStatement();			
			rs2=st2.executeQuery(s2);
	    	rs2.first();
			String all=Integer.parseInt((String)rs2.getString("ALL_NUMBER"))-n+"";
			String left=Integer.parseInt((String)rs2.getString("LEFT_NUMBER"))-n+"";
			if((Integer.parseInt((String)rs2.getString("ALL_NUMBER"))-n)==0){
			
					String x="delete from t_book_number where SEARCH_ID ='"+search_id+"'";
					Statement st=conn.createStatement();
					st.executeUpdate(x);
				
			}
			String sql="update t_book_number set ALL_NUMBER = '"+all+"',LEFT_NUMBER = '"+left+"' where SEARCH_ID = '"+search_id+"'";
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public  static void updata_t_book_xiajia(String book_id ){ //更新项
		start();
		try{
			String sql="update t_book set AVAILABLE = '1' where BOOK_ID = '"+book_id+"'";
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public static void updata_t_reader(String id ,String reader_id,String reader_name,String sex,int college,String email,String phone,String reader_type, String graduate_time){ //增加项
		start();
		try{
			String sql="update t_reader set READER_ID = '"+reader_id+"', READER_NAME = '"+reader_name+"',SEX = '"+sex+"',COLLEGE = "+college+",EMAIL = '"+email+"',PHONE = '"+phone+"',READER_TYPE = '"+reader_type+"',GRADUATE_TIME = '"+graduate_time+"' where READER_ID = '"+id+"'";
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
	public  static void updata_t_book(String search_id,String book_price,String book_type,String author,String book_name,String publisher){ //更新项
		start();
		try{
			String sql="update t_book set BOOK_NAME = '"+book_name+"',BOOK_TYPE = '"+book_type+"',PRICE = '"+book_price+"',PUBLISHER = '"+publisher+"',AUTHOR = '"+author+"' where SEARCH_ID = '"+search_id+"'";
			Statement st=conn.createStatement();
			st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		close();
	}
};