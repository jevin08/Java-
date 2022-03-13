package com.furniture.FinalProject;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import entities.Customer;
import services.AdminServices;
import services.CustomerServices;

@Controller
public class AppController {
	@RequestMapping("")
	public String home() {
		return "home";
	}
	@RequestMapping("admin")
	public String adminHome() {
		return "admin/home";
	}
	@RequestMapping("admin/product/add")
	public String addProduct(){
		return "admin/addProduct";
	}
	@RequestMapping("login")
	public String login(Model model){
		return "login";
	}
	
	@RequestMapping("signin")
	public String signIn(){
		return "signin";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.setAttribute("adminLoggedIn", null);
		session.setAttribute("loggedIn", null);
		session.setAttribute("uname", null);
		return "home";
	}
	
	@GetMapping("validateLogin")
	public String validateLogin(Model model) {
		return "login";
	}
	
	@PostMapping("validateLogin")
	public String validateLogin(@RequestParam("uname") String name, @RequestParam("password") String pass, HttpSession session) {
		Long id = AdminServices.isAdmin(name, pass);
		if(id!=0) {
			session.setAttribute("adminLoggedIn", "true");
			session.setAttribute("uname", name);
			session.setAttribute("uid", id);
			return "./admin/home";
		}else if(CustomerServices.isCustomer(name, pass)!=0) {
			session.setAttribute("loggedIn", "true");
			session.setAttribute("uname", name);
			return "home";
		}else {
			session.setAttribute("error-message", "Username or password not matching.");
			return "login";
		}
	}
	
	@GetMapping("validateSignin")
	public String validateSignin(Model model) {
		return "signin";
	}
	
	@PostMapping("validateSignin")
	public String validateSignin(String uname, String email, String password, @RequestParam("confirm-password") String confirmPass, String fname, String lname, String phone, @RequestParam("sec-phone") String secPhone, String bdate, HttpSession session) {
		if(password.equals(confirmPass) && !password.equals("")){
			if(AdminServices.isAdmin(uname, password)!=0 || CustomerServices.isCustomer(uname, password)!=0) {
				session.setAttribute("error-message", "Username and password already exists.");
				return "signin";
			}
			Date birthDate = Date.valueOf(bdate);
			Customer customer = new Customer(fname, lname, uname, email, password, phone, secPhone, birthDate, secPhone);
			CustomerServices.addCustomer(customer);
			return "login";
		}else {
			session.setAttribute("error-message", "Password not matched or empty.");
			return "signin";
		}
	}
	@RequestMapping("profile")
	public String profile(HttpSession session) {
		if("true"==session.getAttribute("loggedIn")) {
			String uname = (String) session.getAttribute("uname");
			Customer customer = CustomerServices.getCustomer(uname);
			return "profile";
		}
		session.setAttribute("info-message", "Please Login First!");
		return "login";
	}
	
}
