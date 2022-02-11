<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="contents">

    <div class="titleArea">
        <h2>EVENT</h2>
        <p>저희 피부과가 준비한 다양하고 풍성한 이벤트를 확인하세요.</p>
    </div>
    <div class="title-right">
        <div class="search-bar">
            <form name="nseacrh" method="get" role="form">
                <input type="hidden" name="bo_table" value="notice">
                <input type="hidden" name="sca" value="">
                <input type="hidden" name="sop" value="and">
                <select name="findtype3" id="findtype3">
                    <option value="title">제목</option>
                    <option value="contents">내용</option>
                    <option value="titcont">제목+내용</option>
                </select>
                <input type="text" name="findkey" value="" required id="findkey" maxlength="20" placeholder="검색어를 입력해 주세요">
                <button type="button" class="submit" id="findbtn">
                    <img src="/images/paging/search.png" />
                </button>
            </form>
        </div>
    </div>

    <div class="event_list">
        <ul class="list clearfix">
            <li class="item">
                <a href="/event/detail" class="wrap">
                    <img src="/images/event/thumbnail/event1.jpg">
                    <div class="txt_bx">
                        <div class="txt_wrap">
                            <p class="tit">[11월 EVENT]With CORONA, 아자아자 대한민국</p>
                            <p class="date">2021-11-18 ~ 2021-12-31</p>
                        </div>
                    </div>
                </a>
            </li>

            <li class="item">
                <a href="/event/detail" class="wrap">
                    <img src="/images/event/thumbnail/event2.jpg">
                    <div class="txt_bx">
                        <div class="txt_wrap">
                            <p class="tit">5월 가정의달 이벤트</p>
                            <p class="date">2021-04-28 ~ 2021-05-31</p>
                        </div>
                    </div>
                </a>
            </li>

            <li class="item">
                <a href="/event/detail" class="wrap">
                    <img src="/images/event/thumbnail/event3.jpg">
                    <div class="txt_bx">
                        <div class="txt_wrap">
                            <p class="tit">더블로 골드 리프팅 이벤트</p>
                            <p class="date">2020-12-07 ~ 2020-12-31</p>
                        </div>
                    </div>
                </a>
            </li>

            <li class="item">
                <a href="/event/detail" class="wrap">
                    <img src="/images/event/thumbnail/event4.jpg">
                    <div class="txt_bx">
                        <div class="txt_wrap">
                            <p class="tit">뜨거운 여름! 티끌없이 시원하게 노출하자!</p>
                            <p class="date">2020-07-06 ~ 2020-08-31</p>
                        </div>
                    </div>
                </a>
            </li>
        </ul>
    </div>

    <div class="button_pos">
        <div class="btnArea M b_right">
            <a href="/event/write" class="black_s">작성하기</a>
        </div>
    </div>


    <div class="the3-base-paginate">
        <a href="?board_no=1&page=1">
            <img src="/images/paging/paging_left_arrow01.png" alt="이전 페이지"/>
        </a>
        <ol>
            <li><a href="?board_no=1&page=1" class="this">1</a></li>
            <li><a href="?board_no=1&page=2">2</a></li>
            <li><a href="?board_no=1&page=3">3</a></li>
            <li><a href="?board_no=1&page=4">4</a></li>
        </ol>
        <a href="?board_no=1&page=2">
            <img src="/images/paging/paging_right_arrow01.png" alt="다음 페이지"/>
        </a>
    </div>


</div>