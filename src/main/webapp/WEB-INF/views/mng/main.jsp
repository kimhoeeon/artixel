<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%--
  IntelliJ Variable Definitions
  (이 주석은 실제 실행 시 무시되며, IDE 에러 표시를 없애기 위한 용도입니다)
--%>
<%--@elvariable id="sysDbStatus" type="java.lang.Boolean"--%>
<%--@elvariable id="sysMemoryUsed" type="java.lang.Long"--%>
<%--@elvariable id="sysMemoryTotal" type="java.lang.Long"--%>
<%--@elvariable id="sysMemoryUsage" type="java.lang.Integer"--%>
<%--@elvariable id="sysDiskUsed" type="java.lang.Long"--%>
<%--@elvariable id="sysDiskTotal" type="java.lang.Long"--%>
<%--@elvariable id="sysDiskUsage" type="java.lang.Integer"--%>
<%--@elvariable id="sysActiveThreads" type="java.lang.Integer"--%>
<%--@elvariable id="sysCpuCores" type="java.lang.Integer"--%>
<%--@elvariable id="sysOsName" type="java.lang.String"--%>
<%--@elvariable id="sysJavaVer" type="java.lang.String"--%>
<%--@elvariable id="todayGameList" type="java.util.List<com.mtf.artixel.vo.GameVO>"--%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover" />
    <meta name="format-detection" content="telephone=no,email=no,address=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="mobile-web-app-capable" content="yes" />

    <link rel="icon" href="/favicon.ico" />
    <link rel="shortcut icon" href="/favicon.ico" />
    <link rel="manifest" href="/site.webmanifest" />

    <title>관리자 메인 | Artixel 관리자</title>
    <link href="/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/mngStyle.css" rel="stylesheet">
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

                                <div class="row g-5 g-xl-8 mb-8">
                                    <div class="col-md-6">
                                        <div class="card bg-primary hoverable card-xl-stretch mb-xl-8">
                                            <div class="card-body">
                                                <div class="text-white fw-bolder fs-2 mb-2 mt-5">누적 접수된 문의 건수</div>
                                                <div class="fw-bold text-white fs-1"><fmt:formatNumber value="${totalInquiryCount}" pattern="#,###"/> 건</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card bg-success hoverable card-xl-stretch mb-xl-8">
                                            <div class="card-body">
                                                <div class="text-white fw-bolder fs-2 mb-2 mt-5">오늘 접수된 신규 문의</div>
                                                <div class="fw-bold text-white fs-1"><fmt:formatNumber value="${todayInquiryCount}" pattern="#,###"/> 건</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-5 g-xl-8 mb-8">
                                    <div class="col-md-6">
                                        <div class="card card-flush h-md-100">
                                            <div class="card-header pt-5"><h3 class="card-title align-items-start flex-column"><span class="card-label fw-bolder text-dark">구분별 문의 현황</span></h3></div>
                                            <div class="card-body pt-0">
                                                <table class="table table-bordered text-center">
                                                    <thead class="bg-light"><tr><th>구분</th><th>건수</th></tr></thead>
                                                    <tbody>
                                                    <c:forEach var="stat" items="${categoryStats}">
                                                        <tr><td>${stat.category}</td><td>${stat.count} 건</td></tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card card-flush h-md-100">
                                            <div class="card-header pt-5"><h3 class="card-title align-items-start flex-column"><span class="card-label fw-bolder text-dark">국가별 문의 현황</span></h3></div>
                                            <div class="card-body pt-0">
                                                <table class="table table-bordered text-center">
                                                    <thead class="bg-light"><tr><th>국가</th><th>건수</th></tr></thead>
                                                    <tbody>
                                                    <c:forEach var="stat" items="${countryStats}">
                                                        <tr><td>${stat.country}</td><td>${stat.count} 건</td></tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card card-flush shadow-sm">
                                    <div class="card-header pt-5">
                                        <h3 class="card-title align-items-start flex-column">
                                            <span class="card-label fw-bolder text-dark">서버 시스템 정보 수집 대시보드</span>
                                        </h3>
                                    </div>
                                    <div class="card-body pt-0">
                                        <table class="table table-bordered table-striped text-center align-middle">
                                            <thead class="bg-light fw-bolder">
                                            <tr>
                                                <th>OS 정보</th>
                                                <th>Java 버전</th>
                                                <th>메모리 (사용/전체)</th>
                                                <th>디스크 (사용/전체)</th>
                                                <th>서버 IP / 접속자 IP</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>${sysInfo.osName} (${sysInfo.osArch})</td>
                                                <td>${sysInfo.javaVersion}</td>
                                                <td>
                                                    <div class="text-primary fw-bold">${sysInfo.usedMemory} MB</div> / ${sysInfo.totalMemory} MB
                                                </td>
                                                <td>
                                                    <div class="text-danger fw-bold">${sysInfo.usedSpace} GB</div> / ${sysInfo.totalSpace} GB
                                                </td>
                                                <td>
                                                    서버: ${sysInfo.serverIp}<br>접속자: ${sysInfo.clientIp}
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
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

</body>
</html>