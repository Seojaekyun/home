package com.example.demo.service;

import java.util.List;

import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface MemberService {
	public String member();
	public String useridCheck(String userid);
	public String memberOk(MemberDto mdto);
	public List<MemberDto> getAllMembers();
	public String rlist(HttpSession session, HttpServletRequest request, Model model);
	public MemberDto getMemberDetails(String userid);
	public String searchUserId(MemberDto mdto);
	void pwdSearch(MemberDto mdto, Model model) throws Exception; // 변경된 메서드 시그니처
 // 비밀번호 검색 메서드 정의
    }
	
