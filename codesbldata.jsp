<%@ page import="java.sql.*, java.lang.*" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"0"); //userid

String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement statement = null;
ResultSet rs = null;
StringBuffer sb = new StringBuffer("");
int x=0; String a="0";
Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	statement = connection.createStatement();
	rs = statement.executeQuery("SELECT * FROM grsusds.seedcatalogpre order by crop,code");
		
	while(rs.next()){if(x==0) sb.append("<table id='rtab' class='tablesorter' style='display:non'><thead><tr><th>Crop</th><th>Code </th><th>Genus</th><th>Species</th><th>Subtaxa</th><th>Action</th></tr></thead><tbody>"); x++; sb.append("<tr><td id='cfn" + rs.getString("seedcatalogid") + "'>" + rs.getString("crop") + "</td><td id='cln" + rs.getString("seedcatalogid") + "'>" + rs.getString("code") + "</td><td id='oun" + rs.getString("seedcatalogid") + "'>" + rs.getString("genus") + "</td><td id='oem" + rs.getString("seedcatalogid") + "'>" + rs.getString("species") + "</td>"+"<td id='ost" + rs.getString("seedcatalogid") + "'>" + rs.getString("subtaxa") + "</td><td id='ocu" + "><div class='alignright'><a id='ocn" + rs.getString("seedcatalogid") + "' href='javascript:;' onclick='ed(" + rs.getString("seedcatalogid") + ")'>Edit</a> | <a href='javascript:;' onclick='de(" + rs.getString("seedcatalogid") + ")'>Delete</a></span></td>"+"</tr>"); } 
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