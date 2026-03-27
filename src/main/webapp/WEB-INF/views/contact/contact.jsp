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

</head>

<body>

    <%@ include file="../header.jsp" %>

    <div id="global-upload-loader">
        <div class="loader-spinner"></div>
        <div class="loader-text">대용량 파일과 데이터를 안전하게 전송 중입니다.</div>
        <div class="loader-sub-text">잠시만 기다려주세요. 화면을 벗어나거나 새로고침하지 마세요.</div>
    </div>

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
                    <form id="inquiryForm" class="contact_form" action="/contact/submit" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="fullEmail" name="email">

                        <table class="form_box">
                            <tbody>
                            <tr class="radio">
                                <td class="gubun req">
                                    유형
                                </td>
                                <td class="naeyong">
                                    <label>
                                        <input type="radio" id="type_appraisal" name="inquiryType" value="감정의뢰" checked><label for="type_appraisal">감정의뢰</label>
                                    </label>
                                    <label>
                                        <input type="radio" id="type_general" name="inquiryType" value="일반문의"><label for="type_general">일반문의</label>
                                    </label>
                                </td>
                            </tr>
                            <tr class="radio">
                                <td class="gubun req">
                                    구분
                                </td>
                                <td class="naeyong">
                                    <label>
                                        <input type="radio" id="cat_corp" name="category" value="기업" checked><label for="cat_corp">기업</label>
                                    </label>
                                    <label>
                                        <input type="radio" id="cat_person" name="category" value="개인"><label for="cat_person">개인</label>
                                    </label>
                                    <label>
                                        <input type="radio" id="cat_org" name="category" value="기관"><label for="cat_org">기관</label>
                                    </label>
                                    <label class="etc_wrap">
                                        <input type="radio" id="cat_etc" name="category" value="기타"><label for="cat_etc">기타</label>
                                    </label>
                                    <input type="text" class="etc_input" placeholder="직접입력">
                                </td>
                            </tr>
                            <tr>
                                <td class="gubun req">
                                    성함
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="clientName" name="clientName" placeholder="담당자명을 입력해주세요">
                                </td>
                            </tr>
                            <tr class="email_info">
                                <td class="gubun req">
                                    이메일
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="email1" maxlength="40" value="" placeholder="이메일" autocomplete="off">
                                    <span>@</span>
                                    <input type="text" id="emailDomain" placeholder="직접입력">
                                    <select id="emailDomainSelect">
                                        <option value="direct">직접입력</option>
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
                                    연락처
                                </td>
                                <td class="naeyong">
                                    <select id="countryCode" name="countryCode">
                                        <option value="+82">대한민국 (+82)</option>
                                        <option value="+1">미국/캐나다 (+1)</option>
                                        <option value="+81">일본 (+81)</option>
                                        <option value="+86">중국 (+86)</option>
                                        <option value="+49">독일 (+49)</option>
                                        <option value="+33">프랑스 (+33)</option>
                                        <option value="+44">영국 (+44)</option>
                                        <option value="+61">호주 (+61)</option>
                                        <option value="+84">베트남 (+84)</option>
                                        <option value="+66">태국 (+66)</option>
                                    </select>
                                    <span>-</span>
                                    <input type="text" id="contact" name="contact" placeholder="010-1234-5678">
                                </td>
                            </tr>
                            <tr class="country_info">
                                <td class="gubun req">
                                    국가 선택
                                </td>
                                <td class="naeyong">
                                    <select id="country" name="country">
                                        <option value="대한민국" selected>대한민국 (South Korea)</option>
                                        <option value="일본">일본 (Japan)</option>
                                        <option value="중국">중국 (China)</option>
                                        <option value="미국">미국 (United States)</option>
                                        <option value="캐나다">캐나다 (Canada)</option>
                                        <option value="독일">독일 (Germany)</option>
                                        <option value="프랑스">프랑스 (France)</option>
                                        <option value="영국">영국 (United Kingdom)</option>
                                        <option value="호주">호주 (Australia)</option>
                                        <option value="베트남">베트남 (Vietnam)</option>
                                        <option value="태국">태국 (Thailand)</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="gubun req">
                                    작품 크기
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="artworkSize" name="artworkSize" placeholder="그림의 실제 사이즈를 작성해주세요">
                                </td>
                            </tr>
                            <tr class="w100">
                                <td class="gubun">
                                    작가명
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="artistName" name="artistName" placeholder="작가명을 입력해주세요">
                                </td>
                            </tr>
                            <tr class="w100">
                                <td class="gubun">
                                    작품 제목
                                </td>
                                <td class="naeyong">
                                    <input type="text" id="artworkTitle" name="artworkTitle" placeholder="작품 제목을 입력해주세요">
                                </td>
                            </tr>
                            <tr class="file_info">
                                <td class="gubun req">
                                    작품 사진 첨부
                                </td>
                                <td class="naeyong">
                                    <p class="file_box">
                                        <input type="file" id="uploadFile" name="uploadFile" style="display:none;">

                                        <input type="text" class="upload_name" value="파일선택" disabled="disabled">
                                        <button type="button" class="btn_file" onclick="$('#uploadFile').click();">
                                            파일 선택
                                        </button>
                                        <input type="text" id="fileUrl" name="fileUrl" placeholder="URL 입력 (https://)">
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
                                    <textarea id="content" name="content" placeholder="목적 : (매입/전시/보험/거래)&#13;&#10;작가 :&#13;&#10;연도 :"></textarea>
                                </td>
                            </tr>
                            <tr class="agree_info">
                                <td>
                                    <label class="agree_chk">
                                        <input type="checkbox" id="agreePrivacy" name="agreePrivacy" value="Y" required>
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
                                <a href="#" id="btnSubmit">문의하기</a>
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

    <!-- 완료 팝업 -->
    <div class="center-popup-backdrop" id="alertPopup" style="display: none; z-index: 99999;">
        <div class="center-popup" style="text-align: center;">
            <div class="center-popup_body" style="padding-top: 30px; padding-bottom: 10px;">
                <div class="center-popup_title" style="margin-bottom: 15px;">알림</div>
                <div class="center-popup_txt" id="alertPopupTxt" style="word-break: keep-all; line-height: 1.5;"></div>
            </div>
            <div class="one_btn">
                <button type="button" class="btn btn-primary st2" onclick="$('#alertPopup').fadeOut(200);">확인</button>
            </div>
        </div>
    </div>
    <!-- 완료 팝업 -->

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

            // 1. 실시간 특수문자 및 숫자 차단 (이름, 작가명)
            // 허용: 한글, 영문 대소문자, 공백
            $('#clientName, #artistName').on('input', function() {
                var val = $(this).val();
                var filtered = val.replace(/[^a-zA-Z가-힣\s]/g, '');
                if (val !== filtered) {
                    $(this).val(filtered);
                }
            });

            // 2. 실시간 특수문자 제한 (작품 제목)
            // 허용: 한글, 영문 대소문자, 숫자, 공백, 기본 기호(- _ . , ! ?)
            $('#artworkTitle').on('input', function() {
                var val = $(this).val();
                var filtered = val.replace(/[^a-zA-Z0-9가-힣\s\-\_\.\,\!\?]/g, '');
                if (val !== filtered) {
                    $(this).val(filtered);
                }
            });

            // 3. 비속어(금칙어) 사전 배열
            const badWords = [
                '씨발', '시발', '개새끼', '병신', '지랄', '좆', '썅', '미친',
                '새끼', '니미', '애미', '애비', '염병', '존나', '창녀', '호구', '뒤져'
            ];

            // 텍스트 내 비속어 포함 여부 검사 함수
            function containsBadWord(text) {
                if (!text) return false;
                for (let i = 0; i < badWords.length; i++) {
                    if (text.includes(badWords[i])) return true;
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
                var file = this.files[0];
                if (file) {
                    var maxSize = 100 * 1024 * 1024; // 100MB
                    if (file.size > maxSize) {
                        alert('첨부파일은 최대 100MB까지 업로드 가능합니다.');
                        $(this).val('');
                        $('.upload_name').val('파일선택');
                        return;
                    }
                    // 정상 파일 첨부 시 화면에 파일명 표시
                    var fileName = $(this).val().split('\\').pop();
                    $('.upload_name').val(fileName);
                } else {
                    $('.upload_name').val('파일선택');
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

                for (var i = 0; i < inputsToCheck.length; i++) {
                    if (containsBadWord(inputsToCheck[i])) {
                        alert('입력하신 내용에 금칙어(비속어)가 포함되어 있습니다. 바른 말을 사용해주세요.');
                        return; // 전송 중단
                    }
                }

                // 유형 필수 검사
                var inquiryTypeVal = $('input[name="inquiryType"]:checked').val();
                if (!inquiryTypeVal) {
                    alert('유형을 선택해주세요.');
                    return;
                }

                // 구분 (라디오 버튼) 및 기타 직접입력 처리
                var categoryVal = $('input[name="category"]:checked').val();
                if (!categoryVal) {
                    alert('구분을 선택해주세요.');
                    return;
                }
                if (categoryVal === '기타') {
                    var etcVal = $('.etc_input').val().trim();
                    if (!etcVal) {
                        alert('기타 세부항목을 직접 입력해주세요.');
                        $('.etc_input').focus();
                        return;
                    }
                    // 전송 직전에 라디오 버튼의 값을 "기타 - 입력내용" 으로 변경하여 서버로 전송
                    $('#cat_etc').val('기타 - ' + etcVal);
                }

                // 성함
                if (!$('#clientName').val().trim()) {
                    alert('성함을 입력해주세요.');
                    $('#clientName').focus();
                    return;
                }

                // 이메일 조합
                var email1 = $('#email1').val().trim();
                var emailDomain = $('#emailDomain').val().trim();
                if (!email1 || !emailDomain) {
                    alert('이메일을 정확히 입력해주세요.');
                    $('#email1').focus();
                    return;
                }
                $('#fullEmail').val(email1 + '@' + emailDomain);

                // 연락처
                if (!$('#contact').val().trim()) {
                    alert('연락처를 입력해주세요.');
                    $('#contact').focus();
                    return;
                }

                // 국가 선택
                if (!$('#country').val().trim()) {
                    alert('국가를 선택해주세요.');
                    $('#country').focus();
                    return;
                }

                // 작품 크기
                if (!$('#artworkSize').val().trim()) {
                    alert('작품 크기를 입력해주세요.');
                    $('#artworkSize').focus();
                    return;
                }

                // 첨부파일 & URL 확인
                var uploadFile = $('#uploadFile').val();
                var fileUrl = $('#fileUrl').val().trim();

                if (!uploadFile && !fileUrl) {
                    alert('작품 이미지 파일이나 URL을 첨부해주세요.');
                    return;
                }

                if (fileUrl && !fileUrl.startsWith('https://')) {
                    alert('URL은 반드시 https:// 로 시작해야 합니다.');
                    $('#fileUrl').focus();
                    return;
                }

                // 문의 내용
                if (!$('#content').val().trim()) {
                    alert('문의 내용을 입력해주세요.');
                    $('#content').focus();
                    return;
                }

                // 개인정보 동의
                if (!$('#agreePrivacy').is(':checked')) {
                    alert('개인정보 수집 및 이용에 동의해주세요.');
                    return;
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