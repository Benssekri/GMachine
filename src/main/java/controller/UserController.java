package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Machine;
import beans.Salle;
import beans.User;
import service.MachineService;
import service.SalleService;
import service.UserService;
@WebServlet(urlPatterns = { "/UserController" })

public class UserController extends HttpServlet {
	private UserService us = new UserService();

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//response.sendRedirect("User.jsp");
        if (request.getParameter("op") != null) {
        	if (request.getParameter("op").equals("load")) {
        		response.setContentType("application/json");
        		List<User> users = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(users));
        	}
        	
        	if (request.getParameter("op").equals("update")) {
         		int id= Integer.parseInt(request.getParameter("id"));
             	String username = request.getParameter("username");
         		String mail = request.getParameter("mail");
         		String password=request.getParameter("password");
         		User user = us.findById(id);
         		user.setUsername(username);
         		user.setMail(mail);
         		user.setPassword(password);
         		us.update(user);
         		response.setContentType("application/json");
                 List<User> users = us.findAll();
                 Gson json = new Gson();
                 response.getWriter().write(json.toJson(users));
         	}
            
            if (request.getParameter("op").equals("delete")) {
        		int id= Integer.parseInt(request.getParameter("id"));
        		User user = us.findById(id);
        		us.delete(user);
        		response.setContentType("application/json");
                List<User> users = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(users));
        	}
        }
        else {
        	String username = request.getParameter("username");
     		String mail = request.getParameter("mail");
     		String password=request.getParameter("password");
    		us.create(new User(username,mail,password,1));
    		response.setContentType("application/json");
            List<User> users = us.findAll();
            Gson json = new Gson();
            response.getWriter().write(json.toJson(users));
        }
        
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	
}
