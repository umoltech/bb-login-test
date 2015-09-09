<%@ include file="/webapis/ui/doctype.jspf" %>

<%@ taglib uri="/bbNG" prefix="bbNG" %>
<%@ taglib uri="/bbUI" prefix="bbUI" %>
<%@ taglib uri="/loginUI" prefix="loginUI" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="productName" value="${ loginUI:getProductName() }" />

<%--
  This is a standard wrapper for all AS pages.  It is recommended that you keep this tag.
  --%>
<bbNG:genericPage authentication="N" wrapper="false" onLoad="loadLoginPage()" bodyClass="login-page">
   
<%@ include file="/webapis/ui/cookie-disclosure-login.jspf"%>

<bbNG:jsBlock>	
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript">	
		//jQuery.noConflict();
		
		var loginpages = {
			'tst90.umassonline.net': {
				'dese-tst.umassonline.net': 'Massachusetts Department of Elementary and Secondary Education (DESE)',
				'uma-tst.umassonline.net': 'UMass Amherst',
				'umb-tst.umassonline.net': 'UMass Boston',
				'umd-tst.umassonline.net': 'UMass Dartmouth',
				'umdi-learningsolutions-tst.umassonline.net': 'UMass Donahue Institute',
				'nciia-tst.umassonline.net': 'National Collegiate Inventors and Innovators Association (NCIIA)',
				'ddslearning-tst.umassonline.net': 'Massachusetts Department of Developmental Services',
				'civicinitiative-tst.umassonline.net': 'UMDI Civic Initiative',
				'springfieldurbanleague-tst.umassonline.net': 'Springfield Urban League',
				'uml-tst.umassonline.net': 'UMass Lowell',
				'umassmed-tst.umassonline.net': 'UMass Worcester'
			}
		};
		
		function loadLoginPage() {
			if (top != self) {
				top.location.replace(self.location.href);
			}
		}
		
		function getJumpBox() {
			var current_host = window.location.hostname;
			var host_name = current_host.toLowerCase();
			var jump_box = '';
			
			if (loginpages[host_name] != 'undefined') {
				jump_box += '<div class="head">Choose Your Campus:</div>';
				
				for (var domain in loginpages[host_name]) {
					jump_box += '<div class="brand">';
					jump_box += '<a href="https://' + domain + '" target="_blank">';
					jump_box += loginpages[host_name][domain]
					jump_box += '</a>';
					jump_box += '</div>';
				}
				
				jQuery('#jumpBox').html(jump_box);
			}
		}
		
		jQuery().ready( function() {
			getJumpBox();
		});
	</script>
</bbNG:jsBlock>
  
<bbNG:cssBlock>
	<style type="text/css">
		body, body.login-page-body { 
			background-color: #ffffff;
			background-image: none;
			margin: 0;
		}
		
		#loginContainer #loginTitle {
			text-align: center;
			margin-bottom: 20px;
		}
		
		#loginContainer #loginTitle h1 {
			background-color: #eeeeee;
			padding: 10px 0;
			margin-top: 0;
			font-size: 180%;
		}
		
		#loginContainer div.loginBody {
			background-color: #ffffff;
			background-image: none;
			background-repeat: no-repeat;
			background-position: center top;
			padding: 0;
		}
		
		#loginAnnouncements ul {
			width: 500px;
		}
		
		#loginAnnouncements li {
			background-color: #FFFF99;
		}
		
		#jumpBox { 
			width: 420px; 
			margin: 0 auto 40px auto; 
			text-align: center; 
			border: 1px solid #999;
		}
		
		#jumpBox .head {
			padding: 10px;
			text-align: center;
			background-color: #ccc;
			font-weight: bold;			
		}
		
		#jumpBox .brand {
			padding: 7px 10px;
			text-align: center;
			border-bottom: 1px solid #999;
		}
		
		#jumpBox .brand:hover {
			background-color: #eeeeee;
		}
		
		#jumpBox .brand a {
			text-decoration: none;
		}
		
		#jumpBox .brand:last-child {
			border-bottom: none;
		}
	</style>
</bbNG:cssBlock>

<div id="loginPageContainer">
  <div id="loginPane">

    <div id="loginContainer">
      <div id="loginTitle" class="clearfix">
        <h1>UMassOnline Blackboard Learn Login</h1>
      </div>

      <div id="loginLang" class="clearfix">
        <loginUI:localePicker />
      </div>

      <div class="clearfix loginBody">
        <loginUI:errorMessage />
		<div id="jumpBox"></div>

        <div id="loginBox">
			<loginUI:loginForm />          
        </div>

        <div id="loginOptions">
          <loginUI:gatewayButtons />
        </div>
      </div>

      <loginUI:welcomeArea />
	    
    </div>

  </div>
  
  <loginUI:systemAnnouncements maxItems="5" />

  <bbNG:copyright />
</div>

</bbNG:genericPage>
