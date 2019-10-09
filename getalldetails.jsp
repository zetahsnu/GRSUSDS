<%@ page import="java.sql.*, java.lang.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); String hl = (request.getParameter("hl")!=null&&request.getParameter("hl")!=""?request.getParameter("hl"):""); hl = (hl.equals("")?"en":hl); if(!hl.toLowerCase().equals("en") && !hl.toLowerCase().equals("zh")) hl="en";%>
<%!
	public int maxcountry=1; public int maxrole=1; public int maxtraits=1; public int maxpps=1; public int maxtraitsg=1; public int maxtraitsgw=1;
	public String incols (String s, String colname, String delim, String delim2)
	{
		int c=0; int i=0;
		String r=""; 
		if(!colname.equals("country") && colname.indexOf("traits")<0){for(i=0; i<s.split(delim).length;i++) {r+="<td class='" + colname + "'"+ (i==0?" numcol":"") + ">"+s.split(delim)[i]+"</td>"; c++;} }
		if(!colname.equals("country") && colname.indexOf("traits")>-1){for(i=0; i<s.split(delim).length;i++) {r+="<td class='" + colname + "'"+ (i==0?" numcol":"") + ">1</td>"; c++;} }
		if(colname.equals("country")){for(i=0; i<s.split(delim).length;i++) {r+="<td class='coun'" + (i==0?" numcol":"") +  " perc='" +s.split(delim)[i].split(delim2)[1]+ "'>"+s.split(delim)[i].split(delim2)[0]+"</td>"; c++;} if(c>maxcountry) maxcountry=c;}
		if(colname.equals("pps"))if(c>maxpps) maxpps=c;
		if(colname.equals("role"))if(c>maxrole) maxrole=c;
		if(colname.equals("traits"))if(c>maxtraits) maxtraits=c;
		if(colname.equals("gtraits"))if(c>maxtraitsg) maxtraitsg=c;
		if(colname.equals("gtraitsw"))if(c>maxtraitsgw) maxtraitsgw=c;
		return r.replace("numcol","numcol="+i);
		//return r;
	}
%>

<%
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"0"); 

String ut = "";
String connectionURL = "jdbc:mysql://127.0.0.1:3306/apsa?user=root;password=root";

Connection connection = null;
Statement statement = null;
ResultSet rs = null;
int x=0;

String h = "<table border=1 cellpadding=1 style='border-collapse:collapse;border-spacing:0;border-color:#aaa;'><tr style='font-size:1em;font-weight:normal;padding:10px 5px;border-style:solid;border-width:.5px;overflow:hidden;word-break:normal;border-color:#aaa;color:#fff;background-color:#A7C942;'><td align='center'>Status</td><td align='center'>Reference Period</td><td align='center'>Crop</td><td align='center'>All Varieties Sales</td><td align='center'>Total Volume Sales</td><td align='center'>WorldVeg Varieties Sales</td><td align='center'>WorldVeg Volume Sales</td><td align='center'>WorldVeg Traits Used</td><td align='center'>WorldVeg Traits (priority)</td><td align='center'>Location</td><td></td></tr>";
StringBuffer sb = new StringBuffer("<table id='vv' border=1><thead><th class='tr'></th></thead>");
Class.forName("com.mysql.jdbc.Driver");

try
{
	connection = DriverManager.getConnection(connectionURL, "root", "root");
	statement = connection.createStatement();
	HashMap hm = new HashMap();

	rs = statement.executeQuery("select v.varinfoid, v.compname, g.seedprodcnt locationname, v.varname, v.varyearintro, v.volprod, v.seedtype, v.planttype, v.purpose, v.role, v.traits vtraits, g.frommonth, g.fromyear,g.tomonth, g.toyear, g.cropprod, g.numvarieties, g.numvarietiesw, g.totvol, g.totvolw, g.traits gtraits, g.traitsw gtraitsw,g.traitidsw,g.traitids,v.traitids vtraitids, v.*, g.* from apsa.geninfo g, apsa.varinfo v where v.geninfoid = g.geninfoid and g.isenabled=1 and g.status=2 order by g.crophead,2");
	 	
		while (rs.next()) {
			x++;
			sb.append("<tr>") ;
			sb.append("<td>" + rs.getString("compname")+ "</td>");sb.append("<td>" + rs.getString("locationname")+ "</td>");
			sb.append("<td>" + rs.getString("crophead")+ "</td>");sb.append("<td>" + rs.getString("frommonth")+ "</td>");
			sb.append("<td>" + rs.getString("fromyear")+ "</td>");sb.append("<td>" + rs.getString("tomonth")+ "</td>");sb.append("<td>" + rs.getString("toyear")+ "</td>"); 
						sb.append("<td>" + rs.getString("totvol")+ "</td>");sb.append("<td>" + rs.getString("totvolw")+ "</td>");
						sb.append("<td>" + rs.getString("numvarieties")+ "</td>");sb.append("<td>" + rs.getString("numvarietiesw")+ "</td>");
			
			sb.append("<td>" + rs.getString("varname")+ "</td>");sb.append("<td>" + rs.getString("varyearintro")+ "</td>");
			sb.append("<td>" + rs.getString("volprod")+ "</td>");sb.append("<td>" + rs.getString("seedtype")+ "</td>");
			sb.append("<td>" + rs.getString("planttype")+ "</td>");
			sb.append(incols(rs.getString("purpose"),"pps",",",""));
			sb.append(incols(rs.getString("role"),"role","!!",""));
			sb.append(incols(rs.getString("countriespercent"),"country",",","!!"));
			//sb.append(incols(rs.getString("vtraits"),"traits",",",""));
			sb.append("<td class='vtraitids'>" + rs.getString("vtraitids")+ "</td>");  for(int i=1;i<26;i++){sb.append("<td class='vtraitidsval"+i+"'>0</td>");}
			//sb.append(incols(rs.getString("gtraits"),"gtraits",",",""));
			sb.append("<td class='gtraitids'>" + rs.getString("traitids")+ "</td>"); for(int i=1;i<26;i++){sb.append("<td class='traitidsval"+i+"'>0</td>");}
			//sb.append(incols(rs.getString("gtraitsw"),"gtraitsw",",",""));
			sb.append("<td class='gtraitidsw'>" + rs.getString("traitidsw")+ "</td>"); for(int i=1;i<26;i++){sb.append("<td class='traitidswval"+i+"'>0</td>");}
			
		 	sb.append("</tr>");
		//Peppers#c#hot/sweet pepper#hl#番椒#c#番椒
		 	
		}


	rs = statement.executeQuery("select 0, compname, g.seedprodcnt locationname, 'NA' varname, 'NA' varyearintro, 'NA' volprod, 'NA' seedtype, 'NA' planttype, 'NA' purpose, 'NA' role, 'NA' vtraits, 'NA!!NA' countriespercent, g.frommonth, g.fromyear,g.tomonth, g.toyear, g.cropprod, g.numvarieties, g.numvarietiesw, g.totvol, g.totvolw, g.traits gtraits, g.traitsw gtraitsw, g.crophead,g.traitidsw,g.traitids from apsa.geninfo g where g.numvarietiesw<1 and g.isenabled=1 and g.totvolw<1 order by g.crophead,compname");
	 	
		while (rs.next()) {
			x++;
			sb.append("<tr>") ;
			sb.append("<td>" + rs.getString("compname")+rs.getString("traitidsw")+ "</td>");sb.append("<td>" + rs.getString("locationname")+ "</td>");
			sb.append("<td>" + rs.getString("crophead")+ "</td>");sb.append("<td>" + rs.getString("frommonth")+ "</td>");
			sb.append("<td>" + rs.getString("fromyear")+ "</td>");sb.append("<td>" + rs.getString("tomonth")+ "</td>");sb.append("<td>" + rs.getString("toyear")+ "</td>"); 
						sb.append("<td>" + rs.getString("totvol")+ "</td>");sb.append("<td>" + rs.getString("totvolw")+ "</td>");
						sb.append("<td>" + rs.getString("numvarieties")+ "</td>");sb.append("<td>" + rs.getString("numvarietiesw")+ "</td>");
			
			sb.append("<td>" + rs.getString("varname")+ "</td>");sb.append("<td>" + rs.getString("varyearintro")+ "</td>");
			sb.append("<td>" + rs.getString("volprod")+ "</td>");sb.append("<td>" + rs.getString("seedtype")+ "</td>");
			sb.append("<td>" + rs.getString("planttype")+ "</td>");
//sb.append("<td>NA</td>");sb.append("<td>NA</td>");sb.append("<td>NA</td>");sb.append("<td>NA</td>");
			sb.append(incols(rs.getString("purpose"),"pps",",",""));
			sb.append(incols(rs.getString("role"),"role","!!",""));
			sb.append(incols(rs.getString("countriespercent"),"country",",","!!"));
			//sb.append(incols(rs.getString("vtraits"),"traits",",",""));
			for(int i=1;i<27;i++){sb.append("<td>NA</td>");}
			//sb.append(incols(rs.getString("gtraits"),"gtraits",",",""));
			sb.append("<td class='gtraitids'>" + rs.getString("traitids")+ "</td>"); for(int i=1;i<26;i++){sb.append("<td class='traitidsval"+i+"'>0</td>");}
			//sb.append(incols(rs.getString("gtraitsw"),"gtraitsw",",",""));
			sb.append("<td class='gtraitidsw'>" + rs.getString("traitidsw")+ "</td>"); for(int i=1;i<26;i++){sb.append("<td class='traitidswval"+i+"'>0</td>");}
}	

		if(x>0) sb.append("</table>");
 

}
catch (Exception e)
{ 
	
   sb.append( "An error has occured:" + e.getMessage());
}
finally
{
	if(rs!=null) rs.close();
	statement.close();
	connection.close();
	connection=null; statement=null; rs=null;
	
}
response.setContentType("text/html; charset=UTF-8");
if(x==0)out.print("");else out.print(""+sb+"<input type='hidden' id='maxcountry' name='maxcountry' value='"+maxcountry+"'><input type='hidden' id='maxpps' name='maxpps' value='"+maxpps+"'><input type='hidden' id='maxrole' name='maxrole' value='"+maxrole+"'><input type='hidden' id='maxtraits' name='maxtraits' value='"+maxtraits+"'><input type='hidden' id='maxtraitsg' name='maxtraitsg' value='"+maxtraitsg+"'><input type='hidden' id='maxtraitsgw' name='maxtraitsgw' value='"+maxtraitsgw+"'>");
%>
