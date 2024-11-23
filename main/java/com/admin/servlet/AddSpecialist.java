package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DbConnect;
import com.entity.User;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName=req.getParameter("specName");
		
		SpecialistDao dao=new SpecialistDao(DbConnect.getConn());
		boolean f=dao.addSpecialist(specName);
		
		HttpSession s=req.getSession();
		
		if(f) {
			s.setAttribute("successmsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");
		}
		else {
			s.setAttribute("errormsg", "Something wrong on server");
			resp.sendRedirect("admin/index.jsp");
		}
		
	}

}