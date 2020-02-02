<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.Client"%>
<%@ page import="com.yoprojet.projet.services.ClientServicesImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.Mail"%>
<%@ page import="com.yoprojet.projet.services.MailServiceImpl"%>
<%@ page import="java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Accueil - Espace Utilisateur</title>
	<link rel="stylesheet" href="../assets/styles/style.min.css">
	<!-- Alert -->
	<link rel="stylesheet" href="../assets/plugin/sweet-alert/sweetalert.css">
	<!-- Icon -->
	<link rel="stylesheet" href="../assets/fonts/material-design/css/materialdesignicons.css">
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
		 
<c:if test="${sessionScope.privilige!='client'}">
<%
response.sendRedirect(request.getContextPath() +p);
%>
</c:if>

<%
BesoinProjetServicesImpl met= new BesoinProjetServicesImpl();
Iterator<BesoinProjet> projetlist=met.listBesoinProjet().iterator();
int nbreprojet=0;
int nbreprojetbloquer=0;
int nbreprojetactive=0;
long id=Long.parseLong(session.getAttribute("id").toString());
while(projetlist.hasNext())
{
	BesoinProjet b = projetlist.next();
	if(b.getIdClient()==id)
	{
	if(b.getActive()==0)
	{
		nbreprojetbloquer++;
	}
	else{
		nbreprojetactive++;
	}
	nbreprojet++;
	}
	
} 

%>


<div class="main-menu">
	<header class="header">
		<a href="user.html" class="logo"><i class="ico mdi mdi-cube-outline"></i>Utiliateur</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="../avatarUpdate/updateAvatarClient.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			ClientServicesImpl adm=new ClientServicesImpl() ;
			Client clt=adm.unique(email);
			String chemin="tmpfiles/"+clt.getAvatar();
			if(!clt.getAvatar().equals(""))	
			{
			%>
			<img src="../<%=chemin %>"/>
			<%
			}else{
				%>
				<img src="../assets/images/avatar-1.jpg"/>
				<% 
				}
			%>
			<span class="status online"></span></a>
			<h5 class="name"><a href="profile.html"> ${sessionScope.prenom} ${sessionScope.nom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="../profile/profileClient.jsp"><i class="fa fa-user"></i> Profil</a></div>
					<div class="control-item"><a href="#"><i class="fa fa-gear"></i> Param�tres</a></div>
					<div class="control-item"><a href="../deconnexion.jsp"><i class="fa fa-sign-out"></i> Se d�connecter</a></div>
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
					<a class="waves-effect" href="../clientAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
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
					<a class="waves-effect " href="messageClient.jsp">
					<i class="menu-icon mdi mdi-desktop-mac"></i>
					<span>Boite de r�ception</span></a>
					
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
		
		<a href="../deconnexion.jsp" class="ico-item mdi mdi-logout"></a>
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
		<div class="row">
			<div class="col-md-3 col-xs-12">
				<a href="messageComposerClient.jsp" class="btn btn-danger btn-mail-main btn-block margin-bottom-20 waves-effect waves-light">COMPOSE</a>
				<div class="box box-solid">
					<div class="box-body">
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="#"><i class="fa fa-inbox"></i>bo�te de r�ception
							<span class="label-text-right pull-right">35</span></a>
							</li>
							<li><a href="#"><i class="fa fa-envelope"></i> Envoy�</a></li>
							<li><a href="#"><i class="fa fa-trash"></i> Corbeille</a></li>
						</ul>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
			<!-- /.col-md-3 col-xs-12 -->
			
			<div class="col-md-9 col-xs-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Lecture E-mail</h3>
						<div class="box-tools pull-right">
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<h3>Message Subject Is Placed Here</h3>
							<h5>From: help@example.com
								<span class="mailbox-read-time pull-right">15 Feb. 2016 11:03 PM</span>
							</h5>
						</div>
						<!-- /.mailbox-read-info -->
						<div class="mailbox-controls with-border text-center">
							<button type="button" class="btn btn-default btn-sm waves-effect waves-light" data-toggle="tooltip" data-container="body" title="Delete"><i class="fa fa-trash"></i></button>
							<button type="button" class="btn btn-default btn-sm waves-effect waves-light" data-toggle="tooltip" data-container="body" title="Reply"><i class="fa fa-reply"></i></button>
							<button type="button" class="btn btn-default btn-sm waves-effect waves-light" data-toggle="tooltip" data-container="body" title="Forward"><i class="fa fa-share"></i></button>
							<button type="button" class="btn btn-default btn-sm waves-effect waves-light" data-toggle="tooltip" title="Print"><i class="fa fa-print"></i></button>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">
							<p>Hello John,</p>
							<p>Keffiyeh blog actually fashion axe vegan, irony biodiesel. Cold-pressed hoodie chillwave put a bird
								on it aesthetic, bitters brunch meggings vegan iPhone. Dreamcatcher vegan scenester mlkshk. Ethical
								master cleanse Bushwick, occupy Thundercats banjo cliche ennui farm-to-table mlkshk fanny pack
								gluten-free. Marfa butcher vegan quinoa, bicycle rights disrupt tofu scenester chillwave 3 wolf moon
								asymmetrical taxidermy pour-over. Quinoa tote bag fashion axe, Godard disrupt migas church-key tofu
								blog locavore. Thundercats cronut polaroid Neutra tousled, meh food truck selfies narwhal American
								Apparel.
							</p>
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
	
	<script src="../assets/plugin/nprogress/nprogress.js"></script>
	<script src="../assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="../assets/scripts/main.min.js"></script>
	<script src="../assets/scripts/main.js"></script>
	
</body>
</html>