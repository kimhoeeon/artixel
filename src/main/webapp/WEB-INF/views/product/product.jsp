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
        <div class="sub_wrap product_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            “보는 것”이 아니라 “읽는 것”
                        </div>
                        <div class="small">
                            아티셀은 이미지 유사도를 단순히 비교하지 않습니다.<br />
                            대신 작가가 반복적으로 남기는 <span>스타일 시그니처를 데이터로 읽어내,</span><br />
                            일관된 판단 근거로 정리합니다.<br /><br />
                            이를 위해 CNN으로 미세 질감·경계를 SWIN으로<br />
                            전체 구조·구도 맥락을 포착하고, 두 모델을 결합해<br />
                            디테일과 구성을 동시에 분석,<br />
                            더 빠르고 안정적인 1차 판별을 제공합니다.
                        </div>
                    </div>
                    <div class="product_img">
                        <img src="/img/product_img01.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="sub_wrap config_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            ‘진짜 같은 것’까지 구분하는 학습 구조
                        </div>
                        <div class="small">
                            아티셀은 진품 데이터만으로 학습하지 않습니다.<br />
                            위작·유사작·생성형 AI 모방 이미지까지 포함한 대비 데이터와 멀티스케일 학습으로, 환경 변화에도 흔들리지 않는 판별 근거를 설계합니다.
                        </div>
                    </div>
                </div>
                <ul class="config_list">
                    <li>
                        <div class="tit">데이터 구성</div>
                        <ul>
                            <li>• 작가별 검증된 진품 데이터셋 구축</li>
                            <li>• 문서화된 위작/모작/유사작 포함</li>
                            <li>• 추종자·아틀리에·스쿨 등 스타일 근접군 반영</li>
                            <li>• 생성형 AI 스타일 모방(디지털 위조)까지 대비 학습</li>
                        </ul>
                    </li>
                    <li>
                        <div class="tit">학습 방식</div>
                        <ul>
                            <li>• 촬영 차이를 줄이는 데이터 증강(색/명암/노이즈 등)</li>
                            <li>• 전체 이미지로 구도·비율·모티프 같은 상위 특징 학습</li>
                            <li>• 패치(소영역)로 붓터치·경계·미세 색층 학습</li>
                            <li>• 전체+디테일을 함께 잡아 안정적인 1차 판별 지원</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="sub_wrap banner_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            검증 가능한 신뢰를 설계하다
                        </div>
                        <div class="small">데이터 편중을 줄이는 품질 기준과 전문가 검수로, 학습의 출발점부터 <span>편향을 통제</span>합니다.<br />
                            교란·조작 패턴에도 흔들리지 않도록 모델 단계에서 견고성(robustness)을 강화합니다.<br />
                            그리고 결과는 교차검증과 정량 지표(Accuracy·Precision·Recall)로 반복 확인해 <span>재현성</span>을 확보합니다.</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="sub_wrap report_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            판단을 돕는 건<br />결론이 아니라 <span>근거</span>
                        </div>
                        <a href="/contact/contact">Get Started <img src="/img/arrow-right_w.png" alt="화살표"></a>
                    </div>
                </div>
                <div class="report_list">
                    <div class="txt">
                        아티셀은 작품에서 감지된 특징을 작가 시그니처와 비교해 진품 가능성 점수로 제시합니다.<br />
                        판단에 영향을 준 영역을 히트맵·특징맵으로 보여주고, 핵심을 요약 인사이트로 정리합니다.<br />
                        그래서 “맞다/아니다”의 단정이 아니라, 의사결정에 바로 쓰이는 데이터 기반 리포트를<br />
                        제공합니다.
                    </div>
                    <ul>
                        <li>
                            <img src="/img/report_img01.png" alt="리포트 이미지">
                        </li>
                        <li>
                            <img src="/img/report_img02.png" alt="리포트 이미지">
                        </li>
                        <li>
                            <img src="/img/report_img03.png" alt="리포트 이미지">
                        </li>
                    </ul>
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