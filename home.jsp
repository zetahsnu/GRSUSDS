<!DOCTYPE html>
<%String u=((String)session.getAttribute( "s_userid")!=null&&!((String)session.getAttribute( "s_userid")).equals("null")?(String)session.getAttribute( "s_userid"):(request.getParameter("u")!=null&&request.getParameter("u")!=""?"vb"+request.getParameter("u"):"0"));%>
	<html>
	<head>
	<title>GRSU SDS</title>
	 <meta charset='utf-8'>
	<link href="style/styles.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="./js/jquery-1.8.3.min.js"></script> 
	
<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="./js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" href="./js/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />


<script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="js/jquery.tablesorter.widgets.min.js"></script>
<link rel="stylesheet" type="text/css" href="omstable.theme.blue.css" />

<style>
.dropbtn {
    color: orange;
    font-size: 26px;
    border: none;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 260px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
  <script language="javascript" src="./js/notify.min.js"></script>
  <script>
$(document).ready(function () {
	    $("#spinner").bind("ajaxSend", function() {
        $(this).show();
    }).bind("ajaxStop", function() {
        $(this).hide();
    }).bind("ajaxError", function() {
        $(this).hide();
    });
	
var un={"u":$("#u").val()}; if(un.u!="0"){
	$.ajax({
		type: "POST",
		data: un,
		url:"list.jsp" 	,
		success:function(result){
			if($.trim(result)=="") {$("#d").html("No seed requests for you to manage. Begin by clicking <i>Process new seed request</i> above.");return;}
			$("#d").html(result);
			$(function(){
			  $("#rtab").tablesorter({theme:'blue'	, widthFixed: true, widgets: ['zebra','stickyHeaders','filter'], widgetOptions:{stickyHeaders : 'tablesorter-stickyHeader'}}); $("#rtab").show(); $("#wgxls").show(); $("#dm").show();
			});				
  		}
	});
	}else{alert("You will be logged out for security reasons.\n\nPlease log in again.");top.location.href="logout.jsp";}
});	

function fa(x)
{
	$("#q").val(x); document.f.submit();
}
</script>
</head>
<body>	<%@ include file="header.jsp" %>
<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="spinner.gif" alt="Loading"/>
</div>
<form id="f" name="f" method='post' action='orderform.jsp'>
<table width="70%" align="center" border="0"><tr> <td width="100%">
	<table id="activitydispla" width="100%">
	
		</tr>
		<tr id="projectnamePaneltr">
			<td id="projectnamePanel" width="50%" >
				
				<input type="submit" class='btnCloseSpecial' value="+ Process new seed request"> | <a href="report.jsp" class='btnCloseSpecial' target="_self">&#128240; Report</a>
			</td>	
	<td id="projectnamePanel" width="50%" align="right" >
		<div class="dropdown">
		 <span class="dropbtn">&#x2699;</span>
  <div class="dropdown-content">
    <a href="origins.jsp"target="_self">Manage WorldVeg offices</a>
    <a href="blocked.jsp" target="_self">Varieties for consortia</a>  
    <a href="users.jsp" target="_self">Manage users</a>    <a href="codesbl.jsp" target="_self">Breeding line codes</a>  </div>
  </div>
				| <a href='logout.jsp' class='btnCloseSp'>Logout</a>
			</td>	
	</table>
</td></tr></table>
<div style="width:70%;margin: 0 auto;" id="d"><img src="spinner.gif"></div>

	<input type="hidden" id="u" name="u" value="<%=u%>">
	<input type="hidden" id="q" name="q" value="">
	<input type="hidden" id="username" name="username" value="<%=session.getAttribute( "s_username")%>">
	<input type="hidden" id="firstname" name="firstname" value="<%=session.getAttribute( "s_firstname")%>">
	<input type="hidden" id="lastname" name="lastname" value="<%=session.getAttribute( "s_lastname")%>">
</form>
<div id="ca"></div>
</body>
</html>
