<%@ page import="java.sql.*, net.sf.json.*;" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"0"); //usetring p=(request.getParameter("p")!=null&&request.getParameter("p")!=""?request.getParameter("p"):"0"); //projectid
String em=(request.getParameter("em")!=null&&request.getParameter("em")!=""?request.getParameter("em"):"0"); //activityid

//em= "bharath.krishnan@worldveg.org" ;
//String em2= "9bharath.krishnan@worldveg.org" ;

String connectionURL = "jdbc:mysql://127.0.0.1:3306/v1x?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement statement = null;
ResultSet rs = null;
ResultSet rs2 = null;

JSONObject json = new JSONObject();
JSONArray  r = new JSONArray();
JSONObject r1;

Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	statement = connection.createStatement();
	rs = statement.executeQuery("SELECT 1 FROM v1x.companies_wait WHERE EMAIL LIKE '" + em + "' and isenabled=1");
	if(rs.next()) {
	 	r1 = new JSONObject();
       	r1.put("EX", "1");
      	r.add(r1);		
	}
	else
	{
		rs.close(); rs=null;
		rs = statement.executeQuery("SELECT 1 FROM v1x.companies_approved WHERE EMAIL LIKE '" + em + "' and isenabled=1");
		if(rs.next()) {
		 	r1 = new JSONObject();
	       	r1.put("EX", "2");
	      		r.add(r1);		
		}
		else{
		r1 = new JSONObject();
	   		r1.put("EX", "0");	
	   		r.add(r1); }
	}
   json.put("EXS", r);
}
catch (Exception e)
{ 
   r1 = new JSONObject();
   r1.put("EX", "An error has occured:" + e.getMessage());
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