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

  <script language="javascript" src="./js/notify.min.js"></script>
  <script>
$(document).ready(function () {
		if($("#sesu").val()=="0"){ $("#mmkm").hide(); alert("You cannot access this page unless you are logged in.");window.close();return}

	    $("#spinner").bind("ajaxSend", function() {
        $(this).show();
    }).bind("ajaxStop", function() {
        $(this).hide();
    }).bind("ajaxError", function() {
        $(this).hide();
    });
		$("#inline").fancybox(); 

	$.ajax({
		type: "POST",
		data: {"u":$("#sesu").val()},
		url:"usersdata.jsp" 	,
		success:function(result){
			if($.trim(result)=="") {$("#d").html("No users to manage.");return;}
			$("#d").html(result);
			$(function(){
			  $("#rtab").tablesorter({theme:'blue'	, widthFixed: true, widgets: ['zebra','stickyHeaders','filter'], widgetOptions:{stickyHeaders : 'tablesorter-stickyHeader'}}); $("#rtab").show(); $("#wgxls").show(); $("#dm").show();
			});				
  		}
	});
	
});	

function pp(p){
$.ajax({
		type: "POST",
		data: {"action":p},
		url:"sendpw.jsp" 	,
		success:function(result){
			if($.trim(result)=="") {alert("Login details sent.");return;}
  		}
	});
}
	
var GX=0;
function ed(x,y)
{
	GX=x;
	$("#fn").val($("#cfn"+x).text());
	$("#ln").val($("#cln"+x).text());
	$("#em").val($("#oem"+x).text());
	$("#un").val($("#oun"+x).text());
	$("#pw").val($("#opw"+x).text());
	$("#pwc").val($("#opw"+x).text());
	if(y==1) document.f2.pwac.checked=true; else document.f2.pwac.checked=false;
	$("#divfu").show();
}

function fa()
{
	if ($.trim(document.f2.fn.value) == "") {alert('First name is required.');document.f2.fn.focus();return false;}
	if ($.trim(document.f2.ln.value) == "") {alert('Last name is required.');document.f2.ln.focus();return false;}
	if ($.trim(document.f2.em.value) == "") {alert('Email is required.');document.f2.em.focus();return false;}
	if ($.trim(document.f2.un.value) == "") {alert('User name is required.');document.f2.un.focus();return false;}
	if ($.trim(document.f2.pw.value) == "") {alert('Password is required.');document.f2.pw.focus();return false;}
	if ($.trim(document.f2.pw.value) != $.trim(document.f2.pwc.value)) {alert('Passwords do not match.');document.f2.pw.focus();return false;}
	
	if (GX==0) $("#action").val(0); else {$("#action").val(1);$("#pwc").val(GX);}
	document.f2.submit();
}

function de(x)
{	
	$("#action").val(2); $("#pwc").val(x); document.f2.submit();
}
</script>
<body>
<%@ include file="header.jsp" %><br>
	<input type="hidden" id="sesu" name="sesu" value="<%=u%>">

<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="spinner.gif" alt="Loading"/>
</div>
<form id="f" name="f" method='post' action='orderform.jsp'>
<table width="70%" align="center" border="0"><tr> <td width="100%">
	<table id="activitydispla" width="100%"> <tr><td><input type="button" onclick="ed(0,'')" class='btnCloseSpecial' id='mmkm' value="+ Add new user"></td>	
		</tr>		
		<tr id="projectnamePaneltr">
			<td id="projectnamePanel" width="50%" >
				
			</td>	
	<td id="projectnamePanel" width="50%" align="right" >
				
			</td>	
	</table>
</td></tr></table>
</form>
<div style="width:70%;margin: 0 auto;" id="d"></div>
<div id="ca"></div>
<div id="divfu" style="position: fixed; display:none;
        width: 30%; 
        z-index: 2; 
        top: 50%;
        left: 50%;
        margin-top: -10%; 
        margin-left: -10%;
        padding: 1px;
        border: .5px solid #555555;
        background-color: lightyellow;
        border-radius: 5px;
        text-align: center;">
<form action="userssave.jsp" method="post" id="f2" name="f2">
    		<table align="center" id="activitydisplay">
			<tr><td>First Name</td><td><input type="text" name="fn" id="fn" maxlength="50"></td></tr>
			<tr><td>Last Name</td><td><input type="text" name="ln" id="ln" maxlength="50"></td></tr>
			<tr><td>User Name</td><td><input type="text" name="un" id="un" maxlength="50"></td></tr>
			<tr><td>Email</td><td><input type="text" name="em" id="em" maxlength="50"></td></tr>
			<tr><td>Password</td><td><input type="password" name="pw" id="pw" maxlength="50"></td></tr>
			<tr><td>Confirm Password</td><td><input type="password" name="pwc" id="pwc" maxlength="50"></td></tr>
			<tr><td>Administrative User?</td><td>Check here if yes <input type="checkbox" name="pwac" id="pwac" value="1"></td></tr>
			<tr><td colspan="2"><input id="afufilebtn" type="button" value="Save" onclick="fa()"><div class="alignright"><input type="button" value="Close" onclick="$('#divfu').hide()" ></div></td></tr></table>	<input type="hidden" id="action" name="action" value="">
</form></div>
</body>
</html>
