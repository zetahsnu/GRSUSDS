<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<%

//String filePath = "/usr/share/tomcat7/webapps/staffapp/"+request.getParameter("f");//+"/"+request.getParameter("f");
String filePath = ""+request.getParameter("f");
try{
  File file =new File(filePath);
if(file.exists()) { file.delete();  file= new File(filePath.substring(0,filePath.lastIndexOf('/'))); if(file.exists())  file.delete();}

      }catch(Exception ex) {
         System.out.println(ex);
      }
   
%>
