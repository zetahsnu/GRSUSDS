<%@ page import="java.sql.*,  java.io.*,java.util.*, javax.servlet.*" %>

<%
String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
 
int isok = 1;
String ma="", successstr="Saved successfully.";
   	
String action = (request.getParameter("action")!=null&&request.getParameter("action")!=""?request.getParameter("action"):"0"); 
String em = (request.getParameter("em")!=null&&request.getParameter("em")!=""?request.getParameter("em"):""); 
String fn = (request.getParameter("fn")!=null&&request.getParameter("fn")!=""?request.getParameter("fn"):""); 
String ln = (request.getParameter("ln")!=null&&request.getParameter("ln")!="" ?request.getParameter("ln"):""); 
String un = (request.getParameter("un")!=null&&request.getParameter("un")!=""?request.getParameter("un"):"");
String pw = (request.getParameter("pw")!=null&&request.getParameter("pw")!=""?request.getParameter("pw"):"");
String pwc = (request.getParameter("pwc")!=null&&request.getParameter("pwc")!=""?request.getParameter("pwc"):"");
String pwac = (request.getParameter("pwac")!=null&&request.getParameter("pwac")!=""?request.getParameter("pwac"):"0");

Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	
	if(action.equals("0"))
	{
		out.print(fn+"k.,");
	pstmt = connection.prepareStatement("INSERT INTO grsusds.users (firstname, lastname, email, username, password, isadmin) VALUES (?,?,?,?,?,?)");
	pstmt.setString(1, fn);pstmt.setString(2, ln);	pstmt.setString(3, em);pstmt.setString(4, un); pstmt.setString(5,pw); pstmt.setString(6,pwac);
	pstmt.executeUpdate();
	}
	
	if(action.equals("1"))
	{
	pstmt = connection.prepareStatement("UPDATE grsusds.users set firstname=?, lastname=?, email=?, username=?, password=?, isadmin=? where userid=?");
		pstmt.setString(1, fn);pstmt.setString(2, ln);	pstmt.setString(3, em);pstmt.setString(4, un); pstmt.setString(5,pw); pstmt.setString(6, pwac);
	pstmt.setString(7, pwc);
	pstmt.executeUpdate();
	}
	
	if(action.equals("2"))
	{
	pstmt = connection.prepareStatement("UPDATE grsusds.users set isenabled = 0 where userid=?");
	pstmt.setString(1, pwc);
	pstmt.executeUpdate();
	}
}
catch (Exception e)
{ 
	isok=0;
   successstr= "An error has occured:" + e.getMessage();
}
finally
{
	if(rs!=null) rs.close();
	if(stmt!=null)stmt.close();
	if(pstmt!=null)pstmt.close();
	connection.close();
	connection=null; pstmt=null;stmt=null; rs=null;	
}

if(isok==0)out.print(successstr);
else response.sendRedirect("users.jsp");
%>
