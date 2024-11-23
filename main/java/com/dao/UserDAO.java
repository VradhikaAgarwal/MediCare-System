package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	// pass user object in parameter to get all the details of user
	public boolean userRegister(User u) {
		boolean f = false;
		try {
			String sql = "insert into user_details(full_name,contact,email,new_pass,confirm_pass) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getContact());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getNewPass());
			ps.setString(5, u.getConfirmPass());

			int i = ps.executeUpdate();
			// i=1 successfully inserted otherwise store garbage value
			if (i == 1) {
				f = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return f;
	}

	public User login(String em, String psw) {
		User u = null;
		try {
			String sql = "select * from user_details where email=? and new_pass=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new User();
				// u.setId(rs.getInt(1));
				u.setFullName(rs.getString("full_name"));
				u.setContact(rs.getString("contact"));
				u.setEmail(rs.getString("email"));
				u.setNewPass(rs.getString("new_pass"));
				u.setConfirmPass(rs.getString("confirm_pass"));
				u.setId(rs.getInt("new_id"));
				System.out.println("User ID from DB: " + u.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	
	// to check whether the old password is correct or not
	public boolean checkOldPassword(int userId, String oldPassword) {
		
		// if not correct it returns false
		boolean f = false;

		try {
			String sql = "select * from user_details where new_id=? and new_pass=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return f;
	}
	
public boolean changePassword(int userId, String newPassword) {
		
		boolean f = false;

		try {
			String sql = "update user_details set new_pass=? where new_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userId);

			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return f;
	}
}
