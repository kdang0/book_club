package com.kevin.login_reg.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kevin.login_reg.services.BookService;
import com.kevin.login_reg.services.UserService;

@Controller
public class MainController {
	private final UserService userServ;
	private final BookService bookServ;
	public MainController(UserService userServ, BookService bookServ) {
		this.userServ = userServ;
		this.bookServ = bookServ;
	}
	@GetMapping("/")
	public String dashboard(HttpSession session, Model model) {
		model.addAttribute("loggedInUser", userServ.getUser((Long) session.getAttribute("user_id")));
		model.addAttribute("allBooks", bookServ.getAll());
		return "main/dashboard.jsp";
	}
}
