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

@WebServlet("/userChangePassword")
public class ChangePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid= Integer.parseInt(req.getParameter("uid"));
		String oldPassword=req.getParameter("oldPassword");
		String newPassword=req.getParameter("newPassword");
		
		UserDAO dao= new UserDAO(DbConnect.getConn());
		HttpSession session= req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("successmsg", "Password Change Successfully ");
				resp.sendRedirect("change_pass.jsp");
				
		//		session.removeAttribute("successmsg");
			}
			else
			{
				session.setAttribute("errormsg", "Something Wrong on Server");
				resp.sendRedirect("change_pass.jsp");
			}
			
		}else {
			session.setAttribute("errormsg", "Old Password is Incorrect");
			resp.sendRedirect("change_pass.jsp");
		}
		
	}
	
	

}
