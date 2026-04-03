<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html lang="ko">
<head>
    <meta name="naver-site-verification" content="4119aa15c7b47490e3741d534ff095532fdcaa18" />
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" />
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="format-detection" content="telephone=no,email=no,address=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="mobile-web-app-capable" content="yes" />

    <meta name="title" content="아티셀 |  AI기반 작품 감정 플랫폼">
    <meta name="description" content="이미지를 픽셀 단위로 해체해 작가 고유의 필치, 색의 흐름, 구도, 붓질의 리듬과 질감 등을 AI로 분석하고, 축적된 작가별 데이터를 기반으로 진위 가능성을 보고서 형식으로 제시합니다.">
    <meta property="og:type" content="website">
    <meta property="og:locale" content="ko_KR">
    <meta property="og:site_name" content="아티셀">
    <meta property="og:title" content="아티셀 |  AI기반 작품 감정 플랫폼">
    <meta property="og:description" content="이미지를 픽셀 단위로 해체해 작가 고유의 필치, 색의 흐름, 구도, 붓질의 리듬과 질감 등을 AI로 분석하고, 축적된 작가별 데이터를 기반으로 진위 가능성을 보고서 형식으로 제시합니다.">
    <meta name="keywords" content="아티셀, artixel, 그림 AI 분석, AI 그림 분석, 미술 작품 분석, 작품 분석 플랫폼, 이미지 AI 분석, 그림 분석 플랫폼, AI 이미지 분석, 미술 AI, 작품 AI 분석">
    <meta property="og:url" content="https://artixel.kr"/>
    <meta property="og:image" content="https://artixel.kr/img/og_img.jpg">

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

    <style>
        /* 전체 화면 업로드 로딩 오버레이 CSS */
        #global-upload-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.85);
            z-index: 99999;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        #global-upload-loader.active {
            opacity: 1;
            visibility: visible;
        }

        .loader-spinner {
            width: 60px;
            height: 60px;
            border: 5px solid rgba(255, 255, 255, 0.2);
            border-top: 5px solid #009ef7;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-bottom: 20px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loader-text {
            color: #ffffff;
            font-size: 1.2rem;
            font-weight: 600;
            font-family: 'Pretendard', sans-serif;
            text-align: center;
            line-height: 1.5;
            letter-spacing: -0.5px;
        }

        .loader-sub-text {
            color: #a1a5b7;
            font-size: 0.9rem;
            margin-top: 8px;
            font-family: 'Pretendard', sans-serif;
        }
    </style>

    <link rel="preload" href="/fonts/Pretendard-Regular.woff2" as="font" type="font/woff2" crossorigin>
    <link rel="preload" href="/fonts/Pretendard-Bold.woff2" as="font" type="font/woff2" crossorigin>
</head>

<body>

    <%@ include file="../header.jsp" %>

    <div id="global-upload-loader">
        <div class="loader-spinner"></div>
        <div class="loader-text">It is safely transferring large files and data.</div>
        <div class="loader-sub-text">Please wait a moment. Do not leave the screen or refresh.</div>
    </div>

    <!-- container -->
    <div id="container">

        <!-- section -->
        <div class="sub_wrap contact_wrap en">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Contact
                        </div>
                        <div class="small">
                            The information you submit<br />
                            will be used only for responding to inquiries.
                        </div>
                        <div class="btn guide">Artwork Photography Guide<img src="/img/arrow-right_w.png" alt="Arrow"></div>
                    </div>
                    <form id="inquiryForm" class="contact_form" action="/contact/submit" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="fullEmail" name="email">

                        <table class="form_box">
                            <tbody>
                            <tr class="radio">
                                <td class="gubun req">
                                    Type
                                </td>
                                <td class="naeyong">
                                    <label>
                                        <input type="radio" id="type_appraisal" name="inquiryType" value="감정의뢰" checked><label for="type_appraisal">Appraisal Request</label>
                                    </label>
                                    <label>
                                        <input type="radio" id="type_general" name="inquiryType" value="일반문의"><label for="type_general">General Inquiry</label>
                                    </label>
                                </td>
                            </tr>
                            <tr class="radio w100">
                                <td class="gubun req">
                                    Category
                                </td>
                                <td class="naeyong">
                                    <label>
                                        <input type="radio" id="cat_corp" name="category" value="기업" checked><label for="cat_corp">Company</label>
                                    </label>
                                    <label>
                                        <input type="radio" id="cat_person" name="category" value="개인"><label for="cat_person">Individual</label>
                                    </label>
                                    <label>
                                        <input type="radio" id="cat_org" name="category" value="기관"><label for="cat_org">Organization</label>
                                    </label>
                                    <label class="etc_wrap">
                                        <input type="radio" id="cat_etc" name="category" value="기타"><label for="cat_etc">Others</label>
                                    </label>
                                    <input type="text" class="etc_input" placeholder="Direct">
                                </td>
                            </tr>
                            <tr>
                                <td class="gubun req">
                                    Name
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="clientName" name="clientName" placeholder="Please enter the contact name">
                                </td>
                            </tr>
                            <tr class="email_info">
                                <td class="gubun req">
                                    Email
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="email1" maxlength="40" value="" placeholder="Email" autocomplete="off">
                                    <span>@</span>
                                    <input type="text" id="emailDomain" placeholder="Direct">
                                    <select id="emailDomainSelect">
                                        <option value="direct">Direct</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="kakao.com">kakao.com</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="outlook.com">outlook.com</option>
                                        <option value="icloud.com">icloud.com</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="number_info">
                                <td class="gubun req">
                                    Contact Number
                                </td>
                                <td class="naeyong">
                                    <select id="countryCode" name="countryCode">
                                        <option value="+82">South Korea (+82)</option>
                                        <option value="+1">United States/Canada (+1)</option>
                                        <option value="+81">Japan (+81)</option>
                                        <option value="+86">China (+86)</option>
                                        <option value="+49">Germany (+49)</option>
                                        <option value="+33">France (+33)</option>
                                        <option value="+44">United Kingdom (+44)</option>
                                        <option value="+61">Australia (+61)</option>
                                        <option value="+84">Vietnam (+84)</option>
                                        <option value="+66">Thailand (+66)</option>
                                    </select>
                                    <span>-</span>
                                    <input type="text" id="contact" name="contact" placeholder="010-1234-5678">
                                </td>
                            </tr>
                            <tr class="country_info">
                                <td class="gubun req">
                                    Select Country
                                </td>
                                <td class="naeyong">
                                    <select id="country" name="country">
                                        <option value="대한민국" selected>South Korea</option>
                                        <option value="미국">United States</option>
                                        <option value="캐나다">Canada</option>
                                        <option value="일본">Japan</option>
                                        <option value="중국">China</option>
                                        <option value="독일">Germany</option>
                                        <option value="프랑스">France</option>
                                        <option value="영국">United Kingdom</option>
                                        <option value="호주">Australia</option>
                                        <option value="베트남">Vietnam</option>
                                        <option value="태국">Thailand</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="appraisal_only">
                                <td class="gubun req">
                                    Artwork Size
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="artworkSize" name="artworkSize" placeholder="Please enter the actual size of the artwork">
                                </td>
                            </tr>
                            <tr class="w100 appraisal_only">
                                <td class="gubun">
                                    Artist Name
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="artistName" name="artistName" placeholder="Please enter the artist name">
                                </td>
                            </tr>
                            <tr class="w100 appraisal_only">
                                <td class="gubun">
                                    Artwork Title
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="artworkTitle" name="artworkTitle" placeholder="Please enter the artwork title">
                                </td>
                            </tr>
                            <tr class="file_info appraisal_only">
                                <td class="gubun req">
                                    Upload Artwork Images
                                </td>
                                <td class="naeyong">
                                    <p class="file_box">
                                        <input type="file" id="uploadFile" name="uploadFile" multiple style="display:none;">
                                        <input type="text" class="upload_name" value="Select File" disabled="disabled">
                                        <button type="button" class="btn_file" onclick="$('#uploadFile').click();">
                                            Select File
                                        </button>
                                        <input type="text" id="fileUrl" name="fileUrl" placeholder="Enter URL (https://)">
                                    </p>
                                </td>
                                <td>
                                    <ul>
                                        <li>Please select and upload multiple images at once, or provide a drive URL where the images are stored.</li>
                                        <li>Attachments can be uploaded up to <span>100MB</span>. Please check the ‘Artwork Photography Guide’ before uploading.</li>
                                        <li>If you have multiple requests or need to attach larger files, please contact contact@artixel.kr</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="textarea_info">
                                <td class="gubun req">
                                    Inquiry Details
                                </td>
                                <td class="naeyong">
                                    <textarea id="content" name="content" placeholder="Purpose: (Purchase/Exhibition/Insurance/Transaction)&#13;&#10;Artist:&#13;&#10;Year:"></textarea>
                                </td>
                            </tr>
                            <tr class="agree_info">
                                <td>
                                    <label class="agree_chk">
                                        <input type="checkbox" id="agreePrivacy" name="agreePrivacy" value="Y" required>
                                        <span class="chk_box"></span>
                                        <span class="txt">
                                            <span href="" class="btn_terms btn-open-terms" data-terms="service">Collection and Use of Personal Information</span> Agreement
                                        </span>
                                    </label>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                        <div class="btn_wrap">
                            <div class="send">
                                <a href="#" id="btnSubmit">Submit Inquiry</a>
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
                        Artwork Photography Guide
                    </div>
                    <div class="guide-txt">
                        <ul>
                            <li>• You can take photos using a digital camera or smartphone. Please shoot in <span>RAW format or high-resolution mode</span>.</li>
                            <li>• To avoid distortion caused by shooting angles, take the photo <span>from the front</span>.</li>
                            <li>• To prevent distortion caused by camera filters or adjustments, shoot in <span>default mode</span>.</li>
                            <li>• There should be <span>no light reflection</span> caused by lighting or direct sunlight.</li>
                            <li>• Make sure <span>no shadows appear</span> when taking photos.</li>
                        </ul>
                        <img src="/img/guide_img01.png" alt="Guide image">
                    </div>
                </div>
                <div class="guide-content">
                    <ul>
                        <li class="bold">
                            <span>1</span>Place an A4 sheet next to the artwork to establish a white reference, and capture the entire artwork in the photo.
                        </li>
                        <li>* Required number of photos: 1</li>
                        <li>
                            <img src="/img/guide_img02_en.png" alt="Guide image">
                        </li>
                    </ul>
                    <ul>
                        <li class="bold">
                            <span>2</span>Minimize the exposure of frames and capture the artwork so that it fills the entire image, similar to catalog photos.
                        </li>
                        <li>* Required number of photos: 1</li>
                        <li>
                            <img src="/img/guide_img03_en.png" alt="Guide image">
                        </li>
                    </ul>
                    <ul>
                        <li class="bold">
                            <span>3</span>Take close-up shots so that the texture of the paper is visible. At least 3 close-up images are required.
                        </li>
                        <li>* Required number of photos: 3</li>
                        <li>
                            <img src="/img/guide_img04_en.png" alt="Guide image">
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
                    Confirm
                </button>
            </div>
        </div>
    </div>
    <!-- 팝업 -->

    <!-- 완료 팝업 -->
    <div class="center-popup-backdrop" id="alertPopup" style="display: none; z-index: 99999;">
        <div class="center-popup" style="text-align: center;">
            <div class="center-popup_body" style="padding-top: 30px; padding-bottom: 10px;">
                <div class="center-popup_title" style="margin-bottom: 15px;">Alert</div>
                <div class="center-popup_txt" id="alertPopupTxt" style="word-break: keep-all; line-height: 1.5;"></div>
            </div>
            <div class="one_btn">
                <button type="button" class="btn btn-primary st2" onclick="$('#alertPopup').fadeOut(200);">Confirm</button>
            </div>
        </div>
    </div>
    <!-- 완료 팝업 -->

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/script.js"></script>

    <script>
        $(document).ready(function() {
            // 1. 서버 측 전송 결과 메시지 처리
            var serverMsg = '${msg}';
            if (serverMsg) {
                $('#alertPopupTxt').html(serverMsg);
                $('#alertPopup').css('display', 'flex').hide().fadeIn(300);
            }

            // 유형 라디오 버튼 변경 시 UI 토글 및 데이터 초기화
            $('input[name="inquiryType"]').on('change', function() {
                var typeVal = $(this).val();
                if (typeVal === '일반문의') {
                    // 일반문의일 경우 작품 관련 항목 숨김
                    $('.appraisal_only').hide();
                    // 숨겨진 상태에서 데이터가 전송되지 않도록 값 초기화
                    $('#artworkSize, #artistName, #artworkTitle, #fileUrl').val('');
                    $('#uploadFile').val('');
                    $('.upload_name').val('Select File');
                    $('#content').attr('placeholder', 'Please feel free to write your inquiry.');
                } else {
                    // 감정의뢰일 경우 다시 보여줌
                    $('.appraisal_only').show();
                    $('#content').attr('placeholder', 'Purpose: (Purchase/Exhibition/Insurance/Transaction)\nArtist:\nYear:');
                }
            });

            // 초기 로딩 시 한 번 강제 트리거하여 상태를 맞춰줌
            $('input[name="inquiryType"]:checked').trigger('change');

            // 1. 실시간 특수문자 및 숫자 차단 (이름, 작가명)
            // 한글 자음과 모음(ㄱ-ㅎ, ㅏ-ㅣ)을 추가로 허용하여 타이핑 도중 글자가 끊기지 않도록 방어
            $('#clientName, #artistName').on('input', function() {
                var val = $(this).val();
                var filtered = val.replace(/[^a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ\s]/g, '');
                if (val !== filtered) { $(this).val(filtered); }
            });

            // 2. 실시간 특수문자 제한 (작품 제목)
            // 한글 자음과 모음(ㄱ-ㅎ, ㅏ-ㅣ) 추가 허용
            $('#artworkTitle').on('input', function() {
                var val = $(this).val();
                var filtered = val.replace(/[^a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ\s\-\_\.\,\!\?]/g, '');
                if (val !== filtered) { $(this).val(filtered); }
            });

            // [요청 1 반영] 영문 비속어 추가 (대표적인 영문 금칙어 포함)
            const badWords = [
                '씨발', '시발', '개새끼', '병신', '지랄', '좆', '썅', '미친',
                '새끼', '니미', '애미', '애비', '염병', '존나', '창녀', '호구', '뒤져',
                'fuck', 'shit', 'bitch', 'asshole', 'cunt', 'slut', 'whore', 'bastard', 'dick', 'pussy', 'nigger', 'damn'
            ];

            // 텍스트 내 비속어 포함 여부 검사 함수
            // 대소문자 상관없이 영문 비속어를 잡아내도록 toLowerCase() 적용
            function containsBadWord(text) {
                if (!text) return false;
                let lowerText = text.toLowerCase();
                for (let i = 0; i < badWords.length; i++) {
                    if (lowerText.includes(badWords[i])) return true;
                }
                return false;
            }

            // 국가별 번호 체계를 고려한 입력 필터링 하이브리드 로직
            function formatPhoneNumber() {
                var countryCode = $('#countryCode').val();
                var $contact = $('#contact');

                if (countryCode === '+82') {
                    // 대한민국(+82)일 경우: 자동 하이픈 삽입 및 11자리 글자수 제한
                    var val = $contact.val().replace(/[^0-9]/g, '');
                    var formatted = '';

                    if (val.length < 4) {
                        formatted = val;
                    } else if (val.length < 7) {
                        formatted = val.substring(0, 3) + '-' + val.substring(3);
                    } else if (val.length < 11) {
                        formatted = val.substring(0, 3) + '-' + val.substring(3, 6) + '-' + val.substring(6);
                    } else {
                        formatted = val.substring(0, 3) + '-' + val.substring(3, 7) + '-' + val.substring(7, 11);
                    }

                    $contact.val(formatted);
                    $contact.attr('maxlength', '13');
                } else {
                    // 외국일 경우: 자유로운 번호 체계를 위해 숫자, 띄어쓰기, 하이픈만 입력 허용하고 자릿수 제한 해제
                    var val = $contact.val().replace(/[^0-9\-\s]/g, '');
                    $contact.val(val);
                    $contact.removeAttr('maxlength');
                }
            }

            // 연락처 입력 및 국가코드 변경 이벤트 바인딩
            $('#contact').on('input', formatPhoneNumber);
            $('#countryCode').on('change', function() {
                formatPhoneNumber();
                $('#contact').focus();
            });

            // 3. 이메일 도메인 선택 처리
            $('#emailDomainSelect').on('change', function() {
                var domain = $(this).val();
                if(domain === 'direct') {
                    $('#emailDomain').val('').prop('readonly', false).focus();
                } else {
                    $('#emailDomain').val(domain).prop('readonly', true);
                }
            });

            // 4. 첨부파일 용량 제한 및 파일명 표시 (UI 연동)
            $('#uploadFile').on('change', function() {
                var files = this.files;
                if (files.length > 0) {
                    var totalSize = 0;
                    var maxSize = 100 * 1024 * 1024; // 100MB
                    var fileNames = [];

                    for(var i=0; i<files.length; i++) {
                        totalSize += files[i].size;
                        fileNames.push(files[i].name);
                    }

                    if (totalSize > maxSize) {
                        alert('The total size of attachments can be up to 100MB.');
                        $(this).val('');
                        $('.upload_name').val('Select File');
                        return;
                    }

                    if (files.length === 1) {
                        $('.upload_name').val(fileNames[0]);
                    } else {
                        $('.upload_name').val(fileNames[0] + ' and ' + (files.length - 1) + ' more');
                    }
                } else {
                    $('.upload_name').val('Select File');
                }
            });

            // 5. 폼 전송(Submit) 버튼 클릭 시 전체 유효성 검사
            $('#btnSubmit').on('click', function(e) {
                e.preventDefault();

                var inputsToCheck = [
                    $('.etc_input').val(),
                    $('#clientName').val(),
                    $('#artistName').val(),
                    $('#artworkTitle').val(),
                    $('#artworkSize').val(),
                    $('#content').val()
                ];

                for (let i = 0; i < inputsToCheck.length; i++) {
                    if (containsBadWord(inputsToCheck[i])) {
                        alert('Your input contains prohibited words (profanity). Please use appropriate language.');
                        return;
                    }
                }

                // 유형 필수 검사
                var inquiryTypeVal = $('input[name="inquiryType"]:checked').val();
                if (!inquiryTypeVal) { alert('Please select a type.'); return; }

                // 구분 (라디오 버튼) 및 기타 직접입력 처리
                var categoryVal = $('input[name="category"]:checked').val();
                if (!categoryVal) { alert('Please select a category.'); return; }
                if (categoryVal === '기타') {
                    var etcVal = $('.etc_input').val().trim();
                    if (!etcVal) { alert('Please enter the details for Others.'); $('.etc_input').focus(); return; }
                    $('#cat_etc').val('Others - ' + etcVal);
                }

                // 성함
                if (!$('#clientName').val().trim()) { alert('Please enter your name.'); $('#clientName').focus(); return; }

                // 이메일 조합
                var email1 = $('#email1').val().trim();
                var emailDomain = $('#emailDomain').val().trim();
                if (!email1 || !emailDomain) {
                    alert('Please enter a valid email address.');
                    $('#email1').focus();
                    return;
                }
                $('#fullEmail').val(email1 + '@' + emailDomain);

                // 연락처
                if (!$('#contact').val().trim()) { alert('Please enter your contact number.'); $('#contact').focus(); return; }

                // 국가 선택
                if (!$('#country').val().trim()) { alert('Please select a country.'); $('#country').focus(); return; }

                // 감정의뢰일 때만 필수 검사 수행
                if (inquiryTypeVal === '감정의뢰') {
                    if (!$('#artworkSize').val().trim()) { alert('Please enter the artwork size.'); $('#artworkSize').focus(); return; }

                    var uploadFile = $('#uploadFile').val();
                    var fileUrl = $('#fileUrl').val().trim();
                    if (!uploadFile && !fileUrl) { alert('Please attach an artwork image file or URL.'); return; }
                    if (fileUrl && !fileUrl.startsWith('https://')) {
                        alert('The URL must start with https://.'); $('#fileUrl').focus(); return;
                    }
                }

                // 문의 내용
                if (!$('#content').val().trim()) { alert('Please enter your inquiry details.'); $('#content').focus(); return; }

                // 개인정보 동의
                if (!$('#agreePrivacy').is(':checked')) { alert('Please agree to the collection and use of personal information.'); return; }

                // [요청 2 반영] 모든 유효성 검사 통과 후 폼 전송 직전에 영문 페이지 꼬리표 부착!
                // 백엔드/DB 수정 없이 관리자 페이지에서 "[EN] 감정의뢰" 라고 출력되게 만듭니다.
                var selectedType = $('input[name="inquiryType"]:checked');
                if (!selectedType.val().startsWith('[EN]')) {
                    selectedType.val('[EN] ' + selectedType.val());
                }

                // 모든 유효성 검사를 통과하면 즉시 오버레이 스피너 표출 (화면 클릭 및 뒤로가기 차단)
                $('#global-upload-loader').addClass('active');

                // 폼 전송
                $('#inquiryForm').submit();
            });
        });
    </script>
</body>
</html>