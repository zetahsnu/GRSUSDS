<html>
<head>
<title>GRSU: Log in</title>
<link href="style/styles.css" rel="stylesheet" type="text/css" />
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.slideshow { height: 434px; width: 718px; margin: auto }
.slideshow img { padding: 1px; border: 1px solid #ccc; background-color: #eee; }
</style>


<!--link type="text/css" href="style/jquery-ui-1.9.2.custom/css/le-frog/jquery-ui-1.9.2.custom.css" rel="stylesheet" /-->
<script language="javascript" src="./js/jquery-1.8.3.min.js"></script>
<script language="javascript" src="./js/json2.js"></script>
<script language="javascript" src="./js/jqModal.js"></script>
<script>
//Get project details
$(document).ready(function () {
	//var s=window.location;

});	

function l()
{
	var un = {"u":document.f.u.value,"p":document.f.p.value};
	if($.trim(un.u)==""){alert("Enter your user id.\nIf you do not have one, please contact your project manager.");return false;}
	if($.trim(un.p)==""){alert("Enter your password.\nIf you forgot it, please contact your project manager.");return false;}
	return true;
}	
</script>
</head>
<body onload="document.f.u.focus()">
<%@ include file="header _home.jsp" %>

<table width="30%" align="center"><tr> <td  align="center"><img src="images/map.jpg"></td></tr></table>
<% if(request.getParameter("err")!=null){%>
<table width="30%" align="center"><tr> <td>
<div class="errdiv"><%=request.getParameter("err")%></div>
</td></tr></table>
<%}%>
<form id="f" name="f" method="POST" action="login.jsp" onSubmit="return l()">
<table width="30%" align="center"><tr> <td>
	<table align="center" id="activitydisplay">
		
		<tr> <td>User id</td> <td width="50%"><input type="text" name="u" value=""></td></tr>
		<tr> <td width="50%">Password</td> <td><input type="password" name="p" value=""></td></tr>
		<tr>
			<td colspan=2 align='right'>  
			  <input class='btnCloseSpecial' type="submit" value="Log in" >
			</td>	
		</tr>
	</table>
</td></tr></table>	
</body>
</form>
</body>
</html>	
