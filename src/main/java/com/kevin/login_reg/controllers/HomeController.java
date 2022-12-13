package com.kevin.login_reg.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kevin.login_reg.models.LoginUser;
import com.kevin.login_reg.models.User;
import com.kevin.login_reg.services.UserService;

@Controller
@RequestMapping("/users")
public class HomeController {
	private final UserService userServ;
	public HomeController(UserService userServ) {
		this.userServ = userServ;
	}
	
	@GetMapping("/login/register")
	public String loginReg(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "user/login_reg.jsp";
	}
	
	@PostMapping("/login/register")
	public String registerUser(@Valid @ModelAttribute("newUser") User user, BindingResult result, HttpSession session, Model model) {
		if(!user.getPassword().equals(user.getConfirm())) {
			result.rejectValue("password", "Match", "password not matching");
		}
		
		if(userServ.getUser(user.getEmail()) != null) {
			result.rejectValue("email", "Unique", "email already exists");
		}
		if(result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "user/login_reg.jsp";
		}
		User newUser = userServ.registerUser(user);
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String loginUser(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model, HttpSession session) {
		User loggingInUser = userServ.login(loginUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "user/login_reg.jsp";
		}
		session.setAttribute("user_id", loggingInUser.getId());
		return "redirect:/";
	}
	
	

}
