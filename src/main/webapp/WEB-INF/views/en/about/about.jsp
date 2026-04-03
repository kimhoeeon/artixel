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
        <div class="sub_wrap about_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Read Art,<br />Find Truth Artixel
                        </div>
                    </div>
                    <div class="about_txt">
                        <div class="small">
                            Artixel analyzes artworks through <span>world-class deep learning architecture</span>.<br />
                            We provide a system that supports and objectifies the refined human eye in art appraisal.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="sub_wrap think_wrap">
            <div class="inner">
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            ‘Visual Insight’ that captures even<br />the finest details of brush strokes
                        </div>
                        <div class="small">
                            By adopting the highly trusted ResNet (Residual Network) architecture in deep learning, we quantify brush pressure, texture, and line curvature that are difficult for the human eye to detect.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            ‘Integrated Structuring’ that penetrates<br />the composition and context of the entire artwork
                        </div>
                        <div class="small">
                            Inspired by the latest natural language processing technologies, the Swin Transformer model analyzes artworks by dividing them into smaller parts while understanding their organic relationships. It interprets overall composition, color arrangement, and spatial depth beyond individual brush strokes.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Continuous evolution and ongoing research
                        </div>
                        <div class="small">
                            By adopting the recently introduced MaxViT (Multi-Axis Vision Transformer) model, we have improved appraisal accuracy. We continuously research and apply cutting-edge models capable of processing ultra-high-resolution data, pushing the limits of AI-based appraisal technology every day.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Collaboration between experts and AI: the ‘Ensemble’ system
                        </div>
                        <div class="small">
                            Multiple advanced AI models analyze artworks from different perspectives using their strengths, while professors, artists, appraisers, and art conservation scientists contribute to building Artixel’s unique system. We continue to push technological boundaries with secure and verified high-quality data.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Interpretability and Explainability
                        </div>
                        <div class="small">
                            By providing heatmap reports that show which parts of the image the AI used for its judgment, we ensure transparency in the appraisal process.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //section -->

        <!-- section -->
        <div class="sub_wrap brand_wrap">
            <div class="inner">
                <!-- <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            Brand Story
                        </div>
                    </div>
                    <div class="about_txt">
                        <div class="title">
                            <div class="big">
                                “이 작품은 믿을 수 있는가?”
                            </div>
                        </div>
                        <div class="small">
                            우리는 가장 현실적인 질문에서 우리의 여정을 시작했습니다.<br /><br class="mo_br">
                            지금까지는 작품의 가치를 확인하기 위해<br class="mo_br"> 많은 비용과 시간을 감수해야 했고,<br /><br class="mo_br">
                            그 판단은 여전히 일부 전문가와 폐쇄적인 구조에 의존해 왔습니다.<br />
                            <br class="mo_br">아티셀은 이 불합리한 과정을 기술로 바꾸고자 했습니다.<br /><br />

                            아티셀의 AI는 작품을 표면적으로<br class="mo_br"> 비교하지 않습니다.<br />
                            <br class="mo_br">이미지를 픽셀 단위로 해체해 작가 고유의 필치,<br class="mo_br"> 색의 흐름, 붓질의 리듬과 질감의 층위를<br />
                            분석하고, 축적된 작가별시그니처 패턴을 기반으로<br class="mo_br"> 진위 가능성을 데이터로 제시합니다.<br />
                            <br class="mo_br">결과는 빠르고 투명한 리포트로 제공되며,<br class="mo_br"> 누구나 같은 기준에서 확인할 수 있습니다.<br /><br />

                            <br class="mo_br">아티셀은 예술을 단정하지 않습니다.<br /><br class="mo_br">
                            기술을 통해 판단의 근거를 드러내고,<br class="mo_br"> 신뢰할 수 있는 선택을 돕습니다.<br /><br />

                            <br class="mo_br">더 많은 사람이 예술을 이해하고,<br class="mo_br"> 안심하고 마주할 수 있도록.<br />
                            <br class="mo_br">아티셀은 그 출발점이 되고자 합니다.
                        </div>
                    </div>
                </div> -->
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