<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	
	<%@ page import="com.yoprojet.projet.dao.entite.Tache"%>
	<%@ page import="com.yoprojet.projet.services.TacheServiceImpl"%>
	
	<%@ page import="com.yoprojet.projet.dao.entite.Notification"%>
	<%@ page import="com.yoprojet.projet.services.NotificationServiceImpl"%>
	
	<%@ page import="java.util.*"%>
    
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="Expires" content="0" />
	 <!-- <META http-equiv="refresh" content="20; URL=adminAccueil.jsp">-->
	
	
	<title>Accueil - Espace Administrateur</title>
	<!-- Style principal -->
		<link rel="stylesheet" href="assets/styles/style.min.css">
	
	<!-- Material Design Icon -->
	<link rel="stylesheet" href="assets/fonts/material-design/css/materialdesignicons.css">
	<!-- mCustomScrollbar -->
	<link rel="stylesheet" href="assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.min.css">
	<!-- Waves Effect -->
	<link rel="stylesheet" href="assets/plugin/waves/waves.min.css">
	<!-- Sweet Alert -->
	<link rel="stylesheet" href="assets/plugin/sweet-alert/sweetalert.css">
	<!-- Morris Chart -->
	<link rel="stylesheet" href="assets/plugin/chart/morris/morris.css">
	<!-- FullCalendar -->
	<link rel="stylesheet" href="assets/plugin/fullcalendar/fullcalendar.min.css">
	<link rel="stylesheet" href="assets/plugin/fullcalendar/fullcalendar.print.css" media='print'>
		<!-- Dark Themes -->
	<link rel="stylesheet" href="assets/styles/style-dark.min.css">
</HEAD>
<body>
<%
Cookie[] cookies=request.getCookies();
boolean trouve=false;
String nom="";
String prenom="";
String privilige="";
String p="";
String email1="";
Long id;
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
		if(cookie.getName().equals("email1"))email1=cookie.getValue();
		if(cookie.getName().equals("id"))id=Long.parseLong(cookie.getValue());
		
	
	
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
		<a href="index.html" class="logo"><i class="ico mdi mdi-animation"></i> Espace Admin</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
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
			<h5 class="name"><a href="profile.html">${sessionScope.prenom} ${sessionScope.nom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile/profileAdmin.jsp"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="profile/parametre.jsp"><i class="fa fa-gear"></i> Paramètres</a></div>
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
					<a class="waves-effect" href="partenaire/organisations.jsp"><i class="menu-icon mdi mdi-account-circle">
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
					<a class="waves-effect" href="projetserv?type=messageadmin"><i class="menu-icon mdi mdi-email"></i>
					<span>Messageries</span></a>
				</li>
				<li>
					<a class="waves-effect " href="projetserv?type=notificationadmin">
					<i class="menu-icon mdi mdi-chart-areaspline"></i>
					<span>Mes Notifications</span></a>
				</li>
			</ul>
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
			<input type="search" placeholder="Rechercher..." class="input-search">
			<button class="mdi mdi-magnify button-search" type="submit"></button>
			</form>
		</div>
		<a href="#" class="ico-item mdi mdi-email notice-alarm js__toggle_open" data-target="#message-popup"></a>
		 <a href="deconnexion.jsp" class="ico-item mdi mdi-logout"></a> 
		<!--  	 <a href="deconnexion.jsp" class="ico-item mdi mdi-logout js__logout"></a>-->
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
		<a href="message/messageAdmin.jsp" class="notice-read-more">Voir plus de messages <i class="fa fa-angle-down"></i></a>
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
			<a href="partenaire/developpeursListe.jsp">
				<div class="box-content bg-success text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-group"></i>
						<p class="text text-white">Collaborateurs</p>
						<h2 class="counter"><%=nbrecolla %></h2>
					</div>
				</div>
			</a>
			</div>

			<div class="col-lg-4 col-xs-12">
				<a href="partenaire/ChefListe.jsp">				
				<div class="box-content bg-success text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-graduation-cap"></i>
						<p class="text text-white">Chef de projet</p>
						<h2 class="counter"><%=nbrechef %></h2>
					</div>
				</div>
				</a>	
			</div>
	
			<div class="col-lg-4 col-xs-12">
			<a href="partenaire/ClientListe.jsp">
				<div class="box-content bg-success text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-globe"></i>
						<p class="text text-white">Clients</p>
						<h2 class="counter"><%=nbreclt %></h2>
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
			<a href="projetserv?type=tousprojet">
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-folder"></i>
						<p class="text text-white">Tous les Projets</p>
						<%
						BesoinProjetServicesImpl met1= new BesoinProjetServicesImpl();
						List<BesoinProjet> nbp=met1.listBesoinProjet();
						int nbreprojet=0;
						for (BesoinProjet b : nbp) {
							nbreprojet++;
						} 
						%>
						<h2 class="counter"><%=nbreprojet %></h2>
					</div>
				</div>
			</a>
			</div>
				
	
			<div class="col-lg-4 col-xs-12">
				<a href="projetserv?type=active">				
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-folder-open"></i>
						<p class="text text-white">Projets activés</p>
												<%
							BesoinProjetServicesImpl met2= new BesoinProjetServicesImpl();
							List<BesoinProjet> nba=met2.listBesoinProjet();
							int nbreprojetactive=0;
							for (BesoinProjet b : nba) {
								if(b.getActive()==1){
									nbreprojetactive++;
								}
							} 
							%>
						<h2 class="counter"><%=nbreprojetactive %></h2>
					</div>
				</div>
				</a>	
			</div>
	
			<div class="col-lg-4 col-xs-12">
			<a href="projetserv?type=nonactive">
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-folder-o"></i>
						<p class="text text-white">Projets non activés</p>
						<%
							BesoinProjetServicesImpl met3= new BesoinProjetServicesImpl();
							long nbreprojetbloquer=met3.nbreactice();
							%>
						<h2 class="counter"><%=nbreprojetbloquer %></h2>
					</div>
				</div>
				</a>
			</div>
			</div></div></div>
		</div><br>
<!-- ------------------------------------ ligne 3 ---------------------------------->		
	<div class="row small-spacing">
	<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="box-content card danger">
					<div class="card-content">
					
			<div class="col-lg-4 col-xs-12">
			<a href="tache?status=all&type=admin">
				<div class="box-content bg-danger text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-database"></i>
						<p class="text text-white">Les Tâches des projets</p>
						<%
							TacheServiceImpl tache= new TacheServiceImpl();
							List<Tache> nbt=tache.listTache();
							int nbretache=0;
							for (Tache t : nbt) 
								nbretache++;
								%>
						<h2 class="counter"><%=nbretache %></h2>
					</div>
				</div>
			</a>
			</div>
				
	
			<div class="col-lg-4 col-xs-12">
				<a href="projetserv?type=messageadmin">				
				<div class="box-content bg-danger text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-envelope"></i>
						<p class="text text-white">Boite de Réception</p>

						<h2 class="counter">22</h2>
					</div>
				</div>
				</a>	
			</div>
	
			<div class="col-lg-4 col-xs-12">
			<a href="projetserv?type=notificationadmin">
				<div class="box-content bg-danger text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-commenting"></i>
						<p class="text text-white">Notifications</p>
						<%
						NotificationServiceImpl notification= new NotificationServiceImpl();
						List<Notification> nbtn=notification.listNotification();
						int nbrenoti=0;
						for (Notification t : nbtn) 
						nbrenoti++;
						%>
						<h2 class="counter"><%=nbrenoti %></h2>
					</div>
				</div>
				</a>
			</div>
			</div></div></div>
		</div>		
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