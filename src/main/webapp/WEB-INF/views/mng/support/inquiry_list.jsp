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

    <link rel="icon" href="/favicon.ico" />
    <link rel="shortcut icon" href="/favicon.ico" />
    <link rel="manifest" href="/site.webmanifest" />

    <title>문의 목록 | Artixel 관리자</title>
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
                                        문의 목록
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
                            <div id="kt_app_content_container" class="app-container container-xxl pt-10">

                                <div class="card mb-5">
                                    <div class="card-body">
                                        <form action="/mng/inquiry/list" method="get" class="d-flex align-items-center gap-3">
                                            <select name="searchType" class="form-select w-150px">
                                                <option value="">전체 검색</option>
                                                <option value="name" ${searchVO.searchType == 'name' ? 'selected' : ''}>성함</option>
                                                <option value="contact" ${searchVO.searchType == 'contact' ? 'selected' : ''}>연락처</option>
                                            </select>
                                            <input type="text" name="keyword" value="${searchVO.keyword}" class="form-control w-250px" placeholder="검색어 입력">
                                            <input type="date" name="startDate" value="${searchVO.startDate}" class="form-control w-150px">
                                            <span>~</span>
                                            <input type="date" name="endDate" value="${searchVO.endDate}" class="form-control w-150px">
                                            <button type="submit" class="btn btn-primary">검색</button>
                                            <a href="/mng/inquiry/list" class="btn btn-light">초기화</a>
                                        </form>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header border-0 pt-6">
                                        <div class="card-title">
                                            <div class="d-flex align-items-center position-relative my-1">
                                                전체 <span class="text-danger ms-1 me-1">${totalCount}</span> 건
                                            </div>
                                        </div>
                                        <div class="card-toolbar">
                                            <a href="/mng/inquiry/excel" class="btn btn-sm btn-success">엑셀 다운로드</a>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="table-responsive">
                                            <table class="table align-middle table-row-dashed fs-6 gy-5 text-center">
                                                <thead>
                                                <tr class="text-muted fw-bolder fs-7 text-uppercase gs-0 bg-light">
                                                    <th>연번</th>
                                                    <th>구분</th>
                                                    <th>성함</th>
                                                    <th>연락처</th>
                                                    <th>국가</th>
                                                    <th>접수 일시</th>
                                                    <th>관리</th>
                                                </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-bold">
                                                <c:choose>
                                                    <c:when test="${empty list}">
                                                        <tr><td colspan="7">등록된 의뢰 내역이 없습니다.</td></tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="item" items="${list}" varStatus="status">
                                                            <tr>
                                                                <td>${totalCount - searchVO.limitStart - status.index}</td>
                                                                <td><span class="badge badge-light-primary">${item.category}</span></td>
                                                                <td>${item.clientName}</td>
                                                                <td>${item.countryCode} ${item.contact}</td>
                                                                <td>${item.country}</td>
                                                                <td>${item.createdAt}</td>
                                                                <td>
                                                                    <a href="/mng/inquiry/detail?inquiryId=${item.inquiryId}" class="btn btn-sm btn-light btn-active-light-primary">상세보기</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="d-flex justify-content-center mt-5">
                                            <c:if test="${totalCount > 0}">
                                                <ul class="pagination">
                                                    <c:forEach begin="1" end="${Math.ceil(totalCount / 10.0)}" var="idx">
                                                        <li class="page-item ${currentPage == idx ? 'active' : ''}">
                                                            <a href="/mng/inquiry/list?page=${idx}&searchType=${searchVO.searchType}&keyword=${searchVO.keyword}&startDate=${searchVO.startDate}&endDate=${searchVO.endDate}" class="page-link">${idx}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
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
    </div>

    <script src="/assets/plugins/global/plugins.bundle.js"></script>
    <script src="/assets/js/scripts.bundle.js"></script>

    <script>
        var msg = '${msg}';
        if(msg) alert(msg);
    </script>

</body>
</html>