<%@ page import="java.sql.*,  java.io.*,java.util.*, javax.servlet.*" %>

<%
String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
 
int isok = 1;
String ma="", successstr="Saved successfully.";
   	
String action = (request.getParameter("q")!=null&&request.getParameter("q")!=""?request.getParameter("q"):"0"); 
String actnot = (request.getParameter("cont")!=null&&request.getParameter("cont")!=""?request.getParameter("cont"):""); 
String actname = (request.getParameter("crop")!=null&&request.getParameter("crop")!=""?request.getParameter("crop"):""); 
String actname2 = (request.getParameter("vari")!=null&&request.getParameter("vari")!=""?request.getParameter("vari"):""); 
String actdt = (request.getParameter("undt")!=null&&request.getParameter("undt")!=""?request.getParameter("undt"):"");
String region = (request.getParameter("actdt2")!=null&&request.getParameter("actdt2")!=""?request.getParameter("actdt2"):"");
String t=(request.getParameter("t")!=null&&request.getParameter("t")!=""?request.getParameter("t"):""); //userid
if(t.equals("b"))t="";
Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	
	if(action.equals("0"))
	{
	pstmt = connection.prepareStatement("INSERT INTO grsusds.blocked" + t + " (variety, crop, contract, untildate) VALUES (?,?,?,?)");
	pstmt.setString(1, actname2);pstmt.setString(2, actname); pstmt.setString(3, actnot);pstmt.setString(4, actdt);
	pstmt.executeUpdate();
	}
	else{
	if(region.equals("")){
	pstmt = connection.prepareStatement("update grsusds.blocked" + t + " set variety=?, crop=?, contract=?, untildate=? where blockedid=?");
	pstmt.setString(1, actname2);pstmt.setString(2, actname); pstmt.setString(3, actnot);pstmt.setString(4, actdt);pstmt.setString(5, action);
	}else {
	pstmt = connection.prepareStatement("delete from grsusds.blocked" + t + " where blockedid=?");
	pstmt.setString(1, action);
	}pstmt.executeUpdate();
		
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
else response.sendRedirect("blocked.jsp");
%>
