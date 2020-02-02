<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
	<%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
	<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>

	<%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
	<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
	
	<%@ page import="com.yoprojet.projet.dao.entite.ChefDeProjet"%>
	<%@ page import="com.yoprojet.projet.services.ChefDeProjetServiceImpl"%>
	
	<%@ page import="com.yoprojet.projet.dao.entite.Client"%>
	<%@ page import="com.yoprojet.projet.services.ClientServicesImpl"%>
	
	<%@ page import="com.yoprojet.projet.dao.entite.Admin"%>
	<%@ page import="com.yoprojet.projet.services.AdminServiceImpl"%>
	<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Profile - My Admin Template</title>

	<!-- Main Styles -->
	<link rel="stylesheet" href="../assets/styles/style.min.css">
	
	<!-- Material Design Icon -->
	<link rel="stylesheet" href="../assets/fonts/material-design/css/materialdesignicons.css">

	<!-- mCustomScrollbar -->
	<link rel="stylesheet" href="../assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="../assets/plugin/waves/waves.min.css">

	<!-- Sweet Alert -->
	<link rel="stylesheet" href="../assets/plugin/sweet-alert/sweetalert.css">
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
String p="";
String actualiser="";
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
		if(cookie.getName().equals("actualiser")) actualiser=cookie.getValue();
		
	
		if(cookie.getName().equals("privilige")) privilige=cookie.getValue();
		if(privilige.equalsIgnoreCase("administrateur"))p="/adminAccueil.jsp";
		if(privilige.equalsIgnoreCase("collaborateur"))p="/CollaborateurAccueil.jsp";
		if(privilige.equalsIgnoreCase("Chef de projet"))p="/ChefAccueil.jsp";
		if(privilige.equalsIgnoreCase("client"))p="/clientAccueil.jsp";

	}
}
%>
<%
if(actualiser.equalsIgnoreCase("1"))
{
%>
 
<script>
window.onload = function() {
 setTimeout(function(){ location.reload(true); }, 1000);
}
    
</script>

<%} %>


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

<c:if test="${sessionScope.privilige!='administrateur'}">
<%
response.sendRedirect(request.getContextPath() +p);
%>
</c:if>

<%
	CollaborateurServicesImpl collaService=new CollaborateurServicesImpl() ;
	List<Collaborateur> list = collaService.listCollaborateur();
	int nbrecolla=0;
	for (Collaborateur c : list) {
		nbrecolla++;
	}

%>
<%
	ChefDeProjetServiceImpl cdp=new ChefDeProjetServiceImpl() ;
	List<ChefDeProjet> list1 = cdp.listChefDeProjet();
	int nbrechef=0;
	for (ChefDeProjet c : list1) {
		nbrechef++;
	}
	
%>

<%
	ClientServicesImpl clt=new ClientServicesImpl() ;
	List<Client> listClt = clt.listClient();
	int nbreclt=0;
	for (Client c : listClt) {
	nbreclt++;
	}
%>
<div class="main-menu">
<div class="preloader"></div>
	<header class="header">
		<a href="index.html" class="logo"><i class="ico mdi mdi-animation"></i> Admin</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="../avatarUpdate/updateAvatar.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			AdminServiceImpl adm=new AdminServiceImpl() ;
			Admin admin=adm.unique(email);
			String chemin="tmpfiles/"+admin.getAvatar();
			if(admin.getAvatar().equals("vide"))
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
			<h5 class="name"><a href="profile.html">${sessionScope.prenom} ${sessionScope.nom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile/profileAdmin.jsp"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> Paramètres</a></div>
					<div class="control-item"><a href="../deconnexion.jsp"><i class="fa fa-sign-out"></i> Se déconnecter</a></div>
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
					<a class="waves-effect" href="../adminAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
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
						<li><a href="../projet/projetListe.jsp">Gestion de projet</a></li>
						<li><a href="../projet/projetactiveListe.jsp">Suivi de projet</a></li>
						<li><a href="../projet/finance.jsp">Situation financière</a></li>

					</ul>
				</li>

					<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-account-settings-variant">
					</i><span>Service</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="../projet/metier.jsp?type=dev">Developpement</a></li>
						<li><a href="../projet/metier.jsp?type=design">Design</a></li>
						<li><a href="../projet/metier.jsp?type=marketing">Web marketing</a></li>
						<li><a href="../projet/metier.jsp?type=maintanance">Maintanance</a></li>
						<li><a href="../projet/metier.jsp?type=cms">CMS</a></li>
						<li><a href="../projet/metier.jsp?type=securite">Web Sécurité</a></li>


					</ul>
				</li>
			</ul>
			<h5 class="title">Client</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="../patenaire/organisations.jsp"><i class="menu-icon mdi mdi-account-circle">
					</i><span>Entreprises</span></a>
				</li>
				<li>
					<a class="waves-effect" href="../partenaire/particuliers.jsp"><i class="menu-icon mdi mdi-account-circle">
					</i><span>particuliers</span></a>
				</li>
			</ul>

			<h5 class="title">Réseaux</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="../Gcollaborateur.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
					<span>Ajouter Co-équipier</span></a>
				</li>
				<li>
					<a class="waves-effect" href="../partenaire/developpeursListe.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
					<span>Collaborateurs</span></a>
				</li>
				<li>
					<a class="waves-effect" href="../partenaire/ChefListe.jsp"><i class="menu-icon mdi mdi-arrow-compress-all"></i>
					<span>Chef de projet</span></a>
				</li>
			</ul>
			<h5 class="title">Contacts</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="../message/messageAdmin.jsp"><i class="menu-icon mdi mdi-email"></i>
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
			<div class="col-md-3 col-xs-12">
				<div class="box-content bordered primary margin-bottom-20">
					<div class="profile-avatar">
						<%
						if(admin.getAvatar().equals("vide"))
						{
						%>
						<img src="../assets/images/avatar-1.jpg" width="20%" height="20%"/>
						<%
						}else{
							%>
							<img src="../<%=chemin %>" width="200%" height="200%"/>
							<% 
							}
						%>
						<a href="../adminAccueil.jsp" class="btn btn-block btn-friend"><i class="fa fa-check-circle"></i> Administrateur</a>
						<a href="#" class="btn btn-block btn-inbox"><i class="fa fa-envelope"></i> Mes Messages</a>
						<h3><strong>${sessionScope.prenom} ${sessionScope.nom} </strong></h3>
						<h4>Owner at Our Company, Inc.</h4>
						<p>Ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia 
						consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
					</div>
				</div>
			</div>
			
			<!-- /.col-md-3 col-xs-12 -->
			<div class="col-md-9 col-xs-12">
				<div class="row">
					<div class="col-xs-12">
						<div class="box-content card">
							<h4 class="box-title"><i class="fa fa-user ico"></i>Information personnelle</h4>
			
							<div class="card-content">
								<div class="row">
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Prenom:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">${sessionScope.prenom}</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Nom:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">${sessionScope.nom}</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Type:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">${sessionScope.privilige}</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Email:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">${sessionScope.email1}</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Ville:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">Los Angeles</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Pays:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">United States</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Date naissance:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">Jan 22, 1984</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Telephone:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7">+1-234-5678</div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.card-content -->
						</div>
						<!-- /.box-content card -->
					</div>
					<!-- /.col-md-12 -->
					<div class="col-md-6 col-xs-12">
						<div class="box-content card">
							<h4 class="box-title"><i class="fa fa-file-text ico"></i> Expériences</h4>
							<div class="card-content">
								<ul class="dot-list">
									<li><a href="#">Owner</a> at <a href="#">NinjaTeam</a>.<span class="date">March 2013 ~ Now</span></li>
								</ul>
							</div>
							<!-- /.card-content -->
						</div>
						<!-- /.box-content card -->
					</div>
					<!-- /.col-md-6 -->
					<div class="col-md-6 col-xs-12">
						<div class="box-content card">
							<h4 class="box-title"><i class="fa fa-trophy ico"></i> Education</h4>
							<div class="card-content">
								<ul class="dot-list">
									<li><a href="#">Students</a> at <a href="#">CEO Education</a>.<span class="date">March 2013 ~ Now</span></li>
								</ul>
							</div>
							<!-- /.card-content -->
						</div>
						<!-- /.box-content card -->
					</div>
					<!-- /.col-md-6 -->
				</div>
			</div>
			<!-- /.col-md-9 col-xs-12 -->
		</div>
	</div>
</div>
	<script src="../assets/scripts/jquery.min.js"></script>
	<script src="../assets/scripts/modernizr.min.js"></script>
	<script src="../assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="../assets/plugin/nprogress/nprogress.js"></script>
	<script src="../assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="../assets/plugin/waves/waves.min.js"></script>

	<script src="../assets/scripts/main.min.js"></script>
	<script src="../assets/scripts/main.js"></script>
</body>
</html>