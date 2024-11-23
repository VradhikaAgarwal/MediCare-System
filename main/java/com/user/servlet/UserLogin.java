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

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("new_pass");
			
		 	HttpSession session=req.getSession();
			
			UserDAO dao= new UserDAO(DbConnect.getConn());
			User userObj= dao.login(email, password);
			
			
			if(userObj != null) {
				session.setAttribute("userObj", userObj);
				System.out.println("userObj.id: " + userObj.getId());
				resp.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("errormsg", "Invalid email or password");
				resp.sendRedirect("user_login.jsp");
			}
					
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
  
