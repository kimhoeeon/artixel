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
    <meta property="og:image" content="https://artixel.kr/static/img/og/og_img.jpg">

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

    <%@ include file="header.jsp" %>

    <!-- container -->
    <div id="container">

        <!-- section -->
        <div class="main_top">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            The Truth of Art
                        </div>
                        <div class="ban-logo">
                            <img src="/img/visuals_logo.png" alt="키비주얼 로고">
                        </div>
                        <ul>
                            <li>AI</li>
                            <li>ART</li>
                        </ul>
                        <div class="paging">
                            <div class="swiperMainTopPaging"></div>
                            <div class="swiperMainTopFraction"></div>
                            <div class="swiperMainTopAutoplayBar"><span class="bar"></span></div>
                        </div>
                    </div>
                    <div class="swiper swiperMainTop">
                        <div class="swiper-wrapper">
                            <!-- item -->
                            <div class="swiper-slide item">
                                <div class="img"><img src="/img/img_main_slide_01.png" alt="미술작품"></div>
                            </div>
                            <!-- item -->
                            <div class="swiper-slide item">
                                <div class="img"><img src="/img/img_main_slide_02.png" alt="미술작품"></div>
                            </div>
                            <!-- item -->
                            <div class="swiper-slide item">
                                <div class="img"><img src="/img/img_main_slide_03.png" alt="미술작품"></div>
                            </div>
                            <!-- item -->
                            <div class="swiper-slide item">
                                <div class="img"><img src="/img/img_main_slide_04.png" alt="미술작품"></div>
                            </div>
                            <!-- //end -->

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="main_mind">
            <ul class="mind_img">
                <li data-aos="fade-up" data-aos-duration="1500" data-aos-delay="100">
                    <img src="/img/mind_img01.png" alt="이미지 소개">
                </li>
                <li data-aos="fade-up" data-aos-duration="1500" data-aos-delay="300">
                    <img src="/img/mind_img02.png" alt="이미지 소개">
                </li>
                <li data-aos="fade-up" data-aos-duration="1500" data-aos-delay="500">
                    <img src="/img/mind_img03.png" alt="이미지 소개">
                </li>
                <li data-aos="fade-up" data-aos-duration="1500" data-aos-delay="700">
                    <img src="/img/mind_img05.png" alt="이미지 소개">
                </li>
            </ul>
            <div class="inner">
                <div class="mind_txt">
                    <div class="main_tit">
                        <div class="big">
                            몇 번의 클릭으로 간편하게<br />미술품 감정을 의뢰해보세요.
                        </div>
                        <div class="small">
                            <ul>
                                <li><span>1</span> 홈페이지에 작품 사진을 업로드하세요.</li>
                                <li><span>2</span> Artixel의 AI 시스템이 작품을 분석합니다.</li>
                                <li><span>3</span> 5일 이내에 AI 평가 보고서 및 인증서를 받아보실 수 있습니다.</li>
                            </ul>
                        </div>
                        <span class="gray_txt">
                            * 제출하시는 파일은 안전하게 업로드되며 분석 서비스 목적 달성 후 파기됩니다.<br />
                            * 학습이 완료되지 않은 작가에 대해서는 서비스를 제공하지 않을 수 있습니다.
                        </span>
                        <div class="mind_txt-img" data-aos="fade-up" data-aos-duration="1500" data-aos-delay="500">
                            <img src="/img/mind_img04.png" alt="이미지 소개">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="main_truth p_tb">
            <div class="inner">
                <div class="main_tit">
                    <div class="big">
                        Artixel의 핵심 원칙
                    </div>
                </div>
                <div class="trust_wrap">
                    <ul class="truth_txt">
                        <li>
                            <div class="tit">인간의 도구</div>
                            <div class="txt">
                                <p>
                                    AI의 감정 결과는 객관적이고 수학적인 ‘통찰’을 제공합니다. 그러나 AI는 전문가를 대체하지 않습니다. 전문가의 감정(Connoisseurship), 출처에 대한 조사, 화학적·물리적 분석 결과 등을 보완하는 도구로서 AI 결과를 활용해야 합니다.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img01.png" alt="이미지 소개">
                            </div>
                        </li>
                        <li>
                            <div class="tit">기술적 투명성</div>
                            <div class="txt">
                                <p>
                                    AI의 판단 근거를 인간이 이해할 수 있어야 합니다. Artixel의 AI는 그림의 어느 부분을 보고 판단했는지 “히트맵(Heatmaps)”을 통해 시각적으로 보여줍니다. 또한 AI가 학습한 데이터 소스와 알고리즘, 그리고 한계점을 명확하게 문서화합니다.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img03.png" alt="이미지 소개">
                            </div>
                        </li>
                        <li>
                            <div class="tit">고품질 데이터</div>
                            <div class="txt">
                                <p>
                                    학습에 사용되는 데이터는 엄격하게 선별됩니다. ‘도록’에 활용된 데이터와 작가가 직접 제공하는 데이터를 학습 데이터의 핵심 소스로 사용합니다. 또한 전문가의 교차 검증을 거쳐 위작이나 모작으로 판별된 부정적 사례도 함께 학습하여 AI모델을 설계합니다.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img04.jpg" alt="이미지 소개">
                            </div>
                        </li>
                        <li>
                            <div class="tit">윤리적 절차</div>
                            <div class="txt">
                                <p>
                                    학습에 사용되는 데이터의 저작권을 준수합니다. 필요한 경우 라이선스를 확보합니다.<br />또한 우리의 AI 분석 결과는 법적인 효력을 갖을 수 없으며 법적 분쟁에서 단독 증거가 될 수 없습니다.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img05.jpg" alt="이미지 소개">
                            </div>
                        </li>
                    </ul>
                    <div class="truth_img">
                        <ul>
                            <li class="active">
                                <img src="/img/truth_img01.png" alt="이미지 소개">
                            </li>
                            <li>
                                <img src="/img/truth_img03.png" alt="이미지 소개">
                            </li>
                            <li>
                                <img src="/img/truth_img04.jpg" alt="이미지 소개">
                            </li>
                            <li>
                                <img src="/img/truth_img05.jpg" alt="이미지 소개">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="main_contact p_tb">
            <div class="inner">
                <div class="main_tit">
                    <div class="big">
                        Redefining trust in art
                    </div>
                    <div class="small">
                        예술을 더 믿을 수 있는 세상<br />
                        아티셀은 그 출발점이 되고자 합니다.
                    </div>
                    <a href="/contact">Get Started <img src="/img/arrow-right.png" alt="화살표"></a>
                </div>
                <div class="main_contact-img">
                    <img src="/img/main_contact.png" alt="미술작품 이미지">
                </div>
            </div>
        </div>
        <!-- //section -->

    </div>
    <!-- //container -->

    <%@ include file="footer.jsp" %>

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