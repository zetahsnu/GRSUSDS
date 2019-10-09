<%@ page import="java.sql.*, java.lang.*" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):""); //userid

String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement statement = null;
ResultSet rs = null;
StringBuffer sb = new StringBuffer("");
int x=0;
Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	statement = connection.createStatement();
	rs = statement.executeQuery("SELECT * FROM grsusds.origincounty order by country");
		
	while(rs.next()){if(x==0) sb.append("<table id='rtab' class='tablesorter' style='display:non'><thead><tr><th>Country</th><th>Address</th></tr></thead><tbody>"); x++; sb.append("<tr><td><a href='javascript:;' onclick='ed(" + rs.getString("origincountyid") + ",\"" + rs.getString("country") + "\")'>" + rs.getString("country") + "</a>"  + "</td><td id='oca" + rs.getString("origincountyid") + "'>" + rs.getString("contactaddress") + "<div class='alignright'><a href='javascript:;' onclick='de(" + rs.getString("origincountyid") + ")'>Delete</a></div></td></tr>"); } 
	if(x==0){sb.append("");} else {sb.append("</tbody></table>");}
	
}

catch (Exception e)
{ 
   sb.append("An error has occurred:" + e.getMessage());
}
finally
{
	rs.close();
	statement.close();
	connection.close();
	connection=null; statement=null; rs=null;
	
}
//response.setContentType("application/html; charset=UTF-8");
out.println(sb);
%>