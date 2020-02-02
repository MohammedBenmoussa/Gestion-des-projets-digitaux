<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="com.yoprojet.projet.dao.entite.ChefDeProjet"%>
	<%@ page import="com.yoprojet.projet.services.ChefDeProjetServiceImpl"%>
    <%@ page import="com.yoprojet.projet.dao.entite.BesoinProjet"%>
	<%@ page import="com.yoprojet.projet.services.BesoinProjetServicesImpl"%>
	<%@ page import="com.yoprojet.projet.dao.entite.Collaborateur"%>
	<%@ page import="com.yoprojet.projet.services.CollaborateurServicesImpl"%>
	
	<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="Expires" content="0" />
	 <!-- <META http-equiv="refresh" content="20; URL=adminAccueil.jsp">-->
	
	
	<title>Accueil - Espace Administrateur</title>
	<!-- Style principal -->
	<link rel="stylesheet" href="assets/styles/style.min.css">
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
</HEAD>
<body>
<%
Cookie[] cookies=request.getCookies();
boolean trouve=false;
String nom="";
String prenom="";
String privilige="";
String p="/page-login.jsp";
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
<c:if test="${sessionScope.privilige!='Chef de projet'}">
<c:redirect url="<%=p %>"/>
</c:if>

<div class="main-menu">

	<header class="header">
		<a href="ChefAccueil.jsp" class="logo"><i class="ico mdi mdi-animation"></i>Espace Chef de projet</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="avatarUpdate/updateAvatarChef.jsp" class="avatar">
			<%
			String email = (String) session.getAttribute("email1");
			ChefDeProjetServiceImpl adm=new ChefDeProjetServiceImpl() ;
			ChefDeProjet chef=adm.unique(email);
			String chemin="tmpfiles/"+chef.getAvatar();
			if(chef.getAvatar().equals("vide"))	
			{
			%>
			<img src="assets/images/avatar-1.jpg"/>
			<%
			}else{
				%>
				<img src="<%=chemin %>"/>
				<% 
				}
			%>
			<span class="status online"></span></a>
			<h5 class="name"><a href="profile.html">${sessionScope.prenom} ${sessionScope.nom}</a></h5>
			<h5 class="position">${sessionScope.privilige}</h5>
			
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item"><a href="profile/profilechef.jsp"><i class="fa fa-user"></i> Profil</a></div>
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
					<a class="waves-effect" href="ChefAccueil.jsp"><i class="menu-icon mdi mdi-view-dashboard"></i>
					<span>Tableau de bord</span></a>
				</li>
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
						<li><a href="#">Gestion de Projet</a></li>
						<li><a href="#">Getion des Tâches</a></li>
						<li><a href="#">Situation financière</a></li>
					</ul>
				</li>
			</ul>
			

			<!-- debut obglet 2 -->
			<!-- Titre 2 -->
			
			
			
			<!-- Fin Onglet 4 -->
			
			
			<!-- debut obglet 3 -->
			<!-- Titre 3 -->
			<h5 class="title">Réseaux</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="partenaire/co-equipier.jsp"><i class="menu-icon ico mdi mdi-account-switch"></i>
					<span>Co-équipier</span></a>
				</li>
			</ul>
			<!-- Fin Onglet 3 -->
			<!-- debut obglet 4 -->
			<!-- Titre 4 -->
			<h5 class="title">Contact</h5>
			<ul class="menu js__accordion">
				<li>
					<a class="waves-effect" href="projetserv?type=messageChef"><i class="menu-icon mdi mdi-email"></i>
					<span>Mail</span></a>
				</li>
			</ul>
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
					<h4 class="box-title text-info">Nouveaux projets</h4>
					<!-- /.box-title -->
										<%
										Long id=(Long)session.getAttribute("id");
										BesoinProjetServicesImpl met= new BesoinProjetServicesImpl();
										Iterator<BesoinProjet> metierlist=met.listBesoinProjet().iterator();
										int projetChef=0;
										int pourcentage=0;
										while(metierlist.hasNext())
										{
											BesoinProjet b = metierlist.next();
											System.out.println(b.getIdChef()+" ===> "+id);
											
											if(b.getIdChef()== id.longValue())
											{
												projetChef++;
											}
											
										} 
										pourcentage=projetChef*10;
								metierlist.remove();
								%>
					<div class="task-lists">
						<a href="tache?status=nouveau&type=chef" class="task-item">
							<div class="title">L'ensemble de tache de mes nouveaux projets </div>
							<!-- /.title -->
							<div class="progress">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=projetChef %>" aria-valuemin="0" aria-valuemax="10" style="width: <%=pourcentage %>%;"></div>
							</div>
							<div class="metas">
								<div class="meta"><i class="fa fa-check-square-o ico"></i>
								<%=projetChef %>/10</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>

						<a href="#" class="task-item">
							<div class="title">Les messages apropos de mes nouveaux taches. </div>
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
					<div class="text-center">
					<button type="button" class="btn btn-default waves-effect waves-light" data-toggle="modal" data-target="#addTask">
					+ Add New
					</button>
					</div>
				</div>
				<!-- /.box-content -->
			</div>
			<!-- /.col-lg-4 col-xs-12 -->

			<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-warning">Projets A faire</h4>
					<!-- /.box-title -->
				
					<!-- /.dropdown js__dropdown -->
					<div class="task-lists">
						<a href="tache?status=en cours&type=chef" class="task-item">
							<div class="title">L'ensemble des taches de mes projets en cours de préparation</div>
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
						</a>
						<a href="#" class="task-item">
							<div class="title">Les messages apropos de mes taches en cours de préparation. </div>
							<!-- /.title -->
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>14</div>
							</div>
						</a>
					</div>
				</div>
			</div>


			<div class="col-lg-4 col-xs-12">
				<div class="box-content">
					<h4 class="box-title text-success">Projets Terminé</h4>
					<div class="task-lists">
					
						<a href="tache?status=termine&type=chef" class="task-item">
							<div class="title">L'ensemble des taches de mes projets terminés .</div>
							<div class="progress">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
							</div>
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>1</div>
								<div class="meta"><i class="fa fa-paperclip ico"></i>2</div>
							</div>
						</a>
						<a href="#" class="task-item">
							<div class="title">Les messages apropos de mes taches terminés</div>
							<!-- /.title -->
							<div class="metas">
								<div class="meta"><i class="fa fa-comment-o ico"></i>14</div>
								<!-- /.meta -->
							</div>
							<!-- /.metas -->
						</a>
					</div>
				</div>
			</div>
		</div>

	
	<div class="row small-spacing">
	<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="box-content card danger">

					<div class="card-content">
					
			<div class="col-lg-4 col-xs-12">
			<a href="partenaire/co-equipier.jsp">
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-group"></i>
						<p class="text text-white">Collaborateurs</p>
						
						<h2 class="counter">44</h2>
					</div>
				</div>
			</a>
			</div>
				
	
			<div class="col-lg-4 col-xs-12">
				<a href="#">				
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-pie-chart"></i>
						<p class="text text-white">Etats financiers</p>
											
						<h2 class="counter">55</h2>
					</div>
				</div>
				</a>	
			</div>
	
			<div class="col-lg-4 col-xs-12">
			<a href="projetserv?type=messageChef">
				<div class="box-content bg-info text-white">
					<div class="statistics-box with-icon">
						<i class="ico small fa fa-envelope"></i>
						<p class="text text-white">Messagerie</p>
						
						<h2 class="counter">66</h2>
					</div>
				</div>
				</a>
			</div>
			</div></div></div>
		</div><br>
	</div>
</div>
<!--/#wrapper -->
<div class="modal fade" id="addTask" tabindex="-1" role="dialog" aria-labelledby="addTaskLabel">
	<div class="modal-dialog" role="document">
	<form action="tache" method="post">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="addTaskLabel">Ajouter une tâche</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
					<div class="form-group"><label for="taskName">Nom de la tâche</label>
						<input type="text" id="taskName" class="form-control" name="libelle"></div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-1">Affecter par</label>
						<select name="idCollaborateur" id="frm-1" class="form-control">
						<%
									
										CollaborateurServicesImpl coll1= new CollaborateurServicesImpl();
										List<Collaborateur> collalist1=coll1.listCollaborateur();
										for(Collaborateur b:collalist1)
										{
										%>
										<option value="<%=b.getId()%>"><%=b.getPrenom() %> <%=b.getNom() %></option>	
										
										<%
										} 
								%>
						</select>
					</div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-2">Projet</label>
						<select name="idProjet" id="frm-2" class="form-control">
						<%
									
										BesoinProjetServicesImpl met1= new BesoinProjetServicesImpl();
										Iterator<BesoinProjet> metierlist1=met1.listBesoinProjet().iterator();

										while(metierlist1.hasNext())
										{
										BesoinProjet b = metierlist1.next();
											
										if(b.getIdChef()== id.longValue())
										{
										%>
										<option value="<%=b.getId()%>"><%=b.getId()%>- <%=b.getNomComplet() %></option>	
										
										<%
										}
										} 
								%>
						</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-3">Date debut</label>
						<input type="text" id="frm-3" class="form-control" name="dateD"></div>
					</div>
					<div class="col-md-6">
						<div class="form-group"><label for="frm-4">Date Fin</label>
						<input type="text" id="frm-4" class="form-control" name="dateF"></div>
					</div>
					<div class="col-md-12">
						<div class="form-group"><label for="frm-5">Description</label>
						<textarea rows="30" cols="10" id="frm-5" class="form-control" name="description"></textarea>
					</div>
				</div>
			</div>
			<input type="hidden" name="idChef" value="${sessionScope.id }">
			<input type="hidden" name="ajouter" value="ajouter">
			<div class="modal-footer">
				<button type="button" class="btn btn-default waves-effect waves-light" data-dismiss="modal">Fermer</button>
				<input  type="submit" class="btn btn-primary" value="Valider"/>
			</div>
		</div>
		</fom>
	</div>
</div>
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="assets/scripts/main.min.js"></script>	
	<script src="assets/scripts/main.js"></script>
	
	
</body>
</html>