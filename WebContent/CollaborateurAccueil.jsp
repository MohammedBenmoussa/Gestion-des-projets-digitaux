	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
	<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
	
	<%@ page import="com.yoprojet.projet.dao.entite.Tache"%>
	<%@ page import="com.yoprojet.projet.services.TacheServiceImpl"%>
	
	<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Accueil - Espace Collaborateur</title>
	<link rel="stylesheet" href="assets/styles/style.min.css">
	<!-- Alert -->
	<link rel="stylesheet" href="assets/plugin/sweet-alert/sweetalert.css">
	<!-- Icon -->
	<link rel="stylesheet" href="assets/fonts/material-design/css/materialdesignicons.css">
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
		 
		 
<c:if test="${sessionScope.privilige!='Collaborateur'}">
<c:redirect url="<%=p %>"/>
</c:if>
<div class="main-menu">
	<header class="header">
		<a href="CollaborateurAccueil.jsp" class="logo"><i class="ico mdi mdi-animation"></i>Espace Collaborateur</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="avatarUpdate/updateAvatarColla.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			CollaborateurServicesImpl adm=new CollaborateurServicesImpl() ;
			Collaborateur col=adm.unique(email);
			String chemin="tmpfiles/"+col.getAvatar();
			if(col.getAvatar().equals("vide"))	
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
			<h5 class="name"><a href="profile.html">${sessionScope.prenom} ${sessionScope.prenom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile/profileCollaborateur.jsp"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> Paramètres</a></div>
					<div class="control-item"><a href="deconnexion.jsp"><i class="fa fa-sign-out"></i> Se déconnecter</a></div>
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
					<a class="waves-effect" href="CollaborateurAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				
			</ul>
			<!-- Fin onglet 1 -->
		
		<!-- Titre 1 -->
			<h5 class="title">Tâches</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect " href="tache?status=nouveau&type=collaborateur">
					<i class="menu-icon mdi mdi-folder-outline"></i>
					<span>Nouveau Tâches</span></a>
				</li>
				<li>
					<a class="waves-effect " href="tache?status=pending&type=collaborateur">
					<i class="menu-icon mdi mdi-folder-move"></i>
					<span>En cours</span></a>
				</li>
				<li>
					<a class="waves-effect " href="tache?status=termine&type=collaborateur">
					<i class="menu-icon mdi mdi-folder"></i>
					<span>Terminé</span></a>
				</li>
				<li>
					<a class="waves-effect " href="#">
					<i class="menu-icon mdi mdi-folder-multiple-image"></i>
					<span>Suivi Tâches</span></a>
				</li>
				<li>
					<a class="waves-effect " href="#">
					<i class="menu-icon mdi mdi-chart-pie"></i>
					<span>Situation financière</span></a>
				</li>
			</ul>

			<!-- debut obglet 4 -->
			<!-- Titre 4 -->
			<h5 class="title">Contacts</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="projetserv?type=messageCollaborateur"><i class="menu-icon mdi mdi-email"></i>
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

		<a href="deconnexion.jsp" class="ico-item mdi mdi-logout"></a>
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
<br>
<div class="row small-spacing">
	
	<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="box-content card danger">
					<div class="card-content">


			<div class="col-lg-4 col-xs-12">
			<a href="tache?status=nouveau&type=collaborateur">
				<div class="box-content bg-success text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-folder-o"></i>
						<p class="text text-white">Nouveaux Tâches</p>
						<%
							long id =(Long)session.getAttribute("id");
							TacheServiceImpl tache1= new TacheServiceImpl();
							List<Tache> nbt1=tache1.listTache();
							int nbretache1=0;
							for (Tache t : nbt1) 
								if(t.getStatus().equalsIgnoreCase("nouveau") && t.getIdCollaborateur()==id )
								nbretache1++;
								%>
						<h2 class="counter"><%=nbretache1 %></h2>
						
					</div>
				</div>
			</a>
			</div>

			<div class="col-lg-4 col-xs-12">
				<a href="tache?status=en cours&type=collaborateur">				
				<div class="box-content bg-success text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-folder-open"></i>
						<p class="text text-white">Tâche En cours</p>
						<%
							TacheServiceImpl tache2= new TacheServiceImpl();
							List<Tache> nbt2=tache2.listTache();
							int nbretache2=0;
							for (Tache t : nbt2) 
								if(t.getStatus().equalsIgnoreCase("en cours")&& t.getIdCollaborateur()==id)
								nbretache2++;
								%>
						<h2 class="counter"><%=nbretache2 %></h2>
					</div>
				</div>
				</a>	
			</div>
	
			<div class="col-lg-4 col-xs-12">
			<a href="tache?status=termine&type=collaborateur">
				<div class="box-content bg-success text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-folder"></i>
						<p class="text text-white">Tâches Terminés</p>
						<%
							TacheServiceImpl tache3= new TacheServiceImpl();
							List<Tache> nbt3=tache3.listTache();
							int nbretache3=0;
							for (Tache t : nbt3) 
								if(t.getStatus().equalsIgnoreCase("termine")&& t.getIdCollaborateur()==id)
								nbretache3++;
								%>
						<h2 class="counter"><%=nbretache3 %></h2>
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>
</div>
</div>
<br>
<!-- ------------------------------------ ligne 2 ---------------------------------->
	<div class="row small-spacing">
	<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="box-content card danger">

					<div class="card-content">
					
			<div class="col-lg-4 col-xs-12">
			<a href="#">
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-folder-open-o"></i>
						<p class="text text-white">Suivi Tâches</p>
						
						<h2 class="counter">44</h2>
					</div>
				</div>
			</a>
			</div>
				
	
			<div class="col-lg-4 col-xs-12">
				<a href="#">				
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-pie-chart"></i>
						<p class="text text-white">Etats financiers</p>
											
						<h2 class="counter">55</h2>
					</div>
				</div>
				</a>	
			</div>
	
			<div class="col-lg-4 col-xs-12">
			<a href="projetserv?type=messageCollaborateur">
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-envelope"></i>
						<p class="text text-white">Messagerie</p>
						
						<h2 class="counter">66</h2>
					</div>
				</div>
				</a>
			</div>
			</div></div></div>
		</div><br>
	</div>
</div>



	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="assets/scripts/main.min.js"></script>
	<script src="assets/scripts/main.js"></script>
	
	
</body>
</html>