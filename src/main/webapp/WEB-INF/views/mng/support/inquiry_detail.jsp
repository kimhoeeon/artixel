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
    <meta name="robots" content="noindex, nofollow">

    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">

    <title>문의 상세 | Artixel 관리자</title>
    <link href="/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/mngStyle.css" rel="stylesheet" type="text/css"/>

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
                                    <h1 class="d-flex align-items-center fw-bolder fs-1 my-1">
                                        문의 상세 내역
                                        <span class="h-20px border-gray-600 border-start ms-4 mx-2"></span>
                                        <small class="text-muted fs-6 fw-bold my-1 ms-3">Inquiry Detail Info</small>
                                    </h1>

                                    <div class="d-flex align-items-center gap-2">
                                        <a href="/mng/inquiry/list" class="btn btn-sm btn-light">
                                            <i class="ki-outline ki-arrow-left fs-3"></i> 목록으로
                                        </a>
                                        <form action="/mng/inquiry/delete" method="post" style="display:inline;" onsubmit="return confirm('삭제 시 복구가 불가능합니다. 정말 삭제하시겠습니까?');">
                                            <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
                                            <button type="submit" class="btn btn-sm btn-danger">
                                                <i class="ki-outline ki-trash fs-3"></i> 영구 삭제
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <div class="card premium-card mb-10">
                                    <div class="card-body p-9">

                                        <div class="d-flex flex-stack mb-8">
                                            <div class="d-flex align-items-center gap-3">
                                                <div class="badge badge-light-dark fs-6 fw-bold px-4 py-2 border border-gray-700">No. ${inquiry.inquiryId}</div>

                                                <select id="statusSelect" class="form-select form-select-sm w-220px fw-bolder text-white"
                                                        style="background-color: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.2); cursor: pointer;"
                                                        onchange="updateInquiryStatus(${inquiry.inquiryId}, this.value)">
                                                    <option value="PENDING" ${inquiry.status == 'PENDING' ? 'selected' : ''}>대기중 (PENDING)</option>
                                                    <option value="IN_PROGRESS" ${inquiry.status == 'IN_PROGRESS' ? 'selected' : ''}>진행중 (IN_PROGRESS)</option>
                                                    <option value="COMPLETED" ${inquiry.status == 'COMPLETED' ? 'selected' : ''}>답변완료 (COMPLETED)</option>
                                                </select>

                                                <span id="statusUpdateIndicator" class="ms-2 text-success fw-bold align-items-center" style="display:none; font-size: 0.95rem;">
                                                    <i class="ki-outline ki-check-circle fs-3 text-success me-1"></i> 저장됨
                                                </span>
                                            </div>

                                            <div class="text-muted fs-7">
                                                <i class="ki-outline ki-time fs-4 me-1"></i> 접수일시: ${inquiry.createdAt}
                                                <span class="ms-4"><i class="ki-outline ki-geolocation fs-4 me-1"></i> IP: ${inquiry.clientIp}</span>
                                            </div>
                                        </div>

                                        <table class="table table-bordered detail-table align-middle fs-5 gy-5">
                                            <tbody>
                                                <tr>
                                                    <th>유 형</th>
                                                    <td style="width: 35%;"><span class="badge badge-light-primary fw-bolder">${inquiry.inquiryType}</span></td>
                                                    <th>구 분</th>
                                                    <td style="width: 35%;"><span class="text-primary fw-bolder">${inquiry.category}</span></td>
                                                </tr>
                                                <tr>
                                                    <th>문의자명</th>
                                                    <td>${inquiry.clientName}</td>
                                                    <th>연 락 처</th>
                                                    <td><span class="text-gray-400 me-2">${inquiry.countryCode}</span> ${inquiry.contact}</td>
                                                </tr>
                                                <tr>
                                                    <th>이 메 일</th>
                                                    <td>${inquiry.email}</td>
                                                    <th>국 가</th>
                                                    <td>${inquiry.country}</td>
                                                </tr>
                                                <tr>
                                                    <th>개인정보 동의</th>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${inquiry.agreePrivacy == 'Y'}"><span class="badge badge-light-success">동의 (Y)</span></c:when>
                                                            <c:otherwise><span class="badge badge-light-danger">미동의 (N)</span></c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <th>작품 제목</th>
                                                    <td>${inquiry.artworkTitle}</td>
                                                </tr>
                                                <tr>
                                                    <th>작 가 명</th>
                                                    <td>${inquiry.artistName}</td>
                                                    <th>작품 크기</th>
                                                    <td>${inquiry.artworkSize}</td>
                                                </tr>
                                                <tr>
                                                    <th>첨부 파일 / URL</th>
                                                    <td colspan="3">
                                                        <c:choose>
                                                            <c:when test="${not empty inquiry.fileUrl}">
                                                                <c:set var="urlList" value="${fn:split(inquiry.fileUrl, '|')}" />
                                                                <c:set var="nameList" value="${fn:split(inquiry.fileOriginName, '|')}" />

                                                                <c:if test="${fn:length(urlList) == 1 and inquiry.fileOriginName == 'URL_LINK'}">
                                                                    <a href="${inquiry.fileUrl}" target="_blank" class="d-inline-flex align-items-center text-info text-hover-primary fw-bold bg-light-info px-4 py-2 rounded">
                                                                        <i class="ki-outline ki-link fs-3 me-2"></i> 외부 등록 URL 바로가기
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${inquiry.fileOriginName != 'URL_LINK'}">
                                                                    <div class="d-flex flex-column gap-3">
                                                                        <c:forEach items="${urlList}" var="url" varStatus="st">
                                                                            <c:url value="/mng/inquiry/download" var="downloadUrl">
                                                                                <c:param name="fileUrl" value="${url}" />
                                                                                <c:param name="fileName" value="${nameList[st.index]}" />
                                                                            </c:url>
                                                                            <a href="${downloadUrl}" class="d-inline-flex align-items-center text-info text-hover-primary fw-bold bg-light-info px-4 py-2 rounded" style="width: fit-content;">
                                                                                <i class="ki-outline ki-file-down fs-3 me-2"></i> 첨부파일 ${st.count}: ${nameList[st.index]} 다운로드
                                                                            </a>
                                                                        </c:forEach>
                                                                    </div>
                                                                </c:if>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="text-muted"><i class="ki-outline ki-file-deleted fs-4 me-2"></i>첨부된 파일이나 링크가 없습니다.</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <div class="mt-8">
                                            <h4 class="text-gray-400 mb-4"><i class="ki-outline ki-text-align-left fs-3 me-2"></i>문의 상세 내용</h4>
                                            <div class="glass-box text-white fs-5 lh-lg" style="white-space: pre-wrap; min-height: 150px;">${inquiry.content}</div>
                                        </div>

                                        <c:if test="${not empty inquiry.fileUrl and inquiry.fileOriginName != 'URL_LINK'}">
                                            <div class="mt-10 text-center">
                                                <h4 class="text-gray-400 mb-5 d-flex align-items-center justify-content-center">
                                                    <i class="ki-outline ki-picture fs-3 me-2"></i> 첨부 이미지 다중 확인
                                                </h4>

                                                <div class="d-flex flex-wrap justify-content-center gap-5">
                                                    <c:forEach items="${fn:split(inquiry.fileUrl, '|')}" var="url" varStatus="st">
                                                        <c:set var="lowerUrl" value="${fn:toLowerCase(url)}" />
                                                        <c:if test="${fn:endsWith(lowerUrl, '.jpg') or fn:endsWith(lowerUrl, '.jpeg') or fn:endsWith(lowerUrl, '.png') or fn:endsWith(lowerUrl, '.gif')}">
                                                            <div class="glass-box d-inline-block p-8 text-center" id="img-preview-box-${st.index}" style="min-width: 300px;">
                                                                <div class="text-muted mb-5 fs-6">
                                                                    <i class="ki-outline ki-information-5 fs-5 me-1 text-info"></i> 이미지 ${st.count}
                                                                </div>
                                                                <button type="button" class="btn btn-outline btn-outline-dashed btn-outline-info btn-active-light-info" onclick="loadLargeImage('${url}', 'img-preview-box-${st.index}')">
                                                                    <i class="ki-outline ki-eye fs-2 me-2"></i> 원본 이미지 불러오기
                                                                </button>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
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

    <script>

        // 이미지 미리보기 로드 함수
        function loadLargeImage(url, boxId) {
            var $box = $('#' + boxId);
            $box.html(
                '<div class="spinner-border text-info mb-3" role="status"></div>' +
                '<div class="text-muted fs-6 mt-2">대용량 이미지를 다운로드 중입니다...</div>'
            );
            var $img = $('<img>').attr('src', url)
                .addClass('img-fluid rounded shadow-sm mt-3')
                .css({'max-height': '800px', 'object-fit': 'contain', 'display': 'none'})
                .on('load', function() {
                    $box.empty().append($img);
                    $img.fadeIn(400);
                })
                .on('error', function() {
                    $box.html('<span class="text-danger"><i class="ki-outline ki-cross-circle fs-2 me-1"></i> 이미지 로드에 실패했습니다. (URL 만료 또는 손상)</span>');
                });
        }

        function updateInquiryStatus(id, newStatus) {
            $.ajax({
                url: '/mng/inquiry/updateStatus',
                type: 'POST',
                data: { inquiryId: id, status: newStatus },
                success: function(res) {
                    if(res === 'ok') {
                        // 변경 성공 시 "V 저장됨" 문구를 부드럽게 띄웠다 사라지게 함
                        var indicator = $('#statusUpdateIndicator');
                        indicator.css('display', 'inline-flex').hide().fadeIn(200).delay(1500).fadeOut(300);
                    } else {
                        Swal.fire("오류", "상태 변경 처리에 실패했습니다.", "error");
                    }
                },
                error: function() {
                    Swal.fire("오류", "서버 통신 중 문제가 발생했습니다.", "error");
                }
            });
        }
    </script>
</body>
</html>