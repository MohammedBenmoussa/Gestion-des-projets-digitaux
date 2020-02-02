<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.Client"%>
<%@ page import="com.yoprojet.projet.services.ClientServicesImpl"%>
<%@ page import="com.yoprojet.projet.dao.entite.Metier"%>
<%@ page import="com.yoprojet.projet.services.MetierServiceImpl"%>
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
<%if(trouve==false)%>
<c:redirect url="/page-login.jsp"/>
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
<c:redirect url="<%=p %>"/>
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
			<a href="avatarUpdate/updateAvatarClient.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			ClientServicesImpl adm=new ClientServicesImpl() ;
			Client clt=adm.unique(email);
			String chemin="tmpfiles/"+clt.getAvatar();
			if(!clt.getAvatar().equals("vide"))	
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
			<h5 class="name"><a href="profile.html"> ${sessionScope.prenom} ${sessionScope.nom} </a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile/profileClient.jsp"><i class="fa fa-user"></i> Profil</a></div>
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
					<a class="waves-effect" href="ajouterprojetClient.jsp">
					<i class="menu-icon mdi mdi-folder"></i>
					<span>Ajouter</span></a>
					
				</li>
				<li>
					<a class="waves-effect" href="projetserv?type=projetclientactive">
					<i class="menu-icon mdi mdi-folder-multiple-image"></i>
					<span>Suivi</span></a>
					
				</li>
				<li>
					<a class="waves-effect" href="projetserv?type=projetclient">
					<i class="menu-icon mdi mdi-folder-multiple"></i>
					<span>Liste</span></a>
					
				</li>
				<li>
					<a class="waves-effect" href="projetserv?type=projetclientattente">
					<i class="menu-icon mdi mdi-folder-multiple"></i>
					<span>Projets en attente</span></a>
					
				</li>
				<li>
					<a class="waves-effect " href="projetserv?type=projetclientsituation">
					<i class="menu-icon mdi mdi-chart-areaspline"></i>
					<span>Situation financière</span></a>
				</li>
			</ul>

			<!-- debut obglet 4 -->
			<!-- Titre 4 -->
			<h5 class="title">Contact</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="projetserv?type=messageClient">
					<i class="menu-icon mdi mdi-desktop-mac"></i>
					<span>Messagerie</span></a>
					
				</li>
				<li>
					<a class="waves-effect " href="projetserv?type=notificationclient">
					<i class="menu-icon mdi mdi-chart-areaspline"></i>
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
		<a href="deconnexion.jsp" class="ico-item mdi mdi-logout"></a>
	</div>
</div>
<!-- /.fixed-navbar -->

<div id="notification-popup" class="notice-popup js__toggle" data-space="75">
<h2 class="popup-title">Vos notifications</h2>
	<div class="content">
		<a href="projetserv?type=notificationclient" class="notice-read-more">Voir plus de messages <i class="fa fa-angle-down"></i></a>
	</div>
</div>

<!-- /#notification-popup -->
<div id="message-popup" class="notice-popup js__toggle" data-space="75">
	<h2 class="popup-title">MESSAGES RÉCENTS<a href="message/messageComposerClient.jsp" class="pull-right text-danger">Nouveau message</a></h2>
	<div class="content">
		<a href="projetserv?type=messageClient" class="notice-read-more">Voir plus de messages <i class="fa fa-angle-down"></i></a>
	</div>
</div>


<div id="wrapper">
<div class="main-content">
	<div class="prj-header margin-bottom-30">
		<ul class="filters">
				<li><a class="active" href="#">Ajouter</a></li>
		</ul>
<div class="col-xs-12">
<div class="box-content card white">
<h4 class="box-title" style="text-align: center;">Ajouter le besoin du client</h4>
<div class="card-content">
<form action="projetserv" method="post">
	<div class="form-group col-lg-6 "  >
		<label for="exampleInputEmail1">Description de Projet</label>
		<input type="text" name="description" class="form-control" id="exampleInputEmail1" placeholder="decription du projet...">
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
			<label >Métier</label>
				<select  id="popover-1" name="idMetier" class="form-control" multiple >
					<%
						MetierServiceImpl met1= new MetierServiceImpl();
						Iterator<Metier> metierlist=met1.listMetier().iterator();
						while(metierlist.hasNext())
						{
						Metier m = metierlist.next();
						%>
						
						<option value="<%=m.getId() %>"><%=m.getTechnologie() %></option>
						
								<%} %>
						
						</select>
					</div>
						


	<p>&nbsp;</p>
	
	<input type="hidden" name="ajouterProjetClient" value="ajouterProjetClient" />
	
	<input type="hidden" name="idClient" value="${sessionScope.id}" />
	
	<button type="submit" class="btn btn-primary ">Valider</button>
</form>

</div>
					<!-- /.card-content -->
				</div>
				<!-- /.box-content -->
			</div>
		</div>
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
	<script src="assets/scripts/main.js"></script>

</body>
</html>