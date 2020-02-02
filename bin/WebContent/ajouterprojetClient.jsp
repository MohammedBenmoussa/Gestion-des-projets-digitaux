<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.yoprojet.projet.services.MetierServiceImpl"%>
   <%@ page import="com.yoprojet.projet.dao.entite.Metier"%>
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
	
	<!-- Material Design Icon -->
	<link rel="stylesheet" href="assets/fonts/material-design/css/materialdesignicons.css">

	<!-- mCustomScrollbar -->
	<link rel="stylesheet" href="assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="assets/plugin/waves/waves.min.css">

	<!-- Sweet Alert -->
	<link rel="stylesheet" href="assets/plugin/sweet-alert/sweetalert.css">
	
	<!-- Jquery UI -->
	<link rel="stylesheet" href="assets/plugin/jquery-ui/jquery-ui.min.css">
	<link rel="stylesheet" href="assets/plugin/jquery-ui/jquery-ui.structure.min.css">
	<link rel="stylesheet" href="assets/plugin/jquery-ui/jquery-ui.theme.min.css">

	<!-- noUI SLider -->
	<link rel="stylesheet" href="assets/plugin/noUIslider/nouislider.min.css">
	<link rel="stylesheet" href="assets/plugin/noUIslider/nouislider.pips.css">
	<link rel="stylesheet" href="assets/plugin/noUIslider/nouislider.tooltips.css">

	<!-- Ion Range SLider -->
	<link rel="stylesheet" href="assets/plugin/ion-range-slider/css/ion.rangeSlider.css">
	<link rel="stylesheet" href="assets/plugin/ion-range-slider/css/ion.rangeSlider.skinFlat.css">

	<!-- Dark Themes -->
	<link rel="stylesheet" href="assets/styles/style-dark.min.css">
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
					<span>Situation financière</span></a>
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
				<li><a class="active" href="#">Ajouter</a></li>
				<li><a href="#">suivi</a></li>
				<li><a href="#">List</a></li>
		</ul>
<div class="col-xs-12">
<div class="box-content card white">
<h4 class="box-title" style="text-align: center;">Ajouter le besoin du client</h4>
<div class="card-content">
<form action="projetserv" method="post">
	<div class="form-group col-lg-6 "  >
		<label for="exampleInputEmail1">Projet</label>
			<input type="text" name="decription" class="form-control" id="exampleInputEmail1" placeholder="decription du projet...">
	</div>
	
	
		<div class="form-group col-lg-6 "  >
		<label for="exampleInputEmail1">Nom Court</label>
			<input type="text" name="nomCourt" class="form-control" id="exampleInputEmail1" placeholder="nom Court du projet...">
	</div>
		<div class="form-group col-lg-6 "  >
		<label for="exampleInputEmail1">Nom Complet</label>
			<input type="text" name="nomComplet" class="form-control" id="exampleInputEmail1" placeholder="nom Complet du projet...">
	</div>
	
		
	
	
	
	
		<div class="form-group col-lg-6 " >
						<label >Privilege</label>
						<select  id="popover-1" name="idMetier" class="form-control" multiple >
						<%
						MetierServiceImpl met= new MetierServiceImpl();
						Iterator<Metier> metierlist=met.listMetier().iterator();
				while(metierlist.hasNext())
				{
						Metier p = metierlist.next();
						%>
						
						<option value="<%=p.getId() %>"><%=p.getTechnologie() %></option>
						
								<%} %>
						
						</select>
					</div>
							
<div class="margin-top-30 js__ui_slider" data-range="min" data-min="1" data-max="200" data-value-1="120">
<p>
<label for="amount-3">Maximum price:</label>
<input type="text" id="amount-3" class="input-no-style text-danger js__slider_amount"  name="amount-3"/>
</p>
<div class="js__slider_range"></div>
</div>

	<p>&nbsp;</p>
	<input type="hidden" name="ajouterProjetClient" value="ajouterProjetClient" />
	
	<input type="hidden" name="idClient" value="1" />
	
	<button type="submit" class="btn btn-primary ">Valider</button>
</form>

</div>
					<!-- /.card-content -->
				</div>
				<!-- /.box-content -->
			</div>



		</div>
		<!-- /.prj-header -->

	<!-- /.row -->		
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
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugin/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="assets/plugin/waves/waves.min.js"></script>

	<!-- Jquery UI -->
	<script src="assets/plugin/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/plugin/jquery-ui/jquery.ui.touch-punch.min.js"></script>

	<!-- noUI Slider -->
	<script src="assets/plugin/noUIslider/nouislider.min.js"></script>
	<script src="assets/scripts/nouislider.init.min.js"></script>

	<!-- Ion Ranger SLider -->
	<script src="assets/plugin/ion-range-slider/js/ion.rangeSlider.min.js"></script>
	<script src="assets/scripts/ion.rangeSlider.init.min.js"></script>

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