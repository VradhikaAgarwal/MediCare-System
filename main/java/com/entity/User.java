package com.entity;

public class User {
   private int id;
   private String fullName;
   private String contact;
   private String email;
   private String  newPass;
   private String confirmPass;
   

public User() {
	super();
	// TODO Auto-generated constructor stub
}
public User(String fullName, String contact, String email, String newPass, String confirmPass) {
	super();
	this.fullName = fullName;
	this.contact = contact;
	this.email = email;
	this.newPass = newPass;
	this.confirmPass = confirmPass;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFullName() {
	return fullName;
}
public void setFullName(String fullName) {
	this.fullName = fullName;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getNewPass() {
	return newPass;
}
public void setNewPass(String newPass) {
	this.newPass = newPass;
}
public String getConfirmPass() {
	return confirmPass;
}
public void setConfirmPass(String confirmPass) {
	this.confirmPass = confirmPass;
}
   
}
