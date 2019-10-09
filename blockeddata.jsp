<%@ page import="java.sql.*, java.lang.*" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):""); //userid
String t=(request.getParameter("t")!=null&&request.getParameter("t")!=""?request.getParameter("t"):""); //userid
if(t.equals("b"))t="";
String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement statement = null;
ResultSet rs = null; 
StringBuffer sb = new StringBuffer("");
StringBuffer sb2 = new StringBuffer(""); String m="";
int x=0;
Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	statement = connection.createStatement();
	rs = statement.executeQuery("SELECT * FROM grsusds.blocked" + t + " order by contract,crop, variety, untildate");
		
	while(rs.next()){if(!m.equals(rs.getString("contract"))){m=rs.getString("contract");sb2.append(","+rs.getString("contract"));}if(x==0) sb.append("<table id='rtab' class='tablesorter' style='display:non'><thead><tr><th>Contract</th><th>Crop</th><th>Variety</th><th>Validity</th></tr></thead><tbody>"); x++; sb.append("<tr><td><a id='ocn" + rs.getString("blockedid") + "' href='javascript:;' onclick='ed(" + rs.getString("blockedid") + ")'>" + rs.getString("contract") + "</a>"  + "</td><td><i id='ocr" + rs.getString("blockedid") + "'>" + rs.getString("crop") + "</i></td><td id='ocv" + rs.getString("blockedid") + "'>" + rs.getString("variety") + "</td><td id='ocu" + rs.getString("blockedid") + "'>" + rs.getString("untildate") + "<div class='alignright'><a href='javascript:;' onclick='de(" + rs.getString("blockedid") + ")'>Delete</a></div></td></tr>"); } 
	if(x==0){sb.append("");} else {sb.append("</tbody></table><input type='hidden' id='m' value='"+sb2+"'>");}
	
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