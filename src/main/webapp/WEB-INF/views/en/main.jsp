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

    <link rel="preload" href="/fonts/Pretendard-Regular.woff2" as="font" type="font/woff2" crossorigin>
    <link rel="preload" href="/fonts/Pretendard-Bold.woff2" as="font" type="font/woff2" crossorigin>
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
                            <img src="/img/visuals_logo.png" alt="Key Visual Logo">
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
                                <div class="img"><img src="/img/img_main_slide_01.png" alt="Artwork"></div>
                            </div>
                            <!-- item -->
                            <div class="swiper-slide item">
                                <div class="img"><img src="/img/img_main_slide_02.png" alt="Artwork"></div>
                            </div>
                            <!-- item -->
                            <div class="swiper-slide item">
                                <div class="img"><img src="/img/img_main_slide_03.png" alt="Artwork"></div>
                            </div>
                            <!-- item -->
                            <div class="swiper-slide item">
                                <div class="img"><img src="/img/img_main_slide_04.png" alt="Artwork"></div>
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
                    <img src="/img/mind_img01.png" alt="Image description">
                </li>
                <li data-aos="fade-up" data-aos-duration="1500" data-aos-delay="300">
                    <img src="/img/mind_img02.png" alt="Image description">
                </li>
                <li data-aos="fade-up" data-aos-duration="1500" data-aos-delay="500">
                    <img src="/img/mind_img03.png" alt="Image description">
                </li>
                <li data-aos="fade-up" data-aos-duration="1500" data-aos-delay="700">
                    <img src="/img/mind_img05.png" alt="Image description">
                </li>
            </ul>
            <div class="inner">
                <div class="mind_txt">
                    <div class="main_tit">
                        <div class="big">
                            Request an artwork appraisal easily<br />with just a few clicks.
                        </div>
                        <div class="small">
                            <ul>
                                <li><span>1</span> Upload your artwork photos on the website.</li>
                                <li><span>2</span> Artixel’s AI system analyzes the artwork.</li>
                                <li><span>3</span> Receive an AI evaluation report and certificate within 5 days.</li>
                            </ul>
                        </div>
                        <span class="gray_txt">
                            * Submitted files are securely uploaded and will be deleted after the analysis service is completed.<br />
                            * Service may not be available for artists whose data has not yet been trained.
                        </span>
                        <div class="mind_txt-img" data-aos="fade-up" data-aos-duration="1500" data-aos-delay="500">
                            <img src="/img/mind_img04.png" alt="Image description">
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
                        Artixel’s Core Principles
                    </div>
                </div>
                <div class="trust_wrap">
                    <ul class="truth_txt">
                        <li>
                            <div class="tit">A Tool for Humans</div>
                            <div class="txt">
                                <p>
                                    AI appraisal results provide objective and mathematical “insights.” However, AI does not replace experts. AI results should be used as a complementary tool alongside expert connoisseurship, provenance research, and chemical and physical analysis.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img01.png" alt="Image description">
                            </div>
                        </li>
                        <li>
                            <div class="tit">Technical Transparency</div>
                            <div class="txt">
                                <p>
                                    The basis of AI decisions must be understandable to humans. Artixel’s AI visually shows which parts of the artwork were analyzed through “heatmaps.” It also clearly documents data sources, algorithms, and limitations.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img03.png" alt="Image description">
                            </div>
                        </li>
                        <li>
                            <div class="tit">High-Quality Data</div>
                            <div class="txt">
                                <p>
                                    Data used for training is carefully selected. Core data sources include catalog data and data directly provided by artists. Negative cases identified as forgeries or reproductions are also included through expert cross-verification.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img04.jpg" alt="Image description">
                            </div>
                        </li>
                        <li>
                            <div class="tit">Ethical Process</div>
                            <div class="txt">
                                <p>
                                    We comply with copyright laws for all training data. Licenses are secured when necessary.<br />Additionally, AI analysis results have no legal authority and cannot be used as sole evidence in legal disputes.
                                </p>
                            </div>
                            <div class="m-img">
                                <img src="/img/truth_img05.jpg" alt="Image description">
                            </div>
                        </li>
                    </ul>
                    <div class="truth_img">
                        <ul>
                            <li class="active">
                                <img src="/img/truth_img01.png" alt="Image description">
                            </li>
                            <li>
                                <img src="/img/truth_img03.png" alt="Image description">
                            </li>
                            <li>
                                <img src="/img/truth_img04.jpg" alt="Image description">
                            </li>
                            <li>
                                <img src="/img/truth_img05.jpg" alt="Image description">
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
                        A world where art can be trusted more<br />
                        Artixel aims to be the starting point.
                    </div>
                    <a href="/en/contact">Get Started <img src="/img/arrow-right.png" alt="Arrow"></a>
                </div>
                <div class="main_contact-img">
                    <img src="/img/main_contact.png" alt="Artwork image">
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
                    Confirm
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