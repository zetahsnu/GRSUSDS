<%@ page import="java.sql.*, java.lang.*" %>
<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"0"); //username
String p=(request.getParameter("p")!=null&&request.getParameter("p")!=""?request.getParameter("p"):"0"); //password
String g=(request.getParameter("g")!=null&&request.getParameter("g")!=""?request.getParameter("g"):"0"); 

String connectionURL = "jdbc:mysql://127.0.0.1:3306/grsusds?user=root;password=a6v6g1r6isyyc";

Connection connection = null;
Statement statement = null;
PreparedStatement pstmt = null;

ResultSet rs = null;

int i=0;
String pathto="home.jsp";

Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	statement = connection.createStatement();
	
	 pstmt = connection.prepareStatement("SELECT * FROM grsusds.users where username = ? and password = ? and isenabled = 1");
	 pstmt.setString(1, u);
	 pstmt.setString(2, p);
	  rs = pstmt.executeQuery();
	 	
	if(rs.next()) {
		i=1;
		session.setAttribute( "s_userid",  rs.getString("userid"));
		session.setAttribute( "s_username",  rs.getString("username"));
		session.setAttribute( "s_firstname",  rs.getString("firstname"));
		session.setAttribute( "s_lastname",  rs.getString("lastname"));
	}
	//else
	//	out.println("ERLSDSED4Rz");
}
catch (Exception e)
{ 
   pathto = ("index.jsp?err=An error has occured:" + e.getMessage());
}
finally
{
	if(rs!=null)rs.close();
	if(statement!=null)statement.close();
	if(pstmt!=null)pstmt.close();
	if(connection!=null)connection.close();
	connection=null; statement=null; rs=null;
	
}
if(i==0) pathto = "index.jsp?err=User+id+or+password+do+not+match"; 
response.sendRedirect(pathto);
//`out.println(pathto);
%>