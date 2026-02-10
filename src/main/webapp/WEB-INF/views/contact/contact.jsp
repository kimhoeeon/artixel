<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" />
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="format-detection" content="telephone=no,email=no,address=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="mobile-web-app-capable" content="yes" />

    <meta name="title" content="Artixel">
    <meta name="description" content="Artixel">
    <meta property="og:title" content="Artixel">
    <meta property="og:description" content="Artixel">
    <meta property="og:image" content="/img/og_img.jpg">

    <!-- swiper 외부 라이브러리 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

    <!-- aos 외부 라이브러리 -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">

    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/responsive.css">

    <title>Artixel</title>

</head>

<body>

    <%@ include file="../header.jsp" %>

    <!-- container -->
    <div id="container">

        <!-- section -->
        <div class="sub_wrap contact_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Contact
                        </div>
                        <div class="small">
                            제출하신 정보는 <span>문의 응대 목적</span>으로만 사용되며,<br />
                            목적 달성 후 안전하게 관리됩니다.
                        </div>
                    </div>
                    <form class="contact_form">
                        <table class="form_box">
                            <tbody>
                            <tr>
                                <td class="gubun req">
                                    성함
                                </td>
                                <td class="naeyong">
                                    <input type="text" placeholder="성함을 입력해주세요">
                                </td>
                            </tr>
                            <tr class="radio">
                                <td class="gubun req">
                                    구분
                                </td>
                                <td class="naeyong">
                                    <label>
                                        <input type="radio" name="cmp_type" checked>기업
                                    </label>
                                    <label>
                                        <input type="radio" name="cmp_type">개인
                                    </label>
                                </td>
                            </tr>
                            <tr class="number_info">
                                <td class="gubun req">
                                    연락처
                                </td>
                                <td class="naeyong">
                                    <select name="phone" id="phone">
                                        <option value="">010</option>
                                        <option value="">011</option>
                                        <option value="">031</option>
                                    </select>
                                    <span>-</span>
                                    <input type="text" value="" >
                                    <span>-</span>
                                    <input type="text" value="" >
                                </td>
                            </tr>
                            <tr class="email_info">
                                <td class="gubun req">
                                    이메일
                                </td>
                                <td class="naeyong">
                                    <input type="text" name="tax_email_id" id="tax_email_id" maxlength="40" value="" placeholder="이메일" autocomplete="off">
                                    <span>@</span>
                                    <select name="email_host" id="email_host">
                                        <option value="">직접입력</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        <option value="empal.com">empal.com</option>
                                        <option value="korea.com">korea.com</option>
                                        <option value="hanmir.com">hanmir.com</option>
                                        <option value="dreamwiz.com">dreamwiz.com</option>
                                        <option value="orgio.net">orgio.net</option>
                                        <option value="choi.com">choi.com</option>
                                        <option value="hitel.net">hitel.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="textarea_info">
                                <td class="gubun req">
                                    문의 내용
                                </td>
                                <td class="naeyong">
                                    <textarea name="" id="" placeholder="목적 : (매입/전시/보험/거래)&#13;&#10;작가 :&#13;&#10;연도 : "></textarea>
                                </td>
                            </tr>
                            <tr class="file_info">
                                <td class="gubun req">
                                    작품 사진 첨부
                                </td>
                                <td class="naeyong">
                                    <p class="file_box">
                                        <input type="text" class="upload_name" value="파일선택" disabled="disabled">
                                        <button type="button" class="btn_file" id="">
                                            파일 선택
                                        </button>
                                    </p>
                                </td>
                            </tr>
                            <tr class="agree_info">
                                <td>
                                    <label class="agree_chk">
                                        <input type="checkbox" id="agreePrivacy" required>
                                        <span class="chk_box"></span>
                                        <span class="txt">
                                            <span href="" class="btn_terms btn-open-terms" data-terms="service">개인정보 수집 이용</span> 동의
                                        </span>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn_wrap">
                            <div>
                                <a href="/">홈으로</a>
                            </div>
                            <div class="send">
                                <a href="#">문의하기</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- //section -->


    </div>
    <!-- //container -->

    <%@ include file="../footer.jsp" %>

    <!-- 팝업 -->
    <div class="center-popup-backdrop terms" id="centerPopup">
        <div class="center-popup">
            <div class="center-popup_body">
                <div class="center-popup_title" id="centerPopupTitle"></div>
                <div class="center-popup_txt terms-txt" id="centerPopupTxt"></div>
            </div>
            <div class="one_btn">
                <button type="button" class="btn btn-primary st2" data-popup="center-confirm">
                    확인
                </button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/script.js"></script>
    <script src="/js/swiper.js"></script>

</body>
</html>