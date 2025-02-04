package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.MemberDto;
import com.example.demo.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
		
	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@GetMapping("/login/login")
	public String login(HttpServletRequest request, Model model) {
		return service.login(request,model);
	}
	
	@GetMapping("/login/loginAd")
	public String loginAd(HttpServletRequest request, Model model) {
		return service.loginAd(request,model);
	}
	
	@PostMapping("/login/loginOk") public String loginOk(MemberDto mdto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return service.loginOk(mdto,session,request,response);
	}
	
	@PostMapping("/login/loginAdmin")
	public String loginAdmin(MemberDto mdto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return service.loginAdmin(mdto,session,request,response);
	}

	@GetMapping("/login/logout") public String logout(HttpSession session) {
		return service.logout(session);
	}
	
	
}