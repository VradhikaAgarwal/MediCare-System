package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.dao.DoctorDao;
import com.db.DbConnect;
import com.entity.Appointment;
import com.entity.Doctor;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		int userId =Integer.parseInt(req.getParameter("userId"));
		String fullname =req.getParameter("fullname");
		String gender =req.getParameter("gender");
		String age =req.getParameter("age");
		String appoint_date =req.getParameter("date");
		String email =req.getParameter("email");
		String phno =req.getParameter("phno");
		String diseases =req.getParameter("diseases");
		int doctor_id=Integer.parseInt(req.getParameter("doct"));
		String address =req.getParameter("address");
		
		System.out.println("Submitted userId: " + userId);
		
		 DoctorDao doctorDao = new DoctorDao(DbConnect.getConn());
         boolean doctorExists = doctorDao.checkDoctorExists(doctor_id);
         HttpSession session = req.getSession();
         if (doctorExists) {
             // Proceed to insert appointment
        	 Appointment ap=new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending");
             AppointmentDao appointmentDao = new AppointmentDao(DbConnect.getConn());
             boolean isInserted = appointmentDao.addAppointment(ap);

             if (isInserted) {
                 session.setAttribute("successmsg", "Appointment Added Successfully");
             } else {
                 session.setAttribute("errormsg", "Failed to Add Appointment");
             }
         } else {
             // Handle invalid doctor_id
             session.setAttribute("errormsg", "Invalid Doctor ID");
         }
         resp.sendRedirect("user_appointment.jsp");
         
     } 
	catch (Exception e) {
         e.printStackTrace();
     }
}
}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
