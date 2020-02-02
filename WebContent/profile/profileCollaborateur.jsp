	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
	<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
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
		 
		 
<c:if test="${sessionScope.privilige!='Collaborateur'}">
<%
response.sendRedirect(request.getContextPath() +p);
%>
</c:if>
<div class="main-menu">
	<header class="header">
		<a href="user.html" class="logo"><i class="ico mdi mdi-cube-outline"></i>Collaborateur</a>
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
			<img src="../assets/images/avatar-1.jpg"  width="200%" height="200%"/>
			<%
			}else{
				%>
				<img src="../<%=chemin %>"  width="200%" height="200%"/>
				<% 
				}
			%>
			<span class="status online"></span></a>
			<h5 class="name"><a href="profile.html">${sessionScope.prenom} ${sessionScope.prenom} ${sessionScope.nom}</a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile/profileCollaborateur.jsp"><i class="fa fa-user"></i> Profil</a></div>
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
					<a class="waves-effect" href="index1.html"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
				
			</ul>
			<!-- Fin onglet 1 -->
		
		<!-- Titre 1 -->
			<h5 class="title">Projets</h5>
			<ul class="menu js__accordion">
			<!-- La gestion de projets -->
				<li>
					<a class="waves-effect parent-item js__control" href="#"><i class="menu-icon mdi mdi-desktop-mac">
					</i><span>Mes Tâches</span><span class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="#">Nouveau</a></li>
						<li><a href="#">En cours</a></li>
						<li><a href="#">terminé</a></li>
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
						if(col.getAvatar().equals("vide"))	
						{
						%>
						<img src="../assets/images/avatar-1.jpg" width="200%" height="200%"/>
						<%
						}else{
							%>
							<img src="../<%=chemin %>"  width="200%" height="200%">
							<% 
							}
						%>
						<a href="#" class="btn btn-block btn-friend"><i class="fa fa-check-circle"></i> Collaborateur</a>
						<a href="#" class="btn btn-block btn-inbox"><i class="fa fa-envelope"></i> Mes Messages</a>
						<h3><strong>Betty Simmons</strong></h3>
						
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
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Date naissance:</label></div>
											<div class="col-xs-7">Jan 22, 1984</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="row">
											<div class="col-xs-5"><label>Telephone:</label></div>
											<div class="col-xs-7">+1-234-5678</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
								if(idSession==m.getIdCollaborateur() && m.getPrivilige().equalsIgnoreCase("collaborateur"))
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
								<div class="form-group col-lg-6">
									<label for="exampleInputEmail1">Intitulé</label>
									<input type="text" name="intitule" class="form-control" id="exampleInputEmail1" placeholder="Intitulé exp...">
								</div>
								<div class="form-group col-lg-6">
									<label for="exampleInputEmail1">Organisation</label>
									<input type="text" name="organiation" class="form-control" id="exampleInputEmail1" placeholder="Organisation...">
								</div>
								<div class="form-group col-lg-6">
							<label >Date debut </label>
							<input type="text" name="dateD" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<div class="form-group col-lg-6">
							<label >Date Fin</label>
							<input type="text" name="dateF" class="form-control" placeholder="mm/dd/yyyy" id="datepicker">
							</div>
							<input type="hidden" name="profilExperience" value="profilExperience"/>
							<button type="submit" class="btn btn-primary ">Valider</button>
								</form>
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
								<%
							EducationServiceImpl edu= new EducationServiceImpl();
							List<Education> listEdu=edu.listEducation();
							for (Education m : listEdu) {
								if(idSession==m.getIdCollaborateur() && m.getPrivilige().equalsIgnoreCase("collaborateur"))
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
				</div>
			</div>
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