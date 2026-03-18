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

    <title>문의 목록 | Artixel 관리자</title>
    <link href="/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>

    <style>
        /* 프리미엄 다크 커스텀 요소 */
        .premium-card { background-color: #15161d !important; border: 1px solid rgba(255, 255, 255, 0.05) !important; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.3) !important; }
        .table-hover tbody tr:hover td { background-color: rgba(255,255,255,0.02) !important; transition: background-color 0.2s ease; }

        /* 상태 뱃지 네온 효과 (간지 포인트) */
        .badge-glow-pending { background-color: rgba(255, 199, 0, 0.1); color: #ffc700; border: 1px solid rgba(255, 199, 0, 0.3); box-shadow: 0 0 10px rgba(255, 199, 0, 0.2); }
        .badge-glow-progress { background-color: rgba(0, 158, 247, 0.1); color: #009ef7; border: 1px solid rgba(0, 158, 247, 0.3); box-shadow: 0 0 10px rgba(0, 158, 247, 0.2); }
        .badge-glow-completed { background-color: rgba(80, 205, 137, 0.1); color: #50cd89; border: 1px solid rgba(80, 205, 137, 0.3); box-shadow: 0 0 10px rgba(80, 205, 137, 0.2); }

        /* 다크 글래스 검색 박스 */
        .search-box { background-color: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.1); color: #fff; }
        .search-box:focus { border-color: #009ef7; box-shadow: 0 0 10px rgba(0, 158, 247, 0.3); background-color: rgba(255,255,255,0.05); color: #fff;}
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

                                <div class="d-flex justify-content-between align-items-center mb-8 mt-5">
                                    <h1 class="d-flex align-items-center fw-bolder fs-1 my-1 text-white">
                                        문의 목록
                                        <span class="h-20px border-gray-600 border-start ms-4 mx-2"></span>
                                        <small class="text-muted fs-6 fw-bold my-1 ms-3">Inquiry Management</small>
                                    </h1>
                                </div>

                                <div class="card premium-card">
                                    <div class="card-header border-0 pt-6">
                                        <div class="card-title">
                                            <form action="/mng/inquiry/list" method="get" class="d-flex align-items-center position-relative my-1 gap-3">
                                                <select name="searchType" class="form-select form-select-sm form-select-solid w-125px search-box" data-control="select2" data-hide-search="true">
                                                    <option value="">전체 검색</option>
                                                    <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>의뢰인명</option>
                                                    <option value="contact" ${param.searchType == 'contact' ? 'selected' : ''}>연락처</option>
                                                </select>
                                                <div class="position-relative">
                                                    <i class="ki-outline ki-magnifier fs-2 text-gray-500 position-absolute top-50 translate-middle-y ms-4"></i>
                                                    <input type="text" name="keyword" value="${param.keyword}" class="form-control form-control-sm form-control-solid w-250px ps-12 search-box" placeholder="검색어를 입력하세요"/>
                                                </div>
                                                <button type="submit" class="btn btn-sm btn-primary">검색</button>
                                                <c:if test="${not empty param.keyword}">
                                                    <a href="/mng/inquiry/list" class="btn btn-sm btn-light-danger">초기화</a>
                                                </c:if>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="card-body pt-0 pb-5">
                                        <div class="table-responsive">
                                            <table class="table align-middle table-row-dashed table-row-gray-800 fs-6 gy-5 table-hover" id="kt_inquiry_table">
                                                <thead>
                                                    <tr class="text-start text-muted fw-bolder fs-7 text-uppercase gs-0 border-bottom border-gray-800">
                                                        <th class="w-60px text-center">NO</th>
                                                        <th class="min-w-100px text-center">구분</th>
                                                        <th class="min-w-150px">의뢰인명 / 기업명</th>
                                                        <th class="min-w-150px">연락처 / 이메일</th>
                                                        <th class="min-w-150px">국가</th>
                                                        <th class="min-w-100px text-center">상태</th>
                                                        <th class="min-w-125px text-center">등록일</th>
                                                        <th class="text-end min-w-70px">관리</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-400 fw-semibold">
                                                    <c:choose>
                                                        <c:when test="${empty list}">
                                                            <tr>
                                                                <td colspan="8" class="text-center py-10 text-muted">등록된 문의 내역이 없습니다.</td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach var="item" items="${list}">
                                                                <tr>
                                                                    <td class="text-center text-gray-500">${item.inquiryId}</td>
                                                                    <td class="text-center">
                                                                        <span class="badge badge-light-dark text-gray-300 px-3 py-2">${item.category}</span>
                                                                    </td>
                                                                    <td>
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="symbol symbol-circle symbol-40px overflow-hidden me-3">
                                                                                <div class="symbol-label fs-3 bg-light-primary text-primary">
                                                                                    ${fn:substring(item.clientName, 0, 1)}
                                                                                </div>
                                                                            </div>
                                                                            <div class="d-flex flex-column">
                                                                                <a href="/mng/inquiry/detail?inquiryId=${item.inquiryId}" class="text-white text-hover-primary mb-1 fw-bold fs-6">${item.clientName}</a>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="d-flex flex-column">
                                                                            <span class="text-gray-300 fs-7 mb-1">
                                                                                <i class="ki-outline ki-phone fs-7 me-2"></i>${item.contact}
                                                                            </span>
                                                                            <span class="text-muted fs-7">
                                                                                <i class="ki-outline ki-sms fs-7 me-2"></i>${item.email}
                                                                            </span>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="d-flex align-items-center">
                                                                            <span class="text-gray-400 fs-6">${item.country}</span>
                                                                        </div>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <c:choose>
                                                                            <c:when test="${item.status == 'PENDING'}">
                                                                                <span class="badge badge-glow-pending px-3 py-2">대기중</span>
                                                                            </c:when>
                                                                            <c:when test="${item.status == 'IN_PROGRESS'}">
                                                                                <span class="badge badge-glow-progress px-3 py-2">진행중</span>
                                                                            </c:when>
                                                                            <c:when test="${item.status == 'COMPLETED'}">
                                                                                <span class="badge badge-glow-completed px-3 py-2">답변완료</span>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="badge badge-light-dark px-3 py-2">${item.status}</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td class="text-center text-gray-500">
                                                                        <fmt:formatDate value="${item.createdAt}" pattern="yyyy.MM.dd HH:mm"/>
                                                                    </td>
                                                                    <td class="text-end">
                                                                        <a href="/mng/inquiry/detail?inquiryId=${item.inquiryId}" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1" title="상세보기">
                                                                            <i class="ki-outline ki-eye fs-2"></i>
                                                                        </a>
                                                                        <button type="button" class="btn btn-icon btn-bg-light btn-active-color-danger btn-sm" onclick="deleteInquiry(${item.inquiryId})" title="삭제">
                                                                            <i class="ki-outline ki-trash fs-2"></i>
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="row mt-5">
                                            <div class="col-sm-12 d-flex align-items-center justify-content-center">
                                                <div class="dataTables_paginate paging_simple_numbers">
                                                    <ul class="pagination">
                                                        <c:if test="${pageMaker.prev}">
                                                            <li class="paginate_button page-item previous">
                                                                <a href="?page=${pageMaker.startPage - 1}&searchType=${param.searchType}&keyword=${param.keyword}" class="page-link bg-dark border-gray-800 text-gray-500"><i class="previous"></i></a>
                                                            </li>
                                                        </c:if>
                                                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                                            <li class="paginate_button page-item ${pageMaker.cri.page == num ? 'active' : ''}">
                                                                <a href="?page=${num}&searchType=${param.searchType}&keyword=${param.keyword}" class="page-link ${pageMaker.cri.page == num ? 'bg-primary text-white' : 'bg-dark border-gray-800 text-gray-400'}">${num}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <c:if test="${pageMaker.next}">
                                                            <li class="paginate_button page-item next">
                                                                <a href="?page=${pageMaker.endPage + 1}&searchType=${param.searchType}&keyword=${param.keyword}" class="page-link bg-dark border-gray-800 text-gray-500"><i class="next"></i></a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
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
        function deleteInquiry(id) {
            Swal.fire({
                text: "이 문의 내역을 삭제하시겠습니까?",
                icon: "warning",
                showCancelButton: true,
                buttonsStyling: false,
                confirmButtonText: "예, 삭제합니다",
                cancelButtonText: "아니요, 취소합니다",
                customClass: {
                    confirmButton: "btn btn-danger",
                    cancelButton: "btn btn-active-light"
                }
            }).then(function (result) {
                if (result.value) {
                    $.ajax({
                        url: '/mng/inquiry/delete',
                        type: 'POST',
                        data: { inquiryId: id },
                        success: function(res) {
                            if(res === 'ok') {
                                Swal.fire({
                                    text: "삭제되었습니다.",
                                    icon: "success",
                                    buttonsStyling: false,
                                    confirmButtonText: "확인",
                                    customClass: { confirmButton: "btn btn-primary" }
                                }).then(function(){
                                    location.reload();
                                });
                            } else {
                                Swal.fire("오류", "삭제 중 문제가 발생했습니다.", "error");
                            }
                        }
                    });
                }
            });
        }
    </script>

</body>
</html>