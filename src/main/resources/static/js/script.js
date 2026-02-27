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
        $('#header .lang').toggleClass('on');
        $('#header .side').toggleClass('on');
    });

    // lang 클릭
    $('#header .lang').on('click', function () {

        $('#header .side .langmenu').stop().slideUp();
        $(this).children('.langmenu').stop().slideToggle();
    });

    // side 클릭
    $('#header .side').on('click', function () {

        $('#header .lang .langmenu').stop().slideUp();
        $(this).children('.langmenu').stop().slideToggle();
    });

    // header 이벤트
    function setMenuEvents() {
        $('#header .menu > li').off('mouseover mouseleave click');


        const slideMenu = (selector, child) => {
            $(selector).on('mouseover', function () {
                $(this).children(child).stop().slideDown();
            }).on('mouseleave', function () {
                $(this).children(child).stop().slideUp();
            });
        };

        if (window.innerWidth >= 899) {
            slideMenu('#header .menu > li:has(.submenu)', '.submenu');

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

$('input[name="cmp_type"]').on('change', function () {

    if ($(this).val() === '기타') {
        $('.etc_input').stop().fadeIn(0).focus();
    } else {
        $('.etc_input').stop().fadeOut(0).val('');
    }

});

// 아코디언
$(document).ready(function () {
    const $items = $('.truth_txt li');
    const $imgs = $('.truth_img li');

    openAccordion($items.first());
    $imgs.first().addClass('active');

    $('.truth_txt .tit').on('click', function () {
        const $li = $(this).closest('li');
        const index = $li.index();
        if ($li.hasClass('active')) return;

        closeAll();
        openAccordion($li);

        $imgs.removeClass('active').eq(index).addClass('active');
    });

    function openAccordion($li) {
        const $txt = $li.find('.txt');

        $li.addClass('active');

        $txt.css('max-height', '0px');
        requestAnimationFrame(() => {
        const realHeight = $txt[0].scrollHeight;
        $txt.css('max-height', realHeight + 'px');
        });
    }

    function closeAll() {
        $items.each(function () {
        const $li = $(this);
        const $txt = $li.find('.txt');
        if (!$li.hasClass('active')) {
            $txt.css('max-height', '0px');
            return;
        }

        const currentHeight = $txt[0].scrollHeight;
        $txt.css('max-height', currentHeight + 'px');
        requestAnimationFrame(() => {
            $txt.css('max-height', '0px');
        });

        $li.removeClass('active');
        });
    }

    $(window).on('load', function () {
        const $active = $('.truth_txt li.active .txt');
        if ($active.length) $active.css('max-height', $active[0].scrollHeight + 'px');
    });
});

// 팝업 열기
$('.btn.guide').on('click', function () {
    $('.guide-popup').fadeIn(100);
    $('body').addClass('popup-open'); // 스크롤 잠금용(선택)
});

$('.popup-close').on('click', function () {
    $('.guide-popup').fadeOut(100);
    $('body').removeClass('popup-open');
});

$('.guide-popup').on('click', function (e) {
    if ($(e.target).is('.guide-popup')) {
        $(this).fadeOut(100);
        $('body').removeClass('popup-open');
    }
});

// 개인정보처리방침 팝업
document.addEventListener('DOMContentLoaded', () => {

    const TERMSHEET_LIBRARY = {
        service:{
            title: '개인정보 수집·이용 동의 (필수)',
            text: `
                <div class="stack mt-24 terms_wrap">
                    <div class="sec">
                        <div class="text">
                            <span>아티셀(이하 “회사”)</span> 은 문의 접수 및 답변, 서비스 상담을 위해 아래와 같이 개인정보를 수집·이용합니다. <br class="terms_br">
                            내용을 확인하신 후 동의해 주세요.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            1. 수집 항목
                        </div>
                        <div class="text">
                            ① 수집 항목
                            <ul>
                                <li><span>필수:</span> 성함, 구분(기업/개인), 연락처, 이메일, 국가, 문의내용</li>
                                <li><span>선택:</span> 작품제목</li>
                                <li><span>첨부 자료:</span> 작품 이미지 파일 및/또는 URL(작품 이미지가 포함될 수 있음)</li>
                            </ul>
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            2. 수집·이용 목적
                        </div>
                        <div class="text">
                            <ul>
                                <li>문의 접수 및 본인 확인</li>
                                <li>문의 내용 확인, 답변 및 안내(연락/이메일 회신)</li>
                                <li>서비스 이용 상담, 견적 및 진행 관련 커뮤니케이션</li>
                                <li>분쟁 대응 및 민원 처리, 서비스 품질 개선을 위한 내부 참고(비식별/최소 범위 내)</li>
                            </ul>
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            3. 보유 및 이용 기간
                        </div>
                        <div class="text">
                            <span>문의 처리 완료일로부터 1년 보관 후 파기</span><br class="terms_br">
                            단, 관계 법령에 따라 보관이 필요한 경우 해당 법령에서 정한 기간 동안 보관합니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            4. 동의 거부 권리 및 불이익
                        </div>
                        <div class="text">
                            이용자는 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다.<br class="terms_br">
                            다만 <span>필수 항목 동의/제공을 거부할 경우 문의 접수 및 답변 제공이 제한</span>될 수 있습니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            5. 첨부파일(작품 이미지) 유의사항
                        </div>
                        <div class="text">
                            첨부자료에는 작품 이미지 및 관련 정보가 포함될 수 있으며, 회사는 <span>문의 처리 및 상담 목적 범위 내에서만</span> 이를 이용합니다.<br class="terms_br">
                            민감정보(주민번호, 계좌번호 등)는 입력/첨부하지 않도록 주의해 주세요.
                        </div><br class="terms_br">
                    </div>
                </div>
            `.trim()
        },
        privacy: {
            title: '개인정보 수집·이용 동의 (필수)',
            text: `
                <div class="stack mt-24 terms_wrap">
                    <div class="sec">
                        <div class="text">
                            <span>아티셀(이하 “회사”)</span> 은 문의 접수 및 답변, 서비스 상담을 위해 아래와 같이 개인정보를 수집·이용합니다.
                            
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            1. 수집 항목
                        </div>
                        <div class="text">
                            ① 수집 항목
                            <ul>
                                <li><span>필수:</span> 성함, 구분(기업/개인), 연락처, 이메일, 국가, 문의내용</li>
                                <li><span>선택:</span> 작품제목</li>
                                <li><span>첨부 자료:</span> 작품 이미지 파일 및/또는 URL(작품 이미지가 포함될 수 있음)</li>
                            </ul>
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            2. 수집·이용 목적
                        </div>
                        <div class="text">
                            <ul>
                                <li>문의 접수 및 본인 확인</li>
                                <li>문의 내용 확인, 답변 및 안내(연락/이메일 회신)</li>
                                <li>서비스 이용 상담, 견적 및 진행 관련 커뮤니케이션</li>
                                <li>분쟁 대응 및 민원 처리, 서비스 품질 개선을 위한 내부 참고(비식별/최소 범위 내)</li>
                            </ul>
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            3. 보유 및 이용 기간
                        </div>
                        <div class="text">
                            <span>문의 처리 완료일로부터 1년 보관 후 파기</span><br class="terms_br">
                            단, 관계 법령에 따라 보관이 필요한 경우 해당 법령에서 정한 기간 동안 보관합니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            4. 동의 거부 권리 및 불이익
                        </div>
                        <div class="text">
                            이용자는 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다.<br class="terms_br">
                            다만 <span>필수 항목 동의/제공을 거부할 경우 문의 접수 및 답변 제공이 제한</span>될 수 있습니다.
                        </div>
                    </div>
                    <div class="sec">
                        <div class="tit">
                            5. 첨부파일(작품 이미지) 유의사항
                        </div>
                        <div class="text">
                            첨부자료에는 작품 이미지 및 관련 정보가 포함될 수 있으며, 회사는 <span>문의 처리 및 상담 목적 범위 내에서만</span> 이를 이용합니다.<br class="terms_br">
                            민감정보(주민번호, 계좌번호 등)는 입력/첨부하지 않도록 주의해 주세요.
                        </div><br class="terms_br">
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