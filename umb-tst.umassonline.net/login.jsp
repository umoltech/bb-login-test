<%@ include file="/webapis/ui/doctype.jspf" %>

<%@ taglib uri="/bbNG" prefix="bbNG" %>
<%@ taglib uri="/bbUI" prefix="bbUI" %>
<%@ taglib uri="/loginUI" prefix="loginUI" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="productName" value="${ loginUI:getProductName() }" />

<bbNG:genericPage authentication="N" wrapper="false" onLoad="" bodyClass="login-page pageHome">

<%@ include file="/webapis/ui/cookie-disclosure-login.jspf"%>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">


    

	<meta charset="utf-8">



	<link rel="shortcut icon" href="/bbcswebdav/library/login/umb/favicon.gif" type="image/gif">
	<link rel="apple-touch-icon" href="http://assets.umb.edu/apple-touch-icon.png">
	

	
	<link rel="stylesheet" href="/bbcswebdav/library/login/umb/structure.css">
	<link rel="stylesheet" href="/bbcswebdav/library/login/umb/content.css">
	<link rel="stylesheet" href="/bbcswebdav/library/login/umb/print.css" type="text/css" media="print"> 


<bbNG:cssBlock>
<style type="text/css">

.BBLogo ul li{font-size: 18px; line-height: 1.1em;}

.search .rePosSearch{}
.ulInline li{display: inline;}
#navBB{margin: 0 auto; height: 46px; width: 940px; background:#FFF url(http://www.umassboston.net/assets/bb-images/navBB.png) no-repeat top left;}
#navBB ul{padding: 12px 0 0 50px;}
#navBB ul#navlist li{display: inline;}
#navBB ul#navlist li a{color: #fff!important; font-size: 15px;}
#navBB ul#navlist li a:hover{text-decoration: underline;}
.col1bb{float: left; width: 300px; height: 240px; background: #F1F5F8; padding: 10px 30px 10px 20px; font-size: 120%;}
.col2bb{float: right; width: 550px; height: 260px; background: #053148; position: relative;}
.col3bb{width: 300px; height: 240px; border:1px solid red;}
.col4bb{width: 310px; height: 240px; border:1px solid red;}
.col5bb{width: 310px; height: 240px; border:1px solid red;}
.clearbb {clear:both;}
#navigation {background: #fff!important; width: 0px!important;}
#container .wrap{background: #fff!important; }


.welBB {width: 100%; height: 43px; background:#000 url(http://www.umassboston.net/assets/bb-images/grayBar.png) repeat-x top left;}
.welBB h2{padding: 10px; font-size: 17px;}
.colbbWrap{ width: 900px; height: 100%; background: #FBFBFB;  float: right;}

.col2bb img{float: left; margin: 20px 20px 0px 20px;} 
ul.fBB{float: left; width: 300px; color: #fff; font-weight: bold; font-size: 14px; margin-top: 20px;}
ul.fBB li{line-height: 150%;}
.fBB h2 {color: #9FC9D1; font-size: 18px;}
.fBB h2 a {color: #9FC9D1;}
.BBLogo span{float: left; color: #9FC9D1; font-size: 11px;}
.BBLogo li.bbDots{border-bottom: 1px dashed #9FC9D1; margin: 7px 0; }

#header{border: none;}
#ccbb1{float: left; width: 220px; min-height: 220px; margin-right: 20px;}
#ccbb2{float: left; width: 470px; min-height: 220px; margin-top: 0px;}
#ccbb3{float: left; width: 230px; min-height: 220px;}
.orBB{color: #D67600!important;}
.navy{color: #053148!important;}
.grayBB{color: #9F9F9F!important;}
ul.unstyled li{list-style-type: none!important; background: none!important;}
/* #ccbb2{background:#FFF url(http://www.umassboston.net/assets/bb-images/bbmobile.png) no-repeat top left;} */
#bbNews{background:#FFF url(http://www.umassboston.net/assets/bb-images/bbmobile.png) no-repeat top left; min-height: 220px; padding-top: 5px;}
ul.oDot{list-style: none; padding:0; margin:0;}
ul.oDot li{padding-left: 1em; text-indent: -.7em; background: none!important; list-style-position: inside; list-style-type: square;}
/* ul.oDot li:before {content: "■ "; color: orange; background: none!important;} */
h2.orBB, h3.orBB{font: 1.43em/24px Georgia,Times,serif!important; margin: 10px 0px 10px 10px; padding: 0!important;}
#normal{font-weight: normal!important;}
a{cursor: pointer;}
li#sublogo{font-weight: normal;}
#ulccbb2{width: 310px; margin-left: 115px; font-size: 12px;}
#bbAlerts{width: 450px; min-height: 200px; border: 1px solid #D4D4D4; margin-bottom: 20px; background-color: #FFFFDD;}

div.loginBody { padding-top: 0px; margin-top: 20px; width: 300px; background: #F1F5F8; }
#loginBox ul { width: 300px; }
#loginBox li { padding-bottom: 6px; }
#loginBox li label { text-transform: none; color: #000; }
#loginBox input[type="text"], #loginBox input[type="password"] { padding: 3px; }
#loginAnnouncements ul { width: 400px; }
#loginAnnouncements li { box-shadow: none; }
#content #loginAnnouncements p { padding-bottom: 0; }
#loginErrorMessage { border:0;font-size:150%;margin-bottom:0;width:922px;text-align:center;margin-left:auto;margin-right:auto;}

/* OWL surveys */
.popup { text-align: left; background-color: #B9C2DF; padding: 20px; border: 1px solid #000; width: 285px; height: 380px; position: absolute; z-index: 100; margin-left: -10px; margin-top: -30px; }
.popup p { line-height: 24px; }
</style>
</bbNG:cssBlock>

<bbNG:jsBlock>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
		var bblearn = {
			elements: {
				form: 'form[name=login]',
				username: '#user_id',
				password: '#password',
				start_now: '#surveyurl',
				popup: '#bblearn-popup',
				popupmsg: '#bblearn-popup-msg',
				submit: 'input[type=submit][name=login]',
				server: 'owl-umbcontedonlinecourseeval',
				datasrc: 'OwlUMBContEdOnlineCourseEval',
				forgot: '.forgot',
				fxn: 'cevallogin',
				labels: {
					username: 'label[for="user_id"]',
					password: 'label[for="password"]'
				},
				surveyurl: '#bblearn-survey-url',
				surveychecked: false,
				owlUrl: 'https://owl3.oit.umass.edu/owlj/servlet/OwlPreLogin',
				vistaLink: '<a href="https://login.umassonline.net/boston.cfm">Blackboard Vista users login here</a>',
				pwLink: '<a href="https://spmt.umb.edu">Forgot Your Password?</a>'
			},
			forgot: {
				bbUrl: '/webapps/blackboard/password',
				bosUrl: 'https://spmt.umb.edu'
			}
		};
		
	function openCourseEvalPopUp(jsonpData) {
		if(!jsonpData) {
			return bblearn_submit_form();
		} else {
			if(jsonpData[0].length < 3) {
				bblearn_submit_form();
			}
	
			var numToComplete = jsonpData[0].numsurveys;
			var url = jsonpData[0].surveyurl;
			var popupnote = jsonpData[0].popupnote;
			
			if(isNaN(numToComplete) || url.length < 1) {
				return bblearn_submit_form();
			}
	
			if(numToComplete < 1) {
				return bblearn_submit_form();
			}
	
			jQuery(bblearn.elements.surveyurl).attr('href', url);
			
			if(popupnote && popupnote.length > 0) {
				jQuery(bblearn.elements.popupmsg).html(popupnote);
				jQuery(bblearn.elements.start_now).attr("onclick","bblearn_delayed_submit()");
			}
      
			jQuery(bblearn.elements.popup).show();  
			
		return false;
		}
	}
	var timeoutID = null;
	function bblearn_delayed_submit() {
		if (timeoutID) {
			window.clearTimeout(timeoutID);
		}
		timeoutID = window.setTimeout(bblearn_close_survey_popup, 2000);
	}

		function bblearn_close_survey_popup() {
			jQuery(bblearn.elements.popup).hide();
			return bblearn_submit_form();
		}
		
		function bblearn_submit_form() {			
			jQuery(bblearn.elements.form).submit();
			
			return true;
		}
		
	function bblearn_check_login_form() {  
		var id = jQuery(bblearn.elements.username).val();
		if (jQuery.trim(id) == '') {
			alert('Please supply a valid login username.');
			return false;
		}

		var pw = jQuery(bblearn.elements.password).val();
		if (jQuery.trim(pw) == '') {
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

		jQuery.ajax({
			type: "GET",
			url: bblearn.elements.owlUrl,
			data: {
				Server: bblearn.elements.server,
				datasrc: bblearn.elements.datasrc,
				fxn: bblearn.elements.fxn,
				Login: id,
				password: pw,
				formatjsonp: 1,
				Mode:'1',
				callsrc:'bblearn'
			},
			dataType: "jsonp",
			async: false,
			timeout: 5000,
			jsonp: false,
			success: function(data){
        openCourseEvalPopUp(data);
      },
			error: function (xhr, ajaxOptions, thrownError) {
				if(xhr.status==200){
					//do nothing
				} else {
					bblearn_submit_form();
				}
			}              
		});
	}
		
		jQuery().ready( function() {			
		jQuery('.bblearn-forgot-password').click( function() {
			var bblearnForgotPasswordWindow = window.open(
				'https://www.spire.umass.edu/psp/heproda/EMPLOYEE/HRMS/c/UM_SELF_SERVICE.UM_AM_RESET_OIT_PW.GBL?FolderPath=PORTAL_ROOT_OBJECT.UM_OIT_ACCOUNTS.UM_AM_RESET_OIT_PW_GBL&IsFolder=false&IgnoreParamTempl=FolderPath%252cIsFolder',
				'forgotPasswordWindow',
				'menubar=1,resizable=1,scrollbars=1,status=1,width=850,height=480'
			);
			bblearnForgotPasswordWindow.focus();

			return false;    
		});

		jQuery(bblearn.elements.submit).click( function() {
			bblearn_check_login_form();

			return false;
		});
			
			jQuery(bblearn.elements.forgot).html(bblearn.elements.pwLink);
		});
	</script>
</bbNG:jsBlock>


<!--------gmhn--------->

<div id="header" class="z3">
	<div class="wrap">
		<div class="BBLogo" style="position: relative;">
			<ul>
				<li><a href="#"><img src="/bbcswebdav/library/login/umb/umassBoston_siteLogo.png"></a></li>
				<li id="sublogo">Blackboard Learn Login</li>
				<li class="bbDots"></li>
				<hr id="hrDots"> 
				<li><span>Follow Us On:</span>
				<a class="socialIcon" title="View our Facebook Page" href="http://www.facebook.com/umassboston"><img src="/bbcswebdav/library/login/umb/facebook-sm.png" alt="Facebook"></a>
				<a class="socialIcon" title="View our photos on Flickr" href="http://www.flickr.com/photos/umass_boston/collections/"><img src="/bbcswebdav/library/login/umb/flickr-sm.png" alt="Flickr"></a>
				<a class="socialIcon" title="Follow us on Twitter" href="http://twitter.com/#%21/umassboston"><img src="/bbcswebdav/library/login/umb/twitter-sm.png" alt="Twitter"></a>
				<a class="socialIcon" title="View our YouTube Videos" href="http://www.youtube.com/umassboston"><img src="/bbcswebdav/library/login/umb/youtube-sm.png" alt="YouTube"></a>
				</li>
			</ul>
		</div>
		
	
		<div class="search rePosSearch">
			<form id="searchbox_001225130692263366863:pbalvg-_hus" action="http://www.umb.edu/search">
			<p>
				<input value="001225130692263366863:pbalvg-_hus" name="cx" type="hidden">
				<input value="FORID:11" name="cof" type="hidden">
				<label for="keywords">Search for:</label>
				<input name="q" id="keywords" value="enter keywords" type="text">
			</p>
			<input src="/bbcswebdav/library/login/umb/search_submit-005A8C.png" name="search" value="Submit" id="search_input" alt="Search" type="image">
			</form>
		
		</div><!--// end search //-->
	</div>
</div><!--// end header //-->
<hr class="print">


<!----------gmhn------->

<!---global_nav-->


<div id="navBB">
	<ul id="navlist">		
		<li style="margin-left: 2px;" id="active"><a href="http://www.umb.edu/it/getting_services/wiser">Register for Courses<span></span></a></li>
		<li style="margin-left: 20px;"><a href="http://www.umb.edu/life_on_campus">Life on Campus<span></span></a></li>
		<li style="margin-left: 30px;"><a href="http://www.umb.edu/news_events_media/news">News<span></span></a></li>
		<li style="margin-left: 36px;"><a href="http://www.umb.edu/news_events_media/events">Events<span></span></a></li>
		<li style="margin-left: 43px;"><a href="http://www.umb.edu/it/getting_services/email">Email<span></span></a></li>
		<li style="margin-left: 45px;"><a href="http://www.umb.edu/it/getting_services/wiser">WISER<span></span></a></li>
		<li style="margin-left: 45px;"><a href="http://www.umb.edu/it/getting_services/support_for_online_courses_blackboard/blackboard_learn_9_student_support">Blackboard Learn Support<span></span></a></li>
	</ul>
</div>


<!----------gnn------->

<div id="container"> 
	<loginUI:errorMessage />
	<div id="homeFeature">
		<div class="wrap">
			<div class="featureBB">
				<div class="colbbWrap">	
					<h2 class="orBB">Login</h2>

					<div class="col1bb">
						<p>Enter UMass Boston email username and password below.<br />
						<a href="http://www.umb.edu/it/getting_services/support_for_online_courses_blackboard/blackboard_learn_9_student_support#BBlogin" target="_blank">How to login</a></p>

						<div class="clearfix loginBody">
							<div id="loginBox">
								<div id="bblearn-popup" class="popup" style="display:none">
									<div id="bblearn-popup-msg">
                    <p style="font-weight:bold">Evaluate Your Course(s) and Instruction</p>
                    <p>For at least one of your courses, the opportunity to evaluate the course and instruction is online and easier than ever!</p>
                    <p>Your responses are completely confidential, and any results reported will remain anonymous and will in no way affect your grades.</p>
                    <p>Your evaluation is very important and helps us improve the quality of the educational experience for all students. It only takes a few minutes, so please complete your evaluation(s) now!</p>
                    <p><a id="bblearn-survey-url" target="_blank" onclick="javascript:bblearn_close_survey_popup()" href=""> > Start Now </a></p>
                  </div>                  
                  <p><a href="javascript:bblearn_close_survey_popup()"> > Remind me later </a></p>
								</div>
								<loginUI:loginForm />
							</div>
						</div>
               		</div>
                 
					<div class="col2bb">
						<img class="bbBioImage" src="/bbcswebdav/library/login/umb/student.jpg" title="Student">
						<ul class="fBB">
							<li><h2><a href="http://www.umb.edu/it/students">IT Services for Students</a></h2></li>
							<li>Virtual Computer Lab</li>
							<li>Special pricing on hardware and software</li>
							<li>$9.99 a year for McAfee AntiVirus Plus</li>
							<li>Securing your laptop, training and more</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>   
                
				<div class="clear"></div>
				<div class="welBB">
					<h2><span class="grayBB">Welcome</span> <span class="orBB">Students &amp; Faculty</span></h2>
				</div>
			</div><!--// end slideshow //-->
		</div>
	</div><!--// end homeFeature //-->

	<div class="wrap">
		<div id="padder">
			<div id="content" style="background: #fff;  min-height: 400px; width: 100%!important; background: #fff; margin: 0; padding: 0; position: relative; top: -40px;">
				<div id="ccbb1">
					<h2 class="orBB">Academic Calendars</h2>
					<ul class="unstyled">
						<li><a href="http://www.umb.edu/academics/caps/credit/fall/calendar">CAPS/Online</a></li>
						<li><a href="http://www.umb.edu/registrar/academic_calendar">Regular/On Campus</a></li>
						<li>Your course may not be available before the official listed course start date.</li>						
					</ul>
				</div>

				<div id="ccbb2">
					<div id="bbAlerts">
						<h3 class="orBB" id="normal">Alerts</h3>
						<loginUI:systemAnnouncements maxItems="5" />
					</div>
					<div id="bbNews">
						<h3 class="orBB" id="normal">News</h3>
						<ul id="ulccbb2" class="unstyled">
							<li><b>Blackboard Mobile Learn</b></li>
							<li>Access your online course through your mobile device!</li>
							<li><a href="https://www.blackboard.com/Platforms/Mobile/Products/Mobile-Learn/Features.aspx">Learn more &gt;</a></li>
						</ul>
					</div>					
				</div>
                
                <div id="ccbb3">
					<h2 class="orBB" id="normal">Getting Technical Help</h2>
					<ul class="unstyled">
						<li>Note the link to new contact information below.</li>
						<li>24/7 technical assistance is available to students and faculty via:</li>
						<li><a href="http://umb.echelp.org" target="_blank" class="button-1"><strong>Online Support Center</strong></a></li>
						<li>&nbsp;</li>
						<li>For problems resetting your password:</li>
						<li>Call the IT Service Desk at 617.287.5220.</li>
					</ul>
				</div>	
				<div class="clear"></div>
			</div><!--// end #content //-->
		</div><!--// end #padder //-->
	</div>
</div><!--// end #container //-->
	
	<div id="textLayer">
		<div class="content">
			
		</div><!--// end content //-->
		<span class="close"></span>
	</div><!--// end textLayer //-->
	<span id="textLayerBG"></span>
	

<!-- begin: /includes/global_footer.shtml-->
<hr class="print">
<div id="footer">
	<div class="wrap">
		<strong class="foot">UMass Boston</strong>
		<div class="footerNav cols2">
			<ul class="col">
				<li><a href="http://www.umb.edu/mobile_web">MobileWeb</a></li>                               
				<li><a href="http://www.umb.edu/contact">Contact Us</a></li>
				<li><a href="http://www.umb.edu/hr">Employment</a></li>
				<li><a href="http://www.umb.edu/privacy_terms">Privacy &amp; Terms</a></li>
				<li><a href="http://www.umb.edu/accessibility_statement">Accessibility Statement</a></li>
				<li><a href="http://www.umb.edu/text_only_homepage">Text Only Homepage</a></li>
                                <li><a href="http://www.umb.edu/odi">Diversity / ADA</a></li>
				<li><a href="http://www.umb.edu/the_university/student_consumer_information">Student Consumer Information</a></li>
				<li><a href="http://www.massachusetts.edu/index.html">UMass System</a></li>
			</ul>
			<ul class="col">
				<li><a href="http://www.umb.edu/the_university">The University</a></li>
				<li><a href="http://www.umb.edu/academics">Academics</a></li>
				<li><a href="http://www.umb.edu/research">Research</a></li>
				<li><a href="http://www.umb.edu/admissions">Admissions &amp; Financial Aid</a></li>
				<li><a href="http://www.umb.edu/athletics">Athletics &amp; Recreation</a></li>
				<li><a href="http://www.umb.edu/life_on_campus">Life on Campus</a></li>
				<li><a href="http://www.umb.edu/in_the_community">In the Community</a></li>
			</ul>
		</div>
		<div class="extra">
							<div class="share">
			
							<!-- AddThis Button BEGIN -->
							<div class="addthis_toolbox addthis_default_style ">
								<a href="https://www.addthis.com/bookmark.php?v=250&amp;username=umbcommunications" class="addthis_button_compact at300m"><span class="at16nc at300bs at15nc at15t_compact at16t_compact"><span class="at_a11y">More Sharing Services</span></span>Share</a>
								<span tabindex="1000" class="addthis_separator">|</span>
								<a class="socialIcon" title="View our Facebook Page" href="http://www.facebook.com/umassboston"><img src="/bbcswebdav/library/login/umb/facebook-sm.png" alt="Facebook"></a>
								<a class="socialIcon" title="View our photos on Flickr" href="http://www.flickr.com/photos/umass_boston/collections/"><img src="/bbcswebdav/library/login/umb/flickr-sm.png" alt="Flickr"></a>
								<a class="socialIcon" title="Follow us on Twitter" href="http://twitter.com/#%21/umassboston"><img src="/bbcswebdav/library/login/umb/twitter-sm.png" alt="Twitter"></a>
								<a class="socialIcon" title="View our YouTube Videos" href="http://www.youtube.com/umassboston"><img src="/bbcswebdav/library/login/umb/youtube-sm.png" alt="YouTube"></a>
							<div class="atclear"></div></div>
							<script type="text/javascript">var addthis_config = {"data_track_clickback":true};</script>
							<script type="text/javascript" src="/bbcswebdav/library/login/umb/addthis_widget.js"></script>
							<!-- AddThis Button END -->
							</div><!--// end share //-->
			<div id="hcard-University-of-Massachusetts-Boston" class="vcard">
				<a class="url fn n" href="http://www.umb.edu/">
					<span class="organization-name">University of Massachusetts Boston</span>
				</a>
				<div class="tel">
					<span class="type">work</span><span class="copperfield">: </span><span class="value" style="font-size: 14px!important;">
617.287.5000 (Information) <br> 617.287.7799 (Campus Police)</span>
				</div>
				<div class="adr">
					<div class="street-address">100 Morrissey Blvd.</div>
					<span class="locality">Boston</span>,
					<span class="region">MA</span>
					<span class="postal-code">02125-3393</span>
					<span class="country-name">United States</span>
				</div>
			</div>
			<p class="copyright">&copy; Copyright 2013 UMass Boston</p>
		</div><!--// end extra //-->
	</div>
</div><!--// end #footer //-->

<bbNG:jsBlock>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-793538-8', 'umassonline.net');
  ga('send', 'pageview');

</script>
</bbNG:jsBlock>
</bbNG:genericPage>