<%@ page import="java.sql.*" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):""); //userid
String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement statement = null;
ResultSet rs = null;
String un="";
int x=0;
Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	statement = connection.createStatement();
	rs = statement.executeQuery("SELECT firstname,lastname FROM grsusds.users where userid="+u);
 	if (rs.next()) {
		x++;
       	un = rs.getString("firstname") + " " + rs.getString("lastname");
		}
	if(x==0)
	{ un="There are no users.";	}
}
catch (Exception e)
{  un="An error has occured:" + e.getMessage();}
finally
{
	rs.close();
	statement.close();
	connection.close();
	connection=null; statement=null; rs=null;
}
out.print(un);
%>