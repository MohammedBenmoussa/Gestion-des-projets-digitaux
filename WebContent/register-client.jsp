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

	<title>Inscription</title>
	<link rel="stylesheet" href="assets/styles/style.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="assets/plugin/waves/waves.min.css">
<script language="JavaScript">
 
function affiche_entreprise() 
{

if (document.votre_type.type.selectedIndex == 1)
document.getElementById('form_entreprise').style.display = 'block';
else
document.getElementById('form_entreprise').style.display = 'none';
}
</script>
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

<div id="single-wrapper">
	<form action="userserv" method="post" class="frm-single" name="votre_type">
		<div class="inside">
			<div class="title"><strong>YoProjet</strong> Client</div>
			<!-- /.title -->
			<div class="frm-title">Inscription</div>
			<!-- /.frm-title -->
			
			<div class="frm-input"  >
				<select  id="popover-1" name="type"  class="frm-inp"  OnChange="affiche_entreprise()">
				<option value="Particulier">Particulier</option>
				<option value="Entreprise">Entreprise</option>
				</select>
				<i class="fa fa-envelope frm-ico"></i>
			</div>
			<div class="frm-input">
			<input type="text" placeholder="Nom contact" class="frm-inp" name="nom">
			<i class="fa fa-envelope frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="text" placeholder="Prenom contact" class="frm-inp" name="prenom">
			<i class="fa fa-envelope frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="email" placeholder="Email" class="frm-inp" name="email">
			<i class="fa fa-envelope frm-ico"></i></div>
			
			<!-- /.frm-input -->
			<div class="frm-input">
			<input type="password" placeholder="Mot de passe" class="frm-inp" name="password">
			<i class="fa fa-lock frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="password" placeholder="Répéter mot de passe" class="frm-inp" name="passwordrepeat">
			<i class="fa fa-repeat frm-ico"></i></div>
			
			
			
			<span id="form_entreprise" style="display:none">
			<div class="frm-input">
			<input type="text" placeholder="Société" class="frm-inp" name="nomSociete">
			<i class="fa fa-user frm-ico"></i>
			</div>
			<div class="frm-input">
			<input type="text" placeholder="Registre de commerce" class="frm-inp" name="registre">
			<i class="fa fa-pencil-square-o frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="text" placeholder="Identifiant fiscal" class="frm-inp" name="identifiant">
			<i class="fa fa-pencil frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="text" placeholder="Adresse" class="frm-inp" name="adrssse">
			<i class="fa fa-pencil frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="text" placeholder="Code Postal" class="frm-inp" name="code">
			<i class="fa fa-pencil frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="text" placeholder="Secteur d'activité" class="frm-inp" name="secteur">
			<i class="fa fa-pencil frm-ico"></i></div>
			<div class="frm-input"  >
				<select  id="popover-1"   class="frm-inp" name="typeSociete">
				  	<option value="pme">P.M.E</option>
				    <option value="sa">S.A</option>
				    <option name="sarl">S.A.R.L</option>
				</select>
				<i class="fa fa-pencil frm-ico"></i>
			</div>
			
	
			</span>
			
			<!-- /.frm-input -->
			<div class="clearfix margin-bottom-20">
				<div class="checkbox primary">
				<input type="checkbox" id="accept"><label for="accept">
				J'accepte les termes et conditions
				</label></div>
				<!-- /.checkbox -->
			</div>
			<!-- /.clearfix -->
			<input type="hidden" name="clientajout" value="clientajout" />
			<button type="submit" class="frm-submit" >S'inscrire<i class="fa fa-arrow-circle-right"></i></button>
			
			<!-- /.row -->
			<a href="page-login.jsp" class="a-link"><i class="fa fa-sign-in">
			</i>Vous avez déjà un compte? identifiez-vous.
			</a>
			<div class="frm-footer">YoProjet © 2019.</div>
			<!-- /.footer -->
		</div>
		<!-- .inside -->
	</form>
</div>
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/modernizr.min.js"></script>
	<script src="assets/plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugin/nprogress/nprogress.js"></script>
	<script src="assets/plugin/waves/waves.min.js"></script>

	<script src="assets/scripts/main.min.js"></script>
	<script src="assets/scripts/main.js"></script>
</body>
</html>