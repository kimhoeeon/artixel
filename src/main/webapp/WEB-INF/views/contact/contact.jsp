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
                            제출하신 정보는 <br />
                            문의 응대 목적으로만 사용됩니다.
                        </div>
                        <div class="btn guide">작품 촬영 가이드<img src="/img/arrow-right_w.png" alt="화살표"></div>
                    </div>
                    <form class="contact_form">
                        <table class="form_box">
                            <tbody>
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
                                    <label>
                                        <input type="radio" name="cmp_type">기관
                                    </label>
                                    <label class="etc_wrap">
                                        <input type="radio" name="cmp_type" value="기타" class="etc_radio">기타
                                    </label>
                                    <input type="text" class="etc_input" placeholder="직접입력">
                                </td>
                            </tr>
                            <tr>
                                <td class="gubun req">
                                    성함
                                </td>
                                <td class="naeyong">
                                    <input type="text" placeholder="담당자명을 입력해주세요">
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
                            <tr class="number_info">
                                <td class="gubun req">
                                    연락처
                                </td>
                                <td class="naeyong">
                                    <select name="phone" id="phone">
                                        <option value="">대한민국 (+82)</option>
                                        <option value="">미국(+1)</option>
                                        <option value="">일본(+81)</option>
                                    </select>
                                    <span>-</span>
                                    <input type="text" value="" placeholder="010-1234-5678">
                                </td>
                            </tr>
                            <tr class="country_info">
                                <td class="gubun req">
                                    국가 선택
                                </td>
                                <td class="naeyong">
                                    <select name="email_host" id="email_host">
                                        <option value="" selected>대한민국 (South Korea)</option>
                                        <option value="">일본 (Japan)</option>
                                        <option value="">중국 (China)</option>
                                        <option value="">미국 (United States)</option>
                                        <option value="">캐나다 (Canada)</option>
                                        <option value="">독일 (Germany)</option>
                                        <option value="">프랑스 (France)</option>
                                        <option value="">영국 (United Kingdom)</option>
                                        <option value="">호주 (Australia)</option>
                                        <option value="">베트남 (Vietnam)</option>
                                        <option value="">태국 (Thailand)</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="gubun req">
                                    작품 크기
                                </td>
                                <td class="naeyong">
                                    <input type="text" placeholder="그림의 실제 사이즈를 작성해주세요">
                                </td>
                            </tr>
                            <tr class="w100">
                                <td class="gubun">
                                    작품 제목
                                </td>
                                <td class="naeyong">
                                    <input type="text" placeholder="작품 제목을 입력해주세요">
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
                                        <input type="text" placeholder="URL 입력">
                                    </p>
                                </td>
                                <td>
                                    <ul>
                                        <li>작품 이미지는 파일로 업로드하거나, 이미지가 저장된 드라이브 URL을 등록해 주세요.</li>
                                        <li>첨부파일은 <span>최대 100MB</span>까지 업로드 가능합니다. 업로드 전 ‘작품 사진 촬영 가이드’를 꼭 확인해 주세요.</li>
                                        <li>작품 의뢰가 여러 건이거나, 더 큰 파일을 첨부해야 하는 경우 contact@artixel.kr로 문의해 주세요</li>
                                    </ul>
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

    <!-- 가이드 팝업 -->
    <div class="guide-popup">
        <div class="popup-inner">
            <button class="popup-close">✕</button>
            <div class="popup-content">
                <div class="guide-top">
                    <div class="tit">
                        작품 촬영 가이드
                    </div>
                    <div class="guide-txt">
                        <ul>
                            <li>• 디지털 카메라 혹은 스마트폰으로도 촬영이 가능합니다. <span>RAW파일 혹은 고화질 모드</span>로 촬영하시기 바랍니다.</li>
                            <li>• 촬영 각도에 의한 왜곡이 발생하지 않도록 <span>정면에서 촬영</span>해야 합니다.</li>
                            <li>• 카메라 필터나 보정에 의해 왜곡이 발생하지 않도록 <span>기본 촬영 모드</span>에서 촬영해야 합니다.</li>
                            <li>• 조명이나 직사광선에 의한 <span>빛 반사 현상이 없어야</span> 합니다.</li>
                            <li>• <span>그림자가 생기지 않도록</span> 유의해서 촬영해야 합니다.</li>
                        </ul>
                        <img src="/img/guide_img01.png" alt="가이드 이미지">
                    </div>
                </div>
                <div class="guide-content">
                    <ul>
                        <li class="bold">
                            <span>1</span>백색의 기준을 잡기 위해 A4용지를 그림과 함께 두고 그림 전체가 나오도록 촬영합니다.
                        </li>
                        <li>* 필요 사진 수: 1장</li>
                        <li>
                            <img src="/img/guide_img02.png" alt="가이드 이미지">
                        </li>
                    </ul>
                    <ul>
                        <li class="bold">
                            <span>2</span>마치 도록에 있는 사진처럼 액자 등의 노출을 최소화하고 그림 전체가 사진에 가득차게 촬영합니다.
                        </li>
                        <li>* 필요 사진 수: 1장</li>
                        <li>
                            <img src="/img/guide_img03.png" alt="가이드 이미지">
                        </li>
                    </ul>
                    <ul>
                        <li class="bold">
                            <span>3</span>종이의 질감이 느껴질 정도로 가까이에서 촬영합니다. 최소 3컷 이상의 근접 사진이 필요합니다.
                        </li>
                        <li>* 필요 사진 수: 3장</li>
                        <li>
                            <img src="/img/guide_img04.png" alt="가이드 이미지">
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!-- 가이드 팝업 -->

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
    <!-- 팝업 -->

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/script.js"></script>
    <script src="/js/swiper.js"></script>

</body>
</html>