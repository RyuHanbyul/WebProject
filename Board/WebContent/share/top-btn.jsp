<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="top-btn">
	<c:choose>
		<c:when test="${id == null && fbid == null}">
			<p style="text-align:right;">
				<a class="btn btn-small top_btn" href="./login.jsp">로그인</a> <a
					class="btn btn-small top_btn" href="user?op=signup">회원가입</a>
			</p>
		</c:when>
		<c:otherwise>
			<c:if test="${id != null  }">
				<p style="text-align:right;">
					<a class="btn btn-small top_btn" href="login?op=logout">로그아웃</a> <a
						class="btn btn-small top_btn" href="user?op=mypage&id=${id}">유저
						마이페이지</a>
				</p>
			</c:if>
			<c:if test="${fbid != null }">
			<p style="text-align:right;">
				<a class="btn btn-small top_btn" href="login?op=logout">로그아웃</a>
				<a class="btn btn-small top_btn" href="fbuser?op=mypage&fbid=${fbid}">페북
					마이페이지</a>
			</p>
			</c:if>
		</c:otherwise>
	</c:choose>
</div>
