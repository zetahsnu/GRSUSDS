<%@ page import="java.sql.*,  java.io.*,java.util.*, javax.servlet.*" %>

<%
String connectionURL = "jdbc:mysql://127.0.0.1:3306/v1?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
 
int isok = 1;
String ma="", successstr="Saved successfully.";
   	
String action = (request.getParameter("action")!=null&&request.getParameter("action")!=""?request.getParameter("action"):"0"); 
String ge = (request.getParameter("ge")!=null&&request.getParameter("ge")!=""?request.getParameter("ge"):""); 
String cr = (request.getParameter("cr")!=null&&request.getParameter("cr")!=""?request.getParameter("cr"):""); 
String ce = (request.getParameter("ce")!=null&&request.getParameter("ce")!="" ?request.getParameter("ce"):""); 
String sp = (request.getParameter("sp")!=null&&request.getParameter("sp")!=""?request.getParameter("sp"):"");
String st = (request.getParameter("st")!=null&&request.getParameter("st")!=""?request.getParameter("st"):"");
String pwc = (request.getParameter("pwc")!=null&&request.getParameter("pwc")!=""?request.getParameter("pwc"):"");

Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	
	if(action.equals("0"))
	{
	pstmt = connection.prepareStatement("INSERT INTO grsusds.seedcatalogpre (crop, code, genus, species, subtaxa) VALUES (?,?,?,?,?)");
		pstmt.setString(1, cr);pstmt.setString(2, ce);	pstmt.setString(3, ge);pstmt.setString(4, sp); pstmt.setString(5,st); 
	pstmt.executeUpdate();
	}
	
	if(action.equals("1"))
	{
	pstmt = connection.prepareStatement("UPDATE grsusds.seedcatalogpre set crop=?, code=?, genus=?, species=?, subtaxa=? where seedcatalogid=?");
		pstmt.setString(1, cr);pstmt.setString(2, ce);	pstmt.setString(3, ge);pstmt.setString(4, sp); pstmt.setString(5,st); pstmt.setString(6, pwc);
	pstmt.executeUpdate();
	}
	
	if(action.equals("2"))
	{
	pstmt = connection.prepareStatement("delete from grsusds.seedcatalogpre where seedcatalogid=?");
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
else response.sendRedirect("codesbl.jsp");
%>