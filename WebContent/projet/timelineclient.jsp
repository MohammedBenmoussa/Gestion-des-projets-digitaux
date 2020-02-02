<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.Client"%>
<%@ page import="com.yoprojet.projet.services.ClientServicesImpl"%>
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

	<link rel="stylesheet" href="../assets/plugin/datatables/media/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="../assets/plugin/datatables/extensions/Responsive/css/responsive.bootstrap.min.css">
	<link rel="stylesheet" href="../assets/plugin/timeline/css/style.css">
	<link rel="stylesheet" href="../assets/styles/style-dark.min.css">
	<!-- Dark Themes -->
		<style>
	.anime{
	cursor: pointer;
	animation: shadow-pulse 2s infinite;
	}
	@keyframes shadow-pulse{
    0%{
        box-shadow: 0 0 0 0px rgba(100,100,0,1);
    }
    
    100%{
        box-shadow: 0 0 0 20px rgba(100,100,0,0);
    }
}
	
	</style>
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
			<h5 class="name"><a href="#"> ${sessionScope.prenom} ${sessionScope.nom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="../profile/profileClient.jsp"><i class="fa fa-user"></i> Profil</a></div>
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
		<a href="../deconnexion.jsp" class="ico-item mdi mdi-logout"></a>
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
		<section id="cd-timeline" class="cd-container">
		<c:forEach var="tache" items="${sessionScope.listetache}">
		<c:if test="${tache.getIdProjet()==sessionScope.idProjet}">
			<div class="cd-timeline-block ">
				<c:if test="${tache.getStatus().equals('en cours')}">			
				<div class="cd-timeline-img cd-picture anime">
					<img src="../assets/plugin/timeline/img/cd-icon-picture.svg" alt="Picture">
				</div> 	
				</c:if>	
				<c:if test="${tache.getStatus().equals('nouveau')}">			
				<div class="cd-timeline-img cd-picture" style="border:10px solid red">
					<img src="../assets/plugin/timeline/img/cd-icon-picture.svg" alt="Picture">
				</div> 
				</c:if>	
				<c:if test="${tache.getStatus().equals('termine')}">			
				<div class="cd-timeline-img cd-picture" style="border:10px solid green">
					<img src="../assets/plugin/timeline/img/cd-icon-picture.svg" alt="Picture">
				</div> 
				</c:if>	
				
				<!-- cd-timeline-img -->

				<div class="cd-timeline-content">
					<h2><c:out value="${tache.getLibelle() }" /></h2>
					<p align="justify"><c:out value="${tache.getDescription() }" /></p>
					<a href="#" class="cd-read-more">Lire la suite</a>
					<span class="cd-date">Debut: <c:out value="${tache.getDateD() }" /><br/>
					Fin: <c:out value="${tache.getDateD() }" /><br/>
					<c:if test="${tache.getStatus().equals('en cours')}">			
					<font color="blue">En cours de traitement</font>
					</c:if>	
					<c:if test="${tache.getStatus().equals('nouveau')}">			
					<font color="red">En attente</font>
					</c:if>	
					<c:if test="${tache.getStatus().equals('termine')}">			
					<font color="green">Termine</font>
					</c:if>	
					</span>
					</div> 
				<!-- cd-timeline-content -->
			</div> 
			</c:if>
			</c:forEach>
		</section>
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