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
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/mng/inquiry")
@RequiredArgsConstructor
public class AdminInquiryController {

    private final InquiryService inquiryService;

    // 1. 문의 목록 조회 (검색/페이징 포함)
    @GetMapping("/list")
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

        return "mng/support/inquiry_list";
    }

    // 2. 문의 상세 보기
    @GetMapping("/detail")
    public String detail(@RequestParam Long inquiryId, Model model) throws Exception {
        model.addAttribute("inquiry", inquiryService.getInquiryDetail(inquiryId));
        return "mng/support/inquiry_detail";
    }

    // 3. 문의 삭제 (AJAX 또는 단순 POST 용)
    @PostMapping("/delete")
    public String delete(@RequestParam Long inquiryId, RedirectAttributes rttr) throws Exception {
        boolean result = inquiryService.deleteInquiry(inquiryId);
        if (result) {
            rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "삭제에 실패했습니다.");
        }
        return "redirect:/mng/inquiry/list";
    }

    // 3-1. 문의 진행 상태(Status) 즉시 변경 (AJAX)
    @PostMapping("/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam Long inquiryId, @RequestParam String status) {
        try {
            InquiryVO vo = new InquiryVO();
            vo.setInquiryId(inquiryId);
            vo.setStatus(status);
            boolean result = inquiryService.updateInquiryStatus(vo);
            return result ? "ok" : "fail";
        } catch (Exception e) {
            log.error("문의 상태 변경 중 오류 발생", e);
            return "error";
        }
    }

    // 4. 전체 엑셀(Excel) 다운로드 로직
    @GetMapping("/excel")
    public void excelDownload(@ModelAttribute InquiryVO inquiryVO, HttpServletResponse response) throws Exception {
        // 엑셀은 전체 데이터를 추출해야 하므로 LIMIT 제한 해제
        inquiryVO.setLimitStart(0);
        inquiryVO.setRecordSize(100000);

        List<InquiryVO> list = inquiryService.getInquiryList(inquiryVO);

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("문의내역");
        Row headerRow = sheet.createRow(0);

        String[] headers = {"연번", "유형", "구분", "성함", "연락처", "이메일", "국가", "작품제목", "작품크기", "작가명", "접수일시"};
        for(int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
        }

        int rowNum = 1;
        for (InquiryVO vo : list) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(vo.getInquiryId());
            row.createCell(1).setCellValue(vo.getInquiryType() != null ? vo.getInquiryType() : "");
            row.createCell(2).setCellValue(vo.getCategory() != null ? vo.getCategory() : "");
            row.createCell(3).setCellValue(vo.getClientName() != null ? vo.getClientName() : "");
            row.createCell(4).setCellValue(vo.getCountryCode() + " " + vo.getContact());
            row.createCell(5).setCellValue(vo.getEmail() != null ? vo.getEmail() : "");
            row.createCell(6).setCellValue(vo.getCountry() != null ? vo.getCountry() : "");
            row.createCell(7).setCellValue(vo.getArtworkTitle() != null ? vo.getArtworkTitle() : "");
            row.createCell(8).setCellValue(vo.getArtworkSize() != null ? vo.getArtworkSize() : "");
            row.createCell(9).setCellValue(vo.getArtistName() != null ? vo.getArtistName() : "");
            row.createCell(10).setCellValue(vo.getCreatedAt() != null ? vo.getCreatedAt() : "");
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment;filename=artixel_inquiry_list.xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }

    // 5. 프록시 다운로드 (크롬 피싱 경고 완벽 우회용)
    @GetMapping("/download")
    public void downloadFile(@RequestParam String fileUrl, @RequestParam String fileName, HttpServletResponse response) {
        try {
            // 보안: 네이버 클라우드 스토리지 URL만 허용 (서버 탈취 공격, SSRF 방지용 안전장치)
            if (!fileUrl.startsWith("https://kr.object.ncloudstorage.com")) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "잘못된 파일 접근입니다.");
                return;
            }

            URL url = new URL(fileUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);

            // 파일명 URL 인코딩 (한글 깨짐 방지)
            String encodedFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

            // 스트림 복사 (네이버 S3 -> 웹 서버 -> 사용자 브라우저)
            try (InputStream in = conn.getInputStream(); OutputStream out = response.getOutputStream()) {
                byte[] buffer = new byte[8192];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
                out.flush();
            }
        } catch (Exception e) {
            log.error("파일 프록시 다운로드 중 오류 발생: {}", fileUrl, e);
        }
    }

}