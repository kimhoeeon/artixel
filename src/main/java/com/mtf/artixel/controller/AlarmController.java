package com.mtf.artixel.controller;

import com.mtf.artixel.service.AlarmService;
import com.mtf.artixel.vo.AlarmVO;
import com.mtf.artixel.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/alarm")
@RequiredArgsConstructor
public class AlarmController {

    private final AlarmService alarmService;

    // 알림 목록 페이지
    @GetMapping("/list")
    public String alarmListPage(HttpSession session, Model model) {
        MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
        if (loginMember == null) return "redirect:/member/login";

        List<AlarmVO> list = alarmService.getMyAlarms(loginMember.getMemberId());
        model.addAttribute("list", list);

        return "alarm/alarm_list"; // views/alarm/alarm_list.jsp
    }

    // [AJAX] 알림 읽음 처리
    @PostMapping("/read")
    @ResponseBody
    public String readAlarm(@RequestParam("alarmId") Long alarmId, HttpSession session) {
        MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
        if (loginMember == null) return "fail:login";

        alarmService.readAlarm(alarmId, loginMember.getMemberId());
        return "ok";
    }
}