package com.yoprojet.projet.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import javax.servlet.http.HttpSession;

import com.yoprojet.projet.dao.entite.BesoinProjet;
import com.yoprojet.projet.dao.entite.Client;
import com.yoprojet.projet.dao.entite.Mail;
import com.yoprojet.projet.dao.entite.Notification;
import com.yoprojet.projet.dao.entite.Tache;
import com.yoprojet.projet.services.BesoinProjetServicesImpl;
import com.yoprojet.projet.services.ClientServicesImpl;
import com.yoprojet.projet.services.MailServiceImpl;
import com.yoprojet.projet.services.NotificationServiceImpl;
import com.yoprojet.projet.services.TacheServiceImpl;
@WebServlet("/Projetservlet")
public class Projetservlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	BesoinProjetServicesImpl beoinService;
	NotificationServiceImpl NotificationService;
	ClientServicesImpl ClientService;
	private Long idProjet;
	TacheServiceImpl tacheser;
    public Projetservlet() {
    	super();
    	tacheser=new TacheServiceImpl();
    	beoinService=new BesoinProjetServicesImpl();
    	NotificationService=new NotificationServiceImpl();
		ClientService=new ClientServicesImpl();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		//String type = request.getServletPath();
		String type=request.getParameter("type");
		
		try {
			switch (type) {
			case "update":
				updateMethode(request, response);
				break;
			case "suivreMethode":
				suivreMethode(request, response);
				break;
			case "nonactive":
				nonactiveMethode(request, response);
				break;
			case "active":
				activeMethode(request, response);
				break;
			case "tousprojet":
				projetMethode(request, response);
				break;
			case "suivre":
				suivreMethode(request, response);
				break;	
			case "suivreclient":
				suivreMethodeClient(request, response);
				break;	
			case "projetclient":
				projetclient(request,response);
				break;
			case "projetclientactive":
				projetclientactive(request,response);
				break;
			case "projetclientattente":
				projetclientattente(request,response);
				break;
			case "factureclient":
				factureclient(request,response);
				break;
			case "projetclientsituation":
				projetclientsituation(request,response);
				break;
			case "messageClient":
				messageClient(request,response);
				break;
			case "messageadmin":
				messageadmin(request,response);
				break;	
			case "messageCollaborateur":
				messageCollaborateur(request,response);
				break;
			case "messageChef":
				messageChef(request,response);
				break;
			case "messageClientEnvoie":
				messageClientEnvoie(request,response);
				break;
			case "messageadminEnvoie":
				messageadminEnvoie(request,response);
				break;	
			case "messageCollaborateurEnvoie":
				messageCollaborateurEnvoie(request,response);
				break;
			case "messageChefEnvoie":
				messageChefEnvoie(request,response);
				break;
			case "liremailclient":
				liremailclient(request,response);
				break;		
			case "notificationadmin":
				notificationadmin(request,response);
				break;
			case "notificationclient":
				notificationclient(request,response);
				break;
			
			default:
				//listUser(request, response);
				break;
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		if(request.getParameter("ajouterProjetClient")!=null)
		{
			String description=request.getParameter("description");
			Long idClient=Long.parseLong(request.getParameter("idClient"));
			String nomComplet=request.getParameter("nomComplet");
			String nomCourt=request.getParameter("nomCourt");
			Long idMetier=Long.parseLong(request.getParameter("idMetier"));
			//int coutEstime=Integer.parseInt(request.getParameter("amount-3"));
			int coutEstime=1000;
			beoinService.ajouterBesoinProjet(new BesoinProjet(description, idClient, nomComplet, nomCourt, idMetier,coutEstime));
			response.sendRedirect(request.getContextPath() + "/clientAccueil.jsp");
			}
		
		if(request.getParameter("affecterChef")!=null)
		{
			double budget=Double.parseDouble(request.getParameter("budget"));
			String dateD=request.getParameter("dateD");
			String dateF=request.getParameter("dateF");
			Long idProjet=Long.parseLong(request.getParameter("idProjet"));
			Long idChef=Long.parseLong(request.getParameter("idChef"));
			String status="en attente";
			
			BesoinProjet p=beoinService.rechercherBesoinProjetId(idProjet);
			p.setIdChef(idChef);
			p.setBudget(budget);
			beoinService.activeProjet(p);
			response.sendRedirect(request.getContextPath() + "/adminAccueil.jsp");
		}
		if(request.getParameter("notification")!=null)
		{
			int idClient=Integer.parseInt(request.getParameter("idClient"));
			String description=request.getParameter("description");
			NotificationService.ajouterNotification(new Notification(idClient,"01/01/2020",description,0));
			response.sendRedirect(request.getContextPath() + "/projetserv?type=notificationadmin");
			
		}
		
	}
	/*------------------ Update projet nonactive  ver active ------------*/
	private void updateMethode(HttpServletRequest request, HttpServletResponse response)
		throws SQLException, IOException, ServletException {
		idProjet=Long.parseLong(request.getParameter("id"));
		BesoinProjet p=beoinService.rechercherBesoinProjetId(idProjet);
		p.setActive(1);
		beoinService.activeProjet(p);
		response.sendRedirect(request.getContextPath() + "/projet/chefAffecterProjet.jsp?id="+idProjet);
	}
	/*-----------------  active  timeline d'un projet --------------------*/
	private void suivreMethode(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		idProjet=Long.parseLong(request.getParameter("id"));
		int idchef=Integer.parseInt(request.getParameter("idchef"));
		int idclient=Integer.parseInt(request.getParameter("idclient"));
		//System.out.println(idProjet);
		HttpSession session = request.getSession();
		List<Tache> listeTache=tacheser.listTache();
		List<BesoinProjet> listeProjet=beoinService.listBesoinProjet();
		session.setAttribute("listeProjetChef", listeProjet);
		session.setAttribute("listetache", listeTache);
		session.setAttribute("idProjet", idProjet);
		response.sendRedirect(request.getContextPath() + "/projet/timeline.jsp?id="+idProjet+"&idclient="+idclient+"&idchef="+idchef);
		
	}
	/*----------------- non active projet --------------------*/
	private void nonactiveMethode(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		BesoinProjetServicesImpl projetService=new BesoinProjetServicesImpl() ;
		List<BesoinProjet> liste = projetService.listBesoinProjet();
		session.setAttribute("listenon", liste);
		response.sendRedirect(request.getContextPath() + "/projet/projetsnonactiveListe.jsp");

	}
	
	/*-----------------  active projet --------------------*/

	private void activeMethode(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		BesoinProjetServicesImpl projetService=new BesoinProjetServicesImpl() ;
		List<BesoinProjet> liste = projetService.listBesoinProjet();
		session.setAttribute("listeactive", liste);
		response.sendRedirect(request.getContextPath() + "/projet/projetactiveListe.jsp");

	}
	/*---------------------- tous les projet ------------------*/
	
	private void projetMethode(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		BesoinProjetServicesImpl projetService=new BesoinProjetServicesImpl() ;
		List<BesoinProjet> liste = projetService.listBesoinProjet();
		session.setAttribute("listeprojet", liste);
		response.sendRedirect(request.getContextPath() + "/projet/projetListe.jsp");

	}
	/*---------------------- tous les projet client------------------*/
	private void projetclient(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		BesoinProjetServicesImpl projetService=new BesoinProjetServicesImpl() ;
		List<BesoinProjet> liste = projetService.listBesoinProjet();
		session.setAttribute("listeprojet", liste);
		response.sendRedirect(request.getContextPath() + "/client/projet.jsp");

	}
	private void projetclientactive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		BesoinProjetServicesImpl projetService=new BesoinProjetServicesImpl() ;
		List<BesoinProjet> liste = projetService.listBesoinProjet();
		session.setAttribute("listeprojet", liste);
		response.sendRedirect(request.getContextPath() + "/client/projetactive.jsp");

	}
	private void projetclientattente(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		BesoinProjetServicesImpl projetService=new BesoinProjetServicesImpl() ;
		List<BesoinProjet> liste = projetService.listBesoinProjet();
		session.setAttribute("listeprojet", liste);
		response.sendRedirect(request.getContextPath() + "/client/projetattente.jsp");

	}
	private void suivreMethodeClient(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		idProjet=Long.parseLong(request.getParameter("id"));
		int idchef=Integer.parseInt(request.getParameter("idchef"));
		int idclient=Integer.parseInt(request.getParameter("idclient"));

		HttpSession session = request.getSession();
		List<Tache> listeTache=tacheser.listTache();
		List<BesoinProjet> listeProjet=beoinService.listBesoinProjet();
		session.setAttribute("listeProjetChef", listeProjet);
		session.setAttribute("listetache", listeTache);
		session.setAttribute("idProjet", idProjet);
		response.sendRedirect(request.getContextPath() + "/projet/timelineclient.jsp?id="+idProjet+"&idclient="+idclient+"&idchef="+idchef);
		
	}
	private void factureclient(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		idProjet=Long.parseLong(request.getParameter("id"));
		long idclient=Long.parseLong(request.getParameter("idclient"));
		/*debut date systeme*/
		Calendar cal=new GregorianCalendar();
		int minute=cal.get(Calendar.MINUTE);
		int heure=cal.get(Calendar.HOUR);
		
		int jour=cal.get(Calendar.DAY_OF_MONTH);
		int mois=cal.get(Calendar.MONTH);mois++;
		int annee=cal.get(Calendar.YEAR);
		String datef=jour+"/"+mois+"/"+annee;
		/*fin date systeme*/
		HttpSession session = request.getSession();
		Client clt=ClientService.rechercherClientId(idclient);
		session.setAttribute("client", clt);
		
		List<BesoinProjet> listeProjet=beoinService.listBesoinProjet();
		session.setAttribute("listeProjet", listeProjet);
		session.setAttribute("idProjet", idProjet);
		session.setAttribute("date", datef);
		response.sendRedirect(request.getContextPath() + "/client/factureclient.jsp?id="+idProjet+"&idclient="+idclient);
		
	}
	private void projetclientsituation(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		BesoinProjetServicesImpl projetService=new BesoinProjetServicesImpl() ;
		List<BesoinProjet> liste = projetService.listBesoinProjet();
		session.setAttribute("listeprojet", liste);
		response.sendRedirect(request.getContextPath() + "/client/finance.jsp");
		
	}
	/*******************Message boite *************************/
	private void messageClient(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailclient=mail.listMail();
		session.setAttribute("listEmailclient", listEmailclient);
		response.sendRedirect(request.getContextPath() + "/message/messageClient.jsp");
		
	}
	private void messageadmin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailadmin=mail.listMail();
		session.setAttribute("listEmailadmin", listEmailadmin);
		response.sendRedirect(request.getContextPath() + "/message/messageAdmin.jsp");
		
	}
	private void messageCollaborateur(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailcollaborateur=mail.listMail();
		session.setAttribute("listEmailcollaborateur", listEmailcollaborateur);
		response.sendRedirect(request.getContextPath() + "/message/messageCollaborateur.jsp");
		
	}
	private void messageChef(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailChef=mail.listMail();
		session.setAttribute("listEmailChef", listEmailChef);
		response.sendRedirect(request.getContextPath() + "/message/messageChef.jsp");
		
	}
	/*************************** Evoie message ************************/
	private void messageadminEnvoie(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailadmin=mail.listMail();
		session.setAttribute("listEmailadmin", listEmailadmin);
		response.sendRedirect(request.getContextPath() + "/message/envoieAdmin.jsp");
		
	}
	private void messageClientEnvoie(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailclient=mail.listMail();
		session.setAttribute("listEmailclient", listEmailclient);
		response.sendRedirect(request.getContextPath() + "/message/envoieClient.jsp");
		
	}
	private void messageCollaborateurEnvoie(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailCollaborateur=mail.listMail();
		session.setAttribute("listEmailCollaborateur", listEmailCollaborateur);
		response.sendRedirect(request.getContextPath() + "/message/envoieCollaborateur.jsp");
		
	}
	private void messageChefEnvoie(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailChef=mail.listMail();
		session.setAttribute("listEmailChef", listEmailChef);
		response.sendRedirect(request.getContextPath() + "/message/envoieChef.jsp");
		
	}
	private void liremailclient(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int idmessage=Integer.parseInt(request.getParameter("idmessage"));
		HttpSession session = request.getSession();
		MailServiceImpl mail= new MailServiceImpl();
		List<Mail> listEmailChef=mail.listMail();
		session.setAttribute("mail", listEmailChef);
		session.setAttribute("idmessage", idmessage);
		response.sendRedirect(request.getContextPath() + "/message/lire-email-client.jsp");
		
	}
	private void notificationadmin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		NotificationServiceImpl mail= new NotificationServiceImpl();
		List<Notification> listNotificationAdmin=mail.listNotification();
		session.setAttribute("listNotificationAdmin", listNotificationAdmin);
		
		response.sendRedirect(request.getContextPath() + "/client/notificationAdmin.jsp");
		
	}
	private void notificationclient(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		HttpSession session = request.getSession();
		NotificationServiceImpl mail= new NotificationServiceImpl();
		List<Notification> listNotificationClient=mail.listNotification();
		session.setAttribute("listNotificationClient", listNotificationClient);
		
		response.sendRedirect(request.getContextPath() + "/client/notification.jsp");
		
	}
	

}
