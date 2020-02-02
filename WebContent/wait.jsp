<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<!-- Stylesheets -->
<link href="design/css/bootstrap.css" rel="stylesheet">
<link href="design/css/main.css" rel="stylesheet">
<link href="design/css/responsive.css" rel="stylesheet">
<!-- Color Switcher Mockup -->
<link href="design/css/color-switcher-design.css" rel="stylesheet">
<!--Color Themes-->
<link id="theme-color-file" href="design/css/color-themes/default-theme.css" rel="stylesheet">
</head>

<body bgcolor="#212529" >

<div class="page-wrapper">

<div class="preloader"></div>

</div>
<%
String privilige=(String) session.getAttribute("privilige");
String p=request.getContextPath()+"/index.jsp";
if(privilige.equalsIgnoreCase("administrateur"))p=request.getContextPath()+"/adminAccueil.jsp";
if(privilige.equalsIgnoreCase("collaborateur"))p=request.getContextPath()+"/CollaborateurAccueil.jsp";
if(privilige.equalsIgnoreCase("Chef de projet"))p=request.getContextPath()+"/ChefAccueil.jsp";
if(privilige.equalsIgnoreCase("client"))p=request.getContextPath()+"/clientAccueil.jsp";
%>
<script language="JavaScript">
        setTimeout("window.location='<%=p%>'",6000);
          // delai en millisecondes donc 10000 = 10 secondes
</script>

<script src="design/js/jquery.js"></script>
<script src="design/js/popper.min.js"></script>
<script src="design/js/bootstrap.min.js"></script>
<script src="design/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="design/js/jquery.fancybox.js"></script>
<script src="design/js/jquery.paroller.min.js"></script>
<script src="design/js/parallax.min.js"></script>
<script src="design/js/tilt.jquery.min.js"></script>
<script src="design/js/dropzone.js"></script>
<script src="design/js/appear.js"></script>
<script src="design/js/owl.js"></script>
<script src="design/js/wow.js"></script>
<script src="design/js/jquery-ui.js"></script>
<script src="design/js/script.js"></script>
<script src="design/js/color-settings.js"></script>
<script src="assets/scripts/main.js"></script>

<script>
//Hide Loading Box (Preloader)
	function handlePreloader() {
		if($('.preloader').length){
			$('.preloader').delay(5000).fadeOut(500);
		}
	}
	</script>
</body>
</html>