<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.ChefDeProjet"%>
	<%@ page import="com.yoprojet.projet.services.ChefDeProjetServiceImpl"%>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
	<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
		<%@ page import="com.yoprojet.projet.services.EducationServiceImpl"%>
	<%@ page import="com.yoprojet.projet.dao.entite.Education"%>
		<%@ page import="com.yoprojet.projet.services.ExperienceServiceImpl"%>
	<%@ page import="com.yoprojet.projet.dao.entite.Experience"%>
	<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Accueil - Espace Chef de projet</title>

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

	<!-- FullCalendar -->
	<link rel="stylesheet" href="../assets/plugin/fullcalendar/fullcalendar.min.css">
	<link rel="stylesheet" href="../assets/plugin/fullcalendar/fullcalendar.print.css" media='print'>

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
		<a href="ChefAccueil.jsp" class="logo"><i class="ico mdi mdi-animation"></i>Chef de projet</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="../avatarUpdate/updateAvatarChef.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			ChefDeProjetServiceImpl adm=new ChefDeProjetServiceImpl() ;
			ChefDeProjet chef=adm.unique(email);
			String chemin="tmpfiles/"+chef.getAvatar();
			if(chef.getAvatar().equals("vide"))	
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
					<a class="waves-effect" href="adminAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
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
					<a class="waves-effect" href="Gcollaborateur.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
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
						if(chef.getAvatar().equals("vide"))
						{
						%>
						<img src="../assets/images/avatar-1.jpg" width="210px" height="150px"/>
						<%
						}else{
							%>
							<img src="../<%=chemin %>" width="200%" height="200%"/>
							<% 
							}
						%>
						<a href="#" class="btn btn-block btn-friend"><i class="fa fa-check-circle"></i> <%=chef.getPrivilige() %></a>
						<a href="../message/messageChef.jsp" class="btn btn-block btn-inbox"><i class="fa fa-envelope"></i> Mes Messages</a>
						<h3><strong><%=chef.getPrenom() %> <%=chef.getNom() %></strong></h3>
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
											<div class="col-xs-7"><%=chef.getPrenom() %></div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Nom:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7"><%=chef.getNom() %></div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Type:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7"><%=chef.getPrivilige() %></div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Email:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7"><%=chef.getEmail() %></div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Ville:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7"><%=chef.getVille()%></div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Pays:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7"><%=chef.getPays() %></div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Date naissance:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7"><%=chef.getDateN() %></div>
											<!-- /.col-xs-7 -->
										</div>
										<!-- /.row -->
									</div>
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Telephone:</label></div>
											<!-- /.col-xs-5 -->
											<div class="col-xs-7"><%=chef.getTelephone() %></div>
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
								<%
								long idSession=(Long) session.getAttribute("id");
								String priviligeMail=(String)session.getAttribute("privilige");
								
							ExperienceServiceImpl exp= new ExperienceServiceImpl();
							List<Experience> listExp=exp.listExperience();
							for (Experience m : listExp) {
							if(idSession==m.getIdCollaborateur() && m.getPrivilige().equalsIgnoreCase("Chef de projet"))
								{
							%>							
							<li><a href="#"><%=m.getOrganisation() %></a> at <a href="#">
							<%=m.getIntitule() %></a>.<span class="date"><%=m.getDated() %> - <%=m.getDatef() %>
							</span></li>
							<%}}%>
								</ul>
							</div>
							<div class="card-content">
								<form action="../userserv" method="post">
								<div class="form-group col-lg-6 "  >
									<label for="exampleInputEmail1">Intitulé</label>
									<input type="text" name="intitule" class="form-control" id="exampleInputEmail1" placeholder="Intitulé exp...">
								</div>
								<div class="form-group col-lg-6 "  >
									<label for="exampleInputEmail1">Organisation</label>
									<input type="text" name="organiation" class="form-control" id="exampleInputEmail1" placeholder="Organisation...">
								</div>
								<div class="form-group col-lg-6 ">
							<label >Date debut </label>
							<input type="text" name="dateD" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<div class="form-group col-lg-6 ">
							<label >Date Fin</label>
							<input type="text" name="dateF" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<input type="hidden" name="profilExperience" value="profilExperience"/>
							<button type="submit" class="btn btn-primary ">Valider</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xs-12">
						<div class="box-content card">
							<h4 class="box-title"><i class="fa fa-trophy ico"></i> Education</h4>
							<div class="card-content">
								<ul class="dot-list">
									<%
							EducationServiceImpl edu= new EducationServiceImpl();
							List<Education> listEdu=edu.listEducation();
							for (Education m : listEdu) {
							if(idSession==m.getIdCollaborateur() && m.getPrivilige().equalsIgnoreCase("Chef de projet"))
							{
							%>							
							<li><a href="#"><%=m.getOrganisation() %></a> at <a href="#">
							<%=m.getIntitule() %></a>.<span class="date"><%=m.getDated() %> - <%=m.getDatef() %>
							</span></li>
							<%}}%>
								</ul>
							</div>
							<div class="card-content">
								<form action="../userserv" method="post">
								<div class="form-group col-lg-6 "  >
									<label for="exampleInputEmail1">Intitulé</label>
									<input type="text" name="intitule" class="form-control" id="exampleInputEmail1" placeholder="Intitulé exp...">
								</div>
								<div class="form-group col-lg-6 "  >
									<label for="exampleInputEmail1">Organisation</label>
									<input type="text" name="organiation" class="form-control" id="exampleInputEmail1" placeholder="Organisation...">
								</div>
								<div class="form-group col-lg-6 ">
							<label >Date debut </label>
							<input type="text" name="dateD" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<div class="form-group col-lg-6 ">
							<label >Date Fin</label>
							<input type="text" name="dateF" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<input type="hidden" name="profilEducation" value="profilEducation"/>
							<button type="submit" class="btn btn-primary ">Valider</button>
								</form>
							</div>
						</div>
					</div>
					<!-- 
					<div class="col-xs-12">
						<div class="box-content card">
							<h4 class="box-title"><i class="fa fa-user ico"></i>Ajouter Education - Expérience</h4>
			
							<div class="card-content">
								<div class="row">
	
								<div class="card-content">
								<form action="../userserv" method="post">
								<div class="form-group col-lg-6 "  >
									<label for="exampleInputEmail1">Intitulé</label>
									<input type="text" name="intitule" class="form-control" id="exampleInputEmail1" placeholder="Intitulé exp...">
								</div>
								<div class="form-group col-lg-6 "  >
									<label for="exampleInputEmail1">Organisation</label>
									<input type="text" name="organiation" class="form-control" id="exampleInputEmail1" placeholder="Organisation...">
								</div>
								<div class="form-group col-lg-6 ">
							<label >Date debut </label>
							<input type="text" name="dateD" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<div class="form-group col-lg-6 ">
							<label >Date Fin</label>
							<input type="text" name="dateF" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<input type="hidden" name="profil" value="profil"/>
							<button type="submit" class="btn btn-primary ">Valider</button>
								</form>
							</div>
							</div>
							</div>
						</div>
					</div>-->
					
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- Placed at the end of the document so the pages load faster -->
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