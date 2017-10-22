package tn.formation.springproject.model.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
	/**
	 * Show user management ui
	 * return view.jsp
	 * @return
	 */
	@GetMapping("users")
	public String users() {
		return "users";
	}
}
