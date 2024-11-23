package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DbConnect;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id= Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao=new DoctorDao(DbConnect.getConn());
		HttpSession session=req.getSession();
		
		if(dao.deleteDoctor(id)) {
			session.setAttribute("successmsg", "Doctor deleted Successfully");
			
			
		

			resp.sendRedirect("admin/doctor.jsp");
		}
		else {
			session.setAttribute("errormsg", "Something went wrong");
			
			
			resp.sendRedirect("admin/doctor.jsp");
			
		}
	}
	
  
}
