	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Accueil - Espace Collaborateur</title>
	<link rel="stylesheet" href="../assets/styles/style.min.css">
	<!-- Alert -->
	<link rel="stylesheet" href="../assets/plugin/sweet-alert/sweetalert.css">
	<!-- Icon -->
	<link rel="stylesheet" href="../assets/fonts/material-design/css/materialdesignicons.css">
		<!-- Dark Themes -->
	<link rel="stylesheet" href="../assets/styles/style-dark.min.css">
	<!-- Fontello Icon -->
	<link rel="stylesheet" href="../assets/fonts/fontello/fontello.css">

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
		
		
		
		
		if(cookie.getName().equals("privilige")) 
			privilige=cookie.getValue();
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
		 
		 
<c:if test="${sessionScope.privilige!='Collaborateur'}">
<%
response.sendRedirect(request.getContextPath() +p);
%>
</c:if>
<div class="main-menu">
	<header class="header">
		<a href="../CollaborateurAccueil.jsp" class="logo"><i class="ico mdi mdi-animation"></i>Espace Collaborateur</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="../avatarUpdate/updateAvatarColla.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			CollaborateurServicesImpl adm=new CollaborateurServicesImpl() ;
			Collaborateur col=adm.unique(email);
			String chemin="tmpfiles/"+col.getAvatar();
			if(col.getAvatar().equals("vide"))	
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
			<h5 class="name"><a href="profile.html">${sessionScope.prenom} ${sessionScope.prenom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile/profileCollaborateur.jsp"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> Param�tres</a></div>
					<div class="control-item"><a href="../deconnexion.jsp"><i class="fa fa-sign-out"></i> Se d�connecter</a></div>
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
					<a class="waves-effect" href="../CollaborateurAccueil.jsp">
					<i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				
			</ul>
			<!-- Fin onglet 1 -->
		
		<!-- Titre 1 -->
			<h5 class="title">T�ches</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect " href="../tache?status=nouveau&type=collaborateur">
					<i class="menu-icon mdi mdi-folder-outline"></i>
					<span>Nouveau T�ches</span></a>
				</li>
				<li>
					<a class="waves-effect " href="../tache?status=en cours&type=collaborateur">
					<i class="menu-icon mdi mdi-folder-move"></i>
					<span>En cours</span></a>
				</li>
				<li>
					<a class="waves-effect " href="../tache?status=termine&type=collaborateur">
					<i class="menu-icon mdi mdi-folder"></i>
					<span>Termin�</span></a>
				</li>
				<li>
					<a class="waves-effect " href="#">
					<i class="menu-icon mdi mdi-folder-multiple-image"></i>
					<span>Suivi T�ches</span></a>
				</li>
				<li>
					<a class="waves-effect " href="#">
					<i class="menu-icon mdi mdi-chart-pie"></i>
					<span>Situation financi�re</span></a>
				</li>
			</ul>

			<!-- debut obglet 4 -->
			<!-- Titre 4 -->
			<h5 class="title">Contacts</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="../message/messageCollaborateur.jsp">
					<i class="menu-icon mdi mdi-email"></i>
					<span>Messageries</span></a>
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
		<h1 class="page-title">Tableau de bord</h1>
	</div>
	
	<div class="pull-right">
		
		<div class="ico-item">
			<a href="#" class="ico-item mdi mdi-magnify js__toggle_open" data-target="#searchform-header"></a>
			<form action="#" id="searchform-header" class="searchform js__toggle">
			<input type="search" placeholder="rechercher..." class="input-search">
			<button class="mdi mdi-magnify button-search" type="submit"></button></form>
		</div>
		
		<a href="#" class="ico-item mdi mdi-email notice-alarm js__toggle_open" data-target="#message-popup"></a>

		<a href="../deconnexion.jsp" class="ico-item mdi mdi-logout"></a>
	</div>
</div>
<!-- /.fixed-navbar -->

<!-- /#notification-popup -->
<div id="message-popup" class="notice-popup js__toggle" data-space="75">
	<h2 class="popup-title">MESSAGES R�CENTS<a href="#" class="pull-right text-danger">Nouveau message</a></h2>
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
				<div class="col-xs-12">
					<div class="box-content">
						<h4 class="box-title">Liste des t�che par Projet</h4>
						<table id="example" class="table table-striped table-bordered display" style="width:100%">
							<thead>
								<tr>
									<th>Libelle</th>
									<th>Date debut</th>
									<th>Date Fin</th>
									<th>ID Chef</th>
									<th>ID Projet</th>
									<th>Status</th>
									<th>Operations</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Libelle</th>
									<th>Date debut</th>
									<th>Date Fin</th>
									<th>ID Chef</th>
									<th>ID Projet</th>
									<th>Status</th>
									<th>Operations</th>
									
								</tr>
							</tfoot>
							<tbody>
							<c:forEach var="projet" items="${sessionScope.listeProjetChef}">
								<c:forEach var="tache" items="${sessionScope.listetache}">
								<c:if test="${tache.getIdCollaborateur()==sessionScope.id && tache.getIdProjet()==projet.getId()}">
		                			<tr style="background: #cecece;font-weight:bold;color:#000">
		                			<td  ><c:out value="${tache.getLibelle() }" /></td>
				                    <td ><c:out value="${tache.getDateD()}" /></td>
				                    <td ><c:out value="${tache.getDateF()}" /></td>
				                    <td ><c:out value="${tache.getIdChef()}" /></td>
				                    <td ><c:out value="${projet.getNomCourt()}" /></td>
				                     <td ><c:out value="${tache.getStatus()}" /></td>
				                     <td width="150px"><span style="font-size:20pt;text-align:center">
				                     <a href="../tache?status=update&id=<c:out value='${tache.getIdTache()}'/>&choix=0"> <i class="ico icon-doc-new"></i></a> 
				                     <a href="../tache?status=update&id=<c:out value='${tache.getIdTache()}'/>&choix=1"> <i class="ico icon-edit"></i></a> 
				                     <a href="../tache?status=update&id=<c:out value='${tache.getIdTache()}'/>&choix=2"> <i class="ico icon-to-end"></i></a> 
				                     </span>
				                     </td>
		                			</tr>
		                		
	                			</c:if>
	                			</c:forEach>
	                			
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
	<script src="../assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="../assets/plugin/nprogress/nprogress.js"></script>
	<script src="../assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="../assets/scripts/main.min.js"></script>
	<script src="../assets/scripts/main.js"></script>
	
	
	
</body>
</html>