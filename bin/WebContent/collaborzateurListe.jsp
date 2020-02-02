<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
<%@ page import="java.util.Iterator"%>

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
	<link rel="stylesheet" href="assets/styles/style-dark.min.css">
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
<div class="main-menu">
	<header class="header">
		<a href="index.html" class="logo"><i class="ico mdi mdi-animation"></i> Admin</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="#" class="avatar">
			<img src="assets/images/avatar-sm-4.jpg" alt="">
			<span class="status online"></span></a>
			<h5 class="name"><a href="profile.html">Med Benmoussa</a></h5>
			<h5 class="position">Administrator</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile.html"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> Paramètres</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-sign-out"></i> Se déconnecter</a></div>
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
					<a class="waves-effect" href="index1.html"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				<!-- LEs nouvelles de nous -->
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-desktop-mac">
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
					<a class="waves-effect" href="index1.html"><i class="menu-icon ico mdi mdi-account-switch"></i>
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
			
			<h5 class="title">Contact</h5>
			<ul class="menu js__accordion">
						
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
		<a href="#" class="ico-item mdi mdi-logout"></a>
	</div>
</div>




<!-- /#notification -->
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

<!--       -->


<div id="wrapper">
	<div class="main-content">
		<div class="row small-spacing">
		
		<ul class="filters">
				<li><a class="active" href="Gcollaborateur.jsp">Ajouter</a></li>
				<li><a href="collaborateurListe.jsp">List</a></li>
				
			</ul>
			
			<div class="col-xs-12">
				<div class="box-content">
					<div class="table-responsive" data-pattern="priority-columns">
						<table id="tech-companies-1" class="table table-small-font table-bordered table-striped">
							<thead>
								<tr>
									<th data-priority="1">email</th>
									<th data-priority="3">prenom</th>
									<th data-priority="1">nom</th>
									<th data-priority="3">ville</th>
									<th data-priority="3">dateN</th>
									<th data-priority="6">telephone</th>
									<th data-priority="6">interet</th>
									<th data-priority="6">privilige</th>
									<th data-priority="6">photo</th>
								</tr>
							</thead>
							<tbody>
							<%
							CollaborateurServicesImpl collaService=new CollaborateurServicesImpl() ;
							Iterator<Collaborateur> list = collaService.listCollaborateur().iterator();
								while(list.hasNext())
								{
									Collaborateur p=list.next(); 
								%>
								<tr>
									<th><span class="co-name"><%=p.getEmail() %></span></th>
									<td><%=p.getNom() %></td>
									<td><%=p.getPrenom() %></td>
									<td><%=p.getVille() %></td>
									<td><%=p.getDateN() %></td>
									<td><%=p.getTelephone() %></td>
									<td><%=p.getInteret() %></td>
									<td><%=p.getPrivilige() %></td>
									<td><%=p.getPhoto() %></td>
								</tr> 
								<%} %>     
							</tbody>
						</table>
					</div> 
				</div>
				
			</div>
			
		</div>
<!--  -->
<!--  -->
				
		<footer class="footer">
			<ul class="list-inline">
				<li>2016 � NinjaAdmin.</li>
				<li><a href="#">Privacy</a></li>
				<li><a href="#">Terms</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</footer>
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
		
	
	
	
	
	

	<!-- Flex Datalist -->
	<script src="assets/plugin/flexdatalist/jquery.flexdatalist.min.js"></script>

	<!-- Popover -->
	<script src="assets/plugin/popover/jquery.popSelect.min.js"></script>

	<!-- Select2 -->
	<script src="assets/plugin/select2/js/select2.min.js"></script>

	<!-- Multi Select -->
	<script src="assets/plugin/multiselect/multiselect.min.js"></script>

	<!-- Touch Spin -->
	<script src="assets/plugin/touchspin/jquery.bootstrap-touchspin.min.js"></script>

	<!-- Timepicker -->
	<script src="assets/plugin/timepicker/bootstrap-timepicker.min.js"></script>

	<!-- Colorpicker -->
	<script src="assets/plugin/colorpicker/js/bootstrap-colorpicker.min.js"></script>

	<!-- Datepicker -->
	<script src="assets/plugin/datepicker/js/bootstrap-datepicker.min.js"></script>

	<!-- Moment -->
	<script src="assets/plugin/moment/moment.js"></script>

	<!-- DateRangepicker -->
	<script src="assets/plugin/daterangepicker/daterangepicker.js"></script>

	<!-- Maxlength -->
	<script src="assets/plugin/maxlength/bootstrap-maxlength.min.js"></script>

	<!-- Demo Scripts -->
	<script src="assets/scripts/form.demo.min.js"></script>

	<!--<script src="assets/scripts/main.js"></script>-->
	
	
</body>
</html>