$(document).ready(function () {

    // header 고정
    $(window).on('scroll', function () {
        if ($(window).scrollTop()) {
            $('#header').addClass('active');
        } else {
            $('#header').removeClass('active');
        }
    });

    // 햄버거 메뉴
    $('#header .hamberg').click(function () {
        $(this).children('span').toggleClass('on');
        $('#header .nav_wrap').toggleClass('on');
    });

    // header 이벤트
    function setMenuEvents() {
        $('#header .menu > li').off('mouseover mouseleave click');
        $('#header .lang').off('mouseover mouseout');

        const slideMenu = (selector, child) => {
            $(selector).on('mouseover', function () {
                $(this).children(child).stop().slideDown();
            }).on('mouseleave', function () {
                $(this).children(child).stop().slideUp();
            });
        };

        if (window.innerWidth >= 899) {
            slideMenu('#header .menu > li:has(.submenu)', '.submenu');
            slideMenu('#header .lang', '.langmenu');
        } else {
            $('#header .menu > li').on('click', function () {
                const $submenu = $(this).children('.submenu');
                $('.submenu').not($submenu).slideUp();
                $submenu.slideToggle();
            }).each(function () {
                if ($(this).children('.submenu').length > 0) {
                    $(this).children('a').attr('href', 'javascript:void(0);');
                }
            });
        }
    }

    $(window).on('resize', setMenuEvents); // 화면 크기 변경 시 재설정
    $(document).ready(setMenuEvents); // 초기 로드 시 설정


    $('.parallax_sec').each(function () {
        const img = $(this).find('.parallax_img');
        const url = img.attr('src');
        $(this).css({
            'background-image': `url(${url})`,
        });
        img.hide(); // 원래 이미지 숨김
    });

});

$(document).ready(function () {
    AOS.init(
        {once: true}
    ); // aos fade 이벤트
});  

// 개인정보처리방침 팝업
document.addEventListener('DOMContentLoaded', () => {

    const TERMSHEET_LIBRARY = {
        service:{
            title: '샘플',
            text: 'sample'

            .trim()
        },
        privacy: {
            title: '개인정보처리방침',
            text: `
                <div class="stack mt-24 terms_wrap">

                    <div class="sec">
                        <div class="text">
                            본 개인정보처리방침은 제이슨 버먼트(이하 “회사”)가 제공하는 <span>사내 세차 예약 서비스 ‘버먼트의 모든 것’</span> (이하 “서비스”) 이용과 관련하여, 이용자의 개인정보를 보호하고 관련 법령을 준수하기 위하여 마련되었습니다. 본 방침에서 ‘이용자’란 본 서비스에 회원으로 등록하여 세차 예약을 이용하는 회사 임직원을 의미합니다.<br class="terms_br">
                            회사는 「개인정보 보호법」 등 관계 법령을 준수하며, 이용자의 개인정보를 최소한으로 수집·이용하고 안전하게 관리합니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            1. 개인정보의 수집 항목 및 수집 방법
                        </div>
                        <div class="text">
                            ① 수집 항목<br class="terms_br">
                            회사는 서비스 제공을 위해 아래와 같은 개인정보를 수집합니다.<br class="terms_br"><br class="terms_br">

                            <span>[필수 항목]</span><br class="terms_br">
                            - 이름<br class="terms_br">
                            - 휴대전화번호<br class="terms_br">
                            - 차량 정보(차종, 차량번호, 차량색상)<br class="terms_br">
                            - 예약 정보(예약 일시, 세차 종류,  주차 위치 정보)<br class="terms_br"><br class="terms_br">

                            <span>[선택 항목]</span><br class="terms_br">
                            - 요청사항(메모)<br class="terms_br">
                            ※ 본 서비스는 결제 기능을 제공하지 않으며, 결제 관련 정보는 일절 수집하지 않습니다. <br class="terms_br">
                            ※ 차량 정보(차량번호 등)는 특정 개인을 식별할 수 있는 정보로 간주되어 개인정보로 보호됩니다.<br class="terms_br"><br class="terms_br">

                            ② 수집 방법<br class="terms_br">
                            모바일 애플리케이션을 통한 이용자의 직접 입력
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            2. 개인정보의 이용 목적
                        </div>
                        <div class="text">
                            회사는 수집한 개인정보를 다음의 목적에 한하여 이용합니다.<br class="terms_br">
                            - 세차 예약 접수 및 예약 내역 관리<br class="terms_br">
                            - 예약 일정 확인 및 변경, 안내 연락<br class="terms_br">
                            - 서비스 운영 및 내부 관리 목적<br class="terms_br">
                            ※ 수집된 개인정보는 위 목적 외의 용도로 이용되지 않으며, 이용 목적이 변경될 경우 사전에 이용자의 동의를 받습니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            3. 개인정보의 열람 및 접근 권한
                        </div>
                        <div class="text">
                            이용자의 개인정보는 다음의 경우에 한하여 열람할 수 있습니다.<br class="terms_br">
                            - 서비스 관리자<br class="terms_br">
                            - 해당 예약을 수행하는 세차업체 관리자<br class="terms_br">
                            - 그 외 제3자 및 일반 직원은 개인정보에 접근할 수 없습니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            4. 개인정보의 보유 및 이용 기간
                        </div>
                        <div class="text">
                            회사는 개인정보 수집 및 이용 목적이 달성된 후 지체 없이 해당 정보를 파기합니다.<br class="terms_br">
                            - 예약 정보: 예약 완료 후 24개월 보관 후 파기<br class="terms_br">
                            - 예약 정보: 예약 완료일 기준 24개월 보관 후 파기<br class="terms_br">
                            - 이용자가 퇴사를 하는 경우: 즉시 파기<br class="terms_br">
                            - 알림 발송 이력: 서비스 운영 확인을 위해 최대 7일간 보관 후 파기<br class="terms_br">
                            단, 내부 감사 또는 관계 법령에 따라 보관이 필요한 경우에는 해당 목적 달성 시까지 보관할 수 있습니다.<br class="terms_br">
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            5. 개인정보의 제3자 제공
                        </div>
                        <div class="text">
                            회사는 이용자의 개인정보를 외부 제3자에게 제공하지 않습니다.<br class="terms_br">
                            다만, 법령에 따라 제공이 요구되는 경우에는 관련 법령을 따릅니다.<br class="terms_br">
                            ※ 세차업체는 서비스 제공을 위한 내부 협력 주체로서, 개인정보 처리 목적 범위 내에서만 접근 권한이 부여됩니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            6. 개인정보의 처리 위탁
                        </div>
                        <div class="text">
                            회사는 원칙적으로 개인정보 처리 업무를 외부에 위탁하지 않습니다.향후 위탁이 발생할 경우, 관련 법령에 따라 사전에 안내하고 필요한 조치를 취하겠습니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            7. 개인정보의 파기 절차 및 방법
                        </div>
                        <div class="text">
                            회사는 개인정보 보유 기간이 경과하거나 처리 목적이 달성된 경우, 해당 정보를 지체 없이 파기합니다.<br class="terms_br">
                            - 전자적 파일 형태: 복구 불가능한 방법으로 삭제<br class="terms_br">
                            - 종이 문서 형태: 분쇄 또는 소각
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            8. 이용자의 권리 및 행사 방법
                        </div>
                        <div class="text">
                            이용자는 언제든지 다음과 같은 권리를 행사할 수 있습니다.<br class="terms_br">
                            - 개인정보 열람 요청<br class="terms_br">
                            - 개인정보 정정 또는 삭제 요청<br class="terms_br">
                            - 개인정보 처리 정지 요청<br class="terms_br">
                            위 권리는 서비스 관리자에게 요청하실 수 있으며, 회사는 지체 없이 조치합니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            9. 개인정보 보호를 위한 안전성 확보 조치
                        </div>
                        <div class="text">
                            회사는 개인정보 보호를 위하여 다음과 같은 조치를 취하고 있습니다.<br class="terms_br">
                            - 개인정보 접근 권한 최소화<br class="terms_br">
                            - 관리자 계정 관리 및 접근 통제<br class="terms_br">
                            - 개인정보 취급자에 대한 정기적인 관리 및 교육
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            10. 개인정보 보호 책임자
                        </div>
                        <div class="text">
                            회사는 개인정보 처리에 관한 업무를 총괄하여 책임지는 개인정보 보호 책임자를 지정하고 있습니다.<br class="terms_br">
                            - 개인정보 보호 책임자: 남점범<br class="terms_br">
                            - 담당 부서: CEO<br class="terms_br">
                            - 연락처: 010-32740-1207<br class="terms_br">
                            - 이메일: benefits@jasonbourmount.com<br class="terms_br">
                            ※ 개인정보 보호 책임자 정보는 내부 지정 후 서비스 내 별도 공지를 통해 안내됩니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            11. 고지의 의무
                        </div>
                        <div class="text">
                            본 개인정보처리방침의 내용이 변경되는 경우, 시행일 최소 7일 전에 서비스 내 공지사항을 통해 안내드립니다.
                        </div>
                    </div>
                </div>
            `.trim()
        }
    };

    const TERMSHEET_BACKDROP = document.getElementById('centerPopup');
    const TERMSHEET_TITLE = document.getElementById('centerPopupTitle');
    const TERMSHEET_TEXT = document.getElementById('centerPopupTxt');
    const TERMSHEET_OPEN_BTNS = document.querySelectorAll('.btn-open-terms');
    const TERMSHEET_CONFIRM_BTN = TERMSHEET_BACKDROP?.querySelector('[data-popup="center-confirm"]');

    if (!TERMSHEET_BACKDROP || !TERMSHEET_TITLE || !TERMSHEET_OPEN_BTNS.length) return;

    const TERMSHEET_TEXT_EL = TERMSHEET_TEXT || (() => {
        const el = document.createElement('div');
        el.className = 'center-popup_txt';
        el.id = 'centerPopupTxt';
        TERMSHEET_TITLE.insertAdjacentElement('afterend', el);
        return el;
    })();


    function TERMSHEET_nl2br(str = '') {
        return String(str).replace(/\n/g, '<br>');
    }

    function TERMSHEET_open(key) {
        const doc = TERMSHEET_LIBRARY[key];
        if (!doc) return;

        TERMSHEET_TITLE.textContent = doc.title || '';
        TERMSHEET_TEXT_EL.innerHTML = TERMSHEET_nl2br(doc.text || '');

        TERMSHEET_BACKDROP.style.display = 'block';
        TERMSHEET_BACKDROP.classList.add('is-open');

        document.body.classList.add('is-scroll-locked');
    }

    function TERMSHEET_close() {
        TERMSHEET_BACKDROP.classList.remove('is-open');
        TERMSHEET_BACKDROP.style.display = 'none';

        TERMSHEET_TITLE.textContent = '';
        TERMSHEET_TEXT_EL.innerHTML = '';

        document.body.classList.remove('is-scroll-locked');
    }

    TERMSHEET_OPEN_BTNS.forEach(btn => {
        btn.addEventListener('click', () => {

        const key = btn.dataset.terms;
        TERMSHEET_open(key);
        });
    });

    if (TERMSHEET_CONFIRM_BTN) {
        TERMSHEET_CONFIRM_BTN.addEventListener('click', TERMSHEET_close);
    }

    TERMSHEET_BACKDROP.addEventListener('click', (e) => {
        if (e.target === TERMSHEET_BACKDROP) TERMSHEET_close();
    });

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && TERMSHEET_BACKDROP.style.display === 'block') {
        TERMSHEET_close();
        }
    });
});