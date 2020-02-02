<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Refresh" Content = "1; URL=deconnexion.jsp">
<title>Insert title here</title>
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
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		else if(cookie.getName().equals("prenomCollaborateur"))
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