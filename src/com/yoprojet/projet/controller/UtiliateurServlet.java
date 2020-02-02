	package com.yoprojet.projet.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.GreaterThanOperator;

import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.dao.entite.ChefDeProjet;
import com.yoprojet.projet.dao.entite.Client;
import com.yoprojet.projet.dao.entite.Collaborateur;
import com.yoprojet.projet.dao.entite.Education;
import com.yoprojet.projet.dao.entite.Experience;
import com.yoprojet.projet.dao.entite.Mail;
import com.yoprojet.projet.services.AdminServiceImpl;
import com.yoprojet.projet.services.ChefDeProjetServiceImpl;
import com.yoprojet.projet.services.ClientServicesImpl;
import com.yoprojet.projet.services.CollaborateurServicesImpl;
import com.yoprojet.projet.services.EducationServiceImpl;
import com.yoprojet.projet.services.ExperienceServiceImpl;
import com.yoprojet.projet.services.MailServiceImpl;
import com.yoprojet.projet.util.MD5;
@WebServlet("/UtiliateurServlet")
public class UtiliateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClientServicesImpl cltService;
	CollaborateurServicesImpl collaService;
	AdminServiceImpl admService;
	ChefDeProjetServiceImpl cdpService; 
	MailServiceImpl mailService;
	EducationServiceImpl eduService;
	ExperienceServiceImpl expService;
	
	String url="";
	
     public UtiliateurServlet() {
        super();
        cltService=new  ClientServicesImpl();
        collaService=new CollaborateurServicesImpl();
        admService = new AdminServiceImpl();
        cdpService = new ChefDeProjetServiceImpl();
        mailService=new MailServiceImpl();
        eduService=new EducationServiceImpl();
        expService=new ExperienceServiceImpl();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(request.getParameter("clientajout")!=null){
			String prenom = request.getParameter("prenom");
			String nom = request.getParameter("nom");
			String email = request.getParameter("email");
			String password = MD5.encode(request.getParameter("password"));
			String type = request.getParameter("type");
			
			if(type.equalsIgnoreCase("particulier")){
				Client c=new Client(email,password,prenom,nom);
				cltService.ajouterClient(c);
			}else
			{
				String nomSociete = request.getParameter("nomSociete");
				String registre = request.getParameter("registre");
				String identifiant = request.getParameter("identifiant");
				String adrssse = request.getParameter("adrssse");
				String code = request.getParameter("code");
				String secteur = request.getParameter("secteur");
				String typeSociete = request.getParameter("typeSociete");
				Client c=new Client(prenom, nom, email, password,type, nomSociete, registre,identifiant, adrssse, code, secteur,typeSociete);
				cltService.ajouterClient(c);
			}
			response.sendRedirect(request.getContextPath() +"/page-login.jsp");
		}
	 
		//------------------------- Collaborateur --------------------------------
		if(request.getParameter("collaborateurajout")!=null)
		{
			String nom=request.getParameter("nom");
			String email=request.getParameter("email");
			String prenom=request.getParameter("prenom");
			String ville=request.getParameter("ville");
			String pays=request.getParameter("pays");
			String dateN=request.getParameter("dateN");
			String titre=request.getParameter("titre");
			String telephone=request.getParameter("telephone");
			String interet=request.getParameter("interet");
			String password=MD5.encode(request.getParameter("password"));
			String repeatpassword=MD5.encode(request.getParameter("repeatpassword"));
			String facebook=request.getParameter("facebook");
			String twitter=request.getParameter("twitter");
			String googleplus=request.getParameter("googleplus");
			String privilige=request.getParameter("privilige");
			String photo=request.getParameter("photo");
			
			
			
			if(cltService.unique(email)==null && collaService.unique(email)==null &&
					admService.unique(email)==null && cdpService.unique(email)==null	)
			{
				if(privilige.equalsIgnoreCase("Chef de projet")) 
				{
				cdpService.ajouterChefDeProjet(new ChefDeProjet(email,prenom,nom,ville,pays,dateN,titre,telephone,interet,password,facebook,twitter,googleplus,privilige,photo));
				request.setAttribute("modele", "Ajouter avec succes");
				request.getRequestDispatcher("Gcollaborateur.jsp").forward(request, response);
				}
				else if(privilige.equalsIgnoreCase("collaborateur")) 
				{
				collaService.ajouterCollaborateur(new Collaborateur(email,prenom,nom,ville,pays,dateN,titre,telephone,interet,password,facebook,twitter,googleplus,privilige,photo));
				request.setAttribute("modele", "Ajouter avec succes");
				request.getRequestDispatcher("Gcollaborateur.jsp").forward(request, response);
				}
			}else
			{
				request.setAttribute("modele", "Déja trouve dans la bae de données");
				request.getRequestDispatcher("Gcollaborateur.jsp").forward(request, response);
			}
		}
	/****************************************************Fin Collaborateur*******************************************************/	
		
		
		/********************************** connexion *****************************************/
			if(request.getParameter("connexion")!=null)
			{
				String email=request.getParameter("email");
				String password=MD5.encode(request.getParameter("password"));
				String b=request.getParameter("sevenir");
				
				//System.out.println(b);
				Object c=null;
				String nom="";
				String prenom="";
				String privilige="";
				String email1="";
				Long id=0l;
				
				
				if(collaService.Connexion(email, password)!=null) 
				{ 
				c=new Object();
				c=(Collaborateur)collaService.Connexion(email, password);
				id=((Collaborateur) c).getId();
				nom=((Collaborateur) c).getNom();
				prenom=((Collaborateur) c).getPrenom();
				privilige= ((Collaborateur) c).getPrivilige();
				email1= ((Collaborateur) c).getEmail();
				url="CollaborateurAccueil";
				}
				
				else if(cltService.Connexion(email, password)!=null) 
				{ 
				c=new Object();
				c=(Client)cltService.Connexion(email, password);
				id=((Client) c).getId();
				nom=((Client) c).getNom();
				prenom=((Client) c).getPrenom();
				privilige= ((Client) c).getPrivilige();
				email1= ((Client) c).getEmail();
				url="clientAccueil";
				}
				
				else if(admService.Connexion(email, password)!=null) 
				{
				c=new Object();
				c=(Admin)admService.Connexion(email, password);
				id=(long) ((Admin) c).getId();
				nom=((Admin) c).getNom();
				prenom=((Admin) c).getPrenom();
				privilige= ((Admin) c).getPrivilege();
				email1= ((Admin) c).getEmail();
				url="adminAccueil";
				}
				
				else if(cdpService.Connexion(email, password)!=null) 
				{ 
				c=new Object();
				c=(ChefDeProjet)cdpService.Connexion(email, password);
				id=((ChefDeProjet) c).getId();
				nom=((ChefDeProjet) c).getNom();
				prenom=((ChefDeProjet) c).getPrenom();
				privilige= ((ChefDeProjet) c).getPrivilige();
				email1= ((ChefDeProjet) c).getEmail();
				url="ChefAccueil";
				}
				else
				{
					url="page-login";
				}

					if(c!=null)
					{
						if(b!=null) 
						{
						Cookie cookie1=new Cookie("nom", nom);
						Cookie cookie2=new Cookie("prenom",prenom);
						Cookie cookie3=new Cookie("privilige", privilige);
						Cookie cookie4=new Cookie("id", id+"");
						Cookie cookie5=new Cookie("email1", email1);
						
						
						cookie1.setMaxAge(60*60*24*30);
						cookie2.setMaxAge(60*60*24*30);
						cookie3.setMaxAge(60*60*24*30);
						cookie4.setMaxAge(60*60*24*30);
						cookie5.setMaxAge(60*60*24*30);
						
						
						response.addCookie(cookie1);
						response.addCookie(cookie2);
						response.addCookie(cookie3);
						response.addCookie(cookie4);
						response.addCookie(cookie5);
						
						
						session.setAttribute("nom", nom);
						session.setAttribute("prenom", prenom);
						session.setAttribute("privilige", privilige);
						session.setAttribute("email1", email1);
						session.setAttribute("id", id);

						response.sendRedirect(request.getContextPath() +"/"+url+".jsp");
						}else {
							session.setAttribute("nom", nom);
							session.setAttribute("prenom", prenom);
							session.setAttribute("privilige", privilige);
							session.setAttribute("email1", email1);
							session.setAttribute("id", id);

							response.sendRedirect(request.getContextPath() +"/"+url+".jsp");
							
						}
				}else
				{
					session.setAttribute("erreur", "E-mail ou mot de passe incorrect");
					response.sendRedirect(request.getContextPath() +"/"+url+".jsp");

				}
				
			}
			
			if(request.getParameter("profilExperience")!=null){
				String intitule=request.getParameter("intitule");
				String organiation=request.getParameter("organiation");
				String dateD=request.getParameter("dateD");
				String dateF=request.getParameter("dateF");
				
				
				
				
				
			}
			if((request.getParameter("profilEducation")!=null) || (request.getParameter("profilExperience")!=null)){
				
				long idCollaborateur=(Long) session.getAttribute("id");
				String privilige=(String) session.getAttribute("privilige");
				
				String intitule=request.getParameter("intitule");
				String organisation=request.getParameter("organiation");
				String dateD=request.getParameter("dateD");
				String dateF=request.getParameter("dateF");
				
				if(request.getParameter("profilEducation")!=null){
				Education e=new Education(intitule,organisation, dateD,dateF,idCollaborateur,privilige);
				eduService.ajouterEducation(e);
				}
				if(request.getParameter("profilExperience")!=null){
				Experience e=new Experience(intitule,organisation, dateD,dateF,idCollaborateur,privilige);
				expService.ajouterExperience(e);
				}
				if(privilige.equalsIgnoreCase("client"))
				response.sendRedirect(request.getContextPath() +"/profile/profileClient.jsp");
				
				if(privilige.equalsIgnoreCase("collaborateur"))
				response.sendRedirect(request.getContextPath() +"/profile/profileCollaborateur.jsp");
				
				if(privilige.equalsIgnoreCase("chef de projet"))
				response.sendRedirect(request.getContextPath() +"/profile/profilechef.jsp");
				
			}
			
			if(request.getParameter("SendMail")!=null){
				
				long id=(Long) session.getAttribute("id");
				String priviligeEmetteur=(String) session.getAttribute("privilige");
				
				String distinataire=request.getParameter("distinataire");
				Long idDistinataire=0l;
				String priviligeDistinataire="";
				//rechercher ID de destiataire par mail
				if(collaService.unique(distinataire)!=null){
					Collaborateur c=collaService.unique(distinataire);
					idDistinataire=c.getId();
					priviligeDistinataire=c.getPrivilige();
				}else if(cltService.unique(distinataire)!=null)
				{
					Client c=cltService.unique(distinataire);
					idDistinataire=c.getId();
					priviligeDistinataire=c.getPrivilige();
					
				}else if(admService.unique(distinataire)!=null)
				{
					Admin a=admService.unique(distinataire);
					idDistinataire=a.getId();
					priviligeDistinataire=a.getPrivilige();
				}else if(cdpService.unique(distinataire)!=null){
					ChefDeProjet cdp=cdpService.unique(distinataire);
					idDistinataire=cdp.getId();
					priviligeDistinataire=cdp.getPrivilige();
				}

				String objet=request.getParameter("objet");
				String message=request.getParameter("message");
				Long emetteur=id;
				/*debut date systeme*/
					Calendar cal=new GregorianCalendar();
					int minute=cal.get(Calendar.MINUTE);
					int heure=cal.get(Calendar.HOUR);
					
					int jour=cal.get(Calendar.DAY_OF_MONTH);
					int mois=cal.get(Calendar.MONTH);mois++;
					int annee=cal.get(Calendar.YEAR);
					System.out.println(jour+"/"+mois+"/"+annee);
				/*fin date systeme*/
				String date=jour+"/"+mois+"/"+annee+"-"+heure+":"+minute; 
				String status="non lu";
				mailService.ajouterMail(new Mail(objet,message,idDistinataire, priviligeDistinataire,emetteur,priviligeEmetteur,date, status));
				request.setAttribute("modele", "Ajouter avec succes");
				response.sendRedirect(request.getContextPath() +"/"+url+".jsp");
			}
	}

}
