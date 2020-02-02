<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.ChefDeProjet"%>
<%@ page import="com.yoprojet.projet.services.ChefDeProjetServiceImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.Admin"%>
<%@ page import="com.yoprojet.projet.services.AdminServiceImpl"%>
<%@ page import="java.util.Iterator"%>
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
			<a href="#" class="avatar">
					<%
			HttpSession session1 = request.getSession();
			AdminServiceImpl adm=new AdminServiceImpl() ;
			Admin admin=adm.unique("admin@gmail.com");
			String chemin="../tmpfiles/"+admin.getAvatar();
			if(!admin.getAvatar().equals(""))
			{
			%>
			<img src="<%=chemin %>"/>
			<%
			}else{
				%>
				<img src="assets/images/avatar-1.jpg"/>
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
					<a class="waves-effect" href="../adminAccueil.jsp">
					<i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				<!-- LEs nouvelles de nous -->
				<li>
					<a class="waves-effect parent-item js__control" href="#">
					<i class="menu-icon mdi mdi-desktop-mac">
					</i><span>User Interface</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="#">Nouvelle</a></li>
						<li><a href="#">Feedbacks</a></li>
					</ul>
				</li>
				<!-- le feedbacks sur nos produit et services -->

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
						<li><a href="#">Gestion de projet</a></li>
						<li><a href="#">Suivi de projet</a></li>
						<li><a href="#">Situation financière</a></li>

					</ul>
				</li>

					<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-account-settings-variant">
					</i><span>Service</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="#">Developpement</a></li>
						<li><a href="#">CMS</a></li>
						<li><a href="#">Web marketing</a></li>
						<li><a href="#">Gestion de contenu</a></li>
						<li><a href="#">Web marketing</a></li>
						<li><a href="#">Design</a></li>
						<li><a href="#">Maintenance</a></li>


					</ul>
				</li>
			</ul>

			<!-- debut obglet 2 -->
			<!-- Titre 2 -->
			
			
			<h5 class="title">Client</h5>
			<ul class="menu js__accordion">
							<!-- les newsletters --> 
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-bank"></i>
					<span>Organisations</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="#">Public</a></li>
						<li><a href="#">Privé</a></li>
					</ul>
				</li>
				
				<li>
					<a class="waves-effect" href="#"><i class="menu-icon mdi mdi-account-circle">
					</i><span>particuliers</span></a>
				</li>
			</ul>
			<!-- Fin Onglet 4 -->
			
			
			<!-- debut obglet 3 -->
			<!-- Titre 3 -->
			<h5 class="title">Communauté</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="../Gcollaborateur.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
					<span>Collaborateurs Interne</span></a>
				</li>
				<li>
					<a class="waves-effect" href="index1.html"><i class="menu-icon mdi mdi-arrow-compress-all"></i>
					<span>Freelancers</span></a>
				</li>
				<li>
					<a class="waves-effect" href="index1.html"><i class="menu-icon mdi mdi-link-variant"></i>
					<span>Partenaires</span></a>
				</li>
			
				
			</ul>
			<!-- Fin Onglet 3 -->
			<!-- debut obglet 4 -->
			<!-- Titre 4 -->
			<h5 class="title">Contact</h5>
			<ul class="menu js__accordion">
							<!-- les newsletters --> 
				<li>
					<a class="waves-effect" href="index1.html"><i class="menu-icon mdi mdi-email"></i>
					<span>Mail</span></a>
				</li>
				<li>
					<a class="waves-effect" href="extras-contact.html"><i class="menu-icon mdi mdi-account-card-details"></i>
					<span>Contact list</span></a>
				</li>
				<li>
					<a class="waves-effect" href="index1.html"><i class="menu-icon mdi mdi-calendar"></i>
					<span>Calendrier</span></a>
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
	<div class="prj-header margin-bottom-30">
		<ul class="filters">
				<li><a class="active" href="#">Accueil</a></li>
				
		</ul>
		
<div class="col-xs-12">
<br>
<br>
<br>
<br>
<div class="box-content card white">

<h4 class="box-title" style="text-align: center;">Affecter Chef de projet a un projet digital</h4>
					<!-- /.box-title -->
<div class="card-content">
<form action="../projetserv" method="post">
<!-- Debut valider les champs -->
<%
String modele;
if(request.getAttribute("modele")!=null)
{
modele=request.getAttribute("modele").toString();
}
else
{
modele="";
}
%>
<%
if(request.getAttribute("modele")!=null)
{%>
<div class="alert alert-success alert-dismissible">
<button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong><%=modele %></strong> 
</div>
<%
}
%>
<%
String erreur;
if(request.getAttribute("erreur")!=null)
{
	erreur=request.getAttribute("erreur").toString();
}
else
{
	erreur="";
}
%>
<%
if(request.getAttribute("erreur")!=null)
{%>
<div class="alert alert-warning alert-dismissible">
<button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong><%=erreur %></strong> 
</div>
<%
}
%>
<!-- Fin erreur valider les champs -->
							<div class="form-group col-lg-6 "  >
							<label >Budget:</label>
							<input type="Budget" name="budget" class="form-control" id="">
							</div>
							<div class="form-group col-lg-6 ">
							<label >Date debut </label>
							<input type="text" name="dateD" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<div class="form-group col-lg-6 ">
							<label >Date Fin</label>
							<input type="text" name="dateF" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
						<div class="form-group col-lg-6 " >
						<label >Chef de projet proposer</label>
						
						<select name="idChef" class="form-control">
						<%
						ChefDeProjetServiceImpl cdp=new ChefDeProjetServiceImpl() ;
						Iterator<ChefDeProjet> list1 = cdp.listChefDeProjet().iterator();
						int nbrechef=0;
						while(list1.hasNext())
						{
						ChefDeProjet ch=list1.next(); 
						%>
						<option value="<%=ch.getId()%>"><%=ch.getPrenom()%> <%=ch.getNom() %> </option>
						<%} %>
					</select>
					</div>
							<%
							String id=(String)request.getParameter("id");
							%>
							<input type="hidden" name="idProjet" class="form-control" value="<%=id%>">
							<input type="hidden" name="affecterChef" value="affecterChef" />
							<button type="submit" class="btn btn-primary ">Valider</button>
						</form>
</div>
					<!-- /.card-content -->
				</div>
				<!-- /.box-content -->
			</div>



		</div>

		<footer class="footer">
			<ul class="list-inline">
			
				<li>2019 &copy; YoProject.</li>
				<li><a href="#">Privacy</a></li>
				<li><a href="#">Terms</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</footer>
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