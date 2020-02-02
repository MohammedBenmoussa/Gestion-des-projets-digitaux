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

	<title>Inscription</title>
	<link rel="stylesheet" href="assets/styles/style.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="assets/plugin/waves/waves.min.css">

</head>

<body>

<div id="single-wrapper">
	<form action="userserv" method="post" class="frm-single">
		<div class="inside">
			<div class="title"><strong>YoProjet</strong> Client</div>
			<!-- /.title -->
			<div class="frm-title">Inscription</div>
			<!-- /.frm-title -->
			<div class="frm-input">
			<input type="text" placeholder="Société" class="frm-inp" name="nom">
			<i class="fa fa-user frm-ico"></i>
			</div>
			<div class="frm-input">
			<input type="text" placeholder="Registre de commerce" class="frm-inp">
			<i class="fa fa-pencil-square-o frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="text" placeholder="Identifiant fiscal" class="frm-inp">
			<i class="fa fa-pencil frm-ico"></i></div>
			
			<!-- /.frm-input -->
			<div class="frm-input">
			<input type="text" placeholder="Contact" class="frm-inp">
			<i class="fa fa-user frm-ico"></i></div>
			<div class="frm-input">
			<input type="email" placeholder="Email" class="frm-inp" name="email">
			<i class="fa fa-envelope frm-ico"></i></div>
			
			<!-- /.frm-input -->
			<div class="frm-input">
			<input type="password" placeholder="Mot de passe" class="frm-inp" name="password">
			<i class="fa fa-lock frm-ico"></i></div>
			
			<div class="frm-input">
			<input type="password" placeholder="Répéter mot de passe" class="frm-inp">
			<i class="fa fa-repeat frm-ico"></i></div>
			
			<!-- /.frm-input -->
			<div class="clearfix margin-bottom-20">
				<div class="checkbox primary">
				<input type="checkbox" id="accept"><label for="accept">
				J'accepte les termes et conditions
				</label></div>
				<!-- /.checkbox -->
			</div>
			<!-- /.clearfix -->
			<input type="hidden" name="registre" value="registre" />
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
</body>
</html>