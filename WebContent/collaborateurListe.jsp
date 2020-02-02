<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.ChefDeProjet"%>
<%@ page import="com.yoprojet.projet.services.ChefDeProjetServiceImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.Admin"%>
<%@ page import="com.yoprojet.projet.services.AdminServiceImpl"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">


<link rel="stylesheet" href="assets/styles/style.min.css">
	
	<!-- Material Design Icon -->
	<link rel="stylesheet" href="assets/fonts/material-design/css/materialdesignicons.css">

	<!-- mCustomScrollbar -->
	<link rel="stylesheet" href="assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="assets/plugin/waves/waves.min.css">

	<!-- Sweet Alert -->
	<link rel="stylesheet" href="assets/plugin/sweet-alert/sweetalert.css">
	
	<!-- FlexDatalist -->
	<link rel="stylesheet" href="assets/plugin/flexdatalist/jquery.flexdatalist.min.css">

	<!-- Popover -->
	<link rel="stylesheet" href="assets/plugin/popover/jquery.popSelect.min.css">

	<!-- Select2 -->
	<link rel="stylesheet" href="assets/plugin/select2/css/select2.min.css">

	<!-- Timepicker -->
	<link rel="stylesheet" href="assets/plugin/timepicker/bootstrap-timepicker.min.css">

	<!-- Touch Spin -->
	<link rel="stylesheet" href="assets/plugin/touchspin/jquery.bootstrap-touchspin.min.css">

	<!-- Colorpicker -->
	<link rel="stylesheet" href="assets/plugin/colorpicker/css/bootstrap-colorpicker.min.css">

	<!-- Datepicker -->
	<link rel="stylesheet" href="assets/plugin/datepicker/css/bootstrap-datepicker.min.css">

	<!-- DateRangepicker -->
	<link rel="stylesheet" href="assets/plugin/daterangepicker/daterangepicker.css">

	<!-- Dark Themes -->
	
		<title>Multiple File Upload - My Admin Template</title>

		<!-- Main Styles -->
		<link rel="stylesheet" href="assets/styles/style.min.css">
		
		<!-- Material Design Icon -->
		<link rel="stylesheet" href="assets/fonts/material-design/css/materialdesignicons.css">

		<!-- mCustomScrollbar -->
		<link rel="stylesheet" href="assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.min.css">

		<!-- Waves Effect -->
		<link rel="stylesheet" href="assets/plugin/waves/waves.min.css">

		<!-- Sweet Alert -->
		<link rel="stylesheet" href="assets/plugin/sweet-alert/sweetalert.css">
		
		<!-- Dropify -->
		<link rel="stylesheet" href="assets/plugin/dropify/css/dropify.min.css">

		<!-- Dark Themes -->
		<link rel="stylesheet" href="assets/styles/style-dark.min.css">


</head>
<body>

<%
Cookie[] cookies=request.getCookies();
boolean trouve=false;
String nom="";
String prenom="";
String privilige="";
String p="";
if(cookies!=null)
{
	for(Cookie cookie:cookies)
	{
		if(cookie.getName().equals("nom"))
		{
			trouve=true;
			nom=cookie.getValue();
		}
		if(cookie.getName().equals("prenom"))prenom=cookie.getValue();
		if(cookie.getName().equals("privilige"))privilige=cookie.getValue();
		
	
		if(cookie.getName().equals("privilige")) privilige=cookie.getValue();
		if(privilige.equalsIgnoreCase("administrateur"))p="/adminAccueil.jsp";
		if(privilige.equalsIgnoreCase("collaborateur"))p="/CollaborateurAccueil.jsp";
		if(privilige.equalsIgnoreCase("Chef de projet"))p="/ChefAccueil.jsp";
		if(privilige.equalsIgnoreCase("client"))p="/clientAccueil.jsp";

	}
}
%>
<c:if test="${empty sessionScope.nom}">
<%if(trouve==false)%>
<c:redirect url="/page-login.jsp"/>
</c:if>

		<c:if test="${sessionScope.privilige=='Collaborateur'}">
		<% p="/CollaborateurAccueil.jsp"; %>
		 </c:if>
		 <c:if test="${sessionScope.privilige=='administrateur'}">
		<% p="/adminAccueil.jsp"; %>
		 </c:if>
		 <c:if test="${sessionScope.privilige=='Chef de projet'}">
		<% p="/ChefAccueil.jsp"; %>
		 </c:if>
		 <c:if test="${sessionScope.privilige=='client'}">
		<% p="/clientAccueil.jsp"; %>
		 </c:if>
		 
	 
<c:if test="${sessionScope.privilige!='administrateur'}">
<c:redirect url="<%=p %>"/>
</c:if>

<div class="main-menu">
	<header class="header">
		<a href="index.html" class="logo"><i class="ico mdi mdi-animation"></i> Admin</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="#" class="avatar">
			<a href="avatarUpdate/updateAvatar.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			AdminServiceImpl adm=new AdminServiceImpl() ;
			Admin admin=adm.unique(email);
			String chemin="tmpfiles/"+admin.getAvatar();
			if(admin.getAvatar().equals("vide"))
			{
			%>
			<img src="assets/images/avatar-1.jpg"/>
			<%
			}else{
				%>
				<img src="<%=chemin %>"/>
				<% 
				}
			%>
			<span class="status online"></span></a>
			<span class="status online"></span></a>
			<h5 class="name"><a href="profile.html">Med Benmoussa</a></h5>
			<h5 class="position">Administrator</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile.html"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> ParamÃ¨tres</a></div>
					<div class="control-item"><a href="deconnexion.jsp"><i class="fa fa-sign-out"></i> Se dÃ©connecter</a></div>
				</div>
			</div>
		</div>
	</header>
	<!-- Menu Vertical -->
	<div class="content">
		<div class="navigation">
		<!-- Titre 1 -->
			<h5 class="title">Navigation</h5>
			<ul class="menu js__accordion">
			<!-- Tableau de bord -->
				<li>
					<a class="waves-effect" href="adminAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				<!-- LEs nouvelles de nous -->
			</ul>
			<h5 class="title">Projets</h5>
			<ul class="menu js__accordion">
			<!-- La gestion de projets -->
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-cube-outline">
					</i><span>Admin UI</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="projet/projetListe.jsp">Gestion de projet</a></li>
						<li><a href="projet/projetactiveListe.jsp">Suivi de projet</a></li>
						<li><a href="projet/finance.jsp">Situation financière</a></li>

					</ul>
				</li>

					<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-account-settings-variant">
					</i><span>Service</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="projet/metier.jsp?type=dev">Developpement</a></li>
						<li><a href="projet/metier.jsp?type=design">Design</a></li>
						<li><a href="projet/metier.jsp?type=marketing">Web marketing</a></li>
						<li><a href="projet/metier.jsp?type=maintanance">Maintanance</a></li>
						<li><a href="projet/metier.jsp?type=cms">CMS</a></li>
						<li><a href="projet/metier.jsp?type=securite">Web Sécurité</a></li>


					</ul>
				</li>
			</ul>
			<h5 class="title">Client</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="patenaire/organisations.jsp"><i class="menu-icon mdi mdi-account-circle">
					</i><span>Entreprises</span></a>
				</li>
				<li>
					<a class="waves-effect" href="partenaire/particuliers.jsp"><i class="menu-icon mdi mdi-account-circle">
					</i><span>particuliers</span></a>
				</li>
			</ul>

			<h5 class="title">Réseaux</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="Gcollaborateur.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
					<span>Ajouter Co-équipier</span></a>
				</li>
				<li>
					<a class="waves-effect" href="partenaire/developpeursListe.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
					<span>Collaborateurs</span></a>
				</li>
				<li>
					<a class="waves-effect" href="partenaire/ChefListe.jsp"><i class="menu-icon mdi mdi-arrow-compress-all"></i>
					<span>Chef de projet</span></a>
				</li>
			</ul>
			<h5 class="title">Contacts</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="message/messageAdmin.jsp"><i class="menu-icon mdi mdi-email"></i>
					<span>Messageries</span></a>
				</li>
			</ul>
		</div>
	</div>


</div>

<!-- /.main-menu -->
<div class="fixed-navbar">
	
	<div class="pull-left">
		<button type="button" class="menu-mobile-button glyphicon glyphicon-menu-hamburger js__menu_mobile"></button>
		<h1 class="page-title">Collaborateur</h1>
	</div>
	
	<div class="pull-right">
		
		<div class="ico-item">
			<a href="#" class="ico-item mdi mdi-magnify js__toggle_open" data-target="#searchform-header"></a>
			<form action="#" id="searchform-header" class="searchform js__toggle">
			<input type="search" placeholder="Rechercher..." class="input-search">
			<button class="mdi mdi-magnify button-search" type="submit"></button>
			</form>
		</div>
		<a href="#" class="ico-item mdi mdi-email notice-alarm js__toggle_open" data-target="#message-popup"></a>
		<a href="deconnexion.jsp" class="ico-item mdi mdi-logout"></a>
	</div>
</div>
<!-- /.fixed-navbar -->



<!-- /#notification-popup -->
<div id="message-popup" class="notice-popup js__toggle" data-space="75">
	<h2 class="popup-title">MESSAGES RÃ‰CENTS<a href="#" class="pull-right text-danger">Nouveau message</a></h2>
	<div class="content">
		<ul class="notice-list">
			<li>
				<a href="#">
					<span class="avatar"><img src="assets/images/avatar-2.jpg" alt=""></span>
					<span class="name">mouniya Kamali</span>
					<span class="desc">Amet odio neque nobis consequuntur consequatur a quae, impedit facere repellat voluptates.</span>
					<span class="time">Il ya 1 heure</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span class="avatar bg-success"><i class="fa fa-user"></i></span>
					<span class="name">Salima Chaybi</span>
					<span class="desc">Amet odio neque nobis consequuntur consequatur a quae, impedit facere repellat voluptates.</span>
					<span class="time">Il y a 1 jour</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span class="avatar"><img src="assets/images/avatar-5.jpg" alt=""></span>
					<span class="name">Firdawss Sami</span>
					<span class="desc">Amet odio neque nobis consequuntur consequatur a quae, impedit facere repellat voluptates.</span>
					<span class="time">il y a 1 an</span>
				</a>
			</li>
		</ul>
		<a href="#" class="notice-read-more">Voir plus de messages <i class="fa fa-angle-down"></i></a>
	</div>
</div>



<div id="wrapper">
	<div class="main-content">
		<div class="row small-spacing">
		<div class="prj-header margin-bottom-30">
		<ul class="filters">
				<li><a href="Gcollaborateur.jsp">Ajouter</a></li>
				<li><a class="active" href="collaborateurListe.jsp">List</a></li>
		</ul>
		<%
							CollaborateurServicesImpl collaService=new CollaborateurServicesImpl() ;
							Iterator<Collaborateur> list = collaService.listCollaborateur().iterator();
								while(list.hasNext())
								{
									Collaborateur colla=list.next(); 
								%>
		
			<div class="col-lg-6 col-md-6">
				<div class="box-contact">
					<img src="tmpfiles/<%=colla.getAvatar()%>" alt="" class="avatar">
					
					
					
					
					
					<h3 class="name margin-top-10"><%=colla.getPrenom()%> <%=colla.getNom() %></h3>
					<!-- /.name -->
					<h4 class="job"><%=colla.getPrivilige() %></h4>
					<!-- /.job -->
					<div class="text-muted">
						<p class="margin-bottom-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor error quibusdam officia amet dolores repellendus rem dolorum saepe!</p>
						<ul class="contact-social list-inline">
							<li><a href="#" data-toggle="tooltip" data-placement="top" title="<%=colla.getTelephone() %>" class="fa fa-phone"></a></li>
							<li><a href="#" data-toggle="tooltip" data-placement="top" title="<%=colla.getEmail() %>" class="fa fa-envelope"></a></li>
							<li><a href="https://<%=colla.getFacebook() %>" data-toggle="tooltip" data-placement="top" title="<%=colla.getFacebook() %>" class="fa fa-facebook"></a></li>
							<li><a href="http://<%=colla.getTwitter() %>" data-toggle="tooltip" data-placement="top" title="<%=colla.getTwitter() %>" class="fa fa-twitter"></a></li>
							<li><a href="https://<%=colla.getGoogleplus() %>" data-toggle="tooltip" data-placement="top" title="<%=colla.getGoogleplus() %>" class="fa fa-google-plus"></a></li>
						</ul>
					</div>
				</div>
				<!-- /.box-contact -->
			</div>
			<%}
			%>    
				<%
							ChefDeProjetServiceImpl cdp=new ChefDeProjetServiceImpl() ;
							Iterator<ChefDeProjet> list1 = cdp.listChefDeProjet().iterator();
								while(list1.hasNext())
								{
									ChefDeProjet colla1=list1.next(); 
								%>
		
			<div class="col-lg-6 col-md-6">
				<div class="box-contact">
					<img src="tmpfiles/<%=colla1.getAvatar()%>" alt="" class="avatar">
					
					
					
					
					
					<h3 class="name margin-top-10"><%=colla1.getPrenom()%> <%=colla1.getNom() %></h3>
					<!-- /.name -->
					<h4 class="job"><%=colla1.getPrivilige()  %></h4>
					<!-- /.job -->
					<div class="text-muted">
						<p class="margin-bottom-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor error quibusdam officia amet dolores repellendus rem dolorum saepe!</p>
						<ul class="contact-social list-inline">
							<li><a href="#" data-toggle="tooltip" data-placement="top" title="<%=colla1.getTelephone() %>" class="fa fa-phone"></a></li>
							<li><a href="#" data-toggle="tooltip" data-placement="top" title="<%=colla1.getEmail() %>" class="fa fa-envelope"></a></li>
							<li><a href="https://<%=colla1.getFacebook() %>" data-toggle="tooltip" data-placement="top" title="<%=colla1.getFacebook() %>" class="fa fa-facebook"></a></li>
							<li><a href="http://<%=colla1.getTwitter() %>" data-toggle="tooltip" data-placement="top" title="<%=colla1.getTwitter() %>" class="fa fa-twitter"></a></li>
							<li><a href="https://<%=colla1.getGoogleplus() %>" data-toggle="tooltip" data-placement="top" title="<%=colla1.getGoogleplus() %>" class="fa fa-google-plus"></a></li>
						</ul>
					</div>
				</div>
				<!-- /.box-contact -->
			</div>
			<%} %>    
		</div>
	</div>
</div>
</div>
<!--       -->

		<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="assets/plugin/waves/waves.min.js"></script>


	<script src="assets/plugin/dropify/js/dropify.min.js"></script>
	<script src="assets/scripts/fileUpload.demo.min.js"></script>

	<script src="assets/scripts/main.min.js"></script>
	<script src="assets/scripts/main.js"></script>


	
	
	
</body>
</html>