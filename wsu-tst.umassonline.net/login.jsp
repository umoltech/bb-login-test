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
	body.login-page { background: #FFFFFF url('/bbcswebdav/library/login/wsu/header-bg.gif') top left repeat-x; }
	div.loginBody { width: 900px; padding: 160px 0 0 0; background: url('/bbcswebdav/library/login/wsu/logo.png') no-repeat scroll 340px 30px; }
	#loginBoxContainer { }
	#loginBlockColumnLeft { float: left; width: 255px; margin-right: 20px; }
	#loginBlockColumnRight { float: left; width: 255px; margin-left: 20px; }
	.loginBlock { background-color: white; padding: 10px 20px 20px 20px; border: 1px solid #999999; margin-bottom: 20px; }
	.loginBlock h3 { padding: 0; text-transform: uppercase; }
	.loginBlock p { margin-bottom: 10px; }
	.loginBlock ul { padding-left: 20px; list-style-type: circle; }
	#loginBox { float: left; width: 350px; }
	#loginBox p { text-align: left; margin-bottom: 10px; }
	#loginBox ul { width: 320px; }
	#loginBox li label { color: #881C1C; }
	#loginAnnouncements ul { width: 350px; }
	#loginAnnouncements li { background-color: #FFFFCC; }
	input.submit[type="submit"] { background: #00498C; }
	
</style>
</bbNG:cssBlock>

<div id="loginPageContainer">
  <div id="loginPane">
    <%-- Begin top rounder --%>
    <div class="topRound loginBack"><b class="outer"></b><b class="middle"></b><b class="inner"></b></div>
    <%-- End top rounder --%>

    <div id="loginContainer">
      <div id="loginHeader" class="clearfix">
        <h1 class="hideoff">${productName}</h1>
        <img src="/bbcswebdav/library/login/wsu/logo.png" alt="${productName}" class="productLogo" />
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
              <h3>Login Instructions</h3>
              <p>Your username will be your first initial, last name, and last four numbers of your campus-wide ID (A#). Your initial password will be your A# with a capital A.</p>
              <p>Example:<br />
              <strong>Username:</strong> jdoe1234<br />
              <strong>Password:</strong> A12345678</p>
            </div>
          </div>
		  <div id="loginBox">            
            <loginUI:loginForm />
            <loginUI:systemAnnouncements maxItems="5" />
          </div>
          <div id="loginBlockColumnRight">
            <div class="loginBlock">
              <h3>Useful Links</h3>
			  <ul>
                <li><a target="_blank" href="http://java.com/en/">Download Java Run Time</a></li>
                <li><a target="_blank" href="http://cit.westfield.ma.edu/support/faqs.php">FAQ&#8217;s</a></li>
                <li><a target="_blank" href="http://www.westfield.ma.edu">Westfield State University</a></li>
                <li><a target="_blank" href="https://learning.umassonline.net/">Old PLATO (Vista) Archive</a></li>
              </ul>
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