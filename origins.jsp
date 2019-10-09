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
			if($("#sesu").val()=="0"){ $("#mmkm").hide(); alert("You cannot access this page unless you are logged in.");return}

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
		//data: un,
		url:"origindata.jsp" 	,
		success:function(result){
			if($.trim(result)=="") {$("#d").html("No seed requests for you to manage. Begin by clicking <i>Process new seed request</i> above.");return;}
			$("#d").html(result);
			$(function(){
			  $("#rtab").tablesorter({theme:'blue'	, widthFixed: true, widgets: ['zebra','stickyHeaders','filter'], widgetOptions:{stickyHeaders : 'tablesorter-stickyHeader'}}); $("#rtab").show(); $("#wgxls").show(); $("#dm").show();
			});				
  		}
	});
	
});	

var GX=0;
function ed(x,y)
{
	GX=x;
	$("#Country").val(y)
	$("#bl").val($("#oca"+x).text());
	$("#divfu").show();
}

function fa()
{
	if ($.trim(document.f2.Country.value) == "") {alert('Country is required.');document.f2.Country.focus();return false;}
	if ($.trim($("#bl").val()) == "") {alert('Contact information cannot be empty.');return false;}

	$("#q").val(GX); document.f2.submit();
}

function de(x)
{	
	$("#q").val(x); $("#actdt2").val(x); document.f2.submit();
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
	<table id="activitydispla" width="100%"> <tr><td><input type="button" onclick="ed(0,'')" class='btnCloseSpecial' id='mmkm' value="+ Add new seed distribution center"></td>	
		</tr>
		<tr id="projectnamePaneltr">
			<td id="projectnamePanel" width="50%" >
				
			</td>	
	<td id="projectnamePanel" width="50%" align="right" >
				
			</td>	
	</table>
</td></tr></table>
<div style="width:70%;margin: 0 auto;" id="d"></div>
</form>
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
<form action="originsave.jsp" method="post" id="f2" name="f2">
    		<table align="center" id="activitydisplay">
			<tr><td><select name="Country" id="Country" style="width: 100% !important;"><option value="" selected="selected"></option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Costa Rica">Costa Rica</option><option value="CÃ´te d'Ivoire">CÃ´te d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="CuraÃ§ao">CuraÃ§ao</option><option value="Cyprus">Cyprus</option><option value="Czech Republic">Czech Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="East Timor">East Timor</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Polynesia">French Polynesia</option><option value="Gabon">Gabon</option><option value="Gambia">Gambia</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Japan">Japan</option><option value="Jordan">Jordan</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="North Korea">North Korea</option><option value="South Korea">South Korea</option><option value="Kosovo">Kosovo</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macedonia">Macedonia</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marshall Islands">Marshall Islands</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mexico">Mexico</option><option value="Micronesia">Micronesia</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montenegro">Montenegro</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Myanmar">Myanmar</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Palestine, State of">Palestine, State of</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Romania">Romania</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Saint Martin">Saint Martin</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Senegal">Senegal</option><option value="Serbia">Serbia</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Sint Maarten">Sint Maarten</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="Spain">Spain</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Sudan, South">Sudan, South</option><option value="Suriname">Suriname</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Togo">Togo</option><option value="Tonga">Tonga</option><option value="Trinidad and Tobago">Trinidad and Tobago</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="United States">United States</option><option value="Uruguay">Uruguay</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Vatican City">Vatican City</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands, British">Virgin Islands, British</option><option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option><option value="Yemen">Yemen</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select></td></tr>
			<tr><td>Name and address:<br><br><textarea name="bl" id="bl" rows="5" cols="30"></textarea></td></tr>
			<tr><td><input id="afufilebtn" type="button" value="Save" onclick="fa()"><div class="alignright"><input type="button" value="Close" onclick="$('#divfu').hide()" ></div></td></tr></table>	<input type="hidden" id="q" name="q" value=""><input value="" type="hidden" name="actdt2" id="actdt2">
</form></div>
</body>
</html>