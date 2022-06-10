package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    public MemberService memberService;
    @GetMapping("/save-form")
    public String saveForm() {return "member/save";}

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean saveResult = memberService.save(memberDTO);
        if (saveResult) {
            return "Login";
        } else {
            return "saveFail";
        }
    }

    @GetMapping("/login-form")
    public String loginForm() {
        return "member/login";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        // 세션(session)
        if (loginMember != null) {
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            return "main";
        } else {
            return "login";
        }
    }
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model ) {
        System.out.println("id = " + id);
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        boolean deleteResult = memberService.delete(id);
        if (deleteResult) {
            // redirect: 컨트롤러의 메서드에서 다른 메서드의 주소를 호출
            // redirect 이용하여 findAll 주소 요청
            return "redirect:/findAll";
        } else {
            return "delete-fail";
        }
    }

    @GetMapping("/update-form")
    public String updateForm(HttpSession session, Model model) {
        // 로그인을 한 상태기 때문에 세샨에 id, memberId가 들어있고
        // 여기서 세션에 있는 id를 가져온다.
        Long updateId = (Long) session.getAttribute("loginId");
        System.out.println("updateId = " + updateId);
        // DB 해당 회원의 정보를 가져와서 그 정보를 가지고 update.jsp 이동
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        System.out.println("memberDTO = " + memberDTO);
        boolean updateResult = memberService.update(memberDTO);
        if (updateResult) {
            // 해당 회원의 상세정보
            return "redirect:/detail?id=" + memberDTO.getId();
        } else {
            return "update-fail";
        }
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        System.out.println("memberId = " + memberId);
        // memberId를 DB에서 중복값이 있는지 없는지 체크하고
        // 없으면 ok, 있으면 no 라는 String 값을 리턴받으세요.
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult; // ok.jsp 또는 no.jsp 를 찾음.
    }


}
