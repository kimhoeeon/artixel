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

    <%@ include file="../header.jsp" %>

    <!-- container -->
    <div id="container">

        <!-- section -->
        <div class="sub_wrap product_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Not “seeing,” but “reading”
                        </div>
                        <div class="small">
                            Artixel does not simply compare image similarity.<br />
                            Instead, it reads the <span>style signatures repeatedly left by the artist as data,</span><br />
                            and organizes them into consistent grounds for judgment.<br /><br />
                            To achieve this, CNN captures fine textures and edges, while SWIN<br />
                            captures the overall structure and compositional context.<br />
                            By combining both models,<br />
                            it analyzes details and composition simultaneously,<br />
                            providing faster and more stable initial classification.
                        </div>
                    </div>
                    <div class="product_img">
                        <img src="/img/product_img01.png" alt="Image">
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
                            A learning structure that distinguishes even “almost real” works
                        </div>
                        <div class="small">
                            Artixel does not train only on authentic data.<br />
                            Through contrastive data including forgeries, similar works, and generative AI imitation images, along with multi-scale learning, it builds robust judgment criteria that remain stable under varying conditions.
                        </div>
                    </div>
                </div>
                <ul class="config_list">
                    <li>
                        <div class="tit">Data Composition</div>
                        <ul>
                            <li>• Verified authentic datasets by artist</li>
                            <li>• Includes documented forgeries, copies, and similar works</li>
                            <li>• Reflects stylistically similar groups such as followers, ateliers, and schools</li>
                            <li>• Includes training against generative AI style imitation (digital forgery)</li>
                        </ul>
                    </li>
                    <li>
                        <div class="tit">Training Method</div>
                        <ul>
                            <li>• Data augmentation to reduce capture differences (color/contrast/noise, etc.)</li>
                            <li>• Learns high-level features such as composition, proportion, and motifs from full images</li>
                            <li>• Learns brush strokes, edges, and fine color layers through patches (local regions)</li>
                            <li>• Supports stable initial classification by combining global and detailed features</li>
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
                            Designing verifiable trust
                        </div>
                        <div class="small">With quality standards that reduce data bias and expert validation, we <span>control bias</span> from the very beginning of training.<br />
                            We enhance robustness at the model level to withstand noise and manipulation patterns.<br />
                            Results are repeatedly validated through cross-validation and quantitative metrics (Accuracy, Precision, Recall) to ensure <span>reproducibility</span>.</div>
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
                            What supports decisions<br />is not the conclusion, but the <span>evidence</span>
                        </div>
                        <a href="/en/contact">Get Started <img src="/img/arrow-right_w.png" alt="Arrow"></a>
                    </div>
                </div>
                <div class="report_list">
                    <div class="txt">
                        Artixel compares detected features in artworks with artist signatures to present an authenticity probability score.<br />
                        It visualizes influential regions through heatmaps and feature maps, and summarizes key insights.<br />
                        Rather than simply stating “true or false,” it provides data-driven reports that directly support decision-making.
                    </div>
                    <ul>
                        <li>
                            <img src="/img/report_img01.png" alt="Report image">
                        </li>
                        <li>
                            <img src="/img/report_img02.png" alt="Report image">
                        </li>
                        <li>
                            <img src="/img/report_img03.png" alt="Report image">
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