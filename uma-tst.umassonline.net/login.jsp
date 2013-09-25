<%@ include file="/webapis/ui/doctype.jspf" %>

<%@ taglib uri="/bbNG" prefix="bbNG" %>
<%@ taglib uri="/bbUI" prefix="bbUI" %>
<%@ taglib uri="/loginUI" prefix="loginUI" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ page import="java.util.Random" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>

<c:set var="productName" value="${ loginUI:getProductName() }" />

<bbNG:genericPage authentication="N" wrapper="false" onLoad="if (document.forms.login.user_id != undefined) document.forms.login.user_id.focus()" bodyClass="login-page">

<%@ include file="/webapis/ui/cookie-disclosure-login.jspf"%>

<bbNG:cssBlock>
<style type="text/css">
	body.login-page { background: #FFFFFF url('/bbcswebdav/library/login/uma/header_bg.gif') top left repeat-x; }
	div.loginBody { width: 900px; padding: 140px 0 0 0; background: url('/bbcswebdav/library/login/uma/logo.png') no-repeat scroll 335px 20px; }
	#loginBoxContainer { }
	#loginBlockColumnLeft { float: left; width: 255px; margin-right: 20px; }
	#loginBlockColumnRight { float: left; width: 255px; margin-left: 20px; }
	.loginBlock { background-color: white; padding: 10px 20px 20px 20px; border: 1px solid #999999; margin-bottom: 20px; }
	.loginBlock h3 { padding: 0; }
	.loginBlock p { margin-bottom: 10px; }
	.loginBlock ul { padding-left: 20px; list-style-type: circle; }
	.loginBlock a { text-decoration: underline; }
	#loginBox { float: left; width: 350px; }
	#loginBox p { text-align: left; margin-bottom: 10px; }
	#loginBox ul { width: 320px; }
	#loginBox li label { color: #881C1C; }
	#loginAnnouncements ul { width: 350px; }
	#loginAnnouncements li { background-color: #FFFFCC; }
	.popup { 
		text-align: left; 
		background-color: #B9C2DF; 
		padding: 10px; 
		border: 1px solid #000; 
		width: 328px;
		height: 200px;
		position: absolute;
		z-index: 100;
	}
</style>
</bbNG:cssBlock>

<bbNG:jsBlock>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript">
		var bblearn = {
			elements: {
				form: 'form[name=login]',
				username: '#user_id',
				password: '#password',
				start_now: '#surveyurl',
				popup: '#bblearn-popup',
				submit: 'input[type=submit][name=login]',
				server: 'owl-umacontedonlinecourseeval',
				datasrc: 'OwlUMAContEdOnlineCourseEval',
				fxn: 'cevallogin',
				forgot: 'a[href="/webapps/blackboard/password"]',
				loginError: '#loginErrorMessage',
				labels: {
					username: 'label[for="user_id"]',
					password: 'label[for="password"]'
				},
				surveyurl: '#bblearn-survey-url',
				surveychecked: false,
				owlUrl: 'https://owl3.oit.umass.edu/owlj/servlet/OwlPreLogin'
			},
			prefix: 'uma_',
			forgot: {
				bbUrl: '/webapps/blackboard/password',
				amhUrl: 'https://www.oit.umass.edu/support/accounts/understand-your-netid-password#Your%20OIT%20Account%20Password'
			}
		};
		
		function openCourseEvalPopUp(jsonpData) {
			if(jsonpData[0].length < 3) {
				bblearn_submit_form();
			}
		
			var numToComplete = jsonpData[0].numsurveys;
			var url = jsonpData[0].surveyurl;
		
			if(isNaN(numToComplete) || url.length < 1) {
				return bblearn_submit_form();
			}
		
			if(numToComplete < 1) {
				return bblearn_submit_form();
			}
		
			$(bblearn.elements.surveyurl).attr('href', url);
			$(bblearn.elements.popup).show();	
		
			return false;	
		}

		function bblearn_close_survey_popup() {
			$(bblearn.elements.popup).hide();
			return bblearn_submit_form();
		}
		
		function bblearn_submit_form() {
			var bblearnUsername = $(bblearn.elements.username).val();
			
			if (bblearnUsername.substring(0, bblearn.prefix.length) != bblearn.prefix) {
				bblearnUsername = bblearn.prefix + bblearnUsername;
			}
			
			$(bblearn.elements.username).val(bblearnUsername);
			
			$(bblearn.elements.form).submit();
			
			return true;
		}
		
		function bblearn_check_login_form() {	
			var id = $(bblearn.elements.username).val();
			if ($.trim(id) == '') {
				alert('Please supply a valid login ID.');
				return false;
			}
		
			var pw = $(bblearn.elements.password).val();
			if ($.trim(pw) == '') {
				alert('Please supply a valid password.');
				return false;
			}
	  
			bblearn_check_surveys(id, pw);
			return false;
		}
		
		function bblearn_check_surveys(id, pw) {
			if(bblearn.elements.surveychecked) {
				bblearn_submit_form();
			}
			
			$.ajax({
				type: "GET",
				url: bblearn.elements.owlUrl,
				data: {
					Server: bblearn.elements.server,
					datasrc: bblearn.elements.datasrc,
					fxn: bblearn.elements.fxn,
					Login: id,
					Password: pw,
					formatjsonp: 1
				},
				dataType: "jsonp",
				timeout: 5000,
				jsonp: false,
				jsonpCallback: "openCourseEvalPopUp",
				error: function() {
					bblearn_submit_form();
				}			
			});
		}
		
		
		
		jQuery().ready( function() {			
			jQuery(bblearn.elements.labels.username).text('NETID');
			
			jQuery(bblearn.elements.forgot).removeAttr('onclick').attr('href', '#').hide();
			
			$(bblearn.elements.submit).click( function() {
				bblearn_check_login_form();
				
				return false;
			});
		});
	</script>
</bbNG:jsBlock>

<div id="loginPageContainer">
  <div id="loginPane">
    <%-- Begin top rounder --%>
    <div class="topRound loginBack"><b class="outer"></b><b class="middle"></b><b class="inner"></b></div>
    <%-- End top rounder --%>

    <div id="loginContainer">
      <div id="loginHeader" class="clearfix">
        <h1 class="hideoff">${productName}</h1>
        <img src="http://www.umass.edu/umhome/sites/default/themes/gateway/logo.png" alt="${productName}" class="productLogo" />
        <loginUI:accessibility />
      </div>

      <div id="loginLang" class="clearfix">
        <loginUI:localePicker />
      </div>

      <div class="clearfix loginBody">
        <loginUI:errorMessage />
		
		<div id="loginBoxContainer">
		  <div id="loginBlockColumnLeft">
            <div class="loginBlock">
              <h3>Need Technical Support?</h3>
              <p>Please visit the Help Desk for Self-Help and Contact information at 
			  <a href="http://uma.echelp.org">http://uma.echelp.org</a>.</p>
            </div>
          </div>
		  <div id="loginBox">  
			<div id="bblearn-popup" class="popup" style="display:none">
				<div id="bblearn-popup-msg">
					The University of Massachusetts requests that you evaluate your online courses. 
					Your feedback is of the utmost importance, and is used to improve the quality of our courses. 
					All answers remain confidential and anonymous.
				</div>
				<p><a id="bblearn-survey-url" target="_blank" onclick="javascript:bblearn_close_survey_popup()" href=""> &gt; Start Now </a></p>
				<p><a href="javascript:bblearn_close_survey_popup()"> &gt; Remind me later </a></p>
			</div>
            <loginUI:loginForm />
            <loginUI:systemAnnouncements maxItems="5" />
          </div>
          <div id="loginBlockColumnRight">
            <div class="loginBlock">
              <h3>IMPORTANT</h3>
              <p><a href="https://www.oit.umass.edu/support/accounts/understand-your-netid-password" target="_blank">About Your NetID and Password</a></p>
              <p><a href="https://www.oit.umass.edu/support/accounts/understand-your-netid-password#Your%20OIT%20Account%20Password" target="_blank">Forgot Your Password?</a></p>
			  <p>Need to access Blackboard Vista?<br />
			  <a href="https://login.umassonline.net/amherstvista.cfm">Blackboard Vista Login</a></p>
            </div>
			<div class="loginBlock">
			  <h3>Learning Management System</h3>
              <p>Through UMassOnline, UMass Amherst Continuing &amp; Professional Education presents 
			  online courses on the Blackboard Learn learning management system.</p>
			  <p>You must have an active OIT Account NetID to log in.
              <a href="https://www.oit.umass.edu/accounts/activate-your-account" target="_blank">Activate Your OIT Account</a>.</p>
              <p>Online courses become available for access one week before the start date of the class.</p>
            </div>
          </div>
        </div>
		
        <div id="loginOptions">
          <loginUI:gatewayButtons />
        </div>
      </div>

      <loginUI:welcomeArea />

      
    </div>

    <%-- Start Bottom Rounder --%>
    <div class="bottomRound loginBack"><b class="inner"></b><b class="middle"></b><b class="outer"></b></div>
    <%-- End Bottom Rounder --%>
  </div>
  
  <bbNG:copyright />
</div>

</bbNG:genericPage>