<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
<%@ page import="java.util.Iterator"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Accueil - Espace Utilisateur</title>
	<link rel="stylesheet" href="assets/styles/style.min.css">
	<!-- Alert -->
	<link rel="stylesheet" href="assets/plugin/sweet-alert/sweetalert.css">
	<!-- Icon -->
	<link rel="stylesheet" href="assets/fonts/material-design/css/materialdesignicons.css">
</head>
<body>
<div class="main-menu">
	<header class="header">
		<a href="user.html" class="logo"><i class="ico mdi mdi-cube-outline"></i>Utiliateur</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="#" class="avatar">
			<img src="assets/images/avatar-3.jpg" alt="">
			<span class="status online"></span></a>
			<h5 class="name"><a href="profile.html">Farida sami</a></h5>
			<h5 class="position">Utilisateur</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile.html"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> Param�tres</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-sign-out"></i> Se d�connecter</a></div>
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
					<a class="waves-effect" href="clientAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				<!-- LEs nouvelles de nous -->
			
			</ul>
			<!-- Fin onglet 1 -->
		
		<!-- Titre 1 -->
			<h5 class="title">Projets</h5>
			<ul class="menu js__accordion">
			<!-- La gestion de projets -->
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-desktop-mac">
					</i><span>Mes projets</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="ajouterprojetClient.jsp">Ajouter</a></li>
						<li><a href="#">Suivi</a></li>
						<li><a href="#">Liste</a></li>
					</ul>
				</li>
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-chart-areaspline"></i>
					<span>Situation financi�re</span></a>
				</li>
			</ul>

			<!-- debut obglet 4 -->
			<!-- Titre 4 -->
			<h5 class="title">Contact</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-desktop-mac">
					</i><span>Mes Messages</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="#">Ajouter</a></li>
						<li><a href="#">Liste</a></li>
					</ul>
				</li>
				<!-- les newsletters --> 
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-chart-areaspline"></i>
					<span>Mes Newsletters</span></a>
				</li>
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-chart-areaspline"></i>
					<span>Mes Notifications</span></a>
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
			<input type="search" placeholder="rechercher..." class="input-search">
			<button class="mdi mdi-magnify button-search" type="submit"></button></form>
		</div>
		
		<a href="#" class="ico-item mdi mdi-email notice-alarm js__toggle_open" data-target="#message-popup"></a>
		<a href="#" class="ico-item pulse"><span class="ico-item mdi mdi-bell notice-alarm js__toggle_open" data-target="#notification-popup"></span></a>
		<a href="#" class="ico-item mdi mdi-logout"></a>
	</div>
</div>
<!-- /.fixed-navbar -->

<div id="notification-popup" class="notice-popup js__toggle" data-space="75"><h2 class="popup-title">Vos notifications</h2>
	<div class="content">
		<ul class="notice-list">
			<li>
				<a href="#">
					<span class="avatar"><img src="assets/images/avatar-sm-8.jpg" alt=""></span>
					<span class="name">Ahmadi Jalal</span>
					<span class="desc">Aimez votre message: "Facebook Messenger"</span>
					<span class="time">Hier</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span class="avatar"><img src="assets/images/avatar-sm-1.jpg" alt=""></span>
					<span class="name">Salmi Hakim</span>
					<span class="desc">Aimez votre message: "Facebook Messenger"</span>
					<span class="time">10 Oct</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span class="avatar"><img src="assets/images/avatar-2.jpg" alt=""></span>
					<span class="name">Slimani Fatima</span>
					<span class="desc">Aimez votre message: "Facebook Messenger"</span>
					<span class="time">7 Oct</span>
				</a>
			</li>
		</ul>
		<a href="#" class="notice-read-more">Voir plus de messages <i class="fa fa-angle-down"></i></a>
	</div>
</div>

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
		
				<!-- /.col-xs-12 -->
				<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-info">Mes projets</h4>
					
					<div class="dropdown js__drop_down">
						<a href="#" class="dropdown-icon glyphicon glyphicon-option-vertical js__drop_down_button"></a>
						<ul class="sub-menu">
							<li><a href="#">Action 1</a></li>
							<li><a href="#">Action 2</a></li>
							<li><a href="#">Action 3</a></li>
							<li class="split"></li>
							<li><a href="#">Action 4</a></li>
						</ul>
				</div>
				
					<div class="content widget-stat">
						<div id="traffic-sparkline-chart-1" class="left-content margin-top-15"></div>
				
						<div class="right-content">
							<h2 class="counter text-info">
							
							<%
							BesoinProjetServicesImpl besoinService=new BesoinProjetServicesImpl() ;
							Iterator<BesoinProjet> list1 = besoinService.listBesoinProjet().iterator();
							int count=0;
								while(list1.hasNext())
								{
									BesoinProjet b=list1.next(); 
									count++; 
								}
								%>
								<%=count %>	
							</h2>
				
							<p class="text text-info">Projet(s)</p>
				
						</div>
				
					</div>
				
				</div>
				
			</div>
			<!-- /.col-lg-4 col-xs-12 -->
			<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-success">Mes projets Actives</h4>
			
					<div class="dropdown js__drop_down">
						<a href="#" class="dropdown-icon glyphicon glyphicon-option-vertical js__drop_down_button"></a>
						<ul class="sub-menu">
							<li><a href="#">Action 1</a></li>
							<li><a href="#">Action 2</a></li>
							<li><a href="#">Action 3</a></li>
							<li class="split"></li>
							<li><a href="#">Action 4</a></li>
						</ul>
			
					</div>
			
					<div class="content widget-stat">
						<div id="traffic-sparkline-chart-2" class="left-content margin-top-10"></div>
			
						<div class="right-content">
							<h2 class="counter text-success">
							<%
							
							 list1 = besoinService.listBesoinProjet().iterator();
							 int count1=0;
								while(list1.hasNext())
								{
									BesoinProjet b=list1.next(); 
									
									count1++; 
								}
								%>
								<%=count1 %>	
							
							 <i class="fa fa-angle-double-up"></i></h2>
			
							<p class="text text-success">Projet(s)</p>
			
						</div>
			
					</div>
			
				</div>
			
			</div>
			
			<!-- /.col-lg-4 col-xs-12 -->
			
			<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-danger">Mes projets en attentes</h4>
			
					<div class="dropdown js__drop_down">
						<a href="#" class="dropdown-icon glyphicon glyphicon-option-vertical js__drop_down_button"></a>
						<ul class="sub-menu">
							<li><a href="#">Action 1</a></li>
							<li><a href="#">Action 2</a></li>
							<li><a href="#">Action 3</a></li>
							<li class="split"></li>
							<li><a href="#">Action 4</a></li>
						</ul>
			
					</div>
			
					<div class="content widget-stat">
						<div id="traffic-sparkline-chart-3" class="left-content"></div>
			
						<div class="right-content">
							<h2 class="counter text-danger">
							<%
							
							list1 = besoinService.listBesoinProjet().iterator();
							int count2=0;
								while(list1.hasNext())
								{
									BesoinProjet b=list1.next(); 
									
									count2++; 
								}
								%>
								<%=count2 %>	
							 <i class="fa fa-angle-double-down"></i></h2>
			
							<p class="text text-danger">Projet(s)</p>
			
						</div>
			
					</div>
			
				</div>
			</div>
			
		</div>
	<!-- /.row -->		
		<footer class="footer">
			<ul class="list-inline">
				<li>2019 � AppsUser.</li>
				<li><a href="#">Privacy</a></li>
				<li><a href="#">Terms</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</footer>
	</div>
</div>
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="assets/scripts/main.min.js"></script>
	<!--<script src="assets/scripts/main.js"></script>-->
	<!--
	<script src="assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="assets/plugin/waves/waves.min.js"></script>-->

	<!-- Morris Chart -->
	<!--
	<script src="assets/plugin/chart/morris/morris.min.js"></script>
	<script src="assets/plugin/chart/morris/raphael-min.js"></script>
	<script src="assets/scripts/chart.morris.init.min.js"></script>
	-->
	<!-- Flot Chart -->
	<!--<script src="assets/plugin/chart/plot/jquery.flot.min.js"></script>
	<script src="assets/plugin/chart/plot/jquery.flot.tooltip.min.js"></script>
	<script src="assets/plugin/chart/plot/jquery.flot.categories.min.js"></script>
	<script src="assets/plugin/chart/plot/jquery.flot.pie.min.js"></script>
	<script src="assets/plugin/chart/plot/jquery.flot.stack.min.js"></script>
	<script src="assets/scripts/chart.flot.init.min.js"></script>
	-->
	<!-- Sparkline Chart -->
	<!--
	<script src="assets/plugin/chart/sparkline/jquery.sparkline.min.js"></script>
	<script src="assets/scripts/chart.sparkline.init.min.js"></script>
	-->
	<!-- FullCalendar -->
	<!--
	<script src="assets/plugin/moment/moment.js"></script>
	<script src="assets/plugin/fullcalendar/fullcalendar.min.js"></script>
	<script src="assets/scripts/fullcalendar.init.js"></script>
	-->
	
</body>
</html>