package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DbConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName=req.getParameter("fullname");
			String contact=req.getParameter("contact");
			String email=req.getParameter("email");
			String newPass=req.getParameter("newPass");
			String confirmPass=req.getParameter("confirmPass");
			
			//parameterized constructor in user entity to set the data in user class
			User u=new User(fullName,contact,email,newPass,confirmPass);
			
			//to interact with database make the object of userDAO
			UserDAO dao=new UserDAO(DbConnect.getConn());
			
			HttpSession s=req.getSession();
			
			//it returns the boolean value
			boolean f=dao.userRegister(u);
			
			if(f) {
				s.setAttribute("successmsg", "Registered successfully");
				resp.sendRedirect("signup.jsp");
				
			}
			else {
				s.setAttribute("errormsg", "Something went wrong, Please try again !!");
				resp.sendRedirect("signup.jsp");	
			}
				
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
      
}
