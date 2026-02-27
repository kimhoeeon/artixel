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
                            Artixel은 <span>세계 최고 수준의 딥러닝 아키텍처</span>를 통해 미술품을 분석합니다.<br />
                            우리는 미술품 감정이라는 인간의 고귀한 안목을 뒷받침하고 객관화하는 시스템을 제공합니다.
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
                            붓 터치의 미세한 결까지 파악하는<br />‘시각적 통찰력’
                        </div>
                        <div class="small">
                            딥러닝 분야에서 가장 신뢰받는 ResNet(Residual Network) 아키텍처를 도입하여 인간의 눈이 놓치기 쉬운 붓 터치의 압력, 질감, 선의 굴곡을 수치화합니다.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            작품 전체의 구도와 맥락을 꿰뚫는<br />‘통합적 구조화’
                        </div>
                        <div class="small">
                            최신 자연어 처리 기술에서 영감을 얻은 Swin Transformer 모델은 작품을 작은 조각 단위로 나누어 분석하면서도, 조각들 간의 유기적인 관계를 파악합니다. 개별 붓 터치를 넘어 작품 전체의 굳, 색채 배치, 공간감을 하나의 맥락으로 이해합니다.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            지속적인 진화와 끊임없는 연구
                        </div>
                        <div class="small">
                            최근 발표된 MaxViT(Multi-Axis Vision Transformer)모델을 도입하여 감정의 정확도를 끌어올렸습니다. 고해상도 초정밀 데이터를 처리하는 최신 모델을 끊임없이 연구하고 적용하여, AI 감정 기술의 한계를 매일 경신하고 있습니다.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            전문가와 AI의 협력 ‘앙상블’시스템
                        </div>
                        <div class="small">
                            여러 가지 최첨단 AI 모델이 각자의 강점으로 작품을 다각도에서 분석하는 과정에 교수, 작가, 감정사, 미술품 보존과학자가 참여하여 Artixel만의 시스템을 완성하였습니다. 우리는 이 시스템 위에 안전하고 검증된 고품질 데이터를 쌓아 기술의 한계를 경신하고 있습니다.
                        </div>
                    </div>
                </div>
                <div class="sec_box">
                    <div class="title">
                        <div class="big">
                            해석가능성(Interpretability)과 설명가능성(Explainablity)
                        </div>
                        <div class="small">
                            AI가 이미지의 어느 부분을 근거로 판단했는지 히트맵(Heatmap) 보고서를 제공하여 감정 과정의 투명성을 보장합니다.
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