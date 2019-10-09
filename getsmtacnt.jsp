<%@ page import="java.sql.*, net.sf.json.*" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):""); //userid
String p=(request.getParameter("p")!=null&&request.getParameter("p")!=""?request.getParameter("p"):""); //userid
String cs=(request.getParameter("i")!=null&&request.getParameter("i")!=""?request.getParameter("i"):""); //userid
String fl=(request.getParameter("f")!=null&&request.getParameter("f")!=""?request.getParameter("f"):""); //userid
String rd=(request.getParameter("r")!=null&&request.getParameter("r")!=""?request.getParameter("r"):""); //useridn

String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement statement = null;
ResultSet rs = null;

JSONObject json = new JSONObject();
JSONArray  r = new JSONArray();
JSONObject r1;
int x=0;
Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	statement = connection.createStatement();
	rs = statement.executeQuery("SELECT * FROM grsusds.origincounty order by country");
 	while (rs.next()) {
		x++;
	 	r1 = new JSONObject();
       	r1.put("country", rs.getString("country"));
       	r1.put("contactaddress", rs.getString("contactaddress"));
       	r.add(r1);
	}
	if(x==0)
	{
		r1 = new JSONObject();
   		r1.put("userid", "0");
   		r1.put("name", "There are no orders.");
   		r.add(r1);	
	}
   json.put("order", r);
}
catch (Exception e)
{ 
   r1 = new JSONObject();
   r1.put("userid", "-1");
   r1.put("name", "An error has occured:" + e.getMessage());
   r.add(r1);
}
finally
{
	rs.close();
	statement.close();
	connection.close();
	connection=null; statement=null; rs=null;
}
response.setContentType("application/json; charset=UTF-8");
response.getWriter().write(json.toString());
%>