<%@ page import="java.sql.*, net.sf.json.*" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"");

String connectionURL = "jdbc:mysql://127.0.0.1:3306/apsa?user=root;password=a6v6g1r6isyyc";

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
	rs = statement.executeQuery("SELECT * from apsa.traits where " + (!u.equals("")?"cropname= '" + u +"' and ":"") + "isenabled=1 order by cropid,seq");
	  while (rs.next()) {
		x++;
	 	r1 = new JSONObject();
       	r1.put("traitid", rs.getString("traitid"));
       	r1.put("cropid", rs.getString("cropid"));
       	r1.put("cropname", rs.getString("cropname"));
       	r1.put("seq", rs.getString("seq"));
       	r1.put("traitname", rs.getString("traitname"));
       	r1.put("zh_traitname", rs.getString("zh_traitname"));
       	r1.put("isother", rs.getString("isother"));
       	r.add(r1);
	}
	if(x==0)
	{
		r1 = new JSONObject();
   		r1.put("traitid", "0");
   		r1.put("name", "No traits found.");
   		r.add(r1);		
	}
   json.put("traits", r);
}
catch (Exception e)
{ 
   r1 = new JSONObject();
   r1.put("traitid", "-1");
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