<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.ChefDeProjet"%>
	<%@ page import="com.yoprojet.projet.services.ChefDeProjetServiceImpl"%>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
	<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
	<%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
	<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
	
	<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Accueil - Espace Chef de projet</title>

		<link rel="stylesheet" href="../assets/styles/style.min.css">
	
	<!-- Material Design Icon -->
	<link rel="stylesheet" href="../assets/fonts/material-design/css/materialdesignicons.css">

	<!-- mCustomScrollbar -->
	<link rel="stylesheet" href="../assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="../assets/plugin/waves/waves.min.css">

	<!-- Sweet Alert -->
	<link rel="stylesheet" href="../assets/plugin/sweet-alert/sweetalert.css">
	
	<!-- Morris Chart -->
	<link rel="stylesheet" href="../assets/plugin/chart/morris/morris.css">

	<!-- FullCalendar -->
	<link rel="stylesheet" href="../assets/plugin/fullcalendar/fullcalendar.min.css">
	<link rel="stylesheet" href="../assets/plugin/fullcalendar/fullcalendar.print.css" media='print'>

	<!-- Dark Themes -->
	<link rel="stylesheet" href="../assets/styles/style-dark.min.css">
</head>
<body>
<%
Cookie[] cookies=request.getCookies();
boolean trouve=false;
String nom="";
String prenom="";
String privilige="";
String p="/page-login.jsp";
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
<%
if(trouve==false)
{
response.sendRedirect(request.getContextPath() + "/page-login.jsp");
}
%>
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
<c:if test="${sessionScope.privilige!='Chef de projet'}">
<%
response.sendRedirect(request.getContextPath() +p);
System.out.println(p);
%>
</c:if>

<div class="main-menu">

	<header class="header">
		<a href="../ChefAccueil.jsp" class="logo"><i class="ico mdi mdi-animation"></i>Espace Chef de projet</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="../avatarUpdate/updateAvatarChef.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			ChefDeProjetServiceImpl adm=new ChefDeProjetServiceImpl() ;
			ChefDeProjet chef=adm.unique(email);
			String chemin="tmpfiles/"+chef.getAvatar();
			if(chef.getAvatar().equals("vide"))	
			{
			%>
			<img src="../assets/images/avatar-1.jpg"/>
			<%
			}else{
				%>
				<img src="../<%=chemin %>"/>
				<% 
				}
			%>
			<span class="status online"></span></a>
			<h5 class="name"><a href="#">${sessionScope.prenom} ${sessionScope.nom}</a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="../profile/profilechef.jsp"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> Paramètres</a></div>
					<div class="control-item"><a href="../deconnexion.jsp"><i class="fa fa-sign-out"></i> Se déconnecter</a></div>
				</div>
			</div>
		</div>
	</header>
	
	<div class="content">
		<div class="navigation">
	
			<h5 class="title">Navigation</h5>
			<ul class="menu js__accordion">
			
				<li>
					<a class="waves-effect" href="../ChefAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
			</ul>
			<!-- Fin onglet 1 -->
		
		<!-- Titre 1 -->
			<h5 class="title">Projets</h5>
			<ul class="menu js__accordion">
			<!-- La gestion de projets -->
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-cube-outline">
					</i><span>Admin UI</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="#">Gestion de Projet</a></li>
						<li><a href="#">Getion des Tâches</a></li>
						<li><a href="#">Situation financière</a></li>
					</ul>
				</li>
			</ul>
			

			<!-- debut obglet 2 -->
			<!-- Titre 2 -->
			
			
			
			<!-- Fin Onglet 4 -->
			
			
			<!-- debut obglet 3 -->
			<!-- Titre 3 -->
			<h5 class="title">Réseaux</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="../partenaire/co-equipier.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
					<span>Co-équipier</span></a>
				</li>
			</ul>
			<!-- Fin Onglet 3 -->
			<!-- debut obglet 4 -->
			<!-- Titre 4 -->
			<h5 class="title">Contact</h5>
			<ul class="menu js__accordion">
							<!-- les newsletters --> 
				<li>
					<a class="waves-effect" href="../message/messageChef.jsp"><i class="menu-icon mdi mdi-email"></i>
					<span>Mail</span></a>
				</li>
			</ul>
			<!-- Fin Onglet 4 -->
		</div>
	</div>
</div>

<!-- /.main-menu -->
<div class="fixed-navbar">
	
	<div class="pull-left">
		<button type="button" class="menu-mobile-button glyphicon glyphicon-menu-hamburger js__menu_mobile"></button>
		<h1 class="page-title">Accueil</h1>
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
		<a href="../deconnexion.jsp" class="ico-item mdi mdi-logout"></a>
	</div>
</div>
<!-- /.fixed-navbar -->



<!-- /#notification-popup -->
<div id="message-popup" class="notice-popup js__toggle" data-space="75">
	<h2 class="popup-title">MESSAGES RÉCENTS<a href="#" class="pull-right text-danger">Nouveau message</a></h2>
	<div class="content">
		<ul class="notice-list">
			<li>
				<a href="#">
					<span class="avatar"><img src="../assets/images/avatar-2.jpg" alt=""></span>
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
				<div class="col-xs-12">
					<div class="box-content">
						<h4 class="box-title">Liste des tâche par Projet</h4>
						<table id="example" class="table table-striped table-bordered display" style="width:100%">
							<thead>
								<tr>
									<th>Libelle</th>
									<th>Date debut</th>
									<th>Date Fin</th>
									<th>ID Collaborateur</th>
									<th>ID Projet</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Libelle</th>
									<th>Date debut</th>
									<th>Date Fin</th>
									<th>ID Collaborateur</th>
									<th>ID Projet</th>
									
								</tr>
							</tfoot>
							<tbody>
							<c:forEach var="projet" items="${sessionScope.listeProjetChef }">
							<c:if test="${projet.getIdChef()==sessionScope.id}"> 
								<tr style="background: gray;color:#FFF"> 
								<td colspan="5" style="font-size:16pt">#${projet.getId()}- ${projet.getNomCourt()  }</td>
								</tr>
								<c:forEach var="tache" items="${sessionScope.listetache}">
								<c:if test="${tache.getIdChef()==sessionScope.id && tache.getIdProjet()==projet.getId()}">
		                			<tr style="background: #cecece;font-weight:bold;color:#000">
		                			<td  ><c:out value="${tache.getLibelle() }" /></td>
				                    <td ><c:out value="${tache.getDateD()}" /></td>
				                    <td ><c:out value="${tache.getDateF()}" /></td>
				                    <td ><c:out value="${tache.getIdCollaborateur()}" /></td>
				                    <td ><c:out value="${projet.getNomCourt()}" /></td>
		                			</tr>
	                			</c:if>
	                			</c:forEach>
	                		</c:if>	
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</div>
	<script src="../assets/scripts/jquery.min.js"></script>
	<script src="../assets/scripts/modernizr.min.js"></script>
	<scrizpt src="../assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="../assets/plugin/nprogress/nprogress.js"></script>
	<script src="../assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="../assets/scripts/main.min.js"></script>	
	<script src="../assets/scripts/main.js"></script>
	
	
</body>
</html>