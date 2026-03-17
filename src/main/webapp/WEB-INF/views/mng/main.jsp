<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" />
    <meta name="format-detection" content="telephone=no,email=no,address=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="mobile-web-app-capable" content="yes" />

    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">

    <title>관리자 메인 | Artixel 관리자</title>
    <link href="/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/mngStyle.css" rel="stylesheet">
    <style>
        /* ====================================================
           [핵심] 기존 라이트 테마를 완벽한 다크 테마로 강제 덮어쓰기
        ==================================================== */
        body, #kt_body, #kt_wrapper, #kt_content, .page, .content {
            background-color: #0c0d12 !important; /* 고급스러운 완전 딥 다크 배경 */
        }

        /* 사이드바 및 헤더(탑바) 영역 다크화 */
        #kt_aside { background-color: #12131a !important; }
        #kt_header { background-color: #12131a !important; border-bottom: 1px solid #1f212a !important; }

        /* 메뉴 텍스트 묻힘 방지 */
        .aside-menu .menu-title { color: #878c9f !important; font-weight: 500; transition: color 0.2s ease;}
        .aside-menu .menu-link:hover .menu-title,
        .aside-menu .menu-link.active .menu-title { color: #ffffff !important; font-weight: 600; }
        .aside-menu .menu-icon i { color: #56596b !important; transition: color 0.2s ease;}
        .aside-menu .menu-link:hover .menu-icon i,
        .aside-menu .menu-link.active .menu-icon i { color: #009ef7 !important; }

        /* 메인 공통 텍스트 화이트 처리 */
        h1, .text-dark, .text-gray-800, .text-gray-900 { color: #ffffff !important; }

        /* 프리미엄 다크 카드(Glassmorphism) 및 네온 디자인 */
        .premium-card {
            background-color: #15161d !important;
            border: 1px solid #22242f !important;
            border-radius: 16px;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        .premium-card:hover {
            transform: translateY(-5px);
            border-color: #3b3e52 !important;
            box-shadow: 0 10px 30px rgba(0,0,0,0.6) !important;
        }

        /* 네온 아이콘 발광 효과 */
        .icon-glow-primary { text-shadow: 0 0 20px rgba(114, 57, 234, 0.8); color: #7239ea !important; }
        .icon-glow-success { text-shadow: 0 0 20px rgba(80, 205, 137, 0.8); color: #50cd89 !important; }
        .icon-glow-info    { text-shadow: 0 0 20px rgba(0, 158, 247, 0.8); color: #009ef7 !important; }
        .icon-glow-warning { text-shadow: 0 0 20px rgba(255, 199, 0, 0.8); color: #ffc700 !important; }
        .icon-glow-danger  { text-shadow: 0 0 20px rgba(241, 65, 108, 0.8); color: #f1416c !important; }

        /* 테이블 호버 이펙트 */
        .table-row-dashed tr { border-bottom: 1px dashed #22242f !important; }
        .table-row-dashed tr:hover td { background-color: rgba(255,255,255,0.03); }

        /* 차트 탭 버튼 */
        .nav-pills-custom .nav-link { background-color: #1b1c24; color: #878c9f !important; border: 1px solid #22242f; transition: all 0.3s ease;}
        .nav-pills-custom .nav-link:hover { color: #fff !important; background-color: #2b2c3a; }
        .nav-pills-custom .nav-link.active { background-color: #009ef7 !important; color: white !important; border-color: #009ef7; box-shadow: 0 0 15px rgba(0, 158, 247, 0.4); }

        /* ApexCharts 툴팁 다크 테마 */
        .apexcharts-tooltip { background: #151521 !important; border: 1px solid #2b2b40 !important; box-shadow: 0 0.5rem 1.5rem 0.5rem rgba(0,0,0,0.4) !important; color: #fff; }
        .apexcharts-tooltip-title { background: #1e1e2d !important; border-bottom: 1px solid #2b2b40 !important; font-weight: 700; color: #a1a5b7 !important; }
    </style>
</head>
<body id="kt_app_body"
      data-kt-app-layout="dark-sidebar"
      data-kt-app-header-fixed="true"
      data-kt-app-sidebar-enabled="true"
      data-kt-app-sidebar-fixed="true"
      data-kt-app-sidebar-hoverable="true"
      data-kt-app-sidebar-push-header="true"
      data-kt-app-sidebar-push-toolbar="true"
      data-kt-app-sidebar-push-footer="true"
      data-kt-app-toolbar-enabled="true"
      class="app-default">

    <div class="d-flex flex-column flex-root app-root" id="kt_app_root">
        <div class="app-page flex-column flex-column-fluid" id="kt_app_page">
            <jsp:include page="/WEB-INF/views/mng/include/header.jsp"/>

            <div class="app-wrapper flex-column flex-row-fluid" id="kt_app_wrapper">
                <jsp:include page="/WEB-INF/views/mng/include/sidebar.jsp"/>

                <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                    <div class="d-flex flex-column flex-column-fluid">
                        <div id="kt_app_content" class="app-content flex-column-fluid">
                            <div id="kt_content_container" class="container-xxl">

                                <div class="d-flex justify-content-between align-items-center mb-8 mt-5">
                                    <h1 class="d-flex align-items-center fw-bolder fs-1 my-1">
                                        대시보드
                                        <span class="h-20px border-gray-700 border-start ms-4 mx-2"></span>
                                        <small class="text-muted fs-6 fw-bold my-1 ms-3">Artixel Analytics</small>
                                    </h1>
                                </div>

                                <div class="row g-5 mb-8 align-items-stretch">
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card h-100">
                                            <div class="card-body px-7 py-6 d-flex flex-column justify-content-between">
                                                <div>
                                                    <i class="ki-outline ki-message-text-2 fs-2x mb-4 d-block icon-glow-primary"></i>
                                                    <div class="text-gray-400 fw-bolder fs-5 mb-2 text-nowrap">누적 문의 건수</div>
                                                </div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${totalInquiryCount}" pattern="#,###"/> <span class="fs-5 text-gray-600">건</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card h-100">
                                            <div class="card-body px-7 py-6 d-flex flex-column justify-content-between">
                                                <div>
                                                    <i class="ki-outline ki-user fs-2x mb-4 d-block icon-glow-success"></i>
                                                    <div class="text-gray-400 fw-bolder fs-5 mb-2 text-nowrap">누적 순 방문자</div>
                                                </div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${totalUniqueVisitors}" pattern="#,###"/> <span class="fs-5 text-gray-600">명</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card h-100">
                                            <div class="card-body px-7 py-6 d-flex flex-column justify-content-between">
                                                <div>
                                                    <i class="ki-outline ki-profile-user fs-2x mb-4 d-block icon-glow-info"></i>
                                                    <div class="text-gray-400 fw-bolder fs-5 mb-2 text-nowrap">누적 전체 방문자</div>
                                                </div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${totalVisitors}" pattern="#,###"/> <span class="fs-5 text-gray-600">명</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card h-100">
                                            <div class="card-body px-7 py-6 d-flex flex-column justify-content-between">
                                                <div>
                                                    <i class="ki-outline ki-bulb fs-2x mb-4 d-block icon-glow-warning"></i>
                                                    <div class="text-gray-400 fw-bolder fs-5 mb-2 text-nowrap">오늘 신규 의뢰</div>
                                                </div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${todayInquiryCount}" pattern="#,###"/> <span class="fs-5 text-gray-600">건</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card premium-card mb-8">
                                    <div class="card-header pt-7 border-0 mb-3">
                                        <h3 class="card-title align-items-start flex-column">
                                            <span class="card-label fw-bolder text-white fs-3">상위 조회 페이지 TOP 5</span>
                                        </h3>
                                    </div>
                                    <div class="card-body pt-0 pb-8">
                                        <div class="table-responsive">
                                            <table class="table align-middle table-row-dashed fs-6 gy-4 border-bottom border-gray-800">
                                                <thead>
                                                <tr class="text-start text-muted fw-bolder fs-7 text-uppercase gs-0">
                                                    <th class="w-60px text-center">순위</th>
                                                    <th class="min-w-150px">페이지명</th>
                                                    <th class="min-w-200px">URL 주소</th>
                                                    <th class="text-end">조회수</th>
                                                </tr>
                                                </thead>
                                                <tbody class="fw-bold text-gray-400">
                                                <c:choose>
                                                    <c:when test="${empty topPages}">
                                                        <tr><td colspan="4" class="text-center text-muted py-10">수집된 페이지 조회 데이터가 없습니다.</td></tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="item" items="${topPages}" varStatus="status">
                                                            <c:set var="badgeClass" value="badge-light-dark" />
                                                            <c:set var="textClass" value="text-gray-500" />
                                                            <c:if test="${status.index == 0}"> <c:set var="badgeClass" value="badge-light-danger" /> <c:set var="textClass" value="text-danger" /> </c:if>
                                                            <c:if test="${status.index == 1}"> <c:set var="badgeClass" value="badge-light-warning" /> <c:set var="textClass" value="text-warning" /> </c:if>
                                                            <c:if test="${status.index == 2}"> <c:set var="badgeClass" value="badge-light-success" /> <c:set var="textClass" value="text-success" /> </c:if>
                                                            <c:if test="${status.index == 3}"> <c:set var="badgeClass" value="badge-light-info" /> <c:set var="textClass" value="text-info" /> </c:if>

                                                            <tr>
                                                                <td class="text-center">
                                                                    <span class="badge badge-square ${badgeClass} fw-bolder px-3 py-2 ${textClass}">${status.index + 1}</span>
                                                                </td>
                                                                <td>
                                                                    <a href="${item.pageUrl}" target="_blank" class="text-white text-hover-primary fs-6 fw-bolder">${item.pageName}</a>
                                                                </td>
                                                                <td>
                                                                    <a href="${item.pageUrl}" target="_blank" class="text-muted text-hover-info fs-7 d-flex align-items-center">
                                                                        <i class="ki-outline ki-link fs-6 me-2"></i>${item.pageUrl}
                                                                    </a>
                                                                </td>
                                                                <td class="text-end text-primary fs-5 fw-bolder">
                                                                    <fmt:formatNumber value="${item.viewCount}" pattern="#,###"/>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-5 mb-8">
                                    <div class="col-xl-6">
                                        <div class="card h-100 premium-card">
                                            <div class="card-header pt-7 border-0 align-items-center">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-white fs-3">홈페이지 방문 현황</span>
                                                </h3>
                                                <div class="card-toolbar">
                                                    <ul class="nav nav-pills nav-pills-custom mb-0">
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateVisitChart('DAY')">Day</a></li>
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4 active" data-bs-toggle="tab" onclick="updateVisitChart('WEEK')">Week</a></li>
                                                        <li class="nav-item mb-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateVisitChart('MONTH')">Month</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="card-body pt-0 pb-5">
                                                <div id="kt_visit_chart" style="height: 350px;"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-6">
                                        <div class="card h-100 premium-card">
                                            <div class="card-header pt-7 border-0 align-items-center">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-white fs-3">문의 현황</span>
                                                </h3>
                                                <div class="card-toolbar">
                                                    <ul class="nav nav-pills nav-pills-custom mb-0">
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateInquiryChart('DAY')">Day</a></li>
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4 active" data-bs-toggle="tab" onclick="updateInquiryChart('WEEK')">Week</a></li>
                                                        <li class="nav-item mb-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateInquiryChart('MONTH')">Month</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="card-body pt-0 pb-5">
                                                <div id="kt_inquiry_chart" style="height: 350px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-5 mb-8">
                                    <div class="col-xl-6">
                                        <div class="card h-md-100 premium-card">
                                            <div class="card-header pt-7 border-0 align-items-center">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-white fs-3">국가별 문의 현황</span>
                                                </h3>
                                                <div class="card-toolbar">
                                                    <ul class="nav nav-pills nav-pills-custom mb-0">
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateCountryChart('DAY')">Day</a></li>
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4 active" data-bs-toggle="tab" onclick="updateCountryChart('WEEK')">Week</a></li>
                                                        <li class="nav-item mb-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateCountryChart('MONTH')">Month</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="card-body d-flex align-items-center justify-content-center pt-2 pb-8">
                                                <div id="kt_country_pie_chart" style="width: 100%; max-width: 480px;"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-6">
                                        <div class="card h-100 premium-card">
                                            <div class="card-header pt-7 border-0 mb-3">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-white fs-3">서버 시스템 리소스</span>
                                                </h3>
                                            </div>
                                            <div class="card-body pt-0 pb-8 d-flex flex-column justify-content-between">
                                                <div class="d-flex flex-column gap-5">

                                                    <div class="d-flex align-items-center p-4 rounded" style="background-color: rgba(255,255,255,0.02); border: 1px solid #2b2b40;">
                                                        <div class="symbol symbol-50px me-5">
                                                            <span class="symbol-label bg-light-primary"><i class="ki-outline ki-setting-2 fs-2x text-primary icon-glow-primary"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column flex-grow-1">
                                                            <span class="text-white fw-bolder fs-5 mb-1">${sysInfo.osName} (${sysInfo.osArch})</span>
                                                            <span class="text-muted fw-bold">Java ${sysInfo.javaVersion}</span>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center p-4 rounded" style="background-color: rgba(255,255,255,0.02); border: 1px solid #2b2b40;">
                                                        <div class="symbol symbol-50px me-5">
                                                            <span class="symbol-label bg-light-success"><i class="ki-outline ki-chart-pie-4 fs-2x text-success icon-glow-success"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column flex-grow-1">
                                                            <div class="d-flex justify-content-between mb-2">
                                                                <span class="text-gray-300 fw-bolder fs-6">메모리 사용량</span>
                                                                <span class="text-muted fw-bold">${sysInfo.usedMemory} MB <span class="text-gray-600">/ ${sysInfo.totalMemory} MB</span></span>
                                                            </div>
                                                            <div class="progress h-6px w-100 bg-light-success"><div class="progress-bar bg-success rounded progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${(sysInfo.usedMemory / sysInfo.totalMemory) * 100}%"></div></div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center p-4 rounded" style="background-color: rgba(255,255,255,0.02); border: 1px solid #2b2b40;">
                                                        <div class="symbol symbol-50px me-5">
                                                            <span class="symbol-label bg-light-danger"><i class="ki-outline ki-archive fs-2x text-danger icon-glow-danger"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column flex-grow-1">
                                                            <div class="d-flex justify-content-between mb-2">
                                                                <span class="text-gray-300 fw-bolder fs-6">디스크 사용량</span>
                                                                <span class="text-muted fw-bold">${sysInfo.usedSpace} GB <span class="text-gray-600">/ ${sysInfo.totalSpace} GB</span></span>
                                                            </div>
                                                            <div class="progress h-6px w-100 bg-light-danger"><div class="progress-bar bg-danger rounded progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${(sysInfo.usedSpace / sysInfo.totalSpace) * 100}%"></div></div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex justify-content-between gap-4 mt-2">
                                                        <div class="d-flex align-items-center p-4 rounded w-100" style="background-color: rgba(255,255,255,0.02); border: 1px solid #2b2b40;">
                                                            <i class="ki-outline ki-route fs-2x text-info me-4 icon-glow-info"></i>
                                                            <div class="d-flex flex-column"><span class="text-muted fs-7">Server IP</span><span class="text-white fw-bolder fs-5">${sysInfo.serverIp}</span></div>
                                                        </div>
                                                        <div class="d-flex align-items-center p-4 rounded w-100" style="background-color: rgba(255,255,255,0.02); border: 1px solid #2b2b40;">
                                                            <i class="ki-outline ki-user fs-2x text-warning me-4 icon-glow-warning"></i>
                                                            <div class="d-flex flex-column"><span class="text-muted fs-7">Client IP</span><span class="text-white fw-bolder fs-5">${sysInfo.clientIp}</span></div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/assets/plugins/global/plugins.bundle.js"></script>
    <script src="/assets/js/scripts.bundle.js"></script>

    <script>
        $(document).ready(function() {
            var visitData = ${visitChartsJson};
            var inquiryData = ${inquiryChartsJson};
            var countryData = ${countryChartsJson};

            var visitChart, inquiryChart, countryPieChart;

            // [1] 방문 현황
            var visitOptions = {
                series: [{ name: '방문자 수', data: [] }],
                chart: { type: 'area', height: 350, toolbar: { show: false }, fontFamily: 'Pretendard' },
                colors: ['#7239ea'],
                fill: { type: 'gradient', gradient: { shadeIntensity: 1, opacityFrom: 0.6, opacityTo: 0.05, stops: [20, 100] } },
                dataLabels: { enabled: false },
                stroke: { curve: 'smooth', width: 3 },
                xaxis: { categories: [], axisBorder: { show: false }, axisTicks: { show: false }, labels: { style: { colors: '#6c6c89' } } },
                yaxis: { labels: { style: { colors: '#6c6c89' } } },
                grid: { borderColor: '#22242f', strokeDashArray: 4 },
                tooltip: { theme: 'dark', style: { fontSize: '13px' }, y: { formatter: function (val) { return val + " 명" } } }
            };
            visitChart = new ApexCharts(document.querySelector("#kt_visit_chart"), visitOptions);
            visitChart.render();

            // [2] 문의 현황
            var inquiryOptions = {
                series: [],
                chart: { type: 'bar', height: 350, stacked: true, toolbar: { show: false }, fontFamily: 'Pretendard' },
                colors: ['#009ef7', '#50cd89', '#f1416c', '#ffc700'],
                plotOptions: { bar: { horizontal: false, borderRadius: 3, columnWidth: '40%' } },
                dataLabels: { enabled: false },
                xaxis: { categories: [], axisBorder: { show: false }, axisTicks: { show: false }, labels: { style: { colors: '#6c6c89' } } },
                yaxis: { labels: { style: { colors: '#6c6c89' } } },
                grid: { borderColor: '#22242f', strokeDashArray: 4 },
                legend: { position: 'top', horizontalAlign: 'right', labels: { colors: '#a1a5b7' }, markers: { radius: 12 } },
                tooltip: { theme: 'dark' },
                fill: { opacity: 1 }
            };
            inquiryChart = new ApexCharts(document.querySelector("#kt_inquiry_chart"), inquiryOptions);
            inquiryChart.render();

            // [3] 국가별 통계
            var pieOptions = {
                series: [],
                labels: [],
                chart: { type: 'donut', height: 380, fontFamily: 'Pretendard' },
                colors: ['#009ef7', '#50cd89', '#f1416c', '#ffc700', '#7239ea'],
                stroke: { show: true, width: 2, colors: ['#15161d'] },
                dataLabels: { enabled: true, dropShadow: { enabled: true, top: 1, left: 1, blur: 1, opacity: 0.5 }, formatter: function (val, opts) { return opts.w.config.series[opts.seriesIndex] + "건"; } },
                plotOptions: { donut: { size: '70%', labels: { show: true, name: { color: '#a1a5b7' }, value: { color: '#fff', fontSize: '30px', fontWeight: 700 }, total: { show: true, showAlways: true, label: '총 문의', color: '#6c6c89', fontSize: '16px', formatter: function (w) { return w.globals.seriesTotals.reduce((a, b) => { return a + b }, 0) + " 건" } } } } },
                legend: { position: 'bottom', horizontalAlign: 'center', labels: { colors: '#a1a5b7' } },
                tooltip: { theme: 'dark' }
            };
            countryPieChart = new ApexCharts(document.querySelector("#kt_country_pie_chart"), pieOptions);
            countryPieChart.render();

            window.updateVisitChart = function(period) {
                visitChart.updateSeries([{ data: visitData[period].data }]);
                visitChart.updateOptions({ xaxis: { categories: visitData[period].categories } });
            };
            window.updateInquiryChart = function(period) {
                inquiryChart.updateSeries(inquiryData[period].series);
                inquiryChart.updateOptions({ xaxis: { categories: inquiryData[period].categories } });
            };
            window.updateCountryChart = function(period) {
                countryPieChart.updateSeries(countryData[period].series);
                countryPieChart.updateOptions({ labels: countryData[period].labels });
            };

            // 초기 세팅 (WEEK)
            updateVisitChart('WEEK');
            updateInquiryChart('WEEK');
            updateCountryChart('WEEK');
        });
    </script>

</body>
</html>