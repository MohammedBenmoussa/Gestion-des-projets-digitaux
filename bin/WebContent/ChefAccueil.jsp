<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Accueil - Espace Chef de projet</title>

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
%>
</c:if>

<div class="main-menu">
	<header class="header">
		<a href="index.html" class="logo"><i class="ico mdi mdi-animation"></i>Chef de projet</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="#" class="avatar">
			<img src="assets/images/avatar-sm-4.jpg" alt="">
			<span class="status online"></span></a>
			<h5 class="name"><a href="profile.html">${sessionScope.prenom} ${sessionScope.nom}</a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			
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
	
	<div class="content">
		<div class="navigation">
	
			<h5 class="title">Navigation</h5>
			<ul class="menu js__accordion">
			
				<li>
					<a class="waves-effect" href="index1.html"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				
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

			
			</ul>

			<!-- debut obglet 2 -->
			<!-- Titre 2 -->
			
			
			
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
		<div class="row small-spacing">
			<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-info">Prochaine</h4>
					<!-- /.box-title -->
					<div class="dropdown js__drop_down">
						<a href="#" class="dropdown-icon glyphicon glyphicon-option-vertical js__drop_down_button"></a>
						<ul class="sub-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else there</a></li>
							<li class="split"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
						<!-- /.sub-menu -->
					</div>
					<!-- /.dropdown js__dropdown -->
					<div class="task-lists">
						<a href="#" class="task-item">
							<div class="title">Cum voluptate quo cumque assumenda debitis.</div>
							<!-- /.title -->
							<div class="progress">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
							</div>
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>1</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-paperclip ico"></i>2</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-check-square-o ico"></i>4/6</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->

						<a href="#" class="task-item">
							<div class="task-icon text-danger"><i class="fa fa-bug"></i></div>
							<div class="title">Fix Bug</div>
							<!-- /.title -->
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"></div>
							</div>
							<div class="metas">
								<div class="meta"><i class="fa fa-user ico"></i>2</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-check-square-o ico"></i>18/21</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->

						<a href="#" class="task-item">
							<div class="title">Cum voluptate quo cumque assumenda debitis.</div>
							<!-- /.title -->
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>14</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->
					</div>
					<!-- /.task-lists -->
					<div class="text-center"><button type="button" class="btn btn-default waves-effect waves-light" data-toggle="modal" data-target="#addTask">+ Add New</button></div>
				</div>
				<!-- /.box-content -->
			</div>
			<!-- /.col-lg-4 col-xs-12 -->

			<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-warning">A faire</h4>
					<!-- /.box-title -->
					<div class="dropdown js__drop_down">
						<a href="#" class="dropdown-icon glyphicon glyphicon-option-vertical js__drop_down_button"></a>
						<ul class="sub-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else there</a></li>
							<li class="split"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
						<!-- /.sub-menu -->
					</div>
					<!-- /.dropdown js__dropdown -->
					<div class="task-lists">
						<a href="#" class="task-item">
							<div class="title">Cum voluptate quo cumque assumenda debitis.</div>
							<!-- /.title -->
							<div class="progress">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
							</div>
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>1</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-paperclip ico"></i>2</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-check-square-o ico"></i>4/6</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->

						<a href="#" class="task-item">
							<div class="task-icon text-danger"><i class="fa fa-bug"></i></div>
							<div class="title">Fix Bug</div>
							<!-- /.title -->
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"></div>
							</div>
							<div class="metas">
								<div class="meta"><i class="fa fa-user ico"></i>2</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-check-square-o ico"></i>18/21</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->

						<a href="#" class="task-item">
							<div class="title">Cum voluptate quo cumque assumenda debitis.</div>
							<!-- /.title -->
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>14</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->
					</div>
					<!-- /.task-lists -->
					<div class="text-center"><button type="button" class="btn btn-default waves-effect waves-light" data-toggle="modal" data-target="#addTask">+ Add New</button></div>
				</div>
				<!-- /.box-content -->
			</div>
			<!-- /.col-lg-4 col-xs-12 -->

			<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-success">Terminé</h4>
					<!-- /.box-title -->
					<div class="dropdown js__drop_down">
						<a href="#" class="dropdown-icon glyphicon glyphicon-option-vertical js__drop_down_button"></a>
						<ul class="sub-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else there</a></li>
							<li class="split"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
						<!-- /.sub-menu -->
					</div>
					<!-- /.dropdown js__dropdown -->
					<div class="task-lists">
						<a href="#" class="task-item">
							<div class="title">Cum voluptate quo cumque assumenda debitis.</div>
							<!-- /.title -->
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>1</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-paperclip ico"></i>2</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->

						<a href="#" class="task-item">
							<div class="task-icon text-success"><i class="fa fa-envira"></i></div>
							<div class="title">Cum voluptate quo cumque assumenda debitis.</div>
							<!-- /.title -->
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
							</div>
							<div class="metas">
								<div class="meta"><i class="fa fa-user ico"></i>14</div>
								<!-- /.meta -->
								<div class="meta"><i class="fa fa-usd ico"></i>10.000</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->

						<a href="#" class="task-item">
							<img src="assets/images/test-image-1.jpg" alt="" class="margin-bottom-10">
							<div class="title">Cum voluptate quo cumque assumenda debitis.</div>
							<!-- /.title -->
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>14</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
						<!-- /.task-item -->
					</div>
					<!-- /.task-lists -->
					<div class="text-center"><button type="button" class="btn btn-default waves-effect waves-light" data-toggle="modal" data-target="#addTask">+ Ajouter une</button></div>
				</div>
				<!-- /.box-content -->
			</div>
			<!-- /.col-lg-4 col-xs-12 -->
		</div>


	<footer class="footer">
			<ul class="list-inline">
				<li>2019 © YoProject.</li>
				<li><a href="#">Privacy</a></li>
				<li><a href="#">Terms</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</footer>
	</div>
	<!-- /.main-content -->
</div><!--/#wrapper -->
<div class="modal fade" id="addTask" tabindex="-1" role="dialog" aria-labelledby="addTaskLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="addTaskLabel">Add New Task</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group"><label for="taskName">Task Name</label><input type="text" id="taskName" class="form-control"></div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-1">Assign to</label><input type="text" id="frm-1" class="form-control"></div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-2">Priority</label><input type="text" id="frm-2" class="form-control"></div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-3">Start Date</label><input type="text" id="frm-3" class="form-control"></div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-4">Due Date</label><input type="text" id="frm-4" class="form-control"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default waves-effect waves-light" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary waves-effect waves-light">Add New</button>
			</div>
		</div>
	</div>
</div>
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="assets/scripts/main.min.js"></script>	<!--<script src="assets/scripts/main.js"></script>-->
	
	
</body>
</html>