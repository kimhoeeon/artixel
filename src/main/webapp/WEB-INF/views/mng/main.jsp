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
    <link rel="manifest" href="/site.webmanifest" />

    <title>관리자 메인 | Artixel 관리자</title>
    <link href="/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/mngStyle.css" rel="stylesheet">
    <style>
        .apexcharts-tooltip { background: #1e1e2d !important; border: 0 !important; box-shadow: 0 0.5rem 1.5rem 0.5rem rgba(0,0,0,0.075) !important; color: #fff; }
        .apexcharts-tooltip-title { background: #151521 !important; border-bottom: 1px solid #2b2b40 !important; font-weight: 700; }
        .premium-card { transition: all 0.3s ease; border: 0; border-radius: 12px; }
        .premium-card:hover { transform: translateY(-5px); box-shadow: 0 1rem 3rem rgba(0,0,0,0.1) !important; }
        .nav-pills-custom .nav-link.active { background-color: #009ef7; color: white !important; }
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
                            <div id="kt_app_content_container" class="app-container container-xxl">

                                <c:if test="${sessionScope.admin.role eq 'SUPER'}">
                                    <div class="card mb-8 bg-light-warning border-warning border-dashed">
                                        <div class="card-body py-5 d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <i class="ki-duotone ki-security-user fs-1 text-warning me-4">
                                                    <span class="path1"></span>
                                                    <span class="path2"></span>
                                                </i>
                                                <div class="d-flex flex-column">
                                                    <h3 class="fs-4 fw-bold mb-1 text-gray-900">관리자 계정 관리 (Super Admin)</h3>
                                                    <span class="fs-7 fw-semibold text-gray-600">운영자 및 발주사 계정 생성, IP 및 권한을 설정할 수 있습니다.</span>
                                                </div>
                                            </div>
                                            <div>
                                                <a href="/mng/system/admin/list" class="btn btn-sm btn-warning fw-bold">
                                                    <i class="ki-duotone ki-setting-2 fs-2 me-1">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i> 계정 관리
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="d-flex justify-content-between align-items-center mb-8 mt-5">
                                    <h1 class="d-flex align-items-center text-dark fw-bolder fs-1 my-1">대시보드</h1>
                                </div>

                                <div class="row g-5 g-xl-8 mb-8">
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card bg-primary card-xl-stretch shadow-sm">
                                            <div class="card-body px-7 py-8">
                                                <i class="ki-outline ki-message-text-2 text-white fs-3x mb-5 d-block"></i>
                                                <div class="text-white fw-bolder fs-3 mb-2 opacity-75">누적 문의 건수</div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${totalInquiryCount}" pattern="#,###"/> 건</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card bg-success card-xl-stretch shadow-sm">
                                            <div class="card-body px-7 py-8">
                                                <i class="ki-outline ki-user text-white fs-3x mb-5 d-block"></i>
                                                <div class="text-white fw-bolder fs-3 mb-2 opacity-75">누적 순 방문자</div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${totalUniqueVisitors}" pattern="#,###"/> 명</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card bg-info card-xl-stretch shadow-sm">
                                            <div class="card-body px-7 py-8">
                                                <i class="ki-outline ki-profile-user text-white fs-3x mb-5 d-block"></i>
                                                <div class="text-white fw-bolder fs-3 mb-2 opacity-75">누적 전체 방문자</div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${totalVisitors}" pattern="#,###"/> 명</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card premium-card bg-warning card-xl-stretch shadow-sm">
                                            <div class="card-body px-7 py-8">
                                                <i class="ki-outline ki-flash text-white fs-3x mb-5 d-block"></i>
                                                <div class="text-white fw-bolder fs-3 mb-2 opacity-75">오늘 신규 의뢰</div>
                                                <div class="fw-bolder text-white fs-1"><fmt:formatNumber value="${todayInquiryCount}" pattern="#,###"/> 건</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card shadow-sm premium-card mb-8">
                                    <div class="card-header pt-7 border-0 mb-3">
                                        <h3 class="card-title align-items-start flex-column">
                                            <span class="card-label fw-bolder text-dark fs-3">상위 조회 페이지 TOP 5</span>
                                        </h3>
                                    </div>
                                    <div class="card-body pt-0 pb-8">
                                        <div class="table-responsive">
                                            <table class="table align-middle table-row-dashed fs-6 gy-4">
                                                <thead>
                                                <tr class="text-start text-muted fw-bolder fs-7 text-uppercase gs-0">
                                                    <th class="w-60px text-center">순위</th>
                                                    <th>페이지명</th>
                                                    <th class="text-end">조회수</th>
                                                </tr>
                                                </thead>
                                                <tbody class="fw-bold text-gray-700">
                                                <c:choose>
                                                    <c:when test="${empty topPages}">
                                                        <tr><td colspan="3" class="text-center text-muted">수집된 페이지 조회 데이터가 없습니다.</td></tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="item" items="${topPages}" varStatus="status">
                                                            <c:set var="badgeClass" value="badge-light" />
                                                            <c:set var="textClass" value="text-dark" />
                                                            <c:if test="${status.index == 0}"> <c:set var="badgeClass" value="badge-danger" /> <c:set var="textClass" value="text-white" /> </c:if>
                                                            <c:if test="${status.index == 1}"> <c:set var="badgeClass" value="badge-warning" /> <c:set var="textClass" value="text-white" /> </c:if>
                                                            <c:if test="${status.index == 2}"> <c:set var="badgeClass" value="badge-success" /> <c:set var="textClass" value="text-white" /> </c:if>
                                                            <c:if test="${status.index == 3}"> <c:set var="badgeClass" value="badge-info" /> <c:set var="textClass" value="text-white" /> </c:if>

                                                            <tr>
                                                                <td class="text-center">
                                                                    <span class="badge badge-square ${badgeClass} fw-bolder px-3 py-2 ${textClass}">${status.index + 1}</span>
                                                                </td>
                                                                <td>
                                                                    <a href="${item.pageUrl}" target="_blank" class="text-dark text-hover-primary fs-6 fw-bolder">${item.pageName}</a>
                                                                </td>
                                                                <td class="text-end text-primary fs-5">
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

                                <div class="row g-5 g-xl-8 mb-8">
                                    <div class="col-xl-6">
                                        <div class="card shadow-sm h-100 premium-card">
                                            <div class="card-header pt-7 border-0 align-items-center">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-dark fs-3">홈페이지 방문 현황</span>
                                                </h3>
                                                <div class="card-toolbar">
                                                    <ul class="nav nav-pills nav-pills-custom mb-0">
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4 active" data-bs-toggle="tab" onclick="updateVisitChart('DAY')">Day</a></li>
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateVisitChart('WEEK')">Week</a></li>
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
                                        <div class="card shadow-sm h-100 premium-card">
                                            <div class="card-header pt-7 border-0 align-items-center">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-dark fs-3">문의 현황</span>
                                                </h3>
                                                <div class="card-toolbar">
                                                    <ul class="nav nav-pills nav-pills-custom mb-0">
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4 active" data-bs-toggle="tab" onclick="updateInquiryChart('DAY')">Day</a></li>
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateInquiryChart('WEEK')">Week</a></li>
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

                                <div class="row g-5 g-xl-8 mb-8">
                                    <div class="col-xl-6">
                                        <div class="card shadow-sm h-md-100 premium-card">
                                            <div class="card-header pt-7 border-0 align-items-center">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-dark fs-3">국가별 문의 현황</span>
                                                </h3>
                                                <div class="card-toolbar">
                                                    <ul class="nav nav-pills nav-pills-custom mb-0">
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4 active" data-bs-toggle="tab" onclick="updateCountryChart('DAY')">Day</a></li>
                                                        <li class="nav-item mb-3 me-3"><a class="nav-link btn btn-sm btn-color-muted btn-active btn-active-primary fw-bolder px-4" data-bs-toggle="tab" onclick="updateCountryChart('WEEK')">Week</a></li>
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
                                        <div class="card shadow-sm h-md-100 premium-card">
                                            <div class="card-header pt-7 border-0 mb-3">
                                                <h3 class="card-title align-items-start flex-column">
                                                    <span class="card-label fw-bolder text-dark fs-3">서버 시스템 리소스 현황</span>
                                                </h3>
                                            </div>
                                            <div class="card-body pt-0 pb-8">
                                                <div class="d-flex flex-column gap-6">

                                                    <div class="d-flex align-items-center p-5 rounded border border-dashed border-gray-300">
                                                        <div class="symbol symbol-50px me-5">
                                                            <span class="symbol-label bg-light-primary"><i class="ki-outline ki-cpu fs-2x text-primary"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column flex-grow-1">
                                                            <span class="text-dark fw-bolder fs-5 mb-1">${sysInfo.osName} (${sysInfo.osArch})</span>
                                                            <span class="text-muted fw-bold">Java ${sysInfo.javaVersion}</span>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center p-5 rounded border border-dashed border-gray-300">
                                                        <div class="symbol symbol-50px me-5">
                                                            <span class="symbol-label bg-light-success"><i class="ki-outline ki-save-2 fs-2x text-success"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column flex-grow-1">
                                                            <div class="d-flex justify-content-between mb-2">
                                                                <span class="text-dark fw-bolder fs-6">메모리 사용량</span>
                                                                <span class="text-muted fw-bold">${sysInfo.usedMemory} MB / ${sysInfo.totalMemory} MB</span>
                                                            </div>
                                                            <div class="progress h-8px w-100 bg-light-success"><div class="progress-bar bg-success rounded" role="progressbar" style="width: ${(sysInfo.usedMemory / sysInfo.totalMemory) * 100}%"></div></div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center p-5 rounded border border-dashed border-gray-300">
                                                        <div class="symbol symbol-50px me-5">
                                                            <span class="symbol-label bg-light-danger"><i class="ki-outline ki-hard-drive fs-2x text-danger"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column flex-grow-1">
                                                            <div class="d-flex justify-content-between mb-2">
                                                                <span class="text-dark fw-bolder fs-6">디스크 사용량</span>
                                                                <span class="text-muted fw-bold">${sysInfo.usedSpace} GB / ${sysInfo.totalSpace} GB</span>
                                                            </div>
                                                            <div class="progress h-8px w-100 bg-light-danger"><div class="progress-bar bg-danger rounded" role="progressbar" style="width: ${(sysInfo.usedSpace / sysInfo.totalSpace) * 100}%"></div></div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex justify-content-between">
                                                        <div class="d-flex align-items-center p-4 rounded border border-dashed border-gray-300 w-100 me-3">
                                                            <i class="ki-outline ki-server fs-2 text-info me-3"></i>
                                                            <div class="d-flex flex-column"><span class="text-muted fs-7">Server IP</span><span class="fw-bolder fs-6">${sysInfo.serverIp}</span></div>
                                                        </div>
                                                        <div class="d-flex align-items-center p-4 rounded border border-dashed border-gray-300 w-100">
                                                            <i class="ki-outline ki-screen fs-2 text-warning me-3"></i>
                                                            <div class="d-flex flex-column"><span class="text-muted fs-7">Client IP</span><span class="fw-bolder fs-6">${sysInfo.clientIp}</span></div>
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
            // 백엔드에서 생성된 JSON 데이터
            var visitData = ${visitChartsJson};
            var inquiryData = ${inquiryChartsJson};
            var countryData = ${countryChartsJson};

            var visitChart, inquiryChart, countryPieChart;

            // [1] 방문 현황 (보라색 Area)
            var visitOptions = {
                series: [{ name: '방문자 수', data: [] }],
                chart: { type: 'area', height: 350, toolbar: { show: false }, fontFamily: 'Pretendard' },
                colors: ['#7239ea'],
                fill: { type: 'gradient', gradient: { shadeIntensity: 1, opacityFrom: 0.45, opacityTo: 0.05, stops: [50, 100] } },
                dataLabels: { enabled: false },
                stroke: { curve: 'smooth', width: 3 },
                xaxis: { categories: [], axisBorder: { show: false }, axisTicks: { show: false }, labels: { style: { colors: '#a1a5b7' } } },
                yaxis: { labels: { style: { colors: '#a1a5b7' } } },
                grid: { borderColor: '#eff2f5', strokeDashArray: 4 },
                tooltip: { style: { fontSize: '13px' }, y: { formatter: function (val) { return val + " 명" } } }
            };
            visitChart = new ApexCharts(document.querySelector("#kt_visit_chart"), visitOptions);
            visitChart.render();

            // [2] 문의 현황 (누적 스택 바 차트 - 기업/개인/기관/기타 색상구분)
            var inquiryOptions = {
                series: [],
                chart: { type: 'bar', height: 350, stacked: true, toolbar: { show: false }, fontFamily: 'Pretendard' },
                colors: ['#009ef7', '#50cd89', '#f1416c', '#ffc700'], // 기업(Primary), 개인(Success), 기관(Danger), 기타(Warning)
                plotOptions: { bar: { horizontal: false, borderRadius: 3, columnWidth: '40%' } },
                dataLabels: { enabled: false },
                xaxis: { categories: [], axisBorder: { show: false }, axisTicks: { show: false }, labels: { style: { colors: '#a1a5b7' } } },
                yaxis: { labels: { style: { colors: '#a1a5b7' } } },
                grid: { borderColor: '#eff2f5', strokeDashArray: 4 },
                legend: { position: 'top', horizontalAlign: 'right', markers: { radius: 12 } },
                fill: { opacity: 1 }
            };
            inquiryChart = new ApexCharts(document.querySelector("#kt_inquiry_chart"), inquiryOptions);
            inquiryChart.render();

            // [3] 국가별 통계 (도넛 차트)
            var pieOptions = {
                series: [],
                labels: [],
                chart: { type: 'donut', height: 380, fontFamily: 'Pretendard' },
                colors: ['#009ef7', '#50cd89', '#f1416c', '#ffc700', '#7239ea'],
                stroke: { show: true, width: 3, colors: ['#ffffff'] },
                dataLabels: { enabled: true, dropShadow: { enabled: true }, formatter: function (val, opts) { return opts.w.config.series[opts.seriesIndex] + "건"; } },
                plotOptions: { donut: { size: '65%', labels: { show: true, total: { show: true, showAlways: true, label: '총 문의', fontSize: '16px', formatter: function (w) { return w.globals.seriesTotals.reduce((a, b) => { return a + b }, 0) + " 건" } } } } },
                legend: { position: 'bottom', horizontalAlign: 'center' }
            };
            countryPieChart = new ApexCharts(document.querySelector("#kt_country_pie_chart"), pieOptions);
            countryPieChart.render();

            // --- 탭 클릭 시 차트 업데이트 함수 ---
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

            // 초기 화면 세팅 (DAY 렌더링)
            updateVisitChart('WEEK');
            updateInquiryChart('WEEK');
            updateCountryChart('WEEK');
        });
    </script>

</body>
</html>