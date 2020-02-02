<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
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
	
	<title>Accueil - Espace Administrateur</title>
	<!-- Style principal -->
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

		<!-- Data Tables -->
		<link rel="stylesheet" href="../assets/plugin/datatables/media/css/dataTables.bootstrap.min.css">
		<link rel="stylesheet" href="../assets/plugin/datatables/extensions/Responsive/css/responsive.bootstrap.min.css">

		<!-- Dark Themes -->
		<link rel="stylesheet" href="../assets/styles/style-dark.min.css">
		
</head>
<body>
<div class="main-menu">
	<header class="header">
		<a href="../index.html" class="logo"><i class="ico mdi mdi-animation"></i> Admin</a>
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
			<h5 class="name"><a href="../profile.html">${sessionScope.prenom} ${sessionScope.nom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="../profile.html"><i class="fa fa-user"></i> Profil</a></div>
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
		<h1 class="page-title">Liste des projets</h1>
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
				<div class="col-xs-12">
					<div class="box-content">
						<h4 class="box-title">Liste des projets</h4>
						<table id="example" class="table table-striped table-bordered display" style="width:100%">
							<thead>
								<tr>
									<th>Nom Court</th>
									<th>Nom Complet</th>
									<th>Description</th>
									<th>#ID Client</th>
									<th>Etat</th>
									<th>Détail</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Nom Court</th>
									<th>Nom Complet</th>
									<th>Description</th>
									
									<th>#ID Client</th>
									<th>Etat</th>
									<th>Détail</th>
									
								</tr>
							</tfoot>
							<tbody>
							<c:forEach var="user" items="${sessionScope.listeprojet}">
                			<tr>
                			<td><c:out value="${user.getNomCourt()}" /></td>
		                    <td><c:out value="${user.getNomComplet()}" /></td>
		                    <td><c:out value="${user.getDescription()}" /></td>
		                    <td style="text-align:center;"><c:out value="${user.getIdClient()}" /></td>
							<c:if test="${user.getActive()==0 }">
			                    <td style="color:red;">#En attente#</td>
			                    <td><a href="../projetserv?id=<c:out value="${user.getId()}" />&type=suivre" style="color:black;" class="btn btn-success ">Activé</a></td>
		                    </c:if>
		                    <c:if test="${user.getActive()==1 }">
			                    <td style="color:green;">#Active#</td>
			                     <td><a href="../projetserv?id=<c:out value="${user.getId()}" />&idclient=<c:out value="${user.getIdClient()}" />&idchef=<c:out value="${user.getIdChef()}" />&type=suivre" style="color:black;" class="btn btn-info">Suivre</a></td>
		                    </c:if>
                			</tr>
                			</c:forEach>
			
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../assets/scripts/jquery.min.js"></script>
		<script src="../ssets/scripts/modernizr.min.js"></script>
		<script src="../assets/plugin/bootstrap/js/bootstrap.min.js"></script>
		<script src="../assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="../assets/plugin/nprogress/nprogress.js"></script>
		<script src="../assets/plugin/sweet-alert/sweetalert.min.js"></script>
		<script src="../assets/plugin/waves/waves.min.js"></script>

		<!-- Data Tables -->
		<script src="../assets/plugin/datatables/media/js/jquery.dataTables.min.js"></script>
		<script src="../assets/plugin/datatables/media/js/dataTables.bootstrap.min.js"></script>
		<script src="../assets/plugin/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
		<script src="../assets/plugin/datatables/extensions/Responsive/js/responsive.bootstrap.min.js"></script>
		<script src="../assets/scripts/datatables.demo.min.js"></script>

		<script src="../assets/scripts/main.min.js"></script>
		<script src="../assets/scripts/main.js"></script>


</body>
</html>