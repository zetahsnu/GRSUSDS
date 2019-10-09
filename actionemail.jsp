<%@ page import="java.sql.*,  java.io.*,java.util.*, javax.servlet.*, java.io.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import="javax.mail.* "%>
<%@ page import="javax.mail.internet.*,javax.activation.*,javax.mail.util.*"%>

<%
String id=(request.getParameter("id")!=null&&request.getParameter("id")!=""?request.getParameter("id"):""); //orderid
String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"0"); //adminuserid
String uname=(request.getParameter("uname")!=null&&request.getParameter("uname")!=""?request.getParameter("uname"):"0"); //adminuserid
String action=(request.getParameter("action")!=null&&request.getParameter("action")!=""?request.getParameter("action"):"1"); //action
String purpose=(request.getParameter("purpose")!=null&&request.getParameter("purpose")!=""?request.getParameter("purpose"):""); //action
String firstname=(request.getParameter("fn")!=null&&request.getParameter("fn")!=""?request.getParameter("fn"):"");
String lastname=(request.getParameter("ln")!=null&&request.getParameter("ln")!=""?request.getParameter("ln"):"");
String dt=(request.getParameter("dt")!=null&&request.getParameter("dt")!=""?request.getParameter("dt"):"");
String orn=(request.getParameter("orn")!=null&&request.getParameter("orn")!=""?request.getParameter("orn"):"0");
String email=(request.getParameter("em")!=null&&request.getParameter("em")!=""?request.getParameter("em"):"");
String ds=(request.getParameter("ds")!=null&&request.getParameter("ds")!=""?request.getParameter("ds"):"");
String org=(request.getParameter("org")!=null&&request.getParameter("org")!=""?request.getParameter("org"):"");
String n=(request.getParameter("n")!=null&&request.getParameter("n")!=""?request.getParameter("n"):"");
String ph=(request.getParameter("ph")!=null&&request.getParameter("ph")!=""?request.getParameter("ph"):"");
String add=(request.getParameter("add")!=null&&request.getParameter("add")!=""?request.getParameter("add"):"");
String ct=(request.getParameter("ct")!=null&&request.getParameter("ct")!=""?request.getParameter("ct"):"");
String st=(request.getParameter("st")!=null&&request.getParameter("st")!=""?request.getParameter("st"):"");
String zp=(request.getParameter("zp")!=null&&request.getParameter("zp")!=""?request.getParameter("zp"):"");
String cnt=(request.getParameter("cnt")!=null&&request.getParameter("cnt")!=""?request.getParameter("cnt"):"");
String imp=(request.getParameter("imp")!=null&&request.getParameter("imp")!=""?request.getParameter("imp"):"");

String mfirstname=(request.getParameter("mfn")!=null&&request.getParameter("mfn")!=""?request.getParameter("mfn"):"");
String memail=(request.getParameter("mem")!=null&&request.getParameter("mem")!=""?request.getParameter("mem"):"");
String mds=(request.getParameter("mds")!=null&&request.getParameter("mds")!=""?request.getParameter("mds"):"");
String morg=(request.getParameter("morg")!=null&&request.getParameter("morg")!=""?request.getParameter("morg"):"");
String mph=(request.getParameter("mph")!=null&&request.getParameter("mph")!=""?request.getParameter("mph"):"");
String madd=(request.getParameter("madd")!=null&&request.getParameter("madd")!=""?request.getParameter("madd"):"");
String mct=(request.getParameter("mct")!=null&&request.getParameter("mct")!=""?request.getParameter("mct"):"");
String mst=(request.getParameter("mst")!=null&&request.getParameter("mst")!=""?request.getParameter("mst"):"");
String mzp=(request.getParameter("mzp")!=null&&request.getParameter("mzp")!=""?request.getParameter("mzp"):"");
String mcnt=(request.getParameter("mcnt")!=null&&request.getParameter("mcnt")!=""?request.getParameter("mcnt"):"");

String blr=(request.getParameter("blr")!=null&&request.getParameter("blr")!=""?request.getParameter("blr"):"");
String bls=(request.getParameter("bls")!=null&&request.getParameter("bls")!=""?request.getParameter("bls"):"");
String gar=(request.getParameter("gar")!=null&&request.getParameter("gar")!=""?request.getParameter("gar"):"");
String gas=(request.getParameter("gas")!=null&&request.getParameter("gas")!=""?request.getParameter("gas"):"");
String skr=(request.getParameter("skr")!=null&&request.getParameter("skr")!=""?request.getParameter("skr"):"");
String sks=(request.getParameter("sks")!=null&&request.getParameter("sks")!=""?request.getParameter("sks"):"");

String pid=(request.getParameter("pid")!=null&&request.getParameter("pid")!=""?request.getParameter("pid"):"");
String mta=(request.getParameter("mta")!=null&&request.getParameter("mta")!=""?request.getParameter("mta"):"");
String smta=(request.getParameter("smta")!=null&&request.getParameter("smta")!=""?request.getParameter("smta"):"");
String shmd=(request.getParameter("shmd")!=null&&request.getParameter("shmd")!=""?request.getParameter("shmd"):"");
String pymd=(request.getParameter("pymd")!=null&&request.getParameter("pymd")!=""?request.getParameter("pymd"):"");
String pyp=(request.getParameter("pyp")!=null&&request.getParameter("pyp")!=""?request.getParameter("pyp"):"");
String pys=(request.getParameter("pys")!=null&&request.getParameter("pys")!=""?request.getParameter("pys"):"");
String pysh=(request.getParameter("pysh")!=null&&request.getParameter("pysh")!=""?request.getParameter("pysh"):"");
String pyt=(request.getParameter("pyt")!=null&&request.getParameter("pyt")!=""?request.getParameter("pyt"):"");
String est=(request.getParameter("est")!=null&&request.getParameter("est")!=""?request.getParameter("est"):"");
String proc=(request.getParameter("proc")!=null&&request.getParameter("proc")!=""?request.getParameter("proc"):"0");
String smtaorigin=(request.getParameter("smtaorigin")!=null&&request.getParameter("smtaorigin")!=""?request.getParameter("smtaorigin"):"");
String awb=(request.getParameter("awb")!=null&&request.getParameter("awb")!=""?request.getParameter("awb"):"");
String shipnum=(request.getParameter("shipnum")!=null&&request.getParameter("shipnum")!=""?request.getParameter("shipnum"):"");
String sbj=(request.getParameter("sbj")!=null&&request.getParameter("sbj")!=""?request.getParameter("sbj"):"WorldVeg Germplasm: Your request");
String cropshipnum=(request.getParameter("cropshipnum")!=null&&request.getParameter("cropshipnum")!=""?request.getParameter("cropshipnum"):"");
String pym=(request.getParameter("pym")!=null&&request.getParameter("pym")!=""?request.getParameter("pym"):"");
String dept=(request.getParameter("dept")!=null&&request.getParameter("dept")!=""?request.getParameter("dept"):"");
String mdept=(request.getParameter("mdept")!=null&&request.getParameter("mdept")!=""?request.getParameter("mdept"):"");
String pur=(request.getParameter("pur")!=null&&request.getParameter("pur")!=""?request.getParameter("pur"):"");

String connectionURL = "jdbc:mysql://localhost:3306/grsusds?user=root;password=a6v6g1r6isyyc";

	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Class.forName("com.mysql.jdbc.Driver");

	connection = DriverManager.getConnection(connectionURL, "root", "a6v6g1r6isyyc");
	
   int hasFiles = 1;
   String acid="",p="", notes="", acname="", acnot="", pname="",  allUploadedFiles="", filesURL="";

try{      
if(action.equals("1")){
	//pstmt = connection.prepareStatement("INSERT INTO grsusds.invalid ( daterecd, firstname, lastname, email, userid, username, purpose, orderno) VALUES (?,?,?,?,?,?,?,?)"); pstmt.setString(1,dt); pstmt.setString(2,firstname); pstmt.setString(3,lastname);pstmt.setString(4,email);pstmt.setString(5,u);pstmt.setString(6,uname); pstmt.setString(7,purpose);pstmt.setString(8,orn);
		//pstmt.execute();
		
	if(!id.equals("") && purpose.equals("unavailablematerial")){pstmt = connection.prepareStatement("UPDATE grsusds.orders set iscanceled=?,cancelreason=?, canceldate=CURRENT_TIMESTAMP where orderid=?"); pstmt.setString(1,"1"); pstmt.setString(2,"unavailable material"); pstmt.setString(3,id);pstmt.execute();}
}

if(action.equals("2") && id.equals("")){
//	u="1";
	pstmt = connection.prepareStatement("INSERT INTO grsusds.orders (userid, username, orderno, requestdate, email, firstname, lastname, job, org, orgnature, phone, address, city, state, zip, country, imppermreq, breedlinesreq, breedlinessent, germplasmreq, germplasmsent, mtafile, smtafile, pid, shipmode, paymode, payprocess, paytest, payship, paytotal, estimatedamt, isprocessed, origincountry, originaddress,awb, mname, mjob, morg, mphone, maddress, mcity, mstate, mzip, mcountry, memail, shipnum, seedkitreq, seedkitsent, cropshipnum, paymethod, dept, mdept, purpose) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); pstmt.setString(1,u); pstmt.setString(2,uname); pstmt.setString(3,"NEW");pstmt.setString(4, dt);pstmt.setString(5,email);pstmt.setString(6,firstname);pstmt.setString(7,lastname); pstmt.setString(8,ds); pstmt.setString(9,org);pstmt.setString(10,n);pstmt.setString(11,ph);pstmt.setString(12,add);pstmt.setString(13,ct); pstmt.setString(14,st);pstmt.setString(15,zp);pstmt.setString(16,cnt); pstmt.setString(17,imp);pstmt.setString(18,blr);pstmt.setString(19,bls); pstmt.setString(20,gar); pstmt.setString(21,gas); pstmt.setString(22,mta); pstmt.setString(23,smta); pstmt.setString(24,pid);  pstmt.setString(25,shmd); pstmt.setString(26,pymd); pstmt.setString(27,pyp); pstmt.setString(28,pys); pstmt.setString(29,pysh); pstmt.setString(30,pyt);pstmt.setString(31,est); pstmt.setString(32,proc);pstmt.setString(33,smtaorigin); pstmt.setString(34,""); pstmt.setString(35,awb);pstmt.setString(36,mfirstname); pstmt.setString(37,mds); pstmt.setString(38,morg);pstmt.setString(39,mph);pstmt.setString(40,madd);pstmt.setString(41,mct); pstmt.setString(42,mst);pstmt.setString(43,mzp);pstmt.setString(44,mcnt);pstmt.setString(45,memail);pstmt.setString(46,shipnum);pstmt.setString(47,skr); pstmt.setString(48,sks); pstmt.setString(49,cropshipnum); pstmt.setString(50,pym);  pstmt.setString(51,dept);  pstmt.setString(52, mdept);  pstmt.setString(53,pur); 
	pstmt.execute();
}
if(action.equals("3") && !id.equals("")){
	pstmt = connection.prepareStatement("DELETE from grsusds.orders WHERE orderid=?"); pstmt.setString(1,id);pstmt.execute();
}
if(action.equals("2") && !id.equals("")){
	pstmt = connection.prepareStatement("UPDATE grsusds.orders set userid=?, username=?, orderno=?, requestdate=?, email=?, firstname=?, lastname=?, job=?, org=?, orgnature=?, phone=?, address=?, city=?, state=?, zip=?, country=?, imppermreq=?, breedlinesreq=?, breedlinessent=?, germplasmreq=?, germplasmsent=?, mtafile=?, smtafile=?, pid=?, shipmode=?, paymode=?, payprocess=?, paytest=?, payship=?, paytotal=?, estimatedamt=?, isprocessed=?, origincountry=?, originaddress=?, awb=?, mname=?, mjob=?, morg=?, mphone=?, maddress=?, mcity=?, mstate=?, mzip=?, mcountry=?, memail=? " +(proc.equals("1")?", processeddt=CURRENT_DATE":"")+ ", shipnum=?, seedkitreq=?, seedkitsent=?, cropshipnum=?, paymethod=?, dept=?, mdept=?, purpose=? WHERE orderid=?"); pstmt.setString(1,u); pstmt.setString(2,uname); pstmt.setString(3,orn);pstmt.setString(4,dt);pstmt.setString(5,email);pstmt.setString(6,firstname);pstmt.setString(7,lastname); pstmt.setString(8,ds); pstmt.setString(9,org);pstmt.setString(10,n);pstmt.setString(11,ph);pstmt.setString(12,add);pstmt.setString(13,ct); pstmt.setString(14,st);pstmt.setString(15,zp);pstmt.setString(16,cnt); pstmt.setString(17,imp);pstmt.setString(18,blr);pstmt.setString(19,bls); pstmt.setString(20,gar); pstmt.setString(21,gas); pstmt.setString(22,mta); pstmt.setString(23,smta); pstmt.setString(24,pid);  pstmt.setString(25,shmd); pstmt.setString(26,pymd); pstmt.setString(27,pyp); pstmt.setString(28,pys); pstmt.setString(29,pysh); pstmt.setString(30,pyt);pstmt.setString(31,est); pstmt.setString(32,proc); pstmt.setString(33,smtaorigin); pstmt.setString(34,""); pstmt.setString(35,awb); pstmt.setString(36,mfirstname); pstmt.setString(37,mds); pstmt.setString(38,morg);pstmt.setString(39,mph);pstmt.setString(40,madd);pstmt.setString(41,mct); pstmt.setString(42,mst);pstmt.setString(43,mzp);pstmt.setString(44,mcnt);pstmt.setString(45,memail);pstmt.setString(46,shipnum);pstmt.setString(47,skr);pstmt.setString(48,sks); pstmt.setString(49,cropshipnum);  pstmt.setString(50,pym); pstmt.setString(51,dept);  pstmt.setString(52, mdept);  pstmt.setString(53,pur); pstmt.setString(54,id);
	pstmt.execute();
	
	if(proc.equals("1")){
		pstmt = connection.prepareStatement("INSERT INTO grsusds.ordsummary (orderid,fromcountry,tocountry,type,variety) values (?,?,?,?,?)");
		for(int i=0; i<bls.split(";").length; i++) { if(!bls.split(";")[i].equals("")) {for(int j=0; j<bls.split(";")[i].split(":")[1].split(",").length; j++) {pstmt.setInt(1,Integer.parseInt(id));pstmt.setString(2,bls.split(";")[i].split(":")[0]);pstmt.setString(3,cnt);pstmt.setString(4,"BL");pstmt.setString(5,bls.split(";")[i].split(":")[1].split(",")[j]);  pstmt.addBatch();}pstmt.executeBatch();}
		}
		pstmt = connection.prepareStatement("INSERT INTO grsusds.ordsummary (orderid,fromcountry,tocountry,type,variety) values (?,?,?,?,?)");
		for(int i=0; i<gas.split(";").length; i++) { if(!gas.split(";")[i].equals("")) {for(int j=0; j<gas.split(";")[i].split(":")[1].split(",").length; j++) {pstmt.setInt(1,Integer.parseInt(id));pstmt.setString(2,gas.split(";")[i].split(":")[0]);pstmt.setString(3,cnt);pstmt.setString(4,"GA");pstmt.setString(5,gas.split(";")[i].split(":")[1].split(",")[j]);  pstmt.addBatch();}pstmt.executeBatch();}
		}
		pstmt = connection.prepareStatement("INSERT INTO grsusds.ordsummary (orderid,fromcountry,tocountry,type,variety) values (?,?,?,?,?)");
		for(int i=0; i<sks.split(";").length; i++) { if(!sks.split(";")[i].equals("")) {for(int j=0; j<sks.split(";")[i].split(":")[1].split(",").length; j++) {pstmt.setInt(1,Integer.parseInt(id));pstmt.setString(2,sks.split(";")[i].split(":")[0]);pstmt.setString(3,cnt);pstmt.setString(4,"SK");pstmt.setString(5,sks.split(";")[i].split(":")[1].split(",")[j]);  pstmt.addBatch();}pstmt.executeBatch();}
		}
	}
}
if(action.equals("1")){
	String copye="";
		stmt  = connection.createStatement();
	rs = stmt.executeQuery("SELECT email FROM grsusds.users where isenabled=1");
	 while(rs.next()) { copye+="," + rs.getString("email"); } if(!copye.equals(""))copye=copye.substring(1);
   	//send mail	
	String host = "smtp.gmail.com";   
String from = "seedrequest@worldveg.org";
    String user = "seedrequest@worldveg.org";
    String pass = "Latifolia2017";
    Properties props = System.getProperties();
    props.put("mail.smtp.starttls.enable", "true"); // added this line
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.user", user);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");

    Session session1 = Session.getDefaultInstance(props, null);
       
		//session.setAttribute( "s_email",  "kb@worldveg.org");
		MimeMessage message = new MimeMessage(session1);
		
    message.setFrom(new InternetAddress(from));
	String[] to = {request.getParameter("to")}; // added this line
//	String[] to = {"miao-rong.yan@worldveg.org"}; // added this line
	
	String[] cc = new String[copye.split(",").length];//String[] cc = {"roland.schafleitner@worldveg.org","maarten.vanzonneveld@worldveg.org","jessica.chang@worldveg.org"}; // added this line
	if(!copye.equals(""))  cc = copye.split(",");
		
InternetAddress[] toAddress = new InternetAddress[to.length];
InternetAddress[] ccAddress = new InternetAddress[cc.length];
		
		// To get the array of addresses
		for( int zi=0; zi < to.length; zi++ ) { // changed from a while loop
		    toAddress[zi] = new InternetAddress(to[zi]);
		}
		  //  out.println(Message.RecipientType.TO);
		
		for( int zi=0; zi < toAddress.length; zi++) { // changed from a while loop
		    message.addRecipient(Message.RecipientType.TO, toAddress[zi]);
		} 
 			
			out.print(copye);
			// To get the array of ccaddresses
		for( int zi=0; zi < cc.length; zi++ ) { // changed from a while loop
		    ccAddress[zi] = new InternetAddress(cc[zi]);
		}
		  //  out.println(Message.RecipientType.TO);
		
		for( int zi=0; zi < ccAddress.length; zi++) { // changed from a while loop
		    message.addRecipient(Message.RecipientType.CC, ccAddress[zi]);
		}
		
		message.setSubject(""+sbj	);
    	//message.setText("" + request.getParameter("msg"));	
    	message.setContent("" + request.getParameter("msg"),"text/html");	
		    


	    Transport transport = session1.getTransport("smtp");
	    transport.connect(host, user, pass);
	  	transport.sendMessage(message, message.getAllRecipients());
	    transport.close();  transport = null; message = null;
	 	// end of send mail
 	
}     	   		
}   	//response.sendRedirect("home.jsp?pr="+p);
   
   catch (Exception e)
{ 
	    
  out.print( "An error has occured:" + e.getMessage());
}
finally
{
	//if(rs!=null) rs.close();
	//statement.close();
	//connection.close();
	//connection=null; stmt=null; rs=null;
	
} 
%>	
