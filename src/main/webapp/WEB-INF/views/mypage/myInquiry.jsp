<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--
<!%
    String strReferer = request.getHeader("referer");

    if(strReferer == null){
%>
<script language="javascript">
    alert("정상적인 경로를 통해 다시 접근해 주세요.");
    document.location.href="/";
</script>
<!%
        return;
    }
%>
-->

<c:if test="${sessionScope.MyInfo eq null}">
    <script language="javascript">
        alert("로그인이 필요한 기능입니다.");
        document.location.href="/";
    </script>
</c:if>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${(cp - 1) / 5}" integerOnly="true" />
<fmt:parseNumber var="sp" value="${sp * 5 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 4}" />

<%-- 총 게시물수를 페이지 당 게시물 수로 나눔 : 총 페이지수 --%>
<fmt:parseNumber var="tp" value="${icnt / 10}" integerOnly="true" />
<c:if test="${icnt % 10 gt 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<%-- 글번호 --%>
<fmt:parseNumber var="snum" value="${icnt - (cp-1) * 10}" />

<%-- 페이지링크 : 검색기능 x --%>
<c:set var="pglink" value="/inquiry/list?cp=" />

<div id="contents">

    <div class="titleArea">
        <h2>마이페이지</h2>
    </div>


    <div>
        <h2  style="text-align: center">
            <span><c:if test="${sessionScope.MyInfo.uid eq 'admin'}">관리자</c:if>
                <c:if test="${sessionScope.MyInfo.uid ne 'admin'}">${sessionScope.MyInfo.uname}</c:if> 님 환영합니다.</span>
        </h2>
    </div>

	<div class="mypageDisplay">
		<div class="mypage">
			<div class="pageMain">
				<a href="/mypage/myInfo" class="pageMain_box">
					<h3>회원 정보</h3>
					<p>고객님의 개인정보를 관리하는 공간입니다.</p>
				</a>
			</div>
			<div class="pageMain">
				<a href="/mypage/myDiagnosis?cp=1" class="pageMain_box">
					<h3>
						<c:if test="${sessionScope.MyInfo.uid eq 'admin'}">신청된 검사 목록</c:if>
						<c:if test="${sessionScope.MyInfo.uid ne 'admin'}">진단결과 조회</c:if>
					</h3>
					<p>
						<c:if test="${sessionScope.MyInfo.uid eq 'admin'}">신청된 검사 목록을 조회하고 결과를<br>작성하실 수 있습니다.</c:if>
						<c:if test="${sessionScope.MyInfo.uid ne 'admin'}">피부진단 결과를 조회하실 수 있습니다.</c:if></p>
				</a>
			</div>
			<div class="pageMain">
				<a href="/mypage/myInquiry?cp=1&uid=${sessionScope.MyInfo.uid}" class="pageMain_box mypageBtnActive">
					<h3>문의내역 조회</h3>
					<p>문의하신 내역과 답변을 확인하실 수 있습니다.</p>
				</a>
			</div>
		</div>

		<div class="mypageMainView">
			<h2 style="text-align: center; padding-top: 30px">문의내역 조회</h2>
			<div class="the3-base-table listType">
				<table border="1" summary="" style="width: 90%; margin: auto;">
					<colgroup>
						<col style="width:50px;"/>
						<col style="width:auto;"/>
						<col style="width:80px;"/>
						<col style="width:80px;"/>
					</colgroup>
					<thead><tr style=" ">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">상태</th>
						<th scope="col" class="">작성일</th>
					</tr></thead>
					<tbody class="center">
					<c:if test="${snum lt 1}">
                                <tbody class="center" style="height: 144px">
                                    <tr>
                                        <td class="noResult" colspan="4">검색 결과가 없습니다.</td>
                                    </tr>
                                </tbody>
                    </c:if>
					<c:forEach var="i" items="${is}">
					<tr style="background-color:#FFFFFF; color:#333333;" class="xans-record-">
						<td>${snum}</td>
						<td class="left txtBreak">
							<a href="/inquiry/detail?bno=${i.bno}" style="color:#333333;">${i.title}</a>
							<c:if test="${i.secret eq 'true'}">
								<img src="/images/logo/padlock.png" width="20" alt="비밀글" />
							</c:if>
							<span class="txtEm">[${i.comment}]</span>
						</td>
						<td><c:if test="${i.status eq 'true'}">
								<c:set var="status" value="답변완료"/>
							</c:if>
							<c:if test="${i.status eq 'false'}">
								<c:set var="status" value="답변대기"/>
							</c:if>
							${status}
						</td>
						<td><span class="txtNum">${fn:substring(i.regdate, 0, 10)}</span></td>
					</tr>
						<c:set var="snum" value="${snum-1}" />
					</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="the3-base-paginate">
				<c:if test="${cp ge sp and sp-1 != 0}">
					<a href="${pglink}${sp-1}">
						<img src="/images/paging/paging_left_arrow01.png" alt="이전 페이지">
					</a>
				</c:if>
				<c:if test="${sp-1 le 0}">
					<a href="${pglink}${sp}">
						<img src="/images/paging/paging_left_arrow01.png" alt="이전 페이지">
					</a>
				</c:if>

				<ol>
					<c:forEach var="i" begin="${sp}" end="${ep}" step="1">
						<%-- 표시하는 페이지i가 총 페이지 수보다 작거나 같을 동안만 출력 --%>
						<c:if test="${i le tp}">
							<c:if test="${i eq cp}">
								<li><a class="this" href="${pglink}${i}">${i}</a></li>
							</c:if>
							<c:if test="${i ne cp}">
								<li><a href="${pglink}${i}">${i}</a></li>
							</c:if>
						</c:if>
					</c:forEach>
				</ol>

				<c:if test="${cp+1 le tp and ep le tp}">
					<a href="${pglink}${ep+1}">
						<img src="/images/paging/paging_right_arrow01.png" alt="다음 페이지"/>
					</a>
				</c:if>
				<c:if test="${cp+1 ge tp or ep ge tp}">
					<a href="${pglink}${tp}">
						<img src="/images/paging/paging_right_arrow01.png" alt="다음 페이지"/>
					</a>
				</c:if>
			</div>
		</div>
	</div>
</div>