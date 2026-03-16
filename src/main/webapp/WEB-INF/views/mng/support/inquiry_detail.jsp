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

    <title>문의 상세 | Artixel 관리자</title>
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

                        <div id="kt_app_toolbar" class="app-toolbar pt-6 pb-2 pt-lg-10 pb-lg-2">
                            <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
                                <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                                    <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
                                        문의 상세보기
                                    </h1>

                                    <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                                        <li class="breadcrumb-item text-muted">
                                            <a href="/mng/main.do" class="text-muted text-hover-primary">Home</a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <span class="bullet bg-gray-400 w-5px h-2px"></span>
                                        </li>
                                        <li class="breadcrumb-item text-muted">문의 관리</li>
                                        <li class="breadcrumb-item">
                                            <span class="bullet bg-gray-400 w-5px h-2px"></span>
                                        </li>
                                        <li class="breadcrumb-item text-dark">문의 목록</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id="kt_app_content" class="app-content flex-column-fluid">
                            <div id="kt_app_content_container" class="app-container container-xxl">

                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <h1>의뢰 문의 상세 내역</h1>
                                    <div>
                                        <a href="/mng/inquiry/list" class="btn btn-secondary me-2">목록으로</a>
                                        <form action="/mng/inquiry/delete" method="post" style="display:inline;" onsubmit="return confirm('삭제 시 복구가 불가능합니다. 정말 삭제하시겠습니까?');">
                                            <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
                                            <button type="submit" class="btn btn-danger">삭제하기</button>
                                        </form>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <table class="table table-bordered align-middle table-row-dashed fs-6">
                                            <colgroup>
                                                <col style="width: 15%; background: #f8f9fa;">
                                                <col style="width: 35%;">
                                                <col style="width: 15%; background: #f8f9fa;">
                                                <col style="width: 35%;">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th class="text-center">접수 일시</th>
                                                <td>${inquiry.createdAt}</td>
                                                <th class="text-center">구분</th>
                                                <td>${inquiry.category}</td>
                                            </tr>
                                            <tr>
                                                <th class="text-center">성함</th>
                                                <td>${inquiry.clientName}</td>
                                                <th class="text-center">연락처</th>
                                                <td>${inquiry.countryCode} ${inquiry.contact}</td>
                                            </tr>
                                            <tr>
                                                <th class="text-center">이메일</th>
                                                <td>${inquiry.email}</td>
                                                <th class="text-center">국가</th>
                                                <td>${inquiry.country}</td>
                                            </tr>
                                            <tr>
                                                <th class="text-center">작품 제목</th>
                                                <td>${inquiry.artworkTitle}</td>
                                                <th class="text-center">작가명</th>
                                                <td>${inquiry.artistName}</td>
                                            </tr>
                                            <tr>
                                                <th class="text-center">작품 크기</th>
                                                <td colspan="3">${inquiry.artworkSize}</td>
                                            </tr>
                                            <tr>
                                                <th class="text-center">첨부 파일/URL</th>
                                                <td colspan="3">
                                                    <c:choose>
                                                        <c:when test="${not empty inquiry.fileUrl}">
                                                            <a href="${inquiry.fileUrl}" target="_blank" class="text-primary fw-bolder text-hover-primary">
                                                                <i class="bi bi-link-45deg"></i> 원본 확인 및 다운로드 (${inquiry.fileOriginName})
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted">첨부된 파일이 없습니다.</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="text-center">문의 내용</th>
                                                <td colspan="3" style="white-space: pre-wrap; padding: 20px;">${inquiry.content}</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <c:if test="${not empty inquiry.fileUrl and (fn:endsWith(fn:toLowerCase(inquiry.fileUrl), '.jpg') or fn:endsWith(fn:toLowerCase(inquiry.fileUrl), '.jpeg') or fn:endsWith(fn:toLowerCase(inquiry.fileUrl), '.png') or fn:endsWith(fn:toLowerCase(inquiry.fileUrl), '.gif'))}">
                                            <div class="mt-10 text-center">
                                                <h3 class="mb-5">첨부 이미지 미리보기</h3>
                                                <img src="${inquiry.fileUrl}" alt="첨부된 작품 이미지" class="img-fluid border" style="max-height: 800px; object-fit: contain;">
                                            </div>
                                        </c:if>

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