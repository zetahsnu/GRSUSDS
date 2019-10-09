<%@ page import="java.sql.*, net.sf.json.*" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):""); //userid
String p=(request.getParameter("p")!=null&&request.getParameter("p")!=""?request.getParameter("p"):""); //userid
String cs=(request.getParameter("i")!=null&&request.getParameter("i")!=""?request.getParameter("i"):""); //userid
String fl=(request.getParameter("f")!=null&&request.getParameter("f")!=""?request.getParameter("f"):""); //userid
String rd=(request.getParameter("r")!=null&&request.getParameter("r")!=""?request.getParameter("r"):""); //userid

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
	rs = statement.executeQuery("SELECT orderid,userid,username,orderno,DATE_FORMAT(requestdate,'%Y-%m-%d') requestdate,email,firstname,lastname,job,org,orgnature,phone,address,city,state,zip,country,imppermreq,breedlinesreq,breedlinessent,germplasmreq,germplasmsent,mtafile,smtafile,pid,shipmode,paymode,payprocess,paytest,payship,paytotal,estimatedamt,isprocessed, origincountry, originaddress,mname, mjob, morg, mphone, maddress, mcity, mstate, mzip, mcountry, memail, awb, shipnum, seedkitreq, seedkitsent, cropshipnum, paymethod,dept,mdept,purpose FROM grsusds.orders where orderid="+u);
 	if (rs.next()) {
		x++;
	 	r1 = new JSONObject();
       	r1.put("userid", rs.getString("userid"));
       	r1.put("username", rs.getString("username"));
       	r1.put("orderno", rs.getString("orderno"));
       	r1.put("requestdate", rs.getString("requestdate"));
       	r1.put("email", rs.getString("email"));
       	r1.put("firstname", rs.getString("firstname"));
       	r1.put("lastname", rs.getString("lastname"));
       	r1.put("job", rs.getString("job"));
       	r1.put("org", rs.getString("org"));
       	r1.put("orgnature", rs.getString("orgnature"));
       	r1.put("phone", rs.getString("phone"));
       	r1.put("address", rs.getString("address"));
       	r1.put("city", rs.getString("city"));
       	r1.put("state", rs.getString("state"));
       	r1.put("zip", rs.getString("zip"));
       	r1.put("country", rs.getString("country"));
       	r1.put("imppermreq", rs.getString("imppermreq"));
       	r1.put("breedlinesreq", rs.getString("breedlinesreq"));
       	r1.put("breedlinessent", rs.getString("breedlinessent"));
       	r1.put("germplasmreq", rs.getString("germplasmreq"));
       	r1.put("germplasmsent", rs.getString("germplasmsent"));
       	r1.put("mtafile", rs.getString("mtafile"));
       	r1.put("smtafile", rs.getString("smtafile"));
       	r1.put("pid", rs.getString("pid"));
       	r1.put("shipmode", rs.getString("shipmode"));
       	r1.put("paymode", rs.getString("paymode"));
       	r1.put("payprocess", rs.getString("payprocess"));
       	r1.put("paytest", rs.getString("paytest"));
       	r1.put("paymethod", rs.getString("paymethod"));
       	r1.put("payship", rs.getString("payship"));
       	r1.put("paytotal", rs.getString("paytotal"));
       	r1.put("estimatedamt", rs.getString("estimatedamt"));
       	r1.put("isprocessed", rs.getString("isprocessed"));
       	r1.put("origincountry", rs.getString("origincountry"));
       	r1.put("originaddress", rs.getString("originaddress"));
		r1.put("memail", rs.getString("memail"));
       	r1.put("mname", rs.getString("mname"));
       	r1.put("mjob", rs.getString("mjob"));
       	r1.put("morg", rs.getString("morg"));
       	r1.put("mphone", rs.getString("mphone"));
       	r1.put("maddress", rs.getString("maddress"));
       	r1.put("mcity", rs.getString("mcity"));
       	r1.put("mstate", rs.getString("mstate"));
       	r1.put("mzip", rs.getString("mzip"));
       	r1.put("mcountry", rs.getString("mcountry"));
       	r1.put("awb", rs.getString("awb"));
       	r1.put("shipnum", rs.getString("shipnum"));
       	r1.put("cropshipnum", rs.getString("cropshipnum"));
       	r1.put("seedkitreq", rs.getString("seedkitreq"));
       	r1.put("seedkitsent", rs.getString("seedkitsent"));
       	r1.put("dept", rs.getString("dept"));
       	r1.put("mdept", rs.getString("mdept"));
       	r1.put("pur", rs.getString("purpose"));
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