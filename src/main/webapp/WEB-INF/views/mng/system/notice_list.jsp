<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

    <title>공지사항 관리 | Artixel 관리자</title>
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
                                        공지사항 관리
                                    </h1>

                                    <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                                        <li class="breadcrumb-item text-muted">
                                            <a href="/mng/main.do" class="text-muted text-hover-primary">Home</a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <span class="bullet bg-gray-400 w-5px h-2px"></span>
                                        </li>
                                        <li class="breadcrumb-item text-muted">시스템 관리</li>
                                        <li class="breadcrumb-item">
                                            <span class="bullet bg-gray-400 w-5px h-2px"></span>
                                        </li>
                                        <li class="breadcrumb-item text-dark">공지사항 관리</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id="kt_app_content" class="app-content flex-column-fluid">
                            <div id="kt_app_content_container" class="app-container container-xxl pt-10">

                                <div class="card mb-7">
                                    <div class="card-body py-4 d-flex justify-content-between align-items-center">
                                        <h3 class="card-title m-0">📢 공지사항 목록</h3>
                                        <button type="button" class="btn btn-primary" onclick="openModal()">
                                            <i class="ki-duotone ki-plus fs-2"></i> 공지 등록
                                        </button>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body py-4">
                                        <div class="table-responsive">
                                            <table class="table align-middle table-row-dashed fs-6 gy-5">
                                                <thead>
                                                <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
                                                    <th class="min-w-50px">No</th>
                                                    <th class="min-w-50px">고정</th>
                                                    <th class="min-w-300px">제목</th>
                                                    <th class="min-w-100px">상태</th>
                                                    <th class="min-w-100px">등록일</th>
                                                    <th class="text-end min-w-100px">관리</th>
                                                </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold">
                                                <c:forEach var="item" items="${list}">
                                                    <tr>
                                                        <td>${item.noticeId}</td>
                                                        <td>
                                                            <c:if test="${item.isTop eq 'Y'}"><i
                                                                    class="ki-duotone ki-pin fs-2 text-primary"><span
                                                                    class="path1"></span><span
                                                                    class="path2"></span></i></c:if>
                                                        </td>
                                                        <td>
                                                            <a href="/mng/system/notices/detail?noticeId=${item.noticeId}"
                                                               class="text-gray-800 text-hover-primary fw-bold">${item.title}</a>
                                                        </td>
                                                        <td>
                                                            <c:if test="${item.status eq 'ACTIVE'}"><span
                                                                    class="badge badge-light-success">게시중</span></c:if>
                                                            <c:if test="${item.status eq 'HIDDEN'}"><span
                                                                    class="badge badge-light-secondary">숨김</span></c:if>
                                                        </td>
                                                        <td>
                                                            <fmt:parseDate value="${item.createdAt}"
                                                                           pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate"
                                                                           type="both"/>
                                                            <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
                                                        </td>
                                                        <td class="text-end">
                                                            <a href="/mng/system/notices/detail?noticeId=${item.noticeId}"
                                                               class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1">
                                                                <i class="ki-duotone ki-pencil fs-2"><span
                                                                        class="path1"></span><span class="path2"></span></i>
                                                            </a>
                                                            <button class="btn btn-icon btn-bg-light btn-active-color-danger btn-sm"
                                                                    onclick="deleteNotice('${item.noticeId}')">
                                                                <i class="ki-duotone ki-trash fs-2"><span
                                                                        class="path1"></span><span
                                                                        class="path2"></span><span
                                                                        class="path3"></span><span
                                                                        class="path4"></span><span class="path5"></span></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
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
    </div>

    <div class="modal fade" id="noticeModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered mw-650px">
            <div class="modal-content">
                <form action="/mng/system/notices/save" method="post">
                    <div class="modal-header">
                        <h2 class="fw-bold">공지사항 등록</h2>
                        <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal"><i
                                class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                        </div>
                    </div>
                    <div class="modal-body py-10 px-lg-17">
                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2">제목</label>
                            <input type="text" class="form-control form-control-solid" name="title" required/>
                        </div>
                        <div class="row mb-7">
                            <div class="col-md-6">
                                <label class="fs-6 fw-semibold mb-2">상단 고정</label>
                                <select class="form-select form-select-solid" name="isTop">
                                    <option value="N">미설정</option>
                                    <option value="Y">고정 (Top)</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="fs-6 fw-semibold mb-2">상태</label>
                                <select class="form-select form-select-solid" name="status">
                                    <option value="ACTIVE">게시</option>
                                    <option value="HIDDEN">숨김</option>
                                </select>
                            </div>
                        </div>
                        <div class="fv-row mb-7">
                            <label class="required fs-6 fw-semibold mb-2">내용</label>
                            <textarea class="form-control form-control-solid" name="content" rows="10" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer flex-center">
                        <button type="button" class="btn btn-light me-3" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="/assets/plugins/global/plugins.bundle.js"></script>
    <script src="/assets/js/scripts.bundle.js"></script>
    <script>
        const modal = new bootstrap.Modal(document.getElementById('noticeModal'));

        function openModal() {
            modal.show();
        }

        function deleteNotice(id) {
            if (confirm('삭제하시겠습니까?')) {
                $.post('/mng/system/notices/delete', {noticeId: id}, function (res) {
                    if (res === 'ok') location.reload();
                    else alert('삭제 실패');
                });
            }
        }
    </script>
</body>
</html>