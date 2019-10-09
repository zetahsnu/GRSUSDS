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
String actnot = (request.getParameter("bl")!=null&&request.getParameter("bl")!=""?request.getParameter("bl"):""); 
String actname = (request.getParameter("Country")!=null&&request.getParameter("Country")!=""?request.getParameter("Country"):""); 
String actname2 = (request.getParameter("actname2")!=null&&request.getParameter("actname2")!=""?request.getParameter("actname2"):""); 
String actdt = (request.getParameter("actdt")!=null&&request.getParameter("actdt")!=""?request.getParameter("actdt"):"");
String region = (request.getParameter("actdt2")!=null&&request.getParameter("actdt2")!=""?request.getParameter("actdt2"):"");

Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	
	if(action.equals("0"))
	{
	pstmt = connection.prepareStatement("INSERT INTO grsusds.origincounty (contactaddress, country) VALUES (?,?)");
	pstmt.setString(2, actname);pstmt.setString(1, actnot);
	pstmt.executeUpdate();
	}
	else{	if(region.equals("")){
	pstmt = connection.prepareStatement("update grsusds.origincounty set contactaddress=?, country=? where origincountyid=?");
	pstmt.setString(2, actname);pstmt.setString(1, actnot);pstmt.setString(3, action);	}else {
	pstmt = connection.prepareStatement("delete from grsusds.origincounty where origincountyid=?");
	pstmt.setString(1, action);
	}
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
else response.sendRedirect("origins.jsp");
%>
