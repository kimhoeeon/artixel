package com.mtf.artixel.service;

import com.mtf.artixel.dto.MenuItem;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MenuService {

    /**
     * 관리자 페이지용 메뉴 목록 생성
     */
    public List<MenuItem> getAdminMenuItems() {
        List<MenuItem> menus = new ArrayList<>();

        // 1. 대시보드
        menus.add(new MenuItem("대시보드", "/mng/main.do", "ki-element-11", 4));

        // 2. 문의 관리 (그룹)
        List<MenuItem> subMem = new ArrayList<>();
        subMem.add(new MenuItem("문의 목록", "/mng/inquiry/list", "", 0));
        menus.add(new MenuItem("문의 관리", "#", "ki-message-text-2", 3, subMem));

        return menus;
    }
}