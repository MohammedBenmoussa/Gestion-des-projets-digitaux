<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<c:if test="${!empty sessionScope.privilige}">
<c:redirect url="<%=p %>"/>
</c:if>

<h1><%=p %></h1>
<div id="single-wrapper">
	<form action="userserv" method="post" class="frm-single">
		<div class="inside">
			<div class="title"><strong>Yo</strong>Projet</div>
			<div class="frm-title">Connexion</div>
 <c:if test="${!empty sessionScope.erreur}">
<div class="alert alert-warning alert-dismissible">
<button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>
 ${sessionScope.erreur}
  </strong> 
</div>
</c:if>
			<div class="frm-input"><input type="text" name="email" placeholder="Utilisateur" class="frm-inp"><i class="fa fa-user frm-ico"></i></div>
			<div class="frm-input"><input type="password" name="password" placeholder="Mot de passe" class="frm-inp"><i class="fa fa-lock frm-ico"></i></div>
			<div class="clearfix margin-bottom-20">
				<div class="pull-left">
					<div class="checkbox primary">
					<input type="checkbox" name="sevenir" id="rememberme" value="sevenir">
					<label for="rememberme">Souviens-toi de moi</label></div>
				</div>
			</div>
			<input type="hidden" name="connexion" value="connexion"/>
			<button type="submit" class="frm-submit">Se Connecter<i class="fa fa-arrow-circle-right"></i></button>
			<a href="register-client.jsp" class="a-link"><i class="fa fa-key"></i>Nouveau sur YoProjet? S'inscrire..</a>
			<div class="frm-footer">YoProjet Oujda © 2019.</div>
			<!-- /.footer -->
		</div>
	</form>
</div>
<%
session.invalidate();
%>

	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/waves/waves.min.js"></script>

	<script src="assets/scripts/main.min.js"></script>
	<script src="assets/scripts/main.js"></script>
</body>
</html>