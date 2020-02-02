package com.yoprojet.projet.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.yoprojet.projet.dao.entite.Admin;
import com.yoprojet.projet.dao.entite.ChefDeProjet;
import com.yoprojet.projet.dao.entite.Client;
import com.yoprojet.projet.dao.entite.Collaborateur;
import com.yoprojet.projet.services.AdminServiceImpl;
import com.yoprojet.projet.services.ChefDeProjetServiceImpl;
import com.yoprojet.projet.services.ClientServicesImpl;
import com.yoprojet.projet.services.CollaborateurServicesImpl;
@WebServlet("/UploadDownloadFileServlet")
public class UploadDownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader = null;
    
	private AdminServiceImpl adminService;
	private ClientServicesImpl clientService;
	private CollaborateurServicesImpl collaborateurService;
	private ChefDeProjetServiceImpl chefService;
	    @Override
	
	public void init() throws ServletException
	{
	DiskFileItemFactory fileFactory = new DiskFileItemFactory();
	File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
	fileFactory.setRepository(filesDir);
	this.uploader = new ServletFileUpload(fileFactory);
	adminService=new AdminServiceImpl();
	clientService=new ClientServicesImpl();
	collaborateurService=new CollaborateurServicesImpl();
	chefService=new ChefDeProjetServiceImpl();
	
	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException 
	{
	HttpSession session = request.getSession();
	String email1=(String) session.getAttribute("email1");
	long id=(Long) session.getAttribute("id");
	String privilige=(String) session.getAttribute("privilige");
	
	
	
	if(privilige.equalsIgnoreCase("administrateur")){
	Admin ad1=new Admin();
	ad1=(Admin)adminService.rechercherAdministrateurId(id);
	ad1.setAvatar(id+"-"+privilige+".jpg");//ad.setAvatar(fileItem.getName().toString());
	adminService.updateAvatar(ad1);
	}
	if(privilige.equalsIgnoreCase("client")){
	Client ad2=new Client();
	ad2=clientService.rechercherClientId(id);
	ad2.setAvatar(id+"-"+privilige+".jpg");//ad.setAvatar(fileItem.getName().toString());
	clientService.updateAvatar(ad2);
	}
	 if(privilige.equalsIgnoreCase("collaborateur")){
	Collaborateur ad3=new Collaborateur();	
	ad3=(Collaborateur)collaborateurService.rechercherCollaborateurId(id);
	ad3.setAvatar(id+"-"+privilige+".jpg");
	
	collaborateurService.updateAvatar(ad3);
	}
	 if(privilige.equalsIgnoreCase("Chef de projet")){
	ChefDeProjet	ad4=new ChefDeProjet();
	ad4=chefService.rechercherChefDeProjetId(id);
	ad4.setAvatar(id+"-"+privilige+".jpg");//ad.setAvatar(fileItem.getName().toString());
	chefService.updateAvatar(ad4);
	}
	if(!ServletFileUpload.isMultipartContent(request))
	{			
	throw new ServletException("Content type is not multipart/form-data");
	}
	response.setContentType("text/html");
	try 
	
	{
	List<FileItem> fileItemsList = uploader.parseRequest(request);
	Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
	
	File fileSupprimer = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+id+"-"+privilige+".jpg");
	fileSupprimer.delete();
	
	while(fileItemsIterator.hasNext())
	{
	FileItem fileItem = fileItemsIterator.next();
	File file = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+id+"-"+privilige+".jpg");
	fileItem.write(file);
	}
	
	File folder = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator);
	
	  for (File file : folder.listFiles()) 
	  {
	   if (file.getName().endsWith(".tmp")) 
	   {
	    file.delete();
	   }
	  }
		} catch (Exception e) {
		}
		Cookie cookie=new Cookie("actualiser", "1");
		cookie.setMaxAge(6);
		response.addCookie(cookie);
		response.sendRedirect(request.getContextPath() + "/wait.jsp");
	}
}
