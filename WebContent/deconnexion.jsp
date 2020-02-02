<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Refresh" Content = "1; URL=deconnexion.jsp">
<title>Insert title here</title>
<script src="js/backNoWork.js" type="text/javascript"></script>
</head>
<body>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);
session.invalidate();

Cookie[] cookies=request.getCookies();
if(cookies!=null)
{
	for(Cookie cookie:cookies)
	{
		if(cookie.getName().equals("nom"))
		{
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		else if(cookie.getName().equals("prenom"))
		{
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		else if(cookie.getName().equals("privilige"))
		{
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
	response.sendRedirect(request.getContextPath() + "/page-login.jsp");
}
%>

</body>
</html>