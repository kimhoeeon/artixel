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
                    <form id="inquiryForm" class="contact_form" action="/contact/submit" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="fullEmail" name="email">

                        <table class="form_box">
                            <tbody>
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
                                        <option value="+1">미국(+1)</option>
                                        <option value="+81">일본(+81)</option>
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

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/script.js"></script>

    <script>
        $(document).ready(function() {
            // 1. 서버 측 전송 결과 메시지 처리 (ContactController에서 보낸 메시지)
            var serverMsg = '${msg}';
            if (serverMsg) {
                alert(serverMsg);
            }

            // 2. 연락처(전화번호) 하이픈 자동 생성 및 숫자만 입력 처리
            $('#contact').on('input', function() {
                var val = $(this).val().replace(/[^0-9]/g, '');
                var len = val.length;
                if(len < 4) {
                    $(this).val(val);
                } else if(len < 8) {
                    $(this).val(val.substring(0, 3) + '-' + val.substring(3));
                } else if(len < 11) {
                    $(this).val(val.substring(0, 3) + '-' + val.substring(3, 3) + '-' + val.substring(6));
                } else {
                    $(this).val(val.substring(0, 3) + '-' + val.substring(3, 4) + '-' + val.substring(7));
                }
            });

            // 3. 이메일 도메인 선택 처리 (직접입력 포함)
            $('#emailDomainSelect').on('change', function() {
                var domain = $(this).val();
                if(domain === 'direct') {
                    $('#emailDomain').val('').prop('readonly', false).focus();
                } else {
                    $('#emailDomain').val(domain).prop('readonly', true);
                }
            });

            // 4. 첨부파일 용량 제한 (100MB)
            $('#uploadFile').on('change', function() {
                var file = this.files[0];
                if (file) {
                    var maxSize = 100 * 1024 * 1024; // 100MB
                    if (file.size > maxSize) {
                        alert('첨부파일은 최대 100MB까지 업로드 가능합니다.');
                        $(this).val('');
                    }
                }
            });

            // 5. 폼 전송(Submit) 버튼 클릭 시 전체 유효성 검사
            $('#btnSubmit').on('click', function(e) {
                e.preventDefault();

                // [검증] 구분 (라디오 버튼)
                if (!$('input[name="category"]:checked').val()) {
                    alert('구분을 선택해주세요.');
                    return;
                }

                // [검증] 성함
                if (!$('#clientName').val().trim()) {
                    alert('성함을 입력해주세요.');
                    $('#clientName').focus();
                    return;
                }

                // [검증] 이메일 조합 및 세팅
                var email1 = $('#email1').val().trim();
                var emailDomain = $('#emailDomain').val().trim();
                if (!email1 || !emailDomain) {
                    alert('이메일을 정확히 입력해주세요.');
                    $('#email1').focus();
                    return;
                }
                $('#fullEmail').val(email1 + '@' + emailDomain);

                // [검증] 국가번호 및 연락처
                if (!$('#contact').val().trim()) {
                    alert('연락처를 입력해주세요.');
                    $('#contact').focus();
                    return;
                }

                // [검증] 국가 선택
                if (!$('#country').val().trim()) {
                    alert('국가를 선택해주세요.');
                    $('#country').focus();
                    return;
                }

                // [검증] 작품 크기
                if (!$('#artworkSize').val().trim()) {
                    alert('작품 크기를 입력해주세요.');
                    $('#artworkSize').focus();
                    return;
                }

                // [검증] 첨부파일 & URL 확인 (둘 중 하나 필수)
                var uploadFile = $('#uploadFile').val();
                var fileUrl = $('#fileUrl').val().trim();

                if (!uploadFile && !fileUrl) {
                    alert('작품 이미지 파일이나 URL을 첨부해주세요.');
                    return;
                }

                // URL 입력 시 https:// 검증
                if (fileUrl && !fileUrl.startsWith('https://')) {
                    alert('URL은 반드시 https:// 로 시작해야 합니다.');
                    $('#fileUrl').focus();
                    return;
                }

                // [검증] 문의 내용
                if (!$('#content').val().trim()) {
                    alert('문의 내용을 입력해주세요.');
                    $('#content').focus();
                    return;
                }

                // [검증] 개인정보 동의 여부
                if (!$('#agreePrivacy').is(':checked')) {
                    alert('개인정보 수집 및 이용에 동의해주세요.');
                    return;
                }

                // 중복 전송 방지를 위해 버튼 비활성화 및 텍스트 변경
                $(this).prop('disabled', true).text('접수 중...');

                // 모든 검사 통과 시 실제 폼 전송
                $('#inquiryForm').submit();
            });
        });
    </script>
</body>
</html>