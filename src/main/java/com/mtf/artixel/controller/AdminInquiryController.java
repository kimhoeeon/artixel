package com.mtf.artixel.controller;

import com.mtf.artixel.service.InquiryService;
import com.mtf.artixel.vo.InquiryVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/mng/inquiry")
@RequiredArgsConstructor
public class AdminInquiryController {

    private final InquiryService inquiryService;

    // 1. 문의 목록 조회 (검색/페이징 포함)
    @GetMapping("/list.do")
    public String list(@ModelAttribute InquiryVO inquiryVO, HttpServletRequest request, Model model) throws Exception {

        // 페이징 처리 로직
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        if (inquiryVO.getRecordSize() == 0) {
            inquiryVO.setRecordSize(10); // 한 페이지당 10개 출력
        }
        inquiryVO.setLimitStart((page - 1) * inquiryVO.getRecordSize());

        int totalCount = inquiryService.getInquiryListCount(inquiryVO);
        List<InquiryVO> list = inquiryService.getInquiryList(inquiryVO);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("searchVO", inquiryVO);
        model.addAttribute("currentPage", page);

        // viotorydiary의 기존 JSP 경로 구조 유지
        return "mng/support/inquiry_list";
    }

    // 2. 문의 상세 보기
    @GetMapping("/detail.do")
    public String detail(@RequestParam Long inquiryId, Model model) throws Exception {
        model.addAttribute("inquiry", inquiryService.getInquiryDetail(inquiryId));
        return "mng/support/inquiry_detail";
    }

    // 3. 문의 삭제 (AJAX 또는 단순 POST 용)
    @PostMapping("/delete.do")
    public String delete(@RequestParam Long inquiryId, RedirectAttributes rttr) throws Exception {
        boolean result = inquiryService.deleteInquiry(inquiryId);
        if (result) {
            rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "삭제에 실패했습니다.");
        }
        return "redirect:/mng/inquiry/list.do";
    }

    // 4. 전체 엑셀(Excel) 다운로드 로직
    @GetMapping("/excel.do")
    public void excelDownload(@ModelAttribute InquiryVO inquiryVO, HttpServletResponse response) throws Exception {
        // 엑셀은 전체 데이터를 추출해야 하므로 LIMIT 제한 해제
        inquiryVO.setLimitStart(0);
        inquiryVO.setRecordSize(100000);

        List<InquiryVO> list = inquiryService.getInquiryList(inquiryVO);

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("문의내역");
        Row headerRow = sheet.createRow(0);

        String[] headers = {"연번", "구분", "성함", "연락처", "이메일", "국가", "작품제목", "작품크기", "작가명", "접수일시"};
        for(int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
        }

        int rowNum = 1;
        for (InquiryVO vo : list) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(vo.getInquiryId());
            row.createCell(1).setCellValue(vo.getCategory() != null ? vo.getCategory() : "");
            row.createCell(2).setCellValue(vo.getClientName() != null ? vo.getClientName() : "");
            row.createCell(3).setCellValue(vo.getCountryCode() + " " + vo.getContact());
            row.createCell(4).setCellValue(vo.getEmail() != null ? vo.getEmail() : "");
            row.createCell(5).setCellValue(vo.getCountry() != null ? vo.getCountry() : "");
            row.createCell(6).setCellValue(vo.getArtworkTitle() != null ? vo.getArtworkTitle() : "");
            row.createCell(7).setCellValue(vo.getArtworkSize() != null ? vo.getArtworkSize() : "");
            row.createCell(8).setCellValue(vo.getArtistName() != null ? vo.getArtistName() : "");
            row.createCell(9).setCellValue(vo.getCreatedAt() != null ? vo.getCreatedAt() : "");
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment;filename=artixel_inquiry_list.xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
}