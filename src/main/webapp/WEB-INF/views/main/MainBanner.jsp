<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배너 페이지</title>

	<!-- Slick CSS -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

	<!-- jQuery & Slick JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

	<!-- 추가 스타일 -->
	<link rel="stylesheet" href="/hos/resources/css/mainpage-user/mainbanner.css">
	<script src="/hos/resources/js/httpRequest.js"></script>

	<script>
		$(document).ready(function () {
			const $slider = $('.slider');

			$slider.slick({
				autoplay: true,
				autoplaySpeed: 4000,
				dots: true,
				arrows: false, // 기본 화살표 제거 (커스텀 버튼 사용)
				infinite: true,
				speed: 500,
				slidesToShow: 1,
				slidesToScroll: 1,
				adaptiveHeight: true
			});

			// 커스텀 버튼과 연결
			$('.slider-btn.prev').on('click', function () {
				$slider.slick('slickPrev');
			});
			$('.slider-btn.next').on('click', function () {
				$slider.slick('slickNext');
			});
		});

		// 배너 삭제 팝업
		function delete_banner() {
			const centerX = window.innerWidth / 2;
			const centerY = window.innerHeight / 2;
			const options = "width=500,height=400,left=" + centerX + ",top=" + centerY;

			window.open(
				"delete_banner_page.do",
				"삭제할 배너의 이름을 선택해주세요",
				options
			);
		}
	</script>
</head>

<body>
	<div class="slider-container">
		<div class="slider">
			<c:forEach var="vo" items="${images}">
				<c:if test="${vo.banner_chk eq 1}">
					<div>
						<img src="/hos/resources/upload/${vo.banner_file}" alt="배너 이미지">
					</div>
				</c:if>
			</c:forEach>
		</div>

		<!-- 커스텀 버튼 -->
		<button class="slider-btn prev">&lt;</button>
		<button class="slider-btn next">&gt;</button>
	</div>
</body>
</html>



