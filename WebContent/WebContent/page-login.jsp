<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Home</title>
	<link rel="stylesheet" href="assets/styles/style.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="assets/plugin/waves/waves.min.css">

</head>

<body>
<%
Cookie[] cookies=request.getCookies();
if(cookies!=null)
{
	for(Cookie cookie:cookies)
	{
		if(cookie.getName().equals("nomCollaborateur"))
		{
			response.sendRedirect(request.getContextPath() + "/CollaborateurAdmin.jsp");
		}
	}
}
%>
<div id="single-wrapper">
	<form action="userserv" method="post" class="frm-single">
		<div class="inside">
			<div class="title"><strong>Yo</strong>Projet</div>
			<!-- /.title -->
			<div class="frm-title">Connexion</div>
			<!-- /.frm-title -->
			<!-- Debut erreur valider les champs -->
<%
String erreur;
if(request.getAttribute("erreur")!=null)
{
	erreur=request.getAttribute("erreur").toString();
}
else
{
	erreur="";
}
%>
<%
if(request.getAttribute("erreur")!=null)
{%>
<div class="alert alert-warning alert-dismissible">
<button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong><%=erreur %></strong> 
</div>
<%
}
%>
<!-- Fin erreur valider les champs -->
			<div class="frm-input"><input type="text" name="email" placeholder="Utilisateur" class="frm-inp"><i class="fa fa-user frm-ico"></i></div>
			<!-- /.frm-input -->
			<div class="frm-input"><input type="password" name="password" placeholder="Mot de passe" class="frm-inp"><i class="fa fa-lock frm-ico"></i></div>
			<!-- /.frm-input -->
			<div class="clearfix margin-bottom-20">
				<div class="pull-left">
					<div class="checkbox primary">
					<input type="checkbox" name="sevenir" id="rememberme" value="sevenir">
					<label for="rememberme">Souviens-toi de moi</label></div>
					<!-- /.checkbox -->
				</div>
			</div>
			<input type="hidden" name="connexion" value="connexion"/>
			<button type="submit" class="frm-submit">Se Connecter<i class="fa fa-arrow-circle-right"></i></button>
			<a href="register-client.jsp" class="a-link"><i class="fa fa-key"></i>Nouveau sur YoProjet? S'inscrire..</a>
			<div class="frm-footer">YoProjet Oujda © 2019.</div>
			<!-- /.footer -->
		</div>
		<!-- .inside -->
	</form>
	<!-- /.frm-single -->
</div><!--/#single-wrapper -->

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="assets/script/html5shiv.min.js"></script>
		<script src="assets/script/respond.min.js"></script>
	<![endif]-->
	<!-- 
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/waves/waves.min.js"></script>

	<script src="assets/scripts/main.min.js"></script>
</body>
</html>