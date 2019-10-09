<%String sesu=((String)session.getAttribute("s_userid")!=null&&!((String)session.getAttribute("s_userid")).equals("null")?(String)session.getAttribute( "s_userid"):"0");if(sesu.equals("0")) response.sendRedirect("logout.jsp"); %>

<% String u=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):""); %>
<!DOCTYPE html>
	<html>
	<head>
	<title>GRSU SDS</title>
	 <meta charset='utf-8'>
	<link href="style/styles.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="./js/jquery-1.8.3.min.js"></script> 
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="./js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" href="./js/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />


  <script language="javascript" src="./js/notify.min.js"></script>
  
	<script language="javascript">
	var ii=0; 
	var GNO=(Date.now()); var GU=''; var GMTA2=''; var GSMTA='';  var GISPROC=0; var GBLK=[]; var GBLKGA=[];
	function choke() {if($("#chok").is(":checked")){$("#spok").show(); GISPROC=1;}else {$("#spok").hide(); GISPROC=0;}}

	function vg(z)
	{
	if ($.trim(document.frm.Dateofreq.value) == "") {alert('Date of request is required.');document.frm.FromEmailAddress.focus();return false;} 
	if ($.trim(document.frm.FromEmailAddress.value) == "") {alert('Email address is required.');document.frm.FromEmailAddress.focus();return false;} 
	if (!validateEmail($.trim(document.frm.FromEmailAddress.value))) {alert('Enter a valid email address.'); return false; }
	if ($.trim(document.frm.FirstName.value) == "") {alert('First Name is required.');document.frm.FirstName.focus();return false;}
	//if ($.trim(document.frm.LastName.value) == "") {alert('Last Name is required.');document.frm.LastName.focus();return false;}
	var un={"msg":"", "dt":document.frm.Dateofreq.value,"fn":document.frm.FirstName.value,"ln":"","to":document.frm.FromEmailAddress.value,"u":document.frm.u.value,"uname":document.frm.uname.value};
	if(z==1){
		un.purpose="invalid"; un.orn=GNO;
	un.msg="Dear " + $.trim(document.frm.FirstName.value) + ",<br><br>Thank you for the interest in WorldVeg germplasm resources.<br><br>To obtain WorldVeg germplasm resouces, you would need to follow our seed distribution policies and procedures. Please check related detailed information from the web link at https://avrdc.org/seed/seeds/. From the same link, you can search and select lines/accessions based on your requirements on WorldVeg-improved vegetable lines (at the online seed catalog), and germplasm accessions (at genebank AVGRIS database) for vegetables).<br><br>For further seed request processing, please fill-in the online Seed Request Form. We will contact you soon after receiving the form.<br><br>Please let me know if you need more information.<br><br>Thank you,<br><br>"+document.frm.uname.value+"";
	}
	if(z==2){
	//get addresses 
	var abl=""; var aga="";var x=1;
	for(var i=0; i<GADDSEEDBL.length;i++)
	{
		for(var j=1;j<document.getElementById('smtaoriginbl').options.length;j++){
			if(GADDSEEDBL[i].split(":")[0]==document.getElementById('smtaoriginbl').options[j].value){abl+=x+". "+ document.getElementById('smtaoriginbl').options[j].text.substr(document.getElementById('smtaoriginbl').options[j].text.indexOf(":")+1).replace(/,/g,"<br/>");abl+="<br/><br/>";x++;break;}
		} 
	}
	if(abl.length>0) abl="<br/>Breeding lines seed provider(s):<br/><br/>"+abl;
	x=1;
	for(var i=0; i<GADDSEEDGA.length;i++)
	{
		for(var j=1;j<document.getElementById('smtaoriginbl').options.length;j++){
			if(GADDSEEDGA[i].split(":")[0]==document.getElementById('smtaoriginbl').options[j].value){aga+=x+". "+ document.getElementById('smtaoriginbl').options[j].text.substr(document.getElementById('smtaoriginbl').options[j].text.indexOf(":")+1).replace(/,/g,"<br/>");aga+="<br/><br/>";x++;break;}
		}
	}	
	if(aga.length>0) aga="<br/>Germplasm accessions seed provider(s):<br/><br/>"+aga;
	
	un.purpose="importpermit"; un.orn=GNO; un.sbj="Documentation for your order: " + GNO;
	un.msg="Dear " + $.trim(document.frm.FirstName.value) + ",<br><br>Thank you for the interest in WorldVeg germplasm resources." +(document.frm.ImportPermit.value=="Yes"?"<br><br>To receive WorldVeg germplasm resouces in your country, submit an import permit for further processing.":"")+"<br>"+($.trim(document.getElementById("bl").value)==""?"":"Breeding lines:<br>"+document.getElementById("bl").value.replace(/\r?\n/g, '<br />')+"<br><br>")+($.trim(document.getElementById("ga").value)==""?"":"Germplasm accessions:<br>"+document.getElementById("ga").value.replace(/\r?\n/g, '<br />')+"<br><br>")+($.trim($("#epd").val())==""?"":"For your information, based on your request the estimated amount due is USD " + $("#epd").val() + ".")+abl+aga+"<br><br>Please let me know if you need more information.<br><br>Thank you,<br><br>"+document.frm.uname.value+"";
	}	
	if(z==3){
				un.purpose="diseasedeclare"; un.orn=GNO; un.sbj="Disease declaration for your order: " + GNO;
	un.msg="Dear " + $.trim(document.frm.FirstName.value) + ",<br><br>Thank you for the interest in WorldVeg germplasm resources.<br><br>In the Import Permit (IP) you provided, some diseases have to be additionally declared in the Phytosanitary Certificate (PC). We will not request the Bureau of Animal and Plant Health Inspection and Quarantine of Taiwan to conduct non-routine tests that are indicated as additional requirements on the import permit. Please check with your Quarantine Office if they accept post-entry quarantine instead.<br><br>Thank you,<br><br>"+document.frm.uname.value+"";
	}	
	if(z==4){
	if($.trim($("#mna").val())=="") return;
			un.purpose="unavailable"; un.orn=GNO;un.sbj="Unavailable materials for your order: " + GNO;
	un.msg="Dear " + $.trim(document.frm.FirstName.value) + ",<br><br>Thank you for the interest in WorldVeg germplasm resources.<br><br>This is to inform you that the following materials you had requested are not available:<br><br>" + $.trim($("#mna").val())+ "<br><br>Please suggest alternative(s) by replying to this email.<br><br>Thank you,<br><br>"+document.frm.uname.value+"";
	}
	
	if(z==5){
				un.purpose="alldone"; un.orn=GNO;  un.sbj="Working on your order: "+GNO;
	un.msg="Dear " + $.trim(document.frm.FirstName.value)  + ",<br><br>Thank you for the interest in WorldVeg germplasm resources and for finishing all the required procedures. We will arrange seed preparation, getting the Phytosanitary Certificate and required documents (Invoice, packing list and non-GMO certificate, if required) for seed dispatch. I will notify you on the tracking number once the seed package is dispatched.<br><br>Thank you,<br><br>"+document.frm.uname.value+"";
	}
		if(z==7){ 
				un.purpose="unavailablematerial"; un.orn=GNO; un.id=$("#q").val(); un.sbj="Material currently unavailable for your order: " + GNO;
	un.msg="Dear " + $.trim(document.frm.FirstName.value)  + ",<br><br>Thank you for the interest in WorldVeg germplasm resources. As material you requested is currently not available, we would be canceling your order.<br><br>Thank you,<br><br>"+document.frm.uname.value+"";
	}
	if(z==6){
		if ($.trim(document.frm.Dateofreq.value) == "") {alert('Date of request is required.');document.frm.Dateofreq.focus();return false;} 
	if($.trim($("#epd").val())=="") {alert("Enter an estimated payment due amount.");return;}
			un.purpose="estimatedamt"; un.orn=GNO; un.sbj="Order estimate for "+GNO;
	un.msg="Dear " + $.trim(document.frm.FirstName.value) + ",<br><br>Thank you for the interest in WorldVeg germplasm resources. For your information, based on your request on " + $.trim(document.frm.Dateofreq.value) + " the estimated amount due is USD " + $("#epd").val() + ".<br><br>More details on payment-related information is available at https://avrdc.org/seed/seeds/ under the 'Handling Fees' section. <br><br>Thank you,<br><br>"+document.frm.uname.value+"";
	}
	
	if(z==9){
		if(!confirm("Are you sure you want to delete this order?"))return;
		un.purpose="deleteorder"; un.orn=GNO; un.id=$("#q").val(); un.sbj="Delete order"; un.action=3;
	}
	if(z==8){
		if ($.trim(document.frm.Dateofreq.value) == "") {alert('Date of request is required.');document.frm.Dateofreq.focus();return false;} 
	if($.trim($("#epd").val())=="") {alert("Enter an estimated payment due amount.");return;} 
	$("#divpf").show();
	return;
	}
		$.ajax({
			type: "POST",
			data: un,
			url:"actionemail.jsp",
			success:function(result){
				$.notify("Email sent successfully.",{className:'info',globalPosition: 'top center'}); 
				 if(z==1||z==7)document.f.submit();
				}
		});
	}
	
	function isblocked()
	{
		var s="";//alert(cr('bl2').replace(/(\r\n|\n|\r)/gm, ','));return true;
		var x=cr('spbl').replace(/(\r\n|\n|\r)/gm, ',').split(",");
		for(var i=0; i<x.length; i++){
		for(var j=0; j<GBLK.length; j++){
			if(x[i]==GBLK[j][0]) { s+=GBLK[j][0]+" for " +GBLK[j][1] + " is blocked under the agreement with " + GBLK[j][2] + " until " + GBLK[j][3]+".<br>";}
		} 
		} 
		//if(s!="") alert(s);
		if(s!="") { $.alert({
    title: 'Blocked materials',
    content: s,boxWidth: '50%',
    useBootstrap: false,
});
			
		return true; } else return false;
		
	}
	
	function isblockedga()
	{
		var s="";//alert(cr('bl2').replace(/(\r\n|\n|\r)/gm, ','));return true;
		var x=cr('spga').replace(/(\r\n|\n|\r)/gm, ',').split(",");
		for(var i=0; i<x.length; i++){
		for(var j=0; j<GBLKGA.length; j++){
			if(x[i]==GBLKGA[j][0]) { s+=GBLKGA[j][0]+" for " +GBLKGA[j][1] + " is blocked under the agreement with " + GBLKGA[j][2] + " until " + GBLKGA[j][3]+".<br>";}
		} 
		} 
		//if(s!="") alert(s);
		if(s!="") { $.alert({
    title: 'Blocked accessions',
    content: s,boxWidth: '50%',
    useBootstrap: false,
});
			
		return true; } else return false;
		
	}
	
	function sa()
	{
	//if (isblocked()) {return false;} 
	if ($.trim(document.frm.Dateofreq.value) == "") {alert('Date of request is required.');document.frm.Dateofreq.focus();return false;} 
	if ($.trim(document.frm.FromEmailAddress.value) == "") {alert('Email address is required.');document.frm.FromEmailAddress.focus();return false;} 
	if (!validateEmail($.trim(document.frm.FromEmailAddress.value))) {alert('Enter a valid email address.'); return false; }
	//if (!ce($.trim(document.frm.FromEmailAddress.value))) return false;
	if ($.trim(document.frm.FirstName.value) == "") {alert('First Name is required.');document.frm.FirstName.focus();return false;}
	//if ($.trim(document.frm.LastName.value) == "") {alert('Last Name is required.');document.frm.LastName.focus();return false;}
	if ($.trim(document.frm.Designation.value) == "") {alert('Designation is required.');document.frm.Designation.focus();return false;}
	if ($.trim(document.frm.Dept.value) == "") {alert('Department is required.');document.frm.Dept.focus();return false;}
	if ($.trim(document.frm.Organization.value) == "") {alert('Organization is required.');document.frm.Organization.focus();return false;}
	//if ($.trim(document.frm.CellPhone.value) == "") {alert('Phone number is required.');document.frm.CellPhone.focus();return false;}
	//if ($.trim(document.frm.StreetAddress1.value) == "") {alert('Address is required.');document.frm.StreetAddress1.focus();return false;}
	//if ($.trim(document.frm.City.value) == "") {alert('City is required.');document.frm.City.focus();return false;}
	if ($.trim(document.frm.Country.value) == "") {alert('Country is required.');document.frm.Country.focus();return false;}
	//if ($.trim($("#bl").val()) == "" && $.trim($("#ga").val()) == "") {alert('Both breeding lines requested and germplasm accessions requested cannot be empty.');return false;}
	//if ($.trim($("#bl2").val()) == "" && $.trim($("#ga2").val()) == "") {alert('Both breeding lines sent and germplasm accessions sent cannot be empty.');return false;}
	//if ($.trim($("#bl2").val()) == "" && $.trim($("#bl").val()) != "") {alert('Breeding lines sent cannot be empty when breeding lines have been requested.');return false;}
	//if ($.trim($("#ga2").val()) == "" && $.trim($("#ga").val()) != "") {alert('Germplasm accessions sent cannot be empty when germplasm accessions have been requested.');return false;}
	//if ($.trim($("#ga").val()) != "" && $.trim($("#PIDCode").val()) == "") {alert('PID Code is required as germplasm accessions are mentioned.');return false;}
	//if ($.trim($("#ga").val()) == "" && $.trim($("#PIDCode").val()) != "") {alert('As PID Code is mentioned, germplasm accessions are required.');return false;}
	
	
if ($.trim(document.frm.mFromEmailAddress.value) == "") {alert('Email address is required.');document.frm.mFromEmailAddress.focus();return false;} 
	if (!validateEmail($.trim(document.frm.mFromEmailAddress.value))) {alert('Enter a valid email address.'); return false; }
	if ($.trim(document.frm.mFirstName.value) == "") {alert('Name is required.');document.frm.mFirstName.focus();return false;}
	if ($.trim(document.frm.mDesignation.value) == "") {alert('Designation is required.');document.frm.mDesignation.focus();return false;}
	if ($.trim(document.frm.mDept.value) == "") {alert('Department is required.');document.frm.mDept.focus();return false;}
	if ($.trim(document.frm.mOrganization.value) == "") {alert('Organization is required.');document.frm.mOrganization.focus();return false;}
	if ($.trim(document.frm.mCellPhone.value) == "") {alert('Phone number is required.');document.frm.mCellPhone.focus();return false;}
	if ($.trim(document.frm.mStreetAddress1.value) == "") {alert('Address is required.');document.frm.mStreetAddress1.focus();return false;}
	if ($.trim(document.frm.mCity.value) == "") {alert('City is required.');document.frm.mCity.focus();return false;}
	if ($.trim(document.frm.mCountry.value) == "") {alert('Country is required.');document.frm.mCountry.focus();return false;}
	
	if ($.trim(document.frm.Purpose.value) == "") {alert('Purpose is required.');document.frm.Purpose.focus();return false;}
	
	var cntid="";
	//for(var i=0;i<$("input#cntdivchk").length;i++) { if($("input#cntdivchk")[i].checked) { cntid+=","+$("input#cntdivchk")[i].value;}} 

	var un={"dt":document.frm.Dateofreq.value,"orn":GNO,"fn":document.frm.FirstName.value,"ln":"","em":document.frm.FromEmailAddress.value,"u":document.frm.u.value,"uname":document.frm.uname.value, "ds":$.trim(document.frm.Designation.value), "org":$.trim(document.frm.Organization.value), "n":$.trim(document.frm.OrgNat.value), "ph":$.trim(document.frm.CellPhone.value),"add":$.trim(document.frm.StreetAddress1.value),"ct":$.trim(document.frm.City.value),"st":$.trim(document.frm.State.value), "zp": $.trim(document.frm.Zip.value), "cnt":$.trim(document.frm.Country.value),"imp":$.trim(document.frm.ImportPermit.value),"mfn":document.frm.mFirstName.value,"mln":"","mem":document.frm.mFromEmailAddress.value,"mds":$.trim(document.frm.mDesignation.value), "morg":$.trim(document.frm.mOrganization.value), "mph":$.trim(document.frm.mCellPhone.value),"madd":$.trim(document.frm.mStreetAddress1.value),"mct":$.trim(document.frm.mCity.value),"mst":$.trim(document.frm.mState.value), "mzp": $.trim(document.frm.mZip.value), "mcnt":$.trim(document.frm.mCountry.value),"blr":"", "bls":"", "gar":"", "gas":"", "pid": $.trim(document.frm.PIDCode.value), "mta":GMTA2, "smta":GSMTA,"pymd":$.trim(document.frm.PayMode.value),"shmd":$.trim(document.frm.ShipMode.value), "awb":$("#awb").val(), "shipnum":$("#shipnum").val(),"cropshipnum":$("#cropshipnum").val(), "pyp":$("#pyp").val(), "pys":$("#pys").val(), "pysh":$("#pysh").val(), "pyt":$("#pyt").val(), "pym":$("#pym").val(),"est":$("#epd").val(),"id":$("#q").val(),"proc":GISPROC,"smtaorigin":$.trim(cntid.substr(1)), "dept":$.trim(document.frm.Dept.value),"mdept":$.trim(document.frm.mDept.value),"pur":$.trim(document.frm.Purpose.value),"action":"2"};
	
	un.blr = cr('bl'); un.blr=(un.blr.replace(/(\r\n|\n|\r)/gm, ',')); 
	un.bls = cr('bl2'); un.bls=(un.bls.replace(/(\r\n|\n|\r)/gm, ',')); 
	un.gar = cr('ga'); un.gar=(un.gar.replace(/(\r\n|\n|\r)/gm, ','));
	un.gas = cr('ga2'); un.gas=(un.gas.replace(/(\r\n|\n|\r)/gm, ',')); 
	un.skr = cr('sk'); un.skr=(un.gar.replace(/(\r\n|\n|\r)/gm, ','));
	un.sks = cr('sk2'); un.sks=(un.sks.replace(/(\r\n|\n|\r)/gm, ','));

		$.ajax({
			type: "POST",
			data: un,
			url:"actionemail.jsp",
			success:function(result){
	  		top.location.href="home.jsp";
			//document.f.submit();
			}
		});	
	}
	
	function ce(d)
	{
	
		//	alert(d)
		$.ajax({
			type: "POST",
			data: {"em":d},
			url:"checkemailexists.jsp",
			success:function(result){
	//			alert(result.EXS[0].EX)
				if($.trim(result.EXS[0].EX)=="0") {$("#emx").empty(); return true;}
				else if($.trim(result.EXS[0].EX)=="2") {$("#emx").text("This email exists. Please enter another."); return false;}
				else if($.trim(result.EXS[0].EX)=="1") {$("#emx").text("This email exists and is pending ASA's approval."); return false;}
				else {alert($.trim(result.EXS[0].EX)); return false;}
				//$("#activitycontainerPanel").append(result;
				
			//	$(#activitydisplay").addClass("activitydisplay");*/
	  		}
		});	
		return true;
	}
	
	
	function cr(d)
	{
		var theSep;
		var newCode = document.getElementById(d).value
		newCode = newCode.trim();
		var match = /\r\n/.test(newCode);
		if (match == -1){
			//windows line breaks
			theSep = "\r\n";
			newCode = newCode.replace(/\r\n+/g,"\r\n");
		}else{
			//unix line breaks
			theSep = "\n";
			newCode = newCode.replace(/\r/g,"\n");
			newCode = newCode.replace(/\n+/g,"\n");
			
		}
		
		//Create array
		var newCodeArray = newCode.split(theSep);
		for(var i=0;i<newCodeArray.length;i++){
			newCodeArray[i] = newCodeArray[i].trim();
		}
		
		//Remove duplicates
		var i = newCodeArray.length-1;
		while(i > -1){
			var ii = newCodeArray.length-1;
			while(ii > -1){
				if(i != ii){
					if (newCodeArray[i] == newCodeArray[ii]){
						newCodeArray.splice (ii, 1);
					}
				}
			ii--;
			}
		i--;
		}
		
		//Do some sorting
		newCodeArray.sort();
			
		
		//Assemble the lines back together
		newCode = newCodeArray.join(theSep);
		
		//Put new code in place
		//document.getElementById("bl").value = newCode;
		return newCode;
	}
			
	function validateEmail(email){
		var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
		var valid = emailReg.test(email);
	
		if(!valid) {
	        return false;
	    } else {
	    	return true;
	    }
	}
	
	
function rf(t,v){
$.ajax({
			type: "POST",
			data: {"f":t},
			url:"loaddel.jsp",
			success:function(result){var s="";
					$("#spfl"+v).remove();
					if(v=="MTA2") GMTA2 = "";
					if(v=="SMTA") GSMTA = "";
			}
		});
}
	
function getu(q)
{
	var un={"u":q};
	$.ajax({ 
			type: "POST",
			data: un, url:"getuser.jsp",
			success:function(result){
document.frm.uname.value=$.trim(result);
//alert(document.frm.uname.value)
				}
			});
}
	
function getsmtacnt()
{
	var un={"u":q};
	$.ajax({ 
			type: "POST",
			url:"getsmtacnt.jsp",
			success:function(result){
				$.each(result.order, function(i,n){
				$("#smtaoriginbl")
					.append($('<option>', { value : n.country})
          			.text(n.country +":" + n.contactaddress));
				$("#smtaoriginga")
					.append($('<option>', { value : n.country})
          			.text(n.country +":" + n.contactaddress));
				$("#smtaoriginsk")
					.append($('<option>', { value : n.country})
          			.text(n.country +":" + n.contactaddress));
				$("#cntdiv").html($("#cntdiv").html() + "<label><input type='checkbox' id='cntdivchk' value='" +  n.country + "'><span id='ws" + n.country + "'>" + n.country +" | "+n.contactaddress + "</span></label><br/>");

				}
				);
	}});
}


function getblocked()
{
	var un={"u":q};
	$.ajax({ 
			type: "POST",
			url:"getblocked.jsp",
			success:function(result){
				$.each(result.order, function(i,n){
				GBLK[GBLK.length]=[n.variety,n.crop,n.contract,n.untildate];
				}
				);
	}});
}

function getblockedga()
{
	var un={"u":q};
	$.ajax({ 
			type: "POST",
			url:"getblockedga.jsp",
			success:function(result){
				$.each(result.order, function(i,n){
				GBLKGA[GBLKGA.length]=[n.variety,n.crop,n.contract,n.untildate];
				}
				);
	}});
}

function getdet(q)
{
	var un={"u":q};
	$.ajax({
			type: "POST",
			data: un,
			url:"getdet.jsp",
			success:function(result){
				$.each(result.order, function(i,n){ 
				$("#so").html("<b>Order no: "+(n.orderno!="NEW"?n.orderno:"NEW")+"</b>");
				document.frm.Dateofreq.value=n.requestdate;GNO=(n.orderno!="NEW"?n.orderno:document.frm.u.value+"-"+GNO);document.frm.FirstName.value=n.firstname;//
				//document.frm.LastName.value=n.lastname;
				document.frm.FromEmailAddress.value=n.email;
				//document.frm.u.value=n.userid;document.frm.uname.value=n.username;
				document.frm.Designation.value=n.job;document.frm.Organization.value=n.org;document.frm.OrgNat.value=n.orgnature;document.frm.CellPhone.value=n.phone;document.frm.StreetAddress1.value=n.address;document.frm.City.value=n.city;document.frm.State.value=n.state;document.frm.Zip.value=n.zip; document.frm.Country.value=n.country;  			document.frm.ImportPermit.value=n.imppermreq; document.frm.PIDCode.value=n.pid; document.frm.PayMode.value=n.paymode; 				document.frm.ShipMode.value=n.shipmode; 				
				document.frm.awb.value=n.awb; 				
				document.frm.shipnum.value=n.shipnum; 				
				document.frm.cropshipnum.value=n.cropshipnum; 				
				document.frm.mFromEmailAddress.value=n.memail;document.frm.mDesignation.value=n.mjob;document.frm.mOrganization.value=n.morg;document.frm.mCellPhone.value=n.mphone;document.frm.mStreetAddress1.value=n.maddress;document.frm.mCity.value=n.mcity;document.frm.mState.value=n.mstate;document.frm.mZip.value=n.mzip; document.frm.mCountry.value=n.mcountry;document.frm.mFirstName.value=n.mname; document.frm.mDept.value=n.mdept; document.frm.Dept.value=n.dept; document.frm.Purpose.value=n.pur; 
				
				//document.frm.smtaorigin.value=n.origincountry;
				//for(var j=0; j<n.origincountry.split(",").length;j++){
				//for(var i=0;i<$("input#cntdivchk").length;i++) { if($("input#cntdivchk")[i].value==n.origincountry.split(",")[j]) { $("input#cntdivchk")[i].checked=true;}} }
				
				$("#bl").val(n.breedlinesreq);$("#bl2").val(n.breedlinessent);$("#ga").val(n.germplasmreq);$("#ga2").val(n.germplasmsent);$("#sk").val(n.seedkitreq);$("#sk2").val(n.seedkitsent);
				if($.trim($("#bl2").val())!=""){
					for(var i=0; i<$.trim($("#bl2").val()).split(";").length;i++){
						if( $.trim($("#bl2").val()).split(";")[i]!="")
					{GADDSEEDBL.push($.trim($("#bl2").val()).split(";")[i].split(":")[0]+":"+$.trim($("#bl2").val()).split(";")[i].split(":")[1]); }}
				}
				if($.trim($("#ga2").val())!=""){
					for(var i=0; i<$.trim($("#ga2").val()).split(";").length;i++){
						if( $.trim($("#ga2").val()).split(";")[i]!="")
					{GADDSEEDGA.push($.trim($("#ga2").val()).split(";")[i].split(":")[0]+":"+$.trim($("#ga2").val()).split(";")[i].split(":")[1]); }}
				}
				if($.trim($("#sk2").val())!=""){
					for(var i=0; i<$.trim($("#sk2").val()).split(";").length;i++){
						if( $.trim($("#sk2").val()).split(";")[i]!="")
					{GADDSEEDSK.push($.trim($("#sk2").val()).split(";")[i].split(":")[0]+":"+$.trim($("#sk2").val()).split(";")[i].split(":")[1]); }}
				}
				
				GMTA2=n.mtafile; GSMTA=n.smtafile;
				if(n.isprocessed=="0"){if(GMTA2!=""){var a="<span title='Remove' style='cursor:pointer;cursor:hand;padding:2px;' id='spflMTA2' onclick='rf(\"d:/data/MTA2"+GNO+"/"+GMTA2+"\",\"MTA2\")'>"+GMTA2+" &#128940;</span>"; $("#spanfuMTA2").html(a); } if(GSMTA!=""){var a="<span title='Remove' style='cursor:pointer;cursor:hand;padding:2px;' id='spflSMTA' onclick='rf(\"d:/data/SMTA"+GNO+"/"+GSMTA+"\",\"SMTA\")'>"+GSMTA+" &#128940;</span>"; $("#spanfuSMTA").html(a); }
				}
				if(n.isprocessed=="1"){if(GMTA2!=""){var a="<a title='Download' href='d:/data/MTA2"+GNO+"/"+GMTA2+"'>"+GMTA2+"</a>"; $("#spanfuMTA2").html(a); } if(GSMTA!=""){var a="<a title='Download' href='d:/data/SMTA"+GNO+"/"+GSMTA+"'>"+GSMTA+"</a>"; $("#spanfuSMTA").html(a); }
				}
				$("#pyp").val(n.payprocess);$("#pys").val(n.paytest);$("#pym").val(n.paymethod);$("#pysh").val(n.payship);$("#pyt").val(n.paytotal);$("#epd").val(n.estimatedamt); if(n.isprocessed=="1"){$("#chok").prop('checked', true); $( ":input" ).prop('readonly', true);$("#chok").prop('readonly', true); $("#skip_Submit").hide();}
				});
			}
		});
}

function nrep(n)
{
	if($.trim($("#bl2").val())=="" && $.trim($("#ga2").val())=="") {alert("No materials to send."); return;}
	//if($.trim($("#blpf").val())=="" && $.trim($("#gapf").val())=="") {alert("No materials to send."); return;}
	var x=cr('bl2'); $('#blpf').text(x.replace(/(\r\n|\n|\r)/gm, ','));var y=cr('ga2'); $('#gapf').text(y.replace(/(\r\n|\n|\r)/gm, ',')); 
	
	var un={"msg":"", "dt":document.frm.Dateofreq.value,"fn":document.frm.FirstName.value,"ln":"","to":document.frm.FromEmailAddress.value,"u":document.frm.u.value,"uname":document.frm.uname.value};

	var pm=($.trim(document.frm.PayMode.value)); var sm=($.trim(document.frm.ShipMode.value));
	
	var he="<table width='80%'><tr><td align='left'><img src='https://avrdc.org/wp-content/uploads/2017/08/Primary-Logo_new-for-web_279x44.jpg' width='279' height='43' alt='World Vegetable Center Logo'></td><td align='right'>Headquarters<br>P.O. Box 42, Shanhua, Tainan,<br>Taiwan 74199, ROC<br>Tel: +886-6-583-7801, ext. 537<br>Fax: +886-6-583-0009<br>Website: http://www.avrdc.org<br>Email: seedrequest@worldveg.org</td></tr><tr><td colspan='2'><hr></td></tr></table><br><br>";
	
	he+="<b>Order: "+GNO+"</b><br><br>"+$.trim(document.frm.FirstName.value)+"<br>"+$.trim(document.frm.Designation.value)+"<br>"+$.trim(document.frm.Dept.value)+"<br>"+$.trim(document.frm.Organization.value)+"<br>"+$.trim(document.frm.Country.value)+"<br><br>";
	
	he+=($.trim(document.frm.awb.value)!=""?"<br>Airway bill #: "+$.trim(document.frm.awb.value)+"<br>":"");
	
	var ci="";
	
	var fo=""; if(pm=="Bank Transfer")fo="<br><br><hr><b>Note: Bank transfer</b>, in the amount of <b>USD "+$("#pyt").val()+" to AVRDC's bank account at:<br><br><b>JP Morgan Chase Bank<br>Wholesale Deposit Services</b><br>Bank Address: <br>270 Park Avenue, New York, New York 10017, USA.</b><br>Bank ABA #: <b>021-000-021</b><br>Account No: <b>400-358743</b><br>SWIFT: <b>CHASUS33</b><br><br>Account Name: <b>Asian Vegetable Research and Development Center</b><br><br>A scanned copy of the payment voucher should be sent to us via email to seedrequest@worldveg.org";
	
	fo+="<br><br><br><br><br>"+($("#blpf").text()!=""?"<div>Breeding Lines: "+$("#blpf").text()+"</div>":"")+($("#gapf").text()!=""?"<div>Germplasm accessions: "+$("#gapf").text()+"</div>":"");
	
	var t="<table border='0' width='80%' style='border:.5px solid black'><tr><td colspan='2' align='center' style='border: 1px solid #dddddd;'><b>"+(n==1?"Proforma":"") + " Invoice</b></td></tr><tr><td style='border: 1px solid #dddddd;text-align: left;'>Description</td><td style='border: 1px solid #dddddd;text-align: center;'>Amount (in USD)</td></tr><tr><td style='border: 1px solid #dddddd;text-align: left;'>Processing fees:<br/>"+($("#blpf").text()!=""?"<div>Breeding Lines: "+$("#blpf").text().split(',').length+"</div>":"")+($("#gapf").text()!=""?"<div>Germplasm accessions: "+$("#gapf").text().split(',').length+"</div>":"")+"</td><td style='border: 1px solid #dddddd;text-align: center;'>"+$("#pyp").val()+"</td></tr><tr><td style='border: 1px solid #dddddd;text-align: left;'>" + pm + " fees:</td><td style='border: 1px solid #dddddd;text-align: center;'>"+$("#pym").val()+"</td></tr><tr><td style='border: 1px solid #dddddd;text-align: left;'>Testing fees:</td><td style='border: 1px solid #dddddd;text-align: center;'>"+$("#pys").val()+"</td></tr><tr><td style='border: 1px solid #dddddd;text-align: left;'>" + sm + " fees:</td><td style='border: 1px solid #dddddd;text-align: center;'>"+$("#pysh").val()+"</td></tr><tr><td style='border: 1px solid #dddddd;text-align: left;'><b>Total fees in USD:</b> (for 100% advance payment)</td><td style='border: 1px solid #dddddd;text-align: center;'><b>"+$("#pyt").val()+"</b></td></tr></table><br><br><table border='0' width='80%'><tr><td colspan='2' align='right' width='100%'><br>This is an electronically generated document and does not require a signature.</td></tr></table>"//<br>Finance Officer Sign: _______________________<br><br>Finance Officer Name: _______________________</td></tr></table>"; 
	 
	un.purpose="proforma"; un.orn=GNO; un.id=$("#q").val(); un.sbj=(n==1?"Proforma Invoice":"Invoice")+" for order "+GNO;
	un.msg=he+ci+t+fo;
	
			$.ajax({
			type: "POST",
			data: un,
			url:"actionemail.jsp",
			success:function(result){
				$.notify("Email sent successfully.",{className:'info',globalPosition: 'top center'}); 
				 }
		});

	//$("#divpf").html(t); $("#divpf").show()
}

var GADDSEEDBL=[]; var GADDSEEDGA=[]; var GADDSEEDSK=[];
function addseed(o)
{
	if(o=="bl"){
	if($("#smtaoriginbl").val()=="") return;
	if($.trim($("#spbl").val())=="") return;
	if($.trim($("#spbl").val()).charAt(0)==","){$("#spbl").val($.trim($("#spbl").val()).substr(1));}
	if($.trim($("#spbl").val()).charAt($.trim($("#spbl").val()).length-1)==","){$("#spbl").val($.trim($("#spbl").val()).substr(0,$.trim($("#spbl").val()).length-1));}
	for(var i=0; i<GADDSEEDBL.length;i++)
	{
		if(GADDSEEDBL[i].split(":")[0]==$("#smtaoriginbl").val()){GADDSEEDBL.splice(i,1);break;}
	}
	GADDSEEDBL.push($("#smtaoriginbl").val()+":"+ $("#spbl").val().replace(/[ ]/g,"").replace(/;/g,"").replace(/:/g,"")); 
	
	
	if(!$('#chblk').prop('checked')){if (isblocked()) {return false;} }
	$("#bl2").val("");

	for(var i=0; i<GADDSEEDBL.length;i++)
	{
		$("#bl2").val($("#bl2").val()+GADDSEEDBL[i]+";");
	}
	}
	
	if(o=="ga"){
	if($("#smtaoriginga").val()=="") return;
	if($.trim($("#spga").val())=="") return;
	if($.trim($("#spga").val()).charAt(0)==","){$("#spga").val($.trim($("#spga").val()).substr(1));}
	if($.trim($("#spga").val()).charAt($.trim($("#spga").val()).length-1)==","){$("#spga").val($.trim($("#spga").val()).substr(0,$.trim($("#spga").val()).length-1));}
	for(var i=0; i<GADDSEEDGA.length;i++)
	{
		if(GADDSEEDGA[i].split(":")[0]==$("#smtaoriginga").val()){GADDSEEDGA.splice(i,1);break;}
	}
	GADDSEEDGA.push($("#smtaoriginga").val()+":"+ $("#spga").val().replace(/ /g,"").replace(/;/g,"").replace(/:/g,""));  
	
	if(!$('#chgak').prop('checked')){if (isblockedga()) {return false;} }

	$("#ga2").val("");
	for(var i=0; i<GADDSEEDGA.length;i++)
	{
		$("#ga2").val($("#ga2").val()+GADDSEEDGA[i]+";");
	}
	}
	
	if(o=="sk"){
	if($("#smtaoriginsk").val()=="") return;
	if($.trim($("#spsk").val())=="") return;
	if($.trim($("#spsk").val()).charAt(0)==","){$("#spsk").val($.trim($("#spsk").val()).substr(1));}
	if($.trim($("#spsk").val()).charAt($.trim($("#spsk").val()).length-1)==","){$("#spsk").val($.trim($("#spsk").val()).substr(0,$.trim($("#spsk").val()).length-1));}
	for(var i=0; i<GADDSEEDSK.length;i++)
	{
		if(GADDSEEDSK[i].split(":")[0]==$("#smtaoriginsk").val()){GADDSEEDSK.splice(i,1);break;}
	}
	GADDSEEDSK.push($("#smtaoriginsk").val()+":"+ $("#spsk").val().replace(/ /g,"").replace(/;/g,"").replace(/:/g,""));  
	$("#sk2").val("");
	for(var i=0; i<GADDSEEDSK.length;i++)
	{
		$("#sk2").val($("#sk2").val()+GADDSEEDSK[i]+";");
	}
	}
}

function remseed(o)
{
	if(o=="bl"){
	if($("#smtaoriginbl").val()=="") return;
	for(var i=0; i<GADDSEEDBL.length;i++)
	{
		if(GADDSEEDBL[i].split(":")[0]==$("#smtaoriginbl").val()){GADDSEEDBL.splice(i,1);break;}
	}
	$("#bl2").val("");
	for(var i=0; i<GADDSEEDBL.length;i++)
	{
		$("#bl2").val($("#bl2").val()+GADDSEEDBL[i]+";");
	}
	}
	
	if(o=="ga"){
	if($("#smtaoriginga").val()=="") return;
	for(var i=0; i<GADDSEEDGA.length;i++)
	{
		if(GADDSEEDGA[i].split(":")[0]==$("#smtaoriginga").val()){GADDSEEDGA.splice(i,1);break;}
	}
	$("#ga2").val("");
	for(var i=0; i<GADDSEEDGA.length;i++)
	{
		$("#ga2").val($("#ga2").val()+GADDSEEDGA[i]+";");
	}
	}
	
	if(o=="sk"){
	if($("#smtaoriginsk").val()=="") return;
	for(var i=0; i<GADDSEEDSK.length;i++)
	{
		if(GADDSEEDSK[i].split(":")[0]==$("#smtaoriginsk").val()){GADDSEEDSK.splice(i,1);break;}
	}
	$("#sk2").val("");
	for(var i=0; i<GADDSEEDSK.length;i++)
	{
		$("#sk2").val($("#sk2").val()+GADDSEEDSK[i]+";");
	}
	}
}

function selorichg(x,y){
	if(x=="smtaoriginbl"){
		if($("#"+x).val()=="") {$("#spbl").val("");return;}
		var f=false;
		for(var i=0; i<GADDSEEDBL.length;i++)
		{
		if(GADDSEEDBL[i].split(":")[0]==y){$("#spbl").val(GADDSEEDBL[i].split(":")[1]);f=true;break;}
		}
		if(!f)$("#spbl").val("");
	}
	
	if(x=="smtaoriginga"){
		if($("#"+x).val()=="") {$("#spga").val("");return;}
		var f=false;
		for(var i=0; i<GADDSEEDGA.length;i++)
		{
		if(GADDSEEDGA[i].split(":")[0]==y){$("#spga").val(GADDSEEDGA[i].split(":")[1]);f=true;break;}
		}
		if(!f)$("#spga").val("");
	}
	
	if(x=="smtaoriginsk"){
		if($("#"+x).val()=="") {$("#spsk").val("");return;}
		var f=false;
		for(var i=0; i<GADDSEEDSK.length;i++)
		{
		if(GADDSEEDSK[i].split(":")[0]==y){$("#spsk").val(GADDSEEDSK[i].split(":")[1]);f=true;break;}
		}
		if(!f)$("#spsk").val("");
	}
}

function af()
{
	$("#pyt").val(((isNaN(parseFloat($("#pyp").val()))?0:parseFloat($("#pyp").val()))+(isNaN(parseFloat($("#pys").val()))?0:parseFloat($("#pys").val()))+(isNaN(parseFloat($("#pysh").val()))?0:parseFloat($("#pysh").val()))+(isNaN(parseFloat($("#pym").val()))?0:parseFloat($("#pym").val()))).toFixed(2));
}

//.prop("readonly", true);
$(document).ready(function () 
{	 $("#spinner").bind("ajaxSend", function() {
        $(this).show();
    }).bind("ajaxStop", function() {
        $(this).hide();
    }).bind("ajaxError", function() {
        $(this).hide();
    });
	getblocked();
	getblockedga();
	getsmtacnt();
	$("a#inline").fancybox();
	$("#uplfrm1").on('submit',(function(e) {
		e.preventDefault();
		$('#spanfu').show();
		$.ajax({
		url: "load.jsp?i="+($("#q").val()!=""?GU+GNO:GU+$("#u").val()+"-"+GNO), // Url to which the request is send
		type: "POST",             // Type of request to be send, called as method
		data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
		contentType: false,       // The content type used when sending data to the server.
		cache: false,             // To unable request pages to be cached
		processData:false,        // To send DOMDocument or non processed data file it is set to false
		success: function(data)   // A function to be called if request succeeds
		{
		$('#divfu').hide(); var a=""; $("#uplfrm1").trigger("reset");//<a target='_blank' href='"+$.trim(data).split("./")[i]+"'>
		a+="<span title='Remove' style='cursor:pointer;cursor:hand;padding:2px;' id='spfl"+GU+"' onclick='rf(\""+$.trim(data)+"\",\""+GU+"\")'>"+$.trim(data).split("/")[$.trim(data).split("/").length-1]+" &#128940;</span>"; 
		if(GU=="MTA2") GMTA2 = $.trim(data).split("/")[$.trim(data).split("/").length-1];
		if(GU=="SMTA") GSMTA = $.trim(data).split("/")[$.trim(data).split("/").length-1];
		$("#spanfu"+GU).html(a); GU=''; //$("#supflurl").val($("#supflurl").val()+$.trim(data));
		}
		}); 
	}));
	if($("#q").val()!="")getdet($("#q").val());
	
	//get values for user.
	getu($("#u").val());
});
	</script>
	</head>
	<body>
	<%@ include file="header.jsp" %>
	<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="spinner.gif" width="95" height="95" alt="Loading"/>
</div><iframe width=0 height=0 name='ifrm1' id='ifrm1'></iframe>
	
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
<form action="load.jsp?i=0" method="post" enctype="multipart/form-data" id="uplfrm1">
    		<table align="center" id="activitydisplay"><tr><td><b>Select file to upload</b></td></tr><tr><td><input type="file" multiple="multiple" name="fileToUpload" id="fileToUpload"></td></tr><tr><td><input id="afufilebtn" type="submit" value="Upload" name="submit"><div class="alignright"><input type="button" value="Close" onclick="$('#divfu').hide()" ></div></td></tr></table>
</form></div>
 
	<form name='frm' id='frm'  method='POST' target='ifrm1' >
	<table width="70%" align="center"><tr> <td>
		<table align="center" id="activitydisplay">
			 <thead><tr><th colspan="2">Enter request details where this order should go to</th></tr></thead>
					<tr><td colspan="2" bgcolor="#f9e8f5">&#9888; <b>Information will be saved only when the "Save" button is clicked.</b> </td></tr>
<%=(request.getParameter("q")!=null&&request.getParameter("q")!=""?"<tr><td colspan='2' align='center' bgcolor='#bbdaf7'><span id='so'></span></td></tr>":"")%>
				<tr>
	<td><b>Date of request*</b></t d>
	<td>
	<input id="Dateofreq" name="Dateofreq" type="date" maxlength="60" style="width:146px; border:1px solid #999999" /></td> </tr><tr>
	<td><b>Email address*</b></td>
	<td><input id="FromEmailAddress" name="FromEmailAddress" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />  <div id='emx' class="errgen"></div></td>
	</tr>
	<tr>
	<td><b>Requester Name*</b></td>
	<td>
	<input id="FirstName" name="FirstName" type="text" maxlength="60" style="width:146px; border:1px solid #999999" />
	<!--input id="LastName" name="LastName" type="text" maxlength="60" style="width:146px; border:1px solid #999999" /=-->
	</td>
	</tr><tr><td colspan="2" bgcolor="#f9e8f5">&#9888; <a href=javascript:; onclick='vg(1)'>Notify requester if details filled in the online seed request are vague / incomplete /  invalid</a></td></tr>
	<tr> 
	<td><b>Designation / Job title*</b></td>
	<td><input id="Designation" name="Designation" type="text" maxlength="60" style="width:250px; border:1px solid #999999" /></td></tr>
	<tr>
	<td><b>Department*</b></td>
	<td><input id="Dept" name="Dept" type="text" maxlength="60" style="width:250px; border:1px solid #999999" /></td>
	</tr>
	<tr>
	<td><b>Organization*</b></td>
	<td><input id="Organization" name="Organization" type="text" maxlength="100" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr><td><b>Nature of organization*</b></td><td>
<select name="OrgNat" id="OrgNat" class="medium gfield_select" aria-required="true" aria-invalid="false" style="width: 100% !important;"><option value="National Agricultural Research &amp; Extension System / Government">National Agricultural Research &amp; Extension System / Government</option><option value="Genebank">Genebank</option><option value="University">University</option><option value="Advanced Research Institution">Advanced Research Institution</option><option value="Seed Company">Seed Company</option><option value="NGO">NGO</option><option value="Private company">Private company</option><option value="Private individual">Private individual</option><option value="Other">Other</option></select></td></tr>
	<tr>
	<td><b>Contact Phone</b></td>
	<td><input id="CellPhone" name="CellPhone" type="text" maxlength="43" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td><b>Shipping Address</b></td>
	<td><input id="StreetAddress1" name="StreetAddress1" type="text" maxlength="420" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td><b>City</b></td>
	<td><input id="City" name="City" type="text" maxlength="120" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td><b>State / Province</b></td>
	<td><input id="State" name="State" type="text" maxlength="120" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td><b>Zip / Postal Code</b></td>
	<td><input id="Zip" name="Zip" type="text" maxlength="30" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td><b>Country*</b></td>
	<td><select name="Country" id="Country" style="width: 100% !important;"><option value="" selected="selected"></option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Costa Rica">Costa Rica</option><option value="Côte d'Ivoire">Côte d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Curaçao">Curaçao</option><option value="Cyprus">Cyprus</option><option value="Czech Republic">Czech Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="East Timor">East Timor</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Polynesia">French Polynesia</option><option value="Gabon">Gabon</option><option value="Gambia">Gambia</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Japan">Japan</option><option value="Jordan">Jordan</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="North Korea">North Korea</option><option value="South Korea">South Korea</option><option value="Kosovo">Kosovo</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macedonia">Macedonia</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marshall Islands">Marshall Islands</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mexico">Mexico</option><option value="Micronesia">Micronesia</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montenegro">Montenegro</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Myanmar">Myanmar</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Palestine, State of">Palestine, State of</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Romania">Romania</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Saint Martin">Saint Martin</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Senegal">Senegal</option><option value="Serbia">Serbia</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Sint Maarten">Sint Maarten</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="Spain">Spain</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Sudan, South">Sudan, South</option><option value="Suriname">Suriname</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Togo">Togo</option><option value="Tonga">Tonga</option><option value="Trinidad and Tobago">Trinidad and Tobago</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="United States">United States</option><option value="Uruguay">Uruguay</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Vatican City">Vatican City</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands, British">Virgin Islands, British</option><option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option><option value="Yemen">Yemen</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select></td>
	</tr> 
		<tr><td colspan="2" bgcolor="#f9e8f5">&#9888; <a href=javascript:; onclick='vg(3)'>Notify requester that additional declarations as required by some countries</a></td></tr>
		<tr><td colspan=2>Name and details of the person authorized to sign the Material Transfer Agreements</td></tr> 
	
	<tr>
	<td>Full Name*</td>
	<td>
	<input id="mFirstName" name="mFirstName" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />
	<!--input id="LastName" name="LastName" type="text" maxlength="60" style="width:146px; border:1px solid #999999" /=-->
	</td>
	</tr>
	<tr>
	<td>Email address*</td>
	<td><input id="mFromEmailAddress" name="mFromEmailAddress" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />  <div id='emx' class="errgen"></div></td>
	</tr>
	<tr>
	<td>Designation / Job title*</td>
	<td><input id="mDesignation" name="mDesignation" type="text" maxlength="60" style="width:250px; border:1px solid #999999" /></td></tr>
	<tr>
	<td>Department*</td>
	<td><input id="mDept" name="mDept" type="text" maxlength="60" style="width:250px; border:1px solid #999999" /></td></tr>
	<tr>
	<td>Organization*</td>
	<td><input id="mOrganization" name="mOrganization" type="text" maxlength="100" style="width:250px; border:1px solid #999999" /></td>
	</tr>
	<tr>
	<td>Contact Phone*</td>
	<td><input id="mCellPhone" name="mCellPhone" type="text" maxlength="43" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td>Address*</td>
	<td><input id="mStreetAddress1" name="mStreetAddress1" type="text" maxlength="420" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td>City*</td>
	<td><input id="mCity" name="mCity" type="text" maxlength="120" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td>State / Province</td>
	<td><input id="mState" name="mState" type="text" maxlength="120" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td>Zip / Postal Code</td> 
	<td><input id="mZip" name="mZip" type="text" maxlength="30" style="width:250px; border:1px solid #999999" /></td>
	</tr><tr>
	<td>Country*</td>
	<td><select name="mCountry" id="mCountry" style="width: 100% !important;"><option value="" selected="selected"></option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Costa Rica">Costa Rica</option><option value="Côte d'Ivoire">Côte d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Curaçao">Curaçao</option><option value="Cyprus">Cyprus</option><option value="Czech Republic">Czech Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="East Timor">East Timor</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Polynesia">French Polynesia</option><option value="Gabon">Gabon</option><option value="Gambia">Gambia</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Japan">Japan</option><option value="Jordan">Jordan</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="North Korea">North Korea</option><option value="South Korea">South Korea</option><option value="Kosovo">Kosovo</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macedonia">Macedonia</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marshall Islands">Marshall Islands</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mexico">Mexico</option><option value="Micronesia">Micronesia</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montenegro">Montenegro</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Myanmar">Myanmar</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Palestine, State of">Palestine, State of</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Romania">Romania</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Saint Martin">Saint Martin</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Senegal">Senegal</option><option value="Serbia">Serbia</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Sint Maarten">Sint Maarten</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="Spain">Spain</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Sudan, South">Sudan, South</option><option value="Suriname">Suriname</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Togo">Togo</option><option value="Tonga">Tonga</option><option value="Trinidad and Tobago">Trinidad and Tobago</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="United States">United States</option><option value="Uruguay">Uruguay</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Vatican City">Vatican City</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands, British">Virgin Islands, British</option><option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option><option value="Yemen">Yemen</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select></td>
	</tr>

<tr><td><b>Purpose*</b></td>
	<td><input id="Purpose" name="Purpose" type="text" maxlength="60" style="width:250px; border:1px solid #999999" /></td></tr>
<tr>
<td valign="top"><b>BREEDING LINES REQUESTED:</b><br/><textarea name="bl" id="bl" rows="5" cols="50"></textarea><br/><br/><div style="background-color:#f9e8f5;border:.5px solid orange;padding:4px;"><label><input id="chblk" type="checkbox">Don't check for blocked lines</label></div></td>
<td bgcolor="lightyellow"><b>BREEDING LINES SENT:</b><br/><select id="smtaoriginbl" style="width:300px" onchange="selorichg(this.id, this.value)"><option value="">--Select seed provider--</option></select><br/>Varieties (comma-seperated):<br/><textarea id="spbl" rows="3" cols="50"></textarea> <br/><input type="button" value="Add to cart" onclick="addseed('bl')"> | <input type="button" value="Remove from cart" onclick="remseed('bl')"><br/><textarea readonly style="background-color: #dde8fa;" name="bl2" id="bl2" rows="5" cols="50"></textarea></td></tr>
<tr style="display:none"><td colspan="1"><b>Attach signed MTA2 from requester</b> | <a href="javascript:GU='MTA2';$('#divfu').show();void(0);">Click here to upload signed MTA2</a></td><td><span id="spanfuMTA2"></span></td></tr>
</tr>

<tr>
<td><b>GERMPLASM ACCESSIONS REQUESTED:</b><br/><textarea name="ga" id="ga" rows="5" cols="50"></textarea><br/><br/><div style="background-color:#f9e8f5;border:.5px solid orange;padding:4px;"><label><input id="chgak" type="checkbox">Don't check for blocked accessions</label></div></td>
<td bgcolor="lightyellow"><b>GERMPLASM ACCESSIONS SENT:</b><br/><select id="smtaoriginga" style="width:300px" onchange="selorichg(this.id, this.value)"><option value="">--Select seed provider--</option></select><br/>Varieties (comma-seperated):<br/><textarea id="spga" rows="3" cols="50"></textarea> <br/><input type="button" value="Add to cart" onclick="addseed('ga')"> | <input type="button" value="Remove from cart" onclick="remseed('ga')"><br/><textarea style="background-color: #dde8fa;" readonly name="ga2" id="ga2" rows="5" cols="50"></textarea></td></tr>

<tr>
<td><b>SEED KITS REQUESTED:</b><br><textarea name="sk" id="sk" rows="5" cols="50"></textarea></td>
<td bgcolor="lightyellow"><b>SEED KITS SENT:</b><br><select id="smtaoriginsk" style="width:300px" onchange="selorichg(this.id, this.value)"><option value="">--Select seed kit provider--</option></select><br>Varieties (comma-seperated):<br><textarea id="spsk" rows="3" cols="50"></textarea> <br><input type="button" value="Add to cart" onclick="addseed('sk')"> | <input type="button" value="Remove from cart" onclick="remseed('sk')"><br><textarea style="background-color: #dde8fa;" readonly="" name="sk2" id="sk2" rows="5" cols="50"></textarea></td></tr>

<tr><td colspan="1" bgcolor="#f9e8f5">&#9888; <a href="#dvga" title="Material not available" id="inline">Notify requester if any breeding lines and / or germplasm accessions is not available</a></td><td bgcolor="#f9e8f5">&#x26d4; <a href=javascript:; onclick='vg(7)'>Cancel order and notify requester for material unavailablity</a><hr/>&#x26d4; <a href=javascript:; onclick='vg(9)'>Delete order</a></td></tr>

	<tr><td colspan="2" bgcolor="lightyellow"><b>Estimated Payment Due (in USD):</b> <input type="text" id="epd"> <!--input type="button" value="Notify requester" onclick="vg(6)"--> | <a href="https://avrdc.org/seed/seeds/" target="_blank">Payment Information</td></tr>
		<tr><td><b>Import permit required for selected country?*</b><br><a href=javascript:; onclick='vg(2)'>Notify requester that import permit is needed (if applicable), and send estimate and contact details of seed providers</a></td><td>
	<input name="ImportPermit" id="ImportPermit" type="radio" value="Yes" checked>Yes <input name="ImportPermit" id="ImportPermit" type="radio" value="No">No</td></tr>
<tr><td><b>PID Code</b></td><td><input name="PIDCode" id="PIDCode" type="text" value="" class="small" aria-required="true" aria-invalid="false"> | <a href="https://mls.planttreaty.org/itt/index.php?r=site/login/" target="_blank">Open Easy SMTA website</a></td></tr>
<!--tr><td><b>Seed Provider</b></td><td><div id="cntdiv"></div></td></tr-->
<tr style="display:none"><td><b>Attach signed SMTA from requester</b> | <a href="javascript:GU='SMTA';$('#divfu').show();void(0);">Click here to upload signed SMTA</a></td><td><span id="spanfuSMTA"></span></td></tr>

	<tr><td><b>Mode of shipment*</b></td><td>
	<input name="ShipMode" id="ShipMode" type="radio" value="Standard registered air mail (free of charge)" checked>Standard registered air mail (free of charge)<br/>
	<input name="ShipMode" id="ShipMode" type="radio" value="DHL">DHL<br/>
	<input name="ShipMode" id="ShipMode" type="radio" value="EMS">EMS<br/>
	<input name="ShipMode" id="ShipMode" type="radio" value="Others">Others</td></tr>
	<tr>
	<td><b>Airway bill number:</b></td>
	<td><input id="awb" name="awb" type="text" maxlength="43" style="width:250px; border:1px solid #999999" /></td>
	</tr>	
	<tr>
	<td><b>Shipment number:</b></td>
	<td><input id="shipnum" name="shipnum" type="text" maxlength="43" style="width:250px; border:1px solid #999999" /></td>
	</tr>	
	<tr>
	<td><b>Crop shipment number:</b></td>
	<td><input id="cropshipnum" name="cropshipnum" type="text" maxlength="143" style="width:250px; border:1px solid #999999" /></td>
	</tr>	
	<tr><td><b>Mode of payment for seed processing and shipping fees*</b> 
	</td><td>
	<input name="PayMode" id="PayMode" type="radio" value="Credit Card" checked>Credit Card (Visa, Mastercard, American Express): Additional 5% PayPal service fee charged on the amount due<br/> 
	<input name="PayMode" id="PayMode" type="radio" value="PayPal">PayPal: Additional 5% PayPal service fee charged on the amount due<br/> 
	<input name="PayMode" id="PayMode" type="radio" value="Check US Bank">Check drawn on a US Bank: No extra charge<br/>
	<input name="PayMode" id="PayMode" type="radio" value="Bank Transfer">Bank transfer: Fee of US $25 bank charges to be added to the amount due on each transfer</td></tr>
	<tr><td><b>Payment amount (in USD)*</b> <hr>
	<div id="tobesent"><div id="blpf"></div><div id="gapf"></div></div><hr/>
	
	<a href="javascript:;" onclick="nrep(1)">Send proforma invoice to requester</a><br><hr/>
	<a href="javascript:;" onclick="nrep(2)">Send final invoice to requester</a><br>
	<!--a href=#>Notify requester on expected payment (reminder)</a><br>
	<a href=#>Notify requester on payment received</a--></td><td><table width="100%"><tr><td>Processing fees*</td><td><input value="0" type="number" size="10" maxlength="10" id="pyp" onblur="af()"></td></tr><tr><td>Payment method fees*</td><td><input type="number" size="10" maxlength="10" value="0" id="pym" onblur="af()"></td></tr><tr><td>Testing fees</td><td><input type="number" size="10" maxlength="10" value="0" id="pys" onblur="af()"></td></tr><tr><td>Shipping fees*</td><td><input type="number" size="10" maxlength="10" id="pysh" value="0" onblur="af()"></td></tr><tr><td>Total payment due</td><td><input type="number" size="10" maxlength="10" id="pyt" value="0" style="background-color: #dde8fa;" readonly></td></tr></table></td></tr>
		<tr><td colspan="2" bgcolor="#f9e8f5"><label><input id="chok" type="checkbox" value="1" onclick="choke()">I am confirming that this request has been processed.</label> <b>I UNDERSTAND THAT PROCESSED REQUESTS CANNOT BE MODIFIED.</b><br/><span id="spok" style="display:none"><br/>&#9888; <a href=javascript:; onclick='vg(5)'>Notify requester that preparation procedures are underway.</a></span></td></tr>
	<tr><td colspan='2' align='right'> 
	* - required fields. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	<input id="skip_Submit" name="skip_Submit" class="btnCloseSpecial" type="button" value="Save" onclick="sa()">
		<input type="button" class="btnCloseSpecial4" onclick="document.f.submit()" value="Cancel"></td></tr>
	</table>
	<br />
	</td>
	</tr>
	</table>
	<br />
	<input type="hidden" id="u" name="u" value="<%=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"")%>">
	<input type="hidden" id="q" name="q" value="<%=(request.getParameter("q")!=null&&request.getParameter("q")!=""?request.getParameter("q"):"")%>">
	<input type="hidden" id="uname" name="uname" value="">
	<div style="display:none"><div id="dvga" style="font-family:Arial">Enter the materials that are not available. Click "Notify" to email the requester. <br/><br/><textarea id="mna" cols="20" rows="5"></textarea><hr/>
	<input type="button" value="Notify" class="btnCloseSpecial" onclick="vg(4)">
	<!--input type="button" value="Close" class="btnCloseSpecial4" onclick="$.fancybox.close(true)"-->
	</div></div>

	</form>
	<form action="home.jsp" method="POST" id="f" name="f">	<input type="hidden" id="u" name="u" value="<%=(request.getParameter("u")!=null&&request.getParameter("u")!=""?request.getParameter("u"):"")%>">
	</form>
	</body>
	</html> 
