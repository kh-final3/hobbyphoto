<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>0. Design</title>
<link type="text/css"
	href="https://uicdn.toast.com/tui-color-picker/v2.2.6/tui-color-picker.css"
	rel="stylesheet">
<link type="text/css"
	href="https://nhn.github.io/tui.image-editor/latest/dist/tui-image-editor.css"
	rel="stylesheet">
<style>
@import url(http://fonts.googleapis.com/css?family=Noto+Sans);

html, body {
	height: 100%;
	margin: 0;
}
</style>
<script>
	var errorLogs = [];
	window.onerror = function(o, r, e, n) {
		errorLogs.push({
			message : o,
			source : r,
			lineno : e,
			colno : n
		})
	};
</script>
<link rel="stylesheet" type="text/css"
	href="data:text/css;charset=UTF-8,%0A%20%20%20%20.tie-icon-add-button.icon-bubble%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-bubble%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-heart%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-heart%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-location%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-location%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-polygon%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-polygon%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-star%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-star%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-star-2%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-star-2%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-arrow-3%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-arrow-3%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-arrow-2%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-arrow-2%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-arrow%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-arrow%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-bubble%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-bubble%22%5D%20label%2C%0A%20%20%20%20.tie-draw-line-select-button.line%20.tui-image-editor-button.line%20label%2C%0A%20%20%20%20.tie-draw-line-select-button.free%20.tui-image-editor-button.free%20label%2C%0A%20%20%20%20.tie-flip-button.flipX%20.tui-image-editor-button.flipX%20label%2C%0A%20%20%20%20.tie-flip-button.flipY%20.tui-image-editor-button.flipY%20label%2C%0A%20%20%20%20.tie-flip-button.resetFlip%20.tui-image-editor-button.resetFlip%20label%2C%0A%20%20%20%20.tie-crop-button%20.tui-image-editor-button.apply.active%20label%2C%0A%20%20%20%20.tie-crop-preset-button%20.tui-image-editor-button.preset.active%20label%2C%0A%20%20%20%20.tie-resize-button%20.tui-image-editor-button.apply.active%20label%2C%0A%20%20%20%20.tie-resize-preset-button%20.tui-image-editor-button.preset.active%20label%2C%0A%20%20%20%20.tie-shape-button.rect%20.tui-image-editor-button.rect%20label%2C%0A%20%20%20%20.tie-shape-button.circle%20.tui-image-editor-button.circle%20label%2C%0A%20%20%20%20.tie-shape-button.triangle%20.tui-image-editor-button.triangle%20label%2C%0A%20%20%20%20.tie-text-effect-button%20.tui-image-editor-button.active%20label%2C%0A%20%20%20%20.tie-text-align-button.tie-text-align-left%20.tui-image-editor-button.left%20label%2C%0A%20%20%20%20.tie-text-align-button.tie-text-align-center%20.tui-image-editor-button.center%20label%2C%0A%20%20%20%20.tie-text-align-button.tie-text-align-right%20.tui-image-editor-button.right%20label%2C%0A%20%20%20%20.tie-mask-apply.apply.active%20.tui-image-editor-button.apply%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%3Ahover%20%3E%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-checkbox%20label%20%3E%20span%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bfont-weight%3A%20lighter%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%20%3E%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-wrap.tui-image-editor-newline.short%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-wrap.tui-image-editor-newline.short%20label%20%3E%20span%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%238a8a8a%3Bfont-weight%3A%20lighter%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-wrap%20label%20%3E%20span%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bfont-weight%3A%20lighter%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-partition%20%3E%20div%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%233c3c3c%3Bborder-left%3A%201px%20solid%20%233c3c3c%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container.left%20.tui-image-editor-submenu%20.tui-image-editor-partition%20%3E%20div%2C%0A%20%20%20%20.tui-image-editor-container.right%20.tui-image-editor-submenu%20.tui-image-editor-partition%20%3E%20div%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%233c3c3c%3Bborder-bottom%3A%201px%20solid%20%233c3c3c%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-checkbox%20label%20%3E%20span%3Abefore%20%7B%0A%20%20%20%20%20%20%20%20border%3A%200px%3Bbackground-color%3A%20%23fff%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-checkbox%20label%20%3E%20input%3Achecked%20%2B%20span%3Abefore%20%7B%0A%20%20%20%20%20%20%20%20border%3A%200%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-virtual-range-pointer%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bbackground-color%3A%20%23fff%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-virtual-range-bar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23666%3Bbackground-color%3A%20%23666%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-virtual-range-subbar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23d1d1d1%3Bbackground-color%3A%20%23d1d1d1%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-disabled%20.tui-image-editor-virtual-range-pointer%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23414141%3Bbackground-color%3A%20%23414141%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-disabled%20.tui-image-editor-virtual-range-subbar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23414141%3Bbackground-color%3A%20%23414141%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-disabled%20.tui-image-editor-virtual-range-bar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23282828%3Bbackground-color%3A%20%23282828%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-value%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bfont-weight%3A%20lighter%3Bfont-size%3A%2011px%3Bborder%3A%201px%20solid%20%23353535%3Bbackground-color%3A%20%23151515%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%20.color-picker-value%20%2B%20label%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%20.color-picker-value%20%7B%0A%20%20%20%20%20%20%20%20border%3A%201px%20solid%20%231e1e1e%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.svg_ic-menu%20%7B%0A%20%20%20%20%20%20%20%20width%3A%2024px%3Bheight%3A%2024px%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.svg_ic-submenu%20%7B%0A%20%20%20%20%20%20%20%20width%3A%2032px%3Bheight%3A%2032px%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-controls-logo%20%3E%20img%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-header-logo%20%3E%20img%20%7B%0A%20%20%20%20%20%20%20%20width%3A%20251px%3Bheight%3A%2021px%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.normal.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.normal.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%238a8a8a%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%238a8a8a%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.active.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.active.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23555555%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23555555%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.hover.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.hover.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23e9e9e9%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23e9e9e9%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.disabled.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.disabled.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23434343%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23434343%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-submenu%20use.normal.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%238a8a8a%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%238a8a8a%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-submenu%20use.active.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23e9e9e9%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23e9e9e9%3B%0A%20%20%20%20%7D%0A">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div id="tui-image-editor-container"
		class="tui-image-editor-container bottom"
		style="width: 100%; height: 100%;">
		<ul class="tui-image-editor-help-menu top">
			<li tooltip-content="ZoomIn"
				class="tie-btn-zoomIn tui-image-editor-item help enabled"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-zoom-in" class="normal use-default"></use>
					<use xlink:href="#ic-zoom-in" class="disabled use-default"></use>
					<use xlink:href="#ic-zoom-in" class="hover use-default"></use></svg></li>
			<li tooltip-content="ZoomOut"
				class="tie-btn-zoomOut tui-image-editor-item help enabled"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-zoom-out" class="normal use-default"></use>
					<use xlink:href="#ic-zoom-out" class="disabled use-default"></use>
					<use xlink:href="#ic-zoom-out" class="hover use-default"></use></svg></li>
			<li tooltip-content="Hand"
				class="tie-btn-hand tui-image-editor-item help enabled"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-hand" class="normal use-default"></use>
					<use xlink:href="#ic-hand" class="disabled use-default"></use>
					<use xlink:href="#ic-hand" class="hover use-default"></use></svg></li>
			<li class="tui-image-editor-item"><div
					class="tui-image-editor-icpartition"></div></li>
			<li tooltip-content="History"
				class="tie-btn-history tui-image-editor-item help enabled"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-history" class="normal use-default"></use>
					<use xlink:href="#ic-history" class="disabled use-default"></use>
					<use xlink:href="#ic-history" class="hover use-default"></use></svg>
				<div class="tie-panel-history">
					<ol class="history-list">
						<li class="history-item selected-item" data-index="0">
							<div class="tui-image-editor-history-item history">
								<div class="history-item-icon">
									<svg class="svg_ic-submenu">
										<use xlink:href="#ic-history-load" class="normal use-default"></use>
										<use xlink:href="#ic-history-load" class="active use-default"></use></svg>
								</div>
								<span> Load </span>
								<div class="history-item-checkbox">
									<svg class="svg_ic-submenu">
										<use xlink:href="#ic-history-check" class="normal use-default"></use></svg>
								</div>
							</div>
						</li>
					</ol>
				</div></li>
			<li tooltip-content="Undo"
				class="tie-btn-undo tui-image-editor-item help"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-undo" class="normal use-default"></use>
					<use xlink:href="#ic-undo" class="disabled use-default"></use>
					<use xlink:href="#ic-undo" class="hover use-default"></use></svg></li>
			<li tooltip-content="Redo"
				class="tie-btn-redo tui-image-editor-item help"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-redo" class="normal use-default"></use>
					<use xlink:href="#ic-redo" class="disabled use-default"></use>
					<use xlink:href="#ic-redo" class="hover use-default"></use></svg></li>
			<li tooltip-content="Reset"
				class="tie-btn-reset tui-image-editor-item help"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-reset" class="normal use-default"></use>
					<use xlink:href="#ic-reset" class="disabled use-default"></use>
					<use xlink:href="#ic-reset" class="hover use-default"></use></svg></li>
			<li class="tui-image-editor-item"><div
					class="tui-image-editor-icpartition"></div></li>
			<li tooltip-content="Delete"
				class="tie-btn-delete tui-image-editor-item help"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-delete" class="normal use-default"></use>
					<use xlink:href="#ic-delete" class="disabled use-default"></use>
					<use xlink:href="#ic-delete" class="hover use-default"></use></svg></li>
			<li tooltip-content="DeleteAll"
				class="tie-btn-deleteAll tui-image-editor-item help"><svg
					class="svg_ic-menu">
					<use xlink:href="#ic-delete-all" class="normal use-default"></use>
					<use xlink:href="#ic-delete-all" class="disabled use-default"></use>
					<use xlink:href="#ic-delete-all" class="hover use-default"></use></svg></li>
		</ul>
		<div class="tui-image-editor-controls">
			<div class="tui-image-editor-controls-logo">
				<img
					src="https://uicdn.toast.com/toastui/img/tui-image-editor-bi.png">
			</div>
			<ul class="tui-image-editor-menu">
				<li tooltip-content="Resize"
					class="tie-btn-resize tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-resize" class="normal use-default"></use>
						<use xlink:href="#ic-resize" class="active use-default"></use>
						<use xlink:href="#ic-resize" class="hover use-default"></use></svg></li>
				<li tooltip-content="Crop"
					class="tie-btn-crop tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-crop" class="normal use-default"></use>
						<use xlink:href="#ic-crop" class="active use-default"></use>
						<use xlink:href="#ic-crop" class="hover use-default"></use></svg></li>
				<li tooltip-content="Flip"
					class="tie-btn-flip tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-flip" class="normal use-default"></use>
						<use xlink:href="#ic-flip" class="active use-default"></use>
						<use xlink:href="#ic-flip" class="hover use-default"></use></svg></li>
				<li tooltip-content="Rotate"
					class="tie-btn-rotate tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-rotate" class="normal use-default"></use>
						<use xlink:href="#ic-rotate" class="active use-default"></use>
						<use xlink:href="#ic-rotate" class="hover use-default"></use></svg></li>
				<li tooltip-content="Draw"
					class="tie-btn-draw tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-draw" class="normal use-default"></use>
						<use xlink:href="#ic-draw" class="active use-default"></use>
						<use xlink:href="#ic-draw" class="hover use-default"></use></svg></li>
				<li tooltip-content="Shape"
					class="tie-btn-shape tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-shape" class="normal use-default"></use>
						<use xlink:href="#ic-shape" class="active use-default"></use>
						<use xlink:href="#ic-shape" class="hover use-default"></use></svg></li>
				<li tooltip-content="Icon"
					class="tie-btn-icon tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-icon" class="normal use-default"></use>
						<use xlink:href="#ic-icon" class="active use-default"></use>
						<use xlink:href="#ic-icon" class="hover use-default"></use></svg></li>
				<li tooltip-content="Text"
					class="tie-btn-text tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-text" class="normal use-default"></use>
						<use xlink:href="#ic-text" class="active use-default"></use>
						<use xlink:href="#ic-text" class="hover use-default"></use></svg></li>
				<li tooltip-content="Mask"
					class="tie-btn-mask tui-image-editor-item normal"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-mask" class="normal use-default"></use>
						<use xlink:href="#ic-mask" class="active use-default"></use>
						<use xlink:href="#ic-mask" class="hover use-default"></use></svg></li>
				<li tooltip-content="Filter"
					class="tie-btn-filter tui-image-editor-item normal active"><svg
						class="svg_ic-menu">
						<use xlink:href="#ic-filter" class="normal use-default"></use>
						<use xlink:href="#ic-filter" class="active use-default"></use>
						<use xlink:href="#ic-filter" class="hover use-default"></use></svg></li>
			</ul>

			<div class="tui-image-editor-controls-buttons">
				<div
					style="background-color: #fff; border: 1px solid #ddd; color: #222; font-family: 'Noto Sans', sans-serif; font-size: 12px">
					Load <input type="file" class="tui-image-editor-load-btn">
				</div>
				<button class="tui-image-editor-download-btn"
					style="background-color: #fdba3b; border: 1px solid #fdba3b; color: #fff; font-family: 'Noto Sans', sans-serif; font-size: 12px">
					ㅇㅁㄴㅇㄴㅇ</button>
				<button class="submit"
					style="background-color: #fdba3b; border: 1px solid #fdba3b; color: #fff; font-family: 'Noto Sans', sans-serif; font-size: 12px">
					서버저장테스트</button>
			</div>
		</div>

		<div class="tui-image-editor-main-container"
			style="background-image: none; background-color: #1e1e1e; border: 0px">
			<div class="tui-image-editor-header"
				style="background-image: none; background-color: transparent; border: 0px">
				<div class="tui-image-editor-header-logo"></div>
				<div class="tui-image-editor-header-buttons">
					<div
						style="background-color: #fff; border: 1px solid #ddd; color: #222; font-family: 'Noto Sans', sans-serif; font-size: 12px">
						Load <input type="file" class="tui-image-editor-load-btn">
					</div>
					<button class="tui-image-editor-download-btn"
						style="background-color: #fdba3b; border: 1px solid #fdba3b; color: #fff; font-family: 'Noto Sans', sans-serif; font-size: 12px">
						Download</button>
						<button class="submit"
					style="background-color: #fdba3b; border: 1px solid #fdba3b; color: #fff; font-family: 'Noto Sans', sans-serif; font-size: 12px">
					서버저장테스트</button>
				</div>
			</div>
			<div class="tui-image-editor-main tui-image-editor-menu-filter">
				<div class="tui-image-editor-submenu">
					<div class="tui-image-editor-submenu-style"
						style="background-color: #1e1e1e"></div>
					<div class="tui-image-editor-menu-resize">
						<ul class="tui-image-editor-submenu-item">
							<li class="tui-image-editor-submenu-align">
								<div
									class="tui-image-editor-range-wrap tui-image-editor-newline">
									<label class="range">Width&nbsp;</label>
									<div class="tie-width-range tui-image-editor-range">
										<div class="tui-image-editor-virtual-range-bar">
											<div class="tui-image-editor-virtual-range-subbar"
												style="right: 124.84px;"></div>
											<div class="tui-image-editor-virtual-range-pointer"
												style="left: 29.1598px;"></div>
										</div>
									</div>
									<input
										class="tie-width-range-value tui-image-editor-range-value"
										value="0"> <label>px</label>
									<div
										class="tui-image-editor-partition tui-image-editor-newline"></div>
									<label class="range">Height</label>
									<div class="tie-height-range tui-image-editor-range">
										<div class="tui-image-editor-virtual-range-bar">
											<div class="tui-image-editor-virtual-range-subbar"
												style="right: 124.84px;"></div>
											<div class="tui-image-editor-virtual-range-pointer"
												style="left: 29.1598px;"></div>
										</div>
									</div>
									<input
										class="tie-height-range-value tui-image-editor-range-value"
										value="0"> <label>px</label>
								</div>
							</li>
							<li class="tui-image-editor-partition tui-image-editor-newline"></li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tui-image-editor-submenu-align">
								<div class="tui-image-editor-checkbox-wrap">
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox"
											class="tie-lock-aspect-ratio"> <span>Lock
												Aspect Ratio</span>
										</label>
									</div>
								</div>
							</li>
							<li class="tui-image-editor-partition tui-image-editor-newline"></li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tui-image-editor-partition tui-image-editor-newline"></li>
							<li class="tie-resize-button action">
								<div class="tui-image-editor-button apply">
									<svg class="svg_ic-menu">
										<use xlink:href="#ic-apply" class="normal use-default"></use>
										<use xlink:href="#ic-apply" class="active use-default"></use></svg>
									<label> Apply </label>
								</div>
								<div class="tui-image-editor-button cancel">
									<svg class="svg_ic-menu">
										<use xlink:href="#ic-cancel" class="normal use-default"></use>
										<use xlink:href="#ic-cancel" class="active use-default"></use></svg>
									<label> Cancel </label>
								</div>
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-crop">
						<ul class="tui-image-editor-submenu-item">
							<li class="tie-crop-preset-button">
								<div class="tui-image-editor-button preset preset-none active">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-shape-rectangle"
												class="normal use-default"></use>
											<use xlink:href="#ic-shape-rectangle"
												class="active use-default"></use></svg>
									</div>
									<label> Custom </label>
								</div>
								<div class="tui-image-editor-button preset preset-square">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-crop" class="normal use-default"></use>
											<use xlink:href="#ic-crop" class="active use-default"></use></svg>
									</div>
									<label> Square </label>
								</div>
								<div class="tui-image-editor-button preset preset-3-2">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-crop" class="normal use-default"></use>
											<use xlink:href="#ic-crop" class="active use-default"></use></svg>
									</div>
									<label> 3:2 </label>
								</div>
								<div class="tui-image-editor-button preset preset-4-3">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-crop" class="normal use-default"></use>
											<use xlink:href="#ic-crop" class="active use-default"></use></svg>
									</div>
									<label> 4:3 </label>
								</div>
								<div class="tui-image-editor-button preset preset-5-4">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-crop" class="normal use-default"></use>
											<use xlink:href="#ic-crop" class="active use-default"></use></svg>
									</div>
									<label> 5:4 </label>
								</div>
								<div class="tui-image-editor-button preset preset-7-5">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-crop" class="normal use-default"></use>
											<use xlink:href="#ic-crop" class="active use-default"></use></svg>
									</div>
									<label> 7:5 </label>
								</div>
								<div class="tui-image-editor-button preset preset-16-9">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-crop" class="normal use-default"></use>
											<use xlink:href="#ic-crop" class="active use-default"></use></svg>
									</div>
									<label> 16:9 </label>
								</div>
							</li>
							<li class="tui-image-editor-partition tui-image-editor-newline">
							</li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tie-crop-button action">
								<div class="tui-image-editor-button apply">
									<svg class="svg_ic-menu">
										<use xlink:href="#ic-apply" class="normal use-default"></use>
										<use xlink:href="#ic-apply" class="active use-default"></use></svg>
									<label> Apply </label>
								</div>
								<div class="tui-image-editor-button cancel">
									<svg class="svg_ic-menu">
										<use xlink:href="#ic-cancel" class="normal use-default"></use>
										<use xlink:href="#ic-cancel" class="active use-default"></use></svg>
									<label> Cancel </label>
								</div>
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-flip">
						<ul class="tie-flip-button tui-image-editor-submenu-item">
							<li>
								<div class="tui-image-editor-button flipX">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-flip-x" class="normal use-default"></use>
											<use xlink:href="#ic-flip-x" class="active use-default"></use></svg>
									</div>
									<label> Flip X </label>
								</div>
								<div class="tui-image-editor-button flipY">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-flip-y" class="normal use-default"></use>
											<use xlink:href="#ic-flip-y" class="active use-default"></use></svg>
									</div>
									<label> Flip Y </label>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li>
								<div class="tui-image-editor-button resetFlip">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-flip-reset" class="normal use-default"></use>
											<use xlink:href="#ic-flip-reset" class="active use-default"></use></svg>
									</div>
									<label> Reset </label>
								</div>
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-rotate">
						<ul class="tui-image-editor-submenu-item">
							<li class="tie-rotate-button">
								<div class="tui-image-editor-button clockwise">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-rotate-clockwise"
												class="normal use-default"></use>
											<use xlink:href="#ic-rotate-clockwise"
												class="active use-default"></use></svg>
									</div>
									<label> 30 </label>
								</div>
								<div class="tui-image-editor-button counterclockwise">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-rotate-counterclockwise"
												class="normal use-default"></use>
											<use xlink:href="#ic-rotate-counterclockwise"
												class="active use-default"></use></svg>
									</div>
									<label> -30 </label>
								</div>
							</li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tui-image-editor-newline tui-image-editor-range-wrap">
								<label class="range">Range</label>
								<div class="tie-rotate-range tui-image-editor-range">
									<div class="tui-image-editor-virtual-range-bar">
										<div class="tui-image-editor-virtual-range-subbar"
											style="right: 77px;"></div>
										<div class="tui-image-editor-virtual-range-pointer"
											style="left: 77px;"></div>
									</div>
								</div> <input
								class="tie-rotate-range-value tui-image-editor-range-value"
								value="0">
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-draw">
						<ul class="tui-image-editor-submenu-item">
							<li class="tie-draw-line-select-button">
								<div class="tui-image-editor-button free">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-draw-free" class="normal use-default"></use>
											<use xlink:href="#ic-draw-free" class="active use-default"></use></svg>
									</div>
									<label> Free </label>
								</div>
								<div class="tui-image-editor-button line">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-draw-line" class="normal use-default"></use>
											<use xlink:href="#ic-draw-line" class="active use-default"></use></svg>
									</div>
									<label> Straight </label>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li>
								<div class="tie-draw-color tui-image-editor-button"
									title="Color">
									<div class="color-picker-control" style="display: none;">
										<div class="color-picker">
											<div class="tui-colorpicker-container tui-view-1">
												<div class="tui-colorpicker-palette-container tui-view-2">
													<ul class="tui-colorpicker-clearfix">

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #000000; color: #000000"
															title="#000000" value="#000000"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #2a2a2a; color: #2a2a2a"
															title="#2a2a2a" value="#2a2a2a"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #545454; color: #545454"
															title="#545454" value="#545454"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #7e7e7e; color: #7e7e7e"
															title="#7e7e7e" value="#7e7e7e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #a8a8a8; color: #a8a8a8"
															title="#a8a8a8" value="#a8a8a8"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #d2d2d2; color: #d2d2d2"
															title="#d2d2d2" value="#d2d2d2"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ffffff; color: #ffffff"
															title="#ffffff" value="#ffffff"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-color-transparent"
															type="button" title="" value=""></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff4040; color: #ff4040"
															title="#ff4040" value="#ff4040"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff6518; color: #ff6518"
															title="#ff6518" value="#ff6518"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ffbb3b; color: #ffbb3b"
															title="#ffbb3b" value="#ffbb3b"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #03bd9e; color: #03bd9e"
															title="#03bd9e" value="#03bd9e"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-selected"
															type="button"
															style="background-color: #00a9ff; color: #00a9ff"
															title="#00a9ff" value="#00a9ff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #515ce6; color: #515ce6"
															title="#515ce6" value="#515ce6"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #9e5fff; color: #9e5fff"
															title="#9e5fff" value="#9e5fff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff5583; color: #ff5583"
															title="#ff5583" value="#ff5583"></li>

													</ul>
													<div class="tui-colorpicker-clearfix"
														style="overflow: hidden">
														<input type="button"
															class="tui-colorpicker-palette-toggle-slider"
															value="Detail"> <input type="text"
															class="tui-colorpicker-palette-hex" value="#00a9ff"
															maxlength="7"> <span
															class="tui-colorpicker-palette-preview"
															style="background-color: #00a9ff; color: #00a9ff">#00a9ff</span>
													</div>
												</div>
												<div class="tui-colorpicker-slider-container tui-view-3"
													style="display: none;">
													<div
														class="tui-colorpicker-slider-left tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-slider">
<defs>
<linearGradient id="tui-colorpicker-svg-fill-color-1" x1="0%" y1="0%"
																x2="100%" y2="0%">
<stop offset="0%" stop-color="rgb(255,255,255)"></stop>
<stop class="tui-colorpicker-slider-basecolor" offset="100%"
																stop-color="#00aaff"></stop>
</linearGradient>
<linearGradient id="tui-colorpicker-svn-fill-black-1" x1="0%" y1="0%"
																x2="0%" y2="100%">
<stop offset="0%" style="stop-color:rgb(0,0,0);stop-opacity:0"></stop>
<stop offset="100%" style="stop-color:rgb(0,0,0);stop-opacity:1"></stop>
</linearGradient>
</defs>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svg-fill-color-1)"></rect>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svn-fill-black-1)"></rect>
<path transform="translate(105,-7)"
																class="tui-colorpicker-slider-handle"
																d="M0 7.5 L15 7.5 M7.5 15 L7.5 0 M2 7 a5.5 5.5 0 1 1 0 1 Z"
																stroke="black" stroke-width="0.75" fill="none"></path>
</svg>
													</div>
													<div
														class="tui-colorpicker-slider-right tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-huebar">
<defs>
<linearGradient id="g-1" x1="0%" y1="0%" x2="0%" y2="100%">
<stop offset="0%" stop-color="rgb(255,0,0)"></stop>
<stop offset="16.666%" stop-color="rgb(255,255,0)"></stop>
<stop offset="33.333%" stop-color="rgb(0,255,0)"></stop>
<stop offset="50%" stop-color="rgb(0,255,255)"></stop>
<stop offset="66.666%" stop-color="rgb(0,0,255)"></stop>
<stop offset="83.333%" stop-color="rgb(255,0,255)"></stop>
<stop offset="100%" stop-color="rgb(255,0,0)"></stop>
</linearGradient>
</defs>
<rect width="18px" height="100%" fill="url(#g-1)"></rect>
<path transform="translate(-6,62.557376593794274)"
																class="tui-colorpicker-huebar-handle"
																d="M0 0 L4 4 L0 8 L0 0 Z" fill="black" stroke="none"></path>
</svg>
													</div>
												</div>
											</div>
										</div>
										<div class="triangle"></div>
									</div>
									<div class="color-picker-value"
										style="background-color: rgb(0, 169, 255);"></div>
									<label>Color</label>
								</div>
							</li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tui-image-editor-newline tui-image-editor-range-wrap">
								<label class="range">Range</label>
								<div class="tie-draw-range tui-image-editor-range">
									<div class="tui-image-editor-virtual-range-bar">
										<div class="tui-image-editor-virtual-range-subbar"
											style="right: 110.88px;"></div>
										<div class="tui-image-editor-virtual-range-pointer"
											style="left: 43.12px;"></div>
									</div>
								</div> <input
								class="tie-draw-range-value tui-image-editor-range-value"
								value="0">
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-shape">
						<ul class="tui-image-editor-submenu-item">
							<li class="tie-shape-button">
								<div class="tui-image-editor-button rect">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-shape-rectangle"
												class="normal use-default"></use>
											<use xlink:href="#ic-shape-rectangle"
												class="active use-default"></use></svg>
									</div>
									<label> Rectangle </label>
								</div>
								<div class="tui-image-editor-button circle">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-shape-circle" class="normal use-default"></use>
											<use xlink:href="#ic-shape-circle" class="active use-default"></use></svg>
									</div>
									<label> Circle </label>
								</div>
								<div class="tui-image-editor-button triangle">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-shape-triangle"
												class="normal use-default"></use>
											<use xlink:href="#ic-shape-triangle"
												class="active use-default"></use></svg>
									</div>
									<label> Triangle </label>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li class="tie-shape-color-button">
								<div class="tie-color-fill tui-image-editor-button" title="Fill">
									<div class="color-picker-control" style="display: none;">
										<div class="color-picker">
											<div class="tui-colorpicker-container tui-view-4">
												<div class="tui-colorpicker-palette-container tui-view-5">
													<ul class="tui-colorpicker-clearfix">

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #000000; color: #000000"
															title="#000000" value="#000000"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #2a2a2a; color: #2a2a2a"
															title="#2a2a2a" value="#2a2a2a"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #545454; color: #545454"
															title="#545454" value="#545454"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #7e7e7e; color: #7e7e7e"
															title="#7e7e7e" value="#7e7e7e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #a8a8a8; color: #a8a8a8"
															title="#a8a8a8" value="#a8a8a8"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #d2d2d2; color: #d2d2d2"
															title="#d2d2d2" value="#d2d2d2"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ffffff; color: #ffffff"
															title="#ffffff" value="#ffffff"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-selected tui-colorpicker-color-transparent"
															type="button" title="" value=""></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff4040; color: #ff4040"
															title="#ff4040" value="#ff4040"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff6518; color: #ff6518"
															title="#ff6518" value="#ff6518"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ffbb3b; color: #ffbb3b"
															title="#ffbb3b" value="#ffbb3b"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #03bd9e; color: #03bd9e"
															title="#03bd9e" value="#03bd9e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #00a9ff; color: #00a9ff"
															title="#00a9ff" value="#00a9ff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #515ce6; color: #515ce6"
															title="#515ce6" value="#515ce6"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #9e5fff; color: #9e5fff"
															title="#9e5fff" value="#9e5fff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff5583; color: #ff5583"
															title="#ff5583" value="#ff5583"></li>

													</ul>
													<div class="tui-colorpicker-clearfix"
														style="overflow: hidden">
														<input type="button"
															class="tui-colorpicker-palette-toggle-slider"
															value="Detail"> <input type="text"
															class="tui-colorpicker-palette-hex" value=""
															maxlength="7"> <span
															class="tui-colorpicker-palette-preview"
															style="background-color:; color:"></span>
													</div>
												</div>
												<div class="tui-colorpicker-slider-container tui-view-6"
													style="display: none;"></div>
											</div>
										</div>
										<div class="triangle"></div>
									</div>
									<div class="color-picker-value transparent"></div>
									<label>Fill</label>
								</div>
								<div class="tie-color-stroke tui-image-editor-button"
									title="Stroke">
									<div class="color-picker-control" style="display: none;">
										<div class="color-picker">
											<div class="tui-colorpicker-container tui-view-7">
												<div class="tui-colorpicker-palette-container tui-view-8">
													<ul class="tui-colorpicker-clearfix">

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #000000; color: #000000"
															title="#000000" value="#000000"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #2a2a2a; color: #2a2a2a"
															title="#2a2a2a" value="#2a2a2a"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #545454; color: #545454"
															title="#545454" value="#545454"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #7e7e7e; color: #7e7e7e"
															title="#7e7e7e" value="#7e7e7e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #a8a8a8; color: #a8a8a8"
															title="#a8a8a8" value="#a8a8a8"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #d2d2d2; color: #d2d2d2"
															title="#d2d2d2" value="#d2d2d2"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ffffff; color: #ffffff"
															title="#ffffff" value="#ffffff"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-color-transparent"
															type="button" title="" value=""></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff4040; color: #ff4040"
															title="#ff4040" value="#ff4040"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff6518; color: #ff6518"
															title="#ff6518" value="#ff6518"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-selected"
															type="button"
															style="background-color: #ffbb3b; color: #ffbb3b"
															title="#ffbb3b" value="#ffbb3b"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #03bd9e; color: #03bd9e"
															title="#03bd9e" value="#03bd9e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #00a9ff; color: #00a9ff"
															title="#00a9ff" value="#00a9ff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #515ce6; color: #515ce6"
															title="#515ce6" value="#515ce6"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #9e5fff; color: #9e5fff"
															title="#9e5fff" value="#9e5fff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff5583; color: #ff5583"
															title="#ff5583" value="#ff5583"></li>

													</ul>
													<div class="tui-colorpicker-clearfix"
														style="overflow: hidden">
														<input type="button"
															class="tui-colorpicker-palette-toggle-slider"
															value="Detail"> <input type="text"
															class="tui-colorpicker-palette-hex" value="#ffbb3b"
															maxlength="7"> <span
															class="tui-colorpicker-palette-preview"
															style="background-color: #ffbb3b; color: #ffbb3b">#ffbb3b</span>
													</div>
												</div>
												<div class="tui-colorpicker-slider-container tui-view-9"
													style="display: none;">
													<div
														class="tui-colorpicker-slider-left tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-slider">
<defs>
<linearGradient id="tui-colorpicker-svg-fill-color-3" x1="0%" y1="0%"
																x2="100%" y2="0%">
<stop offset="0%" stop-color="rgb(255,255,255)"></stop>
<stop class="tui-colorpicker-slider-basecolor" offset="100%"
																stop-color="#ffa600"></stop>
</linearGradient>
<linearGradient id="tui-colorpicker-svn-fill-black-3" x1="0%" y1="0%"
																x2="0%" y2="100%">
<stop offset="0%" style="stop-color:rgb(0,0,0);stop-opacity:0"></stop>
<stop offset="100%" style="stop-color:rgb(0,0,0);stop-opacity:1"></stop>
</linearGradient>
</defs>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svg-fill-color-3)"></rect>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svn-fill-black-3)"></rect>
<path transform="translate(79.24,-7)"
																class="tui-colorpicker-slider-handle"
																d="M0 7.5 L15 7.5 M7.5 15 L7.5 0 M2 7 a5.5 5.5 0 1 1 0 1 Z"
																stroke="black" stroke-width="0.75" fill="none"></path>
</svg>
													</div>
													<div
														class="tui-colorpicker-slider-right tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-huebar">
<defs>
<linearGradient id="g-3" x1="0%" y1="0%" x2="0%" y2="100%">
<stop offset="0%" stop-color="rgb(255,0,0)"></stop>
<stop offset="16.666%" stop-color="rgb(255,255,0)"></stop>
<stop offset="33.333%" stop-color="rgb(0,255,0)"></stop>
<stop offset="50%" stop-color="rgb(0,255,255)"></stop>
<stop offset="66.666%" stop-color="rgb(0,0,255)"></stop>
<stop offset="83.333%" stop-color="rgb(255,0,255)"></stop>
<stop offset="100%" stop-color="rgb(255,0,0)"></stop>
</linearGradient>
</defs>
<rect width="18px" height="100%" fill="url(#g-3)"></rect>
<path transform="translate(-6,9.783688435789882)"
																class="tui-colorpicker-huebar-handle"
																d="M0 0 L4 4 L0 8 L0 0 Z" fill="black" stroke="none"></path>
</svg>
													</div>
												</div>
											</div>
										</div>
										<div class="triangle"></div>
									</div>
									<div class="color-picker-value"
										style="background-color: rgb(255, 187, 59);"></div>
									<label>Stroke</label>
								</div>
							</li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tui-image-editor-newline tui-image-editor-range-wrap">
								<label class="range">Stroke</label>
								<div class="tie-stroke-range tui-image-editor-range">
									<div class="tui-image-editor-virtual-range-bar">
										<div class="tui-image-editor-virtual-range-subbar"
											style="right: 153.483px;"></div>
										<div class="tui-image-editor-virtual-range-pointer"
											style="left: 0.516779px;"></div>
									</div>
								</div> <input
								class="tie-stroke-range-value tui-image-editor-range-value"
								value="0">
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-icon">
						<ul class="tui-image-editor-submenu-item">
							<li class="tie-icon-add-button">
								<div class="tui-image-editor-button" data-icontype="icon-arrow">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-arrow" class="normal use-default"></use>
											<use xlink:href="#ic-icon-arrow" class="active use-default"></use></svg>
									</div>
									<label> Arrow </label>
								</div>
								<div class="tui-image-editor-button"
									data-icontype="icon-arrow-2">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-arrow-2" class="normal use-default"></use>
											<use xlink:href="#ic-icon-arrow-2" class="active use-default"></use></svg>
									</div>
									<label> Arrow-2 </label>
								</div>
								<div class="tui-image-editor-button"
									data-icontype="icon-arrow-3">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-arrow-3" class="normal use-default"></use>
											<use xlink:href="#ic-icon-arrow-3" class="active use-default"></use></svg>
									</div>
									<label> Arrow-3 </label>
								</div>
								<div class="tui-image-editor-button" data-icontype="icon-star">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-star" class="normal use-default"></use>
											<use xlink:href="#ic-icon-star" class="active use-default"></use></svg>
									</div>
									<label> Star-1 </label>
								</div>
								<div class="tui-image-editor-button" data-icontype="icon-star-2">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-star-2" class="normal use-default"></use>
											<use xlink:href="#ic-icon-star-2" class="active use-default"></use></svg>
									</div>
									<label> Star-2 </label>
								</div>

								<div class="tui-image-editor-button"
									data-icontype="icon-polygon">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-polygon" class="normal use-default"></use>
											<use xlink:href="#ic-icon-polygon" class="active use-default"></use></svg>
									</div>
									<label> Polygon </label>
								</div>

								<div class="tui-image-editor-button"
									data-icontype="icon-location">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-location"
												class="normal use-default"></use>
											<use xlink:href="#ic-icon-location"
												class="active use-default"></use></svg>
									</div>
									<label> Location </label>
								</div>

								<div class="tui-image-editor-button" data-icontype="icon-heart">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-heart" class="normal use-default"></use>
											<use xlink:href="#ic-icon-heart" class="active use-default"></use></svg>
									</div>
									<label> Heart </label>
								</div>

								<div class="tui-image-editor-button" data-icontype="icon-bubble">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-bubble" class="normal use-default"></use>
											<use xlink:href="#ic-icon-bubble" class="active use-default"></use></svg>
									</div>
									<label> Bubble </label>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li class="tie-icon-add-button">
								<div class="tui-image-editor-button" style="margin: 0">
									<div>
										<input type="file" accept="image/*"
											class="tie-icon-image-file">
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-icon-load" class="normal use-default"></use>
											<use xlink:href="#ic-icon-load" class="active use-default"></use></svg>
									</div>
									<label> Custom icon </label>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li>
								<div class="tie-icon-color tui-image-editor-button"
									title="Color">
									<div class="color-picker-control" style="display: none;">
										<div class="color-picker">
											<div class="tui-colorpicker-container tui-view-10">
												<div class="tui-colorpicker-palette-container tui-view-11">
													<ul class="tui-colorpicker-clearfix">

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #000000; color: #000000"
															title="#000000" value="#000000"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #2a2a2a; color: #2a2a2a"
															title="#2a2a2a" value="#2a2a2a"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #545454; color: #545454"
															title="#545454" value="#545454"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #7e7e7e; color: #7e7e7e"
															title="#7e7e7e" value="#7e7e7e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #a8a8a8; color: #a8a8a8"
															title="#a8a8a8" value="#a8a8a8"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #d2d2d2; color: #d2d2d2"
															title="#d2d2d2" value="#d2d2d2"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ffffff; color: #ffffff"
															title="#ffffff" value="#ffffff"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-color-transparent"
															type="button" title="" value=""></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff4040; color: #ff4040"
															title="#ff4040" value="#ff4040"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff6518; color: #ff6518"
															title="#ff6518" value="#ff6518"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-selected"
															type="button"
															style="background-color: #ffbb3b; color: #ffbb3b"
															title="#ffbb3b" value="#ffbb3b"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #03bd9e; color: #03bd9e"
															title="#03bd9e" value="#03bd9e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #00a9ff; color: #00a9ff"
															title="#00a9ff" value="#00a9ff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #515ce6; color: #515ce6"
															title="#515ce6" value="#515ce6"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #9e5fff; color: #9e5fff"
															title="#9e5fff" value="#9e5fff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff5583; color: #ff5583"
															title="#ff5583" value="#ff5583"></li>

													</ul>
													<div class="tui-colorpicker-clearfix"
														style="overflow: hidden">
														<input type="button"
															class="tui-colorpicker-palette-toggle-slider"
															value="Detail"> <input type="text"
															class="tui-colorpicker-palette-hex" value="#ffbb3b"
															maxlength="7"> <span
															class="tui-colorpicker-palette-preview"
															style="background-color: #ffbb3b; color: #ffbb3b">#ffbb3b</span>
													</div>
												</div>
												<div class="tui-colorpicker-slider-container tui-view-12"
													style="display: none;">
													<div
														class="tui-colorpicker-slider-left tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-slider">
<defs>
<linearGradient id="tui-colorpicker-svg-fill-color-4" x1="0%" y1="0%"
																x2="100%" y2="0%">
<stop offset="0%" stop-color="rgb(255,255,255)"></stop>
<stop class="tui-colorpicker-slider-basecolor" offset="100%"
																stop-color="#ffa600"></stop>
</linearGradient>
<linearGradient id="tui-colorpicker-svn-fill-black-4" x1="0%" y1="0%"
																x2="0%" y2="100%">
<stop offset="0%" style="stop-color:rgb(0,0,0);stop-opacity:0"></stop>
<stop offset="100%" style="stop-color:rgb(0,0,0);stop-opacity:1"></stop>
</linearGradient>
</defs>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svg-fill-color-4)"></rect>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svn-fill-black-4)"></rect>
<path transform="translate(79.24,-7)"
																class="tui-colorpicker-slider-handle"
																d="M0 7.5 L15 7.5 M7.5 15 L7.5 0 M2 7 a5.5 5.5 0 1 1 0 1 Z"
																stroke="black" stroke-width="0.75" fill="none"></path>
</svg>
													</div>
													<div
														class="tui-colorpicker-slider-right tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-huebar">
<defs>
<linearGradient id="g-4" x1="0%" y1="0%" x2="0%" y2="100%">
<stop offset="0%" stop-color="rgb(255,0,0)"></stop>
<stop offset="16.666%" stop-color="rgb(255,255,0)"></stop>
<stop offset="33.333%" stop-color="rgb(0,255,0)"></stop>
<stop offset="50%" stop-color="rgb(0,255,255)"></stop>
<stop offset="66.666%" stop-color="rgb(0,0,255)"></stop>
<stop offset="83.333%" stop-color="rgb(255,0,255)"></stop>
<stop offset="100%" stop-color="rgb(255,0,0)"></stop>
</linearGradient>
</defs>
<rect width="18px" height="100%" fill="url(#g-4)"></rect>
<path transform="translate(-6,9.783688435789882)"
																class="tui-colorpicker-huebar-handle"
																d="M0 0 L4 4 L0 8 L0 0 Z" fill="black" stroke="none"></path>
</svg>
													</div>
												</div>
											</div>
										</div>
										<div class="triangle"></div>
									</div>
									<div class="color-picker-value"
										style="background-color: rgb(255, 187, 59);"></div>
									<label>Color</label>
								</div>
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-text">
						<ul class="tui-image-editor-submenu-item">
							<li class="tie-text-effect-button">
								<div class="tui-image-editor-button bold">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-text-bold" class="normal use-default"></use>
											<use xlink:href="#ic-text-bold" class="active use-default"></use></svg>
									</div>
									<label> Bold </label>
								</div>
								<div class="tui-image-editor-button italic">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-text-italic" class="normal use-default"></use>
											<use xlink:href="#ic-text-italic" class="active use-default"></use></svg>
									</div>
									<label> Italic </label>
								</div>
								<div class="tui-image-editor-button underline">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-text-underline"
												class="normal use-default"></use>
											<use xlink:href="#ic-text-underline"
												class="active use-default"></use></svg>
									</div>
									<label> Underline </label>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li class="tie-text-align-button">
								<div class="tui-image-editor-button left">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-text-align-left"
												class="normal use-default"></use>
											<use xlink:href="#ic-text-align-left"
												class="active use-default"></use></svg>
									</div>
									<label> Left </label>
								</div>
								<div class="tui-image-editor-button center">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-text-align-center"
												class="normal use-default"></use>
											<use xlink:href="#ic-text-align-center"
												class="active use-default"></use></svg>
									</div>
									<label> Center </label>
								</div>
								<div class="tui-image-editor-button right">
									<div>
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-text-align-right"
												class="normal use-default"></use>
											<use xlink:href="#ic-text-align-right"
												class="active use-default"></use></svg>
									</div>
									<label> Right </label>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li>
								<div class="tie-text-color tui-image-editor-button"
									title="Color">
									<div class="color-picker-control" style="display: none;">
										<div class="color-picker">
											<div class="tui-colorpicker-container tui-view-13">
												<div class="tui-colorpicker-palette-container tui-view-14">
													<ul class="tui-colorpicker-clearfix">

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #000000; color: #000000"
															title="#000000" value="#000000"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #2a2a2a; color: #2a2a2a"
															title="#2a2a2a" value="#2a2a2a"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #545454; color: #545454"
															title="#545454" value="#545454"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #7e7e7e; color: #7e7e7e"
															title="#7e7e7e" value="#7e7e7e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #a8a8a8; color: #a8a8a8"
															title="#a8a8a8" value="#a8a8a8"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #d2d2d2; color: #d2d2d2"
															title="#d2d2d2" value="#d2d2d2"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ffffff; color: #ffffff"
															title="#ffffff" value="#ffffff"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-color-transparent"
															type="button" title="" value=""></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff4040; color: #ff4040"
															title="#ff4040" value="#ff4040"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff6518; color: #ff6518"
															title="#ff6518" value="#ff6518"></li>

														<li><input
															class="tui-colorpicker-palette-button tui-colorpicker-selected"
															type="button"
															style="background-color: #ffbb3b; color: #ffbb3b"
															title="#ffbb3b" value="#ffbb3b"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #03bd9e; color: #03bd9e"
															title="#03bd9e" value="#03bd9e"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #00a9ff; color: #00a9ff"
															title="#00a9ff" value="#00a9ff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #515ce6; color: #515ce6"
															title="#515ce6" value="#515ce6"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #9e5fff; color: #9e5fff"
															title="#9e5fff" value="#9e5fff"></li>

														<li><input class="tui-colorpicker-palette-button"
															type="button"
															style="background-color: #ff5583; color: #ff5583"
															title="#ff5583" value="#ff5583"></li>

													</ul>
													<div class="tui-colorpicker-clearfix"
														style="overflow: hidden">
														<input type="button"
															class="tui-colorpicker-palette-toggle-slider"
															value="Detail"> <input type="text"
															class="tui-colorpicker-palette-hex" value="#ffbb3b"
															maxlength="7"> <span
															class="tui-colorpicker-palette-preview"
															style="background-color: #ffbb3b; color: #ffbb3b">#ffbb3b</span>
													</div>
												</div>
												<div class="tui-colorpicker-slider-container tui-view-15"
													style="display: none;">
													<div
														class="tui-colorpicker-slider-left tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-slider">
<defs>
<linearGradient id="tui-colorpicker-svg-fill-color-5" x1="0%" y1="0%"
																x2="100%" y2="0%">
<stop offset="0%" stop-color="rgb(255,255,255)"></stop>
<stop class="tui-colorpicker-slider-basecolor" offset="100%"
																stop-color="#ffa600"></stop>
</linearGradient>
<linearGradient id="tui-colorpicker-svn-fill-black-5" x1="0%" y1="0%"
																x2="0%" y2="100%">
<stop offset="0%" style="stop-color:rgb(0,0,0);stop-opacity:0"></stop>
<stop offset="100%" style="stop-color:rgb(0,0,0);stop-opacity:1"></stop>
</linearGradient>
</defs>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svg-fill-color-5)"></rect>
<rect width="100%" height="100%"
																fill="url(#tui-colorpicker-svn-fill-black-5)"></rect>
<path transform="translate(79.24,-7)"
																class="tui-colorpicker-slider-handle"
																d="M0 7.5 L15 7.5 M7.5 15 L7.5 0 M2 7 a5.5 5.5 0 1 1 0 1 Z"
																stroke="black" stroke-width="0.75" fill="none"></path>
</svg>
													</div>
													<div
														class="tui-colorpicker-slider-right tui-colorpicker-slider-part">
														<svg
															class="tui-colorpicker-svg tui-colorpicker-svg-huebar">
<defs>
<linearGradient id="g-5" x1="0%" y1="0%" x2="0%" y2="100%">
<stop offset="0%" stop-color="rgb(255,0,0)"></stop>
<stop offset="16.666%" stop-color="rgb(255,255,0)"></stop>
<stop offset="33.333%" stop-color="rgb(0,255,0)"></stop>
<stop offset="50%" stop-color="rgb(0,255,255)"></stop>
<stop offset="66.666%" stop-color="rgb(0,0,255)"></stop>
<stop offset="83.333%" stop-color="rgb(255,0,255)"></stop>
<stop offset="100%" stop-color="rgb(255,0,0)"></stop>
</linearGradient>
</defs>
<rect width="18px" height="100%" fill="url(#g-5)"></rect>
<path transform="translate(-6,9.783688435789882)"
																class="tui-colorpicker-huebar-handle"
																d="M0 0 L4 4 L0 8 L0 0 Z" fill="black" stroke="none"></path>
</svg>
													</div>
												</div>
											</div>
										</div>
										<div class="triangle"></div>
									</div>
									<div class="color-picker-value"
										style="background-color: rgb(255, 187, 59);"></div>
									<label>Color</label>
								</div>
							</li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tui-image-editor-newline tui-image-editor-range-wrap">
								<label class="range">Text size</label>
								<div class="tie-text-range tui-image-editor-range">
									<div class="tui-image-editor-virtual-range-bar">
										<div class="tui-image-editor-virtual-range-subbar"
											style="right: 85.5556px;"></div>
										<div class="tui-image-editor-virtual-range-pointer"
											style="left: 68.4444px;"></div>
									</div>
								</div> <input
								class="tie-text-range-value tui-image-editor-range-value"
								value="0">
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-mask">
						<ul class="tui-image-editor-submenu-item">
							<li>
								<div class="tui-image-editor-button">
									<div>
										<input type="file" accept="image/*"
											class="tie-mask-image-file">
										<svg class="svg_ic-submenu">
											<use xlink:href="#ic-mask-load" class="normal use-default"></use>
											<use xlink:href="#ic-mask-load" class="active use-default"></use></svg>
									</div>
									<label> Load Mask Image </label>
								</div>
							</li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tie-mask-apply tui-image-editor-newline apply"
								style="margin-top: 22px; margin-bottom: 5px">
								<div class="tui-image-editor-button apply">
									<svg class="svg_ic-menu">
										<use xlink:href="#ic-apply" class="normal use-default"></use>
										<use xlink:href="#ic-apply" class="active use-default"></use></svg>
									<label> Apply </label>
								</div>
							</li>
						</ul>
					</div>
					<div class="tui-image-editor-menu-filter">
						<ul class="tui-image-editor-submenu-item">
							<li class="tui-image-editor-submenu-align">
								<div class="tui-image-editor-checkbox-wrap fixed-width">
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-grayscale">
											<span>Grayscale</span>
										</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-invert">
											<span>Invert</span>
										</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-sepia">
											<span>Sepia</span>
										</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-vintage">
											<span>Sepia2</span>
										</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-blur">
											<span>Blur</span>
										</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-sharpen">
											<span>Sharpen</span>
										</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-emboss">
											<span>Emboss</span>
										</label>
									</div>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li class="tui-image-editor-submenu-align">
								<div
									class="tui-image-editor-checkbox-group tui-image-editor-disabled"
									style="margin-bottom: 7px;">
									<div class="tui-image-editor-checkbox-wrap">
										<div class="tui-image-editor-checkbox">
											<label> <input type="checkbox"
												class="tie-remove-white"> <span>Remove White</span>
											</label>
										</div>
									</div>
									<div
										class="tui-image-editor-newline tui-image-editor-range-wrap short">
										<label>Distance</label>
										<div
											class="tie-removewhite-distance-range tui-image-editor-range">
											<div class="tui-image-editor-virtual-range-bar">
												<div class="tui-image-editor-virtual-range-subbar"
													style="right: 70.4px;"></div>
												<div class="tui-image-editor-virtual-range-pointer"
													style="left: 17.6px;"></div>
											</div>
										</div>
									</div>
								</div>
								<div
									class="tui-image-editor-checkbox-group tui-image-editor-disabled">
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-brightness">
											<span>Brightness</span>
										</label>
									</div>
									<div class="tui-image-editor-range-wrap short">
										<div class="tie-brightness-range tui-image-editor-range">
											<div class="tui-image-editor-virtual-range-bar">
												<div class="tui-image-editor-virtual-range-subbar"
													style="right: 44px;"></div>
												<div class="tui-image-editor-virtual-range-pointer"
													style="left: 44px;"></div>
											</div>
										</div>
									</div>
								</div>
								<div
									class="tui-image-editor-checkbox-group tui-image-editor-disabled">
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-noise">
											<span>Noise</span>
										</label>
									</div>
									<div class="tui-image-editor-range-wrap short">
										<div class="tie-noise-range tui-image-editor-range">
											<div class="tui-image-editor-virtual-range-bar">
												<div class="tui-image-editor-virtual-range-subbar"
													style="right: 79.2px;"></div>
												<div class="tui-image-editor-virtual-range-pointer"
													style="left: 8.8px;"></div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="tui-image-editor-partition only-left-right">
								<div></div>
							</li>
							<li class="tui-image-editor-submenu-align">
								<div
									class="tui-image-editor-checkbox-group tui-image-editor-disabled">
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-pixelate">
											<span>Pixelate</span>
										</label>
									</div>
									<div class="tui-image-editor-range-wrap short">
										<div class="tie-pixelate-range tui-image-editor-range">
											<div class="tui-image-editor-virtual-range-bar">
												<div class="tui-image-editor-virtual-range-subbar"
													style="right: 78.2222px;"></div>
												<div class="tui-image-editor-virtual-range-pointer"
													style="left: 9.77778px;"></div>
											</div>
										</div>
									</div>
								</div>
								<div
									class="tui-image-editor-checkbox-group tui-image-editor-disabled">
									<div
										class="tui-image-editor-newline tui-image-editor-checkbox-wrap">
										<div class="tui-image-editor-checkbox">
											<label> <input type="checkbox"
												class="tie-color-filter"> <span>Color Filter</span>
											</label>
										</div>
									</div>
									<div
										class="tui-image-editor-newline tui-image-editor-range-wrap short">
										<label>Threshold</label>
										<div
											class="tie-colorfilter-threshold-range tui-image-editor-range">
											<div class="tui-image-editor-virtual-range-bar">
												<div class="tui-image-editor-virtual-range-subbar"
													style="right: 70.4px;"></div>
												<div class="tui-image-editor-virtual-range-pointer"
													style="left: 17.6px;"></div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="tui-image-editor-partition">
								<div></div>
							</li>
							<li>
								<div class="filter-color-item">
									<div class="tie-filter-tint-color tui-image-editor-button"
										title="Tint">
										<div class="color-picker-control"
											style="height: 130px; display: none;">
											<div class="color-picker">
												<div class="tui-colorpicker-container tui-view-16">
													<div class="tui-colorpicker-palette-container tui-view-17">
														<ul class="tui-colorpicker-clearfix">

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #000000; color: #000000"
																title="#000000" value="#000000"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #2a2a2a; color: #2a2a2a"
																title="#2a2a2a" value="#2a2a2a"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #545454; color: #545454"
																title="#545454" value="#545454"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #7e7e7e; color: #7e7e7e"
																title="#7e7e7e" value="#7e7e7e"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #a8a8a8; color: #a8a8a8"
																title="#a8a8a8" value="#a8a8a8"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #d2d2d2; color: #d2d2d2"
																title="#d2d2d2" value="#d2d2d2"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ffffff; color: #ffffff"
																title="#ffffff" value="#ffffff"></li>

															<li><input
																class="tui-colorpicker-palette-button tui-colorpicker-color-transparent"
																type="button" title="" value=""></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff4040; color: #ff4040"
																title="#ff4040" value="#ff4040"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff6518; color: #ff6518"
																title="#ff6518" value="#ff6518"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ffbb3b; color: #ffbb3b"
																title="#ffbb3b" value="#ffbb3b"></li>

															<li><input
																class="tui-colorpicker-palette-button tui-colorpicker-selected"
																type="button"
																style="background-color: #03bd9e; color: #03bd9e"
																title="#03bd9e" value="#03bd9e"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #00a9ff; color: #00a9ff"
																title="#00a9ff" value="#00a9ff"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #515ce6; color: #515ce6"
																title="#515ce6" value="#515ce6"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #9e5fff; color: #9e5fff"
																title="#9e5fff" value="#9e5fff"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff5583; color: #ff5583"
																title="#ff5583" value="#ff5583"></li>

														</ul>
														<div class="tui-colorpicker-clearfix"
															style="overflow: hidden">
															<input type="button"
																class="tui-colorpicker-palette-toggle-slider"
																value="Detail"> <input type="text"
																class="tui-colorpicker-palette-hex" value="#03bd9e"
																maxlength="7"> <span
																class="tui-colorpicker-palette-preview"
																style="background-color: #03bd9e; color: #03bd9e">#03bd9e</span>
														</div>
													</div>
													<div class="tui-colorpicker-slider-container tui-view-18"
														style="display: none;">
														<div
															class="tui-colorpicker-slider-left tui-colorpicker-slider-part">
															<svg
																class="tui-colorpicker-svg tui-colorpicker-svg-slider">
<defs>
<linearGradient id="tui-colorpicker-svg-fill-color-6" x1="0%" y1="0%"
																	x2="100%" y2="0%">
<stop offset="0%" stop-color="rgb(255,255,255)"></stop>
<stop class="tui-colorpicker-slider-basecolor" offset="100%"
																	stop-color="#00ffd5"></stop>
</linearGradient>
<linearGradient id="tui-colorpicker-svn-fill-black-6" x1="0%" y1="0%"
																	x2="0%" y2="100%">
<stop offset="0%" style="stop-color:rgb(0,0,0);stop-opacity:0"></stop>
<stop offset="100%" style="stop-color:rgb(0,0,0);stop-opacity:1"></stop>
</linearGradient>
</defs>
<rect width="100%" height="100%"
																	fill="url(#tui-colorpicker-svg-fill-color-6)"></rect>
<rect width="100%" height="100%"
																	fill="url(#tui-colorpicker-svn-fill-black-6)"></rect>
<path transform="translate(102.76,22.120000000000005)"
																	class="tui-colorpicker-slider-handle"
																	d="M0 7.5 L15 7.5 M7.5 15 L7.5 0 M2 7 a5.5 5.5 0 1 1 0 1 Z"
																	stroke="black" stroke-width="0.75" fill="none"></path>
</svg>
														</div>
														<div
															class="tui-colorpicker-slider-right tui-colorpicker-slider-part">
															<svg
																class="tui-colorpicker-svg tui-colorpicker-svg-huebar">
<defs>
<linearGradient id="g-6" x1="0%" y1="0%" x2="0%" y2="100%">
<stop offset="0%" stop-color="rgb(255,0,0)"></stop>
<stop offset="16.666%" stop-color="rgb(255,255,0)"></stop>
<stop offset="33.333%" stop-color="rgb(0,255,0)"></stop>
<stop offset="50%" stop-color="rgb(0,255,255)"></stop>
<stop offset="66.666%" stop-color="rgb(0,0,255)"></stop>
<stop offset="83.333%" stop-color="rgb(255,0,255)"></stop>
<stop offset="100%" stop-color="rgb(255,0,0)"></stop>
</linearGradient>
</defs>
<rect width="18px" height="100%" fill="url(#g-6)"></rect>
<path transform="translate(-6,52.723770104725126)"
																	class="tui-colorpicker-huebar-handle"
																	d="M0 0 L4 4 L0 8 L0 0 Z" fill="black" stroke="none"></path>
</svg>
														</div>
													</div>
												</div>
											</div>
											<div class="triangle"></div>
											<div>
												<label>Opacity</label>
												<div id="tie-filter-tint-opacity"
													class="tui-image-editor-range">
													<div class="tui-image-editor-virtual-range-bar">
														<div class="tui-image-editor-virtual-range-subbar"
															style="right: 28.8px;"></div>
														<div class="tui-image-editor-virtual-range-pointer"
															style="left: 67.2px;"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="color-picker-value"
											style="background-color: rgb(3, 189, 158);"></div>
										<label>Tint</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-tint">
											<span></span>
										</label>
									</div>
								</div>
								<div class="filter-color-item">
									<div class="tie-filter-multiply-color tui-image-editor-button"
										title="Multiply">
										<div class="color-picker-control" style="display: none;">
											<div class="color-picker">
												<div class="tui-colorpicker-container tui-view-19">
													<div class="tui-colorpicker-palette-container tui-view-20">
														<ul class="tui-colorpicker-clearfix">

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #000000; color: #000000"
																title="#000000" value="#000000"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #2a2a2a; color: #2a2a2a"
																title="#2a2a2a" value="#2a2a2a"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #545454; color: #545454"
																title="#545454" value="#545454"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #7e7e7e; color: #7e7e7e"
																title="#7e7e7e" value="#7e7e7e"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #a8a8a8; color: #a8a8a8"
																title="#a8a8a8" value="#a8a8a8"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #d2d2d2; color: #d2d2d2"
																title="#d2d2d2" value="#d2d2d2"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ffffff; color: #ffffff"
																title="#ffffff" value="#ffffff"></li>

															<li><input
																class="tui-colorpicker-palette-button tui-colorpicker-color-transparent"
																type="button" title="" value=""></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff4040; color: #ff4040"
																title="#ff4040" value="#ff4040"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff6518; color: #ff6518"
																title="#ff6518" value="#ff6518"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ffbb3b; color: #ffbb3b"
																title="#ffbb3b" value="#ffbb3b"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #03bd9e; color: #03bd9e"
																title="#03bd9e" value="#03bd9e"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #00a9ff; color: #00a9ff"
																title="#00a9ff" value="#00a9ff"></li>

															<li><input
																class="tui-colorpicker-palette-button tui-colorpicker-selected"
																type="button"
																style="background-color: #515ce6; color: #515ce6"
																title="#515ce6" value="#515ce6"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #9e5fff; color: #9e5fff"
																title="#9e5fff" value="#9e5fff"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff5583; color: #ff5583"
																title="#ff5583" value="#ff5583"></li>

														</ul>
														<div class="tui-colorpicker-clearfix"
															style="overflow: hidden">
															<input type="button"
																class="tui-colorpicker-palette-toggle-slider"
																value="Detail"> <input type="text"
																class="tui-colorpicker-palette-hex" value="#515ce6"
																maxlength="7"> <span
																class="tui-colorpicker-palette-preview"
																style="background-color: #515ce6; color: #515ce6">#515ce6</span>
														</div>
													</div>
													<div class="tui-colorpicker-slider-container tui-view-21"
														style="display: none;">
														<div
															class="tui-colorpicker-slider-left tui-colorpicker-slider-part">
															<svg
																class="tui-colorpicker-svg tui-colorpicker-svg-slider">
<defs>
<linearGradient id="tui-colorpicker-svg-fill-color-7" x1="0%" y1="0%"
																	x2="100%" y2="0%">
<stop offset="0%" stop-color="rgb(255,255,255)"></stop>
<stop class="tui-colorpicker-slider-basecolor" offset="100%"
																	stop-color="#0011ff"></stop>
</linearGradient>
<linearGradient id="tui-colorpicker-svn-fill-black-7" x1="0%" y1="0%"
																	x2="0%" y2="100%">
<stop offset="0%" style="stop-color:rgb(0,0,0);stop-opacity:0"></stop>
<stop offset="100%" style="stop-color:rgb(0,0,0);stop-opacity:1"></stop>
</linearGradient>
</defs>
<rect width="100%" height="100%"
																	fill="url(#tui-colorpicker-svg-fill-color-7)"></rect>
<rect width="100%" height="100%"
																	fill="url(#tui-colorpicker-svn-fill-black-7)"></rect>
<path transform="translate(65.8,4.200000000000003)"
																	class="tui-colorpicker-slider-handle"
																	d="M0 7.5 L15 7.5 M7.5 15 L7.5 0 M2 7 a5.5 5.5 0 1 1 0 1 Z"
																	stroke="black" stroke-width="0.75" fill="none"></path>
</svg>
														</div>
														<div
															class="tui-colorpicker-slider-right tui-colorpicker-slider-part">
															<svg
																class="tui-colorpicker-svg tui-colorpicker-svg-huebar">
<defs>
<linearGradient id="g-7" x1="0%" y1="0%" x2="0%" y2="100%">
<stop offset="0%" stop-color="rgb(255,0,0)"></stop>
<stop offset="16.666%" stop-color="rgb(255,255,0)"></stop>
<stop offset="33.333%" stop-color="rgb(0,255,0)"></stop>
<stop offset="50%" stop-color="rgb(0,255,255)"></stop>
<stop offset="66.666%" stop-color="rgb(0,0,255)"></stop>
<stop offset="83.333%" stop-color="rgb(255,0,255)"></stop>
<stop offset="100%" stop-color="rgb(255,0,0)"></stop>
</linearGradient>
</defs>
<rect width="18px" height="100%" fill="url(#g-7)"></rect>
<path transform="translate(-6,74.35770438067723)"
																	class="tui-colorpicker-huebar-handle"
																	d="M0 0 L4 4 L0 8 L0 0 Z" fill="black" stroke="none"></path>
</svg>
														</div>
													</div>
												</div>
											</div>
											<div class="triangle"></div>
										</div>
										<div class="color-picker-value"
											style="background-color: rgb(81, 92, 230);"></div>
										<label>Multiply</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-multiply">
											<span></span>
										</label>
									</div>
								</div>
								<div class="filter-color-item">
									<div class="tie-filter-blend-color tui-image-editor-button"
										title="Blend">
										<div class="color-picker-control"
											style="height: 130px; display: none;">
											<div class="color-picker">
												<div class="tui-colorpicker-container tui-view-22">
													<div class="tui-colorpicker-palette-container tui-view-23">
														<ul class="tui-colorpicker-clearfix">

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #000000; color: #000000"
																title="#000000" value="#000000"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #2a2a2a; color: #2a2a2a"
																title="#2a2a2a" value="#2a2a2a"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #545454; color: #545454"
																title="#545454" value="#545454"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #7e7e7e; color: #7e7e7e"
																title="#7e7e7e" value="#7e7e7e"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #a8a8a8; color: #a8a8a8"
																title="#a8a8a8" value="#a8a8a8"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #d2d2d2; color: #d2d2d2"
																title="#d2d2d2" value="#d2d2d2"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ffffff; color: #ffffff"
																title="#ffffff" value="#ffffff"></li>

															<li><input
																class="tui-colorpicker-palette-button tui-colorpicker-color-transparent"
																type="button" title="" value=""></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff4040; color: #ff4040"
																title="#ff4040" value="#ff4040"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff6518; color: #ff6518"
																title="#ff6518" value="#ff6518"></li>

															<li><input
																class="tui-colorpicker-palette-button tui-colorpicker-selected"
																type="button"
																style="background-color: #ffbb3b; color: #ffbb3b"
																title="#ffbb3b" value="#ffbb3b"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #03bd9e; color: #03bd9e"
																title="#03bd9e" value="#03bd9e"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #00a9ff; color: #00a9ff"
																title="#00a9ff" value="#00a9ff"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #515ce6; color: #515ce6"
																title="#515ce6" value="#515ce6"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #9e5fff; color: #9e5fff"
																title="#9e5fff" value="#9e5fff"></li>

															<li><input class="tui-colorpicker-palette-button"
																type="button"
																style="background-color: #ff5583; color: #ff5583"
																title="#ff5583" value="#ff5583"></li>

														</ul>
														<div class="tui-colorpicker-clearfix"
															style="overflow: hidden">
															<input type="button"
																class="tui-colorpicker-palette-toggle-slider"
																value="Detail"> <input type="text"
																class="tui-colorpicker-palette-hex" value="#ffbb3b"
																maxlength="7"> <span
																class="tui-colorpicker-palette-preview"
																style="background-color: #ffbb3b; color: #ffbb3b">#ffbb3b</span>
														</div>
													</div>
													<div class="tui-colorpicker-slider-container tui-view-24"
														style="display: none;">
														<div
															class="tui-colorpicker-slider-left tui-colorpicker-slider-part">
															<svg
																class="tui-colorpicker-svg tui-colorpicker-svg-slider">
<defs>
<linearGradient id="tui-colorpicker-svg-fill-color-8" x1="0%" y1="0%"
																	x2="100%" y2="0%">
<stop offset="0%" stop-color="rgb(255,255,255)"></stop>
<stop class="tui-colorpicker-slider-basecolor" offset="100%"
																	stop-color="#ffa600"></stop>
</linearGradient>
<linearGradient id="tui-colorpicker-svn-fill-black-8" x1="0%" y1="0%"
																	x2="0%" y2="100%">
<stop offset="0%" style="stop-color:rgb(0,0,0);stop-opacity:0"></stop>
<stop offset="100%" style="stop-color:rgb(0,0,0);stop-opacity:1"></stop>
</linearGradient>
</defs>
<rect width="100%" height="100%"
																	fill="url(#tui-colorpicker-svg-fill-color-8)"></rect>
<rect width="100%" height="100%"
																	fill="url(#tui-colorpicker-svn-fill-black-8)"></rect>
<path transform="translate(79.24,-7)"
																	class="tui-colorpicker-slider-handle"
																	d="M0 7.5 L15 7.5 M7.5 15 L7.5 0 M2 7 a5.5 5.5 0 1 1 0 1 Z"
																	stroke="black" stroke-width="0.75" fill="none"></path>
</svg>
														</div>
														<div
															class="tui-colorpicker-slider-right tui-colorpicker-slider-part">
															<svg
																class="tui-colorpicker-svg tui-colorpicker-svg-huebar">
<defs>
<linearGradient id="g-8" x1="0%" y1="0%" x2="0%" y2="100%">
<stop offset="0%" stop-color="rgb(255,0,0)"></stop>
<stop offset="16.666%" stop-color="rgb(255,255,0)"></stop>
<stop offset="33.333%" stop-color="rgb(0,255,0)"></stop>
<stop offset="50%" stop-color="rgb(0,255,255)"></stop>
<stop offset="66.666%" stop-color="rgb(0,0,255)"></stop>
<stop offset="83.333%" stop-color="rgb(255,0,255)"></stop>
<stop offset="100%" stop-color="rgb(255,0,0)"></stop>
</linearGradient>
</defs>
<rect width="18px" height="100%" fill="url(#g-8)"></rect>
<path transform="translate(-6,9.783688435789882)"
																	class="tui-colorpicker-huebar-handle"
																	d="M0 0 L4 4 L0 8 L0 0 Z" fill="black" stroke="none"></path>
</svg>
														</div>
													</div>
												</div>
											</div>
											<div class="triangle"></div>
											<div class="tui-image-editor-selectlist-wrap">
												<select><option value="add">Add</option>
													<option value="diff">Diff</option>
													<option value="subtract">Subtract</option>
													<option value="multiply">Multiply</option>
													<option value="screen">Screen</option>
													<option value="lighten">Lighten</option>
													<option value="darken">Darken</option></select>
												<ul class="tui-image-editor-selectlist">
													<li data-item="add">Add</li>
													<li data-item="diff">Diff</li>
													<li data-item="subtract">Subtract</li>
													<li data-item="multiply">Multiply</li>
													<li data-item="screen">Screen</li>
													<li data-item="lighten">Lighten</li>
													<li data-item="darken">Darken</li>
												</ul>
											</div>
										</div>
										<div class="color-picker-value"
											style="background-color: rgb(255, 187, 59);"></div>
										<label>Blend</label>
									</div>
									<div class="tui-image-editor-checkbox">
										<label> <input type="checkbox" class="tie-blend">
											<span></span>
										</label>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="tui-image-editor-wrap"
					style="bottom: 0px; top: 0px; left: 0px; width: 100%;">
					<div class="tui-image-editor-size-wrap">
						<div class="tui-image-editor-align-wrap">
							<div class="tui-image-editor"
								style="height: 499px; width: 700px; top: -75px; left: 0px;">
								<div class="tui-image-editor-canvas-container"
									style="width: 100%; height: 100%; position: relative; user-select: none; max-width: 700px; max-height: 499px;">
									<canvas class="lower-canvas" width="1125" height="803"
										style="position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; touch-action: none; user-select: none; max-width: 700px; max-height: 499px;"></canvas>
									<canvas class="upper-canvas " width="1125" height="803"
										style="position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; touch-action: none; user-select: none; max-width: 700px; max-height: 499px;"></canvas>
									<div class="tui-image-editor-grid-visual">
										<table>
											<tbody>
												<tr>
													<td class="dot left-top"></td>
													<td></td>
													<td class="dot right-top"></td>
												</tr>
												<tr>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td class="dot left-bottom"></td>
													<td></td>
													<td class="dot right-bottom"></td>
												</tr>
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
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.4.0/fabric.js"></script>
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.min.js"></script>
	<script type="text/javascript"
		src="https://uicdn.toast.com/tui-color-picker/v2.2.6/tui-color-picker.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
	<script type="text/javascript"
		src="${path}/resources/js/tui-image-editor.js"></script>
	<script type="text/javascript"
		src="${path}/resources/js/black-theme.js"></script>
	<script>
		// Image editor
		var imageEditor = new tui.ImageEditor('#tui-image-editor-container', {
			includeUI : {
				loadImage : {
					path : 'img/sampleImage2.png',
					name : 'SampleImage',
				},
				theme : blackTheme, // or whiteTheme
				initMenu : 'filter',
				menuBarPosition : 'bottom',
			},
			cssMaxWidth : 700,
			cssMaxHeight : 500,
			usageStatistics : false,
		});
		window.onresize = function() {
			imageEditor.ui.resizeEditor();
		};
	</script>
	<svg xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink" display="none">
<defs id="tui-image-editor-svg-default-icons">
<symbol id="ic-apply" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" stroke="none" fill="none"></path>
    <path fill="none" stroke="inherit" d="M4 12.011l5 5L20.011 6"></path>
</symbol>
<symbol id="ic-cancel" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" fill="none" stroke="none"></path>
    <path fill="none" stroke="inherit" d="M6 6l12 12M18 6L6 18"></path>
</symbol>
<symbol id="ic-crop" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" stroke="none" fill="none"></path>
    <path stroke="none" fill="inherit"
			d="M4 0h1v20a1 1 0 0 1-1-1V0zM20 17h-1V5h1v12zm0 2v5h-1v-5h1z"></path>
    <path stroke="none" fill="inherit"
			d="M5 19h19v1H5zM4.762 4v1H0V4h4.762zM7 4h12a1 1 0 0 1 1 1H7V4z"></path>
</symbol>
<!-- This icon made by Pixel perfect from www.flaticon.com -->
<symbol id="ic-resize" viewBox="0 0 24 24">
  <path d="M0 0h24v24H0z" stroke="none" fill="none"></path>
  <path stroke="none" fill="inherit"
			d="M 18.988281 3.011719 C 18.800781 2.824219 18.5 2.824219 18.3125 3.011719 L 11.621094 9.707031 C 11.429688 9.894531 11.429688 10.195312 11.621094 10.378906 C 11.710938 10.472656 11.835938 10.519531 11.957031 10.519531 C 12.078125 10.519531 12.203125 10.472656 12.292969 10.378906 L 18.988281 3.6875 C 19.175781 3.5 19.175781 3.199219 18.988281 3.011719 Z M 18.988281 3.011719 "></path>
  <path stroke="none" fill="inherit"
			d="M 18.652344 2.867188 C 18.386719 2.867188 18.171875 3.082031 18.171875 3.347656 L 18.171875 9.085938 C 18.171875 9.347656 18.386719 9.5625 18.652344 9.5625 C 18.917969 9.5625 19.132812 9.347656 19.132812 9.085938 L 19.132812 3.347656 C 19.132812 3.082031 18.917969 2.867188 18.652344 2.867188 Z M 18.652344 2.867188 "></path>
  <path stroke="none" fill="inherit"
			d="M 18.652344 2.867188 L 12.914062 2.867188 C 12.652344 2.867188 12.4375 3.082031 12.4375 3.347656 C 12.4375 3.613281 12.652344 3.828125 12.914062 3.828125 L 18.652344 3.828125 C 18.917969 3.828125 19.132812 3.613281 19.132812 3.347656 C 19.132812 3.082031 18.917969 2.867188 18.652344 2.867188 Z M 18.652344 2.867188 "></path>
  <path stroke="none" fill="inherit"
			d="M 10.378906 11.621094 C 10.195312 11.433594 9.890625 11.433594 9.703125 11.621094 L 3.007812 18.316406 C 2.820312 18.5 2.820312 18.804688 3.007812 18.992188 C 3.105469 19.085938 3.226562 19.132812 3.347656 19.132812 C 3.46875 19.132812 3.589844 19.085938 3.683594 18.992188 L 10.378906 12.296875 C 10.566406 12.109375 10.566406 11.804688 10.378906 11.621094 Z M 10.378906 11.621094 "></path>
  <path stroke="none" fill="inherit"
			d="M 3.347656 12.4375 C 3.082031 12.4375 2.867188 12.652344 2.867188 12.914062 L 2.867188 18.652344 C 2.867188 18.917969 3.082031 19.132812 3.347656 19.132812 C 3.613281 19.132812 3.828125 18.917969 3.828125 18.652344 L 3.828125 12.914062 C 3.828125 12.652344 3.613281 12.4375 3.347656 12.4375 Z M 3.347656 12.4375 "></path>
  <path stroke="none" fill="inherit"
			d="M 9.085938 18.171875 L 3.347656 18.171875 C 3.082031 18.171875 2.867188 18.386719 2.867188 18.652344 C 2.867188 18.917969 3.082031 19.132812 3.347656 19.132812 L 9.085938 19.132812 C 9.347656 19.132812 9.5625 18.917969 9.5625 18.652344 C 9.5625 18.386719 9.347656 18.171875 9.085938 18.171875 Z M 9.085938 18.171875 "></path>
  <path stroke="none" fill="inherit"
			d="M 20.5625 0 L 1.4375 0 C 0.644531 0 0 0.644531 0 1.4375 L 0 20.5625 C 0 21.355469 0.644531 22 1.4375 22 L 20.5625 22 C 21.355469 22 22 21.355469 22 20.5625 L 22 1.4375 C 22 0.644531 21.355469 0 20.5625 0 Z M 21.042969 20.5625 C 21.042969 20.828125 20.828125 21.042969 20.5625 21.042969 L 1.4375 21.042969 C 1.171875 21.042969 0.957031 20.828125 0.957031 20.5625 L 0.957031 1.4375 C 0.957031 1.171875 1.171875 0.957031 1.4375 0.957031 L 20.5625 0.957031 C 20.828125 0.957031 21.042969 1.171875 21.042969 1.4375 Z M 21.042969 20.5625 "></path>
</symbol>
<!--  -->
<symbol id="ic-delete-all" viewBox="0 0 24 24">
    <path stroke="none" fill="inherit"
			d="M5 23H3a1 1 0 0 1-1-1V6h1v16h2v1zm16-10h-1V6h1v7zM9 13H8v-3h1v3zm3 0h-1v-3h1v3zm3 0h-1v-3h1v3zM14.794 3.794L13 2h-3L8.206 3.794A.963.963 0 0 1 8 2.5l.703-1.055A1 1 0 0 1 9.535 1h3.93a1 1 0 0 1 .832.445L15 2.5a.965.965 0 0 1-.206 1.294zM14.197 4H8.803h5.394z"></path>
    <path stroke="none" fill="inherit"
			d="M0 3h23v1H0zM11.286 21H8.714L8 23H7l1-2.8V20h.071L9.5 16h1l1.429 4H12v.2l1 2.8h-1l-.714-2zm-.357-1L10 17.4 9.071 20h1.858zM20 22h3v1h-4v-7h1v6zm-5 0h3v1h-4v-7h1v6z"></path>
</symbol>
<symbol id="ic-delete" viewBox="0 0 24 24">
    <path stroke="none" fill="inherit"
			d="M3 6v16h17V6h1v16a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6h1zM14.794 3.794L13 2h-3L8.206 3.794A.963.963 0 0 1 8 2.5l.703-1.055A1 1 0 0 1 9.535 1h3.93a1 1 0 0 1 .832.445L15 2.5a.965.965 0 0 1-.206 1.294zM14.197 4H8.803h5.394z"></path>
    <path stroke="none" fill="inherit"
			d="M0 3h23v1H0zM8 10h1v6H8v-6zm3 0h1v6h-1v-6zm3 0h1v6h-1v-6z"></path>
</symbol>
<symbol id="ic-draw-free" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit"
			d="M2.5 20.929C2.594 10.976 4.323 6 7.686 6c5.872 0 2.524 19 7.697 19s1.89-14.929 6.414-14.929 1.357 10.858 5.13 10.858c1.802 0 2.657-2.262 2.566-6.786"></path>
</symbol>
<symbol id="ic-draw-line" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit" d="M2 15.5h28"></path>
</symbol>
<symbol id="ic-draw" viewBox="0 0 24 24">
    <path fill="none" stroke="inherit"
			d="M2.5 21.5H5c.245 0 .48-.058.691-.168l.124-.065.14.01c.429.028.85-.127 1.16-.437L22.55 5.405a.5.5 0 0 0 0-.707l-3.246-3.245a.5.5 0 0 0-.707 0L3.162 16.888a1.495 1.495 0 0 0-.437 1.155l.01.14-.065.123c-.111.212-.17.448-.17.694v2.5z"></path>
    <path stroke="none" fill="inherit"
			d="M16.414 3.707l3.89 3.89-.708.706-3.889-3.889z"></path>
</symbol>
<symbol id="ic-filter" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" fill="none" stroke="none"></path>
    <path stroke="none" fill="inherit"
			d="M12 7v1H2V7h10zm6 0h4v1h-4V7zM12 16v1h10v-1H12zm-6 0H2v1h4v-1z"></path>
    <path stroke="none" fill="inherit"
			d="M8.5 20a3.5 3.5 0 1 1 0-7 3.5 3.5 0 0 1 0 7zm0-1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zM15.5 11a3.5 3.5 0 1 1 0-7 3.5 3.5 0 0 1 0 7zm0-1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"></path>
</symbol>
<symbol id="ic-flip-reset" viewBox="0 0 31 32">
    <path fill="none" stroke="none" d="M31 0H0v32h31z"></path>
    <path stroke="none" fill="inherit"
			d="M28 16a8 8 0 0 1-8 8H3v-1h1v-7H3a8 8 0 0 1 8-8h17v1h-1v7h1zM11 9a7 7 0 0 0-7 7v7h16a7 7 0 0 0 7-7V9H11z"></path>
    <path fill="none" stroke="inherit" stroke-linecap="square"
			d="M24 5l3.5 3.5L24 12M7 20l-3.5 3.5L7 27"></path>
</symbol>
<symbol id="ic-flip-x" viewBox="0 0 32 32">
    <path fill="none" stroke="none" d="M32 32H0V0h32z"></path>
    <path stroke="none" fill="inherit"
			d="M17 32h-1V0h1zM27.167 11l.5 3h-1.03l-.546-3h1.076zm-.5-3h-1.122L25 5h-5V4h5.153a1 1 0 0 1 .986.836L26.667 8zm1.5 9l.5 3h-.94l-.545-3h.985zm1 6l.639 3.836A1 1 0 0 1 28.819 28H26v-1h3l-.726-4h.894zM23 28h-3v-1h3v1zM13 4v1H7L3 27h10v1H3.18a1 1 0 0 1-.986-1.164l3.666-22A1 1 0 0 1 6.847 4H13z"></path>
</symbol>
<symbol id="ic-flip-y" viewBox="0 0 32 32">
    <path fill="none" stroke="none" d="M0 0v32h32V0z"></path>
    <path stroke="none" fill="inherit"
			d="M0 16v1h32v-1zM11 27.167l3 .5v-1.03l-3-.546v1.076zm-3-.5v-1.122L5 25v-5H4v5.153a1 1 0 0 0 .836.986L8 26.667zm9 1.5l3 .5v-.94l-3-.545v.985zm6 1l3.836.639A1 1 0 0 0 28 28.82V26h-1v3l-4-.727v.894zM28 23v-3h-1v3h1zM4 13h1V7l22-4v10h1V3.18a1 1 0 0 0-1.164-.986l-22 3.667A1 1 0 0 0 4 6.847V13z"></path>
</symbol>
<symbol id="ic-flip" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" fill="none" stroke="none"></path>
    <path fill="inherit" stroke="none"
			d="M11 0h1v24h-1zM19 21v-1h2v-2h1v2a1 1 0 0 1-1 1h-2zm-2 0h-3v-1h3v1zm5-5h-1v-3h1v3zm0-5h-1V8h1v3zm0-5h-1V4h-2V3h2a1 1 0 0 1 1 1v2zm-5-3v1h-3V3h3zM9 3v1H2v16h7v1H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7z"></path>
</symbol>
<symbol id="ic-history" viewBox="0 0 24 24">
    <path fill="none" stroke="none" d="M0 0H24V24H0z"
			transform="translate(-740 -16) translate(547 8) translate(193 8)"></path>
    <path fill="inherit" stroke="none"
			d="M12.5 1C18.299 1 23 5.701 23 11.5S18.299 22 12.5 22c-5.29 0-9.665-3.911-10.394-8.999h1.012C3.838 17.534 7.764 21 12.5 21c5.247 0 9.5-4.253 9.5-9.5S17.747 2 12.5 2C8.49 2 5.06 4.485 3.666 8H3h4v1H2V4h1v3.022C4.68 3.462 8.303 1 12.5 1zm.5 5l-.001 5.291 2.537 2.537-.708.708L12.292 12H12V6h1z"
			transform="translate(-740 -16) translate(547 8) translate(193 8)"></path>
</symbol>
<symbol id="ic-history-check" viewBox="0 0 24 24">
    <g fill="none" fill-rule="evenodd">
        <path stroke="#555555" d="M4.5 -1L1.5 2 6.5 7"
			transform="translate(-60 -804) translate(60 804) translate(2 3) rotate(-90 4 3)"></path>
    </g>
</symbol>
<symbol id="ic-history-crop" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 0H12V12H0z"
			transform="translate(-84 -804) translate(84 804)"></path>
        <path fill="#434343"
			d="M2 0h1v10c-.552 0-1-.448-1-1V0zM10 9v3H9V9h1zM9 2h1v6H9V2z"
			transform="translate(-84 -804) translate(84 804)"></path>
        <path fill="#434343"
			d="M2 9H12V10H2zM9 2c.513 0 .936.386.993.883L10 3H3V2h6zM2 3H0V2h2v1z"
			transform="translate(-84 -804) translate(84 804)"></path>
    </g>
</symbol>
<!-- This icon made by Pixel perfect from www.flaticon.com -->
<symbol id="ic-history-resize" viewBox="0 0 24 24">
  <g fill="none" stroke="none" fill-rule="evenodd">
    <path fill="#434343"
			d="M 9.492188 1.507812 C 9.398438 1.414062 9.25 1.414062 9.15625 1.507812 L 5.8125 4.851562 C 5.714844 4.945312 5.714844 5.097656 5.8125 5.1875 C 5.855469 5.234375 5.917969 5.257812 5.976562 5.257812 C 6.039062 5.257812 6.101562 5.234375 6.148438 5.1875 L 9.492188 1.84375 C 9.585938 1.75 9.585938 1.601562 9.492188 1.507812 Z M 9.492188 1.507812 "></path>
    <path fill="#434343"
			d="M 9.328125 1.433594 C 9.195312 1.433594 9.085938 1.539062 9.085938 1.671875 L 9.085938 4.542969 C 9.085938 4.671875 9.195312 4.78125 9.328125 4.78125 C 9.460938 4.78125 9.566406 4.671875 9.566406 4.542969 L 9.566406 1.671875 C 9.566406 1.539062 9.460938 1.433594 9.328125 1.433594 Z M 9.328125 1.433594 "></path>
    <path fill="#434343"
			d="M 9.328125 1.433594 L 6.457031 1.433594 C 6.328125 1.433594 6.21875 1.539062 6.21875 1.671875 C 6.21875 1.804688 6.328125 1.914062 6.457031 1.914062 L 9.328125 1.914062 C 9.460938 1.914062 9.566406 1.804688 9.566406 1.671875 C 9.566406 1.539062 9.460938 1.433594 9.328125 1.433594 Z M 9.328125 1.433594 "></path>
    <path fill="#434343"
			d="M 5.1875 5.8125 C 5.097656 5.71875 4.945312 5.71875 4.851562 5.8125 L 1.503906 9.15625 C 1.410156 9.25 1.410156 9.402344 1.503906 9.496094 C 1.554688 9.542969 1.613281 9.566406 1.671875 9.566406 C 1.734375 9.566406 1.796875 9.542969 1.84375 9.496094 L 5.1875 6.148438 C 5.28125 6.054688 5.28125 5.902344 5.1875 5.8125 Z M 5.1875 5.8125 "></path>
    <path fill="#434343"
			d="M 1.671875 6.21875 C 1.539062 6.21875 1.433594 6.328125 1.433594 6.457031 L 1.433594 9.328125 C 1.433594 9.460938 1.539062 9.566406 1.671875 9.566406 C 1.804688 9.566406 1.914062 9.460938 1.914062 9.328125 L 1.914062 6.457031 C 1.914062 6.328125 1.804688 6.21875 1.671875 6.21875 Z M 1.671875 6.21875 "></path>
    <path fill="#434343"
			d="M 4.542969 9.085938 L 1.671875 9.085938 C 1.539062 9.085938 1.433594 9.195312 1.433594 9.328125 C 1.433594 9.460938 1.539062 9.566406 1.671875 9.566406 L 4.542969 9.566406 C 4.671875 9.566406 4.78125 9.460938 4.78125 9.328125 C 4.78125 9.195312 4.671875 9.085938 4.542969 9.085938 Z M 4.542969 9.085938 "></path>
    <path fill="#434343"
			d="M 10.28125 0 L 0.71875 0 C 0.320312 0 0 0.320312 0 0.71875 L 0 10.28125 C 0 10.679688 0.320312 11 0.71875 11 L 10.28125 11 C 10.679688 11 11 10.679688 11 10.28125 L 11 0.71875 C 11 0.320312 10.679688 0 10.28125 0 Z M 10.523438 10.28125 C 10.523438 10.414062 10.414062 10.523438 10.28125 10.523438 L 0.71875 10.523438 C 0.585938 10.523438 0.476562 10.414062 0.476562 10.28125 L 0.476562 0.71875 C 0.476562 0.585938 0.585938 0.476562 0.71875 0.476562 L 10.28125 0.476562 C 10.414062 0.476562 10.523438 0.585938 10.523438 0.71875 Z M 10.523438 10.28125 "></path>
  </g>
</symbol>
<!--  -->
<symbol id="ic-history-draw" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 1H12V13H0z"
			transform="translate(-156 -804) translate(156 803)"></path>
        <path stroke="#434343"
			d="M9.622 1.584l1.835 1.658-8.31 8.407L.5 12.5V11l9.122-9.416z"
			transform="translate(-156 -804) translate(156 803)"></path>
        <path fill="#434343"
			d="M7.628 3.753L10.378 3.753 10.378 4.253 7.628 4.253z"
			transform="translate(-156 -804) translate(156 803) rotate(45 9.003 4.003)"></path>
    </g>
</symbol>
<symbol id="ic-history-filter" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 0H12V12H0z"
			transform="translate(-276 -804) translate(276 804)"></path>
        <path fill="#434343" d="M12 3v1H9V3h3zM7 4H0V3h7v1z"
			transform="translate(-276 -804) translate(276 804)"></path>
        <path fill="#434343" d="M12 8v1H9V8h3zM7 9H0V8h7v1z"
			transform="translate(-276 -804) translate(276 804) matrix(-1 0 0 1 12 0)"></path>
        <path fill="#434343"
			d="M8 1c1.105 0 2 .895 2 2s-.895 2-2 2-2-.895-2-2 .895-2 2-2zm0 1c-.552 0-1 .448-1 1s.448 1 1 1 1-.448 1-1-.448-1-1-1zM4 7c1.105 0 2 .895 2 2s-.895 2-2 2-2-.895-2-2 .895-2 2-2zm0 1c-.552 0-1 .448-1 1s.448 1 1 1 1-.448 1-1-.448-1-1-1z"
			transform="translate(-276 -804) translate(276 804)"></path>
    </g>
</symbol>
<symbol id="ic-history-flip" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 0H12V12H0z"
			transform="translate(-108 -804) translate(108 804)"></path>
        <path fill="#434343"
			d="M6 0L7 0 7 12 6 12zM11 10V9h1v1.5c0 .276-.224.5-.5.5H10v-1h1zM5 1v1H1v8h4v1H.5c-.276 0-.5-.224-.5-.5v-9c0-.276.224-.5.5-.5H5zm7 5v2h-1V6h1zm0-3v2h-1V3h1zM9 1v1H7V1h2zm2.5 0c.276 0 .5.224.5.5V2h-2V1h1.5zM9 11H7v-1h2v1z"
			transform="translate(-108 -804) translate(108 804)"></path>
    </g>
</symbol>
<symbol id="ic-history-icon" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 0H12V12H0z"
			transform="translate(-204 -804) translate(204 804)"></path>
        <path stroke="#434343" stroke-linecap="round"
			stroke-linejoin="round" stroke-width="1.1"
			d="M6 9.568L2.601 11 2.975 7.467 0.5 4.82 4.13 4.068 6 1 7.87 4.068 11.5 4.82 9.025 7.467 9.399 11z"
			transform="translate(-204 -804) translate(204 804)"></path>
    </g>
</symbol>
<symbol id="ic-history-mask" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <g transform="translate(-252 -804) translate(252 804)">
            <path d="M0 0H12V12H0z"></path>
            <circle cx="6" cy="6" r="2.5" stroke="#444"></circle>
            <path fill="#434343"
			d="M11.5 0c.276 0 .5.224.5.5v11c0 .276-.224.5-.5.5H.5c-.276 0-.5-.224-.5-.5V.5C0 .224.224 0 .5 0h11zM11 1H1v10h10V1z"></path>
        </g>
    </g>
</symbol>
<symbol id="ic-history-rotate" viewBox="0 0 24 24">
    <defs>
        <path id="rfn4rylffa"
			d="M7 12c-.335 0-.663-.025-.983-.074C3.171 11.492 1 9.205 1 6.444c0-1.363.534-2.613 1.415-3.58"></path>
        <mask id="6f9gn2dysb" width="6" height="9.136" x="0" y="0"
			maskUnits="objectBoundingBox">
            <use xlink:href="#rfn4rylffa" stroke="434343"></use>
        </mask>
    </defs>
    <g fill="none" stroke="none" fill-rule="evenodd">
        <g transform="translate(-132 -804) translate(132 804)">
            <path d="M0 0.5H12V12.5H0z"></path>
            <path fill="#434343"
			d="M6.5 1C9.538 1 12 3.462 12 6.5c0 2.37-1.5 4.39-3.6 5.163l-.407-.916C9.744 10.13 11 8.462 11 6.5 11 4.015 8.985 2 6.5 2c-.777 0-1.509.197-2.147.544L4 1.75l-.205-.04C4.594 1.258 5.517 1 6.5 1z"></path>
            <use stroke="#434343" stroke-dasharray="2 1.25"
			stroke-width="1" mask="url(#6f9gn2dysb)" xlink:href="#rfn4rylffa"></use>
            <path fill="#434343"
			d="M4.279 0L6 1.75 4.25 3.571 3.543 2.864 4.586 1.75 3.572 0.707z"
			transform="matrix(-1 0 0 1 9.543 0)"></path>
        </g>
    </g>
</symbol>
<symbol id="ic-history-shape" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 0H12V12H0z"
			transform="translate(-180 -804) translate(180 804)"></path>
        <path fill="#434343"
			d="M11.5 4c.276 0 .5.224.5.5v7c0 .276-.224.5-.5.5h-7c-.276 0-.5-.224-.5-.5V8.8h1V11h6V5H8.341l-.568-1H11.5z"
			transform="translate(-180 -804) translate(180 804)"></path>
        <path stroke="#434343" stroke-linecap="round"
			stroke-linejoin="round" d="M4.5 0.5L8.5 7.611 0.5 7.611z"
			transform="translate(-180 -804) translate(180 804)"></path>
    </g>
</symbol>
<symbol id="ic-history-text" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 0H12V12H0z"
			transform="translate(-228 -804) translate(228 804)"></path>
        <path fill="#434343"
			d="M2 1h8c.552 0 1 .448 1 1H1c0-.552.448-1 1-1z"
			transform="translate(-228 -804) translate(228 804)"></path>
        <path fill="#434343"
			d="M1 1H2V3H1zM10 1H11V3H10zM5.5 1L6.5 1 6.5 11 5.5 11z"
			transform="translate(-228 -804) translate(228 804)"></path>
        <path fill="#434343" d="M4 10H8V11H4z"
			transform="translate(-228 -804) translate(228 804)"></path>
    </g>
</symbol>
<symbol id="ic-history-load" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <path d="M0 0H12V12H0z"
			transform="translate(-324 -805) translate(324 805)"></path>
        <path fill="#434343"
			d="M5 0c.552 0 1 .448 1 1v1h5.5c.276 0 .5.224.5.5v8c0 .276-.224.5-.5.5H.5c-.276 0-.5-.224-.5-.5V1c0-.552.448-1 1-1h4zm0 1H1v9h10V3H5V1z"
			transform="translate(-324 -805) translate(324 805)"></path>
        <path fill="#434343" d="M1 2L5 2 5 3 1 3z"
			transform="translate(-324 -805) translate(324 805)"></path>
    </g>
</symbol>
<symbol id="ic-history-delete" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <g fill="#434343">
            <path
			d="M2 9h8V1h1v8.5c0 .276-.224.5-.5.5h-9c-.276 0-.5-.224-.5-.5V1h1v8zM0 0H12V1H0z"
			transform="translate(-300 -804) translate(300 804) translate(0 2)"></path>
            <path d="M4 3H5V7H4zM7 3H8V7H7z"
			transform="translate(-300 -804) translate(300 804) translate(0 2)"></path>
            <path
			d="M4 1h4V0h1v1.5c0 .276-.224.5-.5.5h-5c-.276 0-.5-.224-.5-.5V0h1v1z"
			transform="translate(-300 -804) translate(300 804) matrix(1 0 0 -1 0 2)"></path>
        </g>
    </g>
</symbol>
<symbol id="ic-history-group" viewBox="0 0 24 24">
    <g fill="none" stroke="none" fill-rule="evenodd">
        <g transform="translate(-348 -804) translate(348 804)">
            <path d="M0 0H12V12H0z"></path>
            <path fill="#434343"
			d="M1 9v2h1v1H.5c-.276 0-.5-.224-.5-.5V9h1zm11 1v1.5c0 .276-.224.5-.5.5H9v-1h2v-1h1zm-4 1v1H6v-1h2zm-3 0v1H3v-1h2zm7-4v2h-1V7h1zM1 6v2H0V6h1zm11-2v2h-1V4h1zM1 3v2H0V3h1zm10.5-3c.276 0 .5.224.5.5V3h-1V1h-1V0h1.5zM6 0v1H4V0h2zm3 0v1H7V0h2zM0 .5C0 .224.224 0 .5 0H3v1H1v1H0V.5zM9.5 4c.276 0 .5.224.5.5v5c0 .276-.224.5-.5.5h-5c-.276 0-.5-.224-.5-.5V8.355c.317.094.652.145 1 .145V9h4V5h-.5c0-.348-.05-.683-.145-1H9.5z"></path>
            <circle cx="5" cy="5" r="2.5" stroke="#434343"></circle>
        </g>
    </g>
</symbol>
<symbol id="ic-icon-arrow-2" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit" stroke-linecap="round"
			stroke-linejoin="round"
			d="M21.793 18.5H2.5v-5h18.935l-7.6-8h5.872l10.5 10.5-10.5 10.5h-5.914l8-8z"></path>
</symbol>
<symbol id="ic-icon-arrow-3" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit" stroke-linecap="round"
			stroke-linejoin="round"
			d="M25.288 16.42L14.208 27.5H6.792l11.291-11.291L6.826 4.5h7.381l11.661 11.661-.58.258z"></path>
</symbol>
<symbol id="ic-icon-arrow" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit"
			d="M2.5 11.5v9h18v5.293L30.293 16 20.5 6.207V11.5h-18z"></path>
</symbol>
<symbol id="ic-icon-bubble" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit" stroke-linecap="round"
			stroke-linejoin="round"
			d="M22.207 24.5L16.5 30.207V24.5H8A6.5 6.5 0 0 1 1.5 18V9A6.5 6.5 0 0 1 8 2.5h16A6.5 6.5 0 0 1 30.5 9v9a6.5 6.5 0 0 1-6.5 6.5h-1.793z"></path>
</symbol>
<symbol id="ic-icon-heart" viewBox="0 0 32 32">
    <path fill-rule="nonzero" fill="none" stroke="inherit"
			d="M15.996 30.675l1.981-1.79c7.898-7.177 10.365-9.718 12.135-13.012.922-1.716 1.377-3.37 1.377-5.076 0-4.65-3.647-8.297-8.297-8.297-2.33 0-4.86 1.527-6.817 3.824l-.38.447-.381-.447C13.658 4.027 11.126 2.5 8.797 2.5 4.147 2.5.5 6.147.5 10.797c0 1.714.46 3.375 1.389 5.098 1.775 3.288 4.26 5.843 12.123 12.974l1.984 1.806z"></path>
</symbol>
<symbol id="ic-icon-load" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit" stroke-linecap="round"
			stroke-linejoin="round"
			d="M17.314 18.867l1.951-2.53 4 5.184h-17l6.5-8.84 4.549 6.186z"></path>
    <path stroke="none" fill="inherit"
			d="M18.01 4a11.798 11.798 0 0 0 0 1H3v24h24V14.986a8.738 8.738 0 0 0 1 0V29a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5a1 1 0 0 1 1-1h15.01z"></path>
    <path stroke="none" fill="inherit" d="M25 3h1v9h-1z"></path>
    <path fill="none" stroke="inherit" d="M22 6l3.5-3.5L29 6"></path>
</symbol>
<symbol id="ic-icon-location" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit"
			d="M16 31.28C23.675 23.302 27.5 17.181 27.5 13c0-6.351-5.149-11.5-11.5-11.5S4.5 6.649 4.5 13c0 4.181 3.825 10.302 11.5 18.28z"></path>
    <circle fill="none" stroke="inherit" cx="16" cy="13" r="4.5"></circle>
</symbol>
<symbol id="ic-icon-polygon" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit"
			d="M.576 16L8.29 29.5h15.42L31.424 16 23.71 2.5H8.29L.576 16z"></path>
</symbol>
<symbol id="ic-icon-star-2" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit"
			d="M19.446 31.592l2.265-3.272 3.946.25.636-3.94 3.665-1.505-1.12-3.832 2.655-2.962-2.656-2.962 1.12-3.832-3.664-1.505-.636-3.941-3.946.25-2.265-3.271L16 3.024 12.554 1.07 10.289 4.34l-3.946-.25-.636 3.941-3.665 1.505 1.12 3.832L.508 16.33l2.656 2.962-1.12 3.832 3.664 1.504.636 3.942 3.946-.25 2.265 3.27L16 29.638l3.446 1.955z"></path>
</symbol>
<symbol id="ic-icon-star" viewBox="0 0 32 32">
    <path fill="none" stroke="inherit"
			d="M25.292 29.878l-1.775-10.346 7.517-7.327-10.388-1.51L16 1.282l-4.646 9.413-10.388 1.51 7.517 7.327-1.775 10.346L16 24.993l9.292 4.885z"></path>
</symbol>
<symbol id="ic-icon" viewBox="0 0 24 24">
    <path fill="none" stroke="inherit" stroke-linecap="round"
			stroke-linejoin="round"
			d="M11.923 19.136L5.424 22l.715-7.065-4.731-5.296 6.94-1.503L11.923 2l3.574 6.136 6.94 1.503-4.731 5.296L18.42 22z"></path>
</symbol>
<symbol id="ic-mask-load" viewBox="0 0 32 32">
    <path stroke="none" fill="none" d="M0 0h32v32H0z"></path>
    <path stroke="none" fill="inherit"
			d="M18.01 4a11.798 11.798 0 0 0 0 1H3v24h24V14.986a8.738 8.738 0 0 0 1 0V29a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5a1 1 0 0 1 1-1h15.01zM15 23a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-1a5 5 0 1 0 0-10 5 5 0 0 0 0 10z"></path>
    <path stroke="none" fill="inherit" d="M25 3h1v9h-1z"></path>
    <path fill="none" stroke="inherit" d="M22 6l3.5-3.5L29 6"></path>
</symbol>
<symbol id="ic-mask" viewBox="0 0 24 24">
    <circle cx="12" cy="12" r="4.5" stroke="inherit" fill="none"></circle>
    <path stroke="none" fill="inherit"
			d="M2 1h20a1 1 0 0 1 1 1v20a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm0 1v20h20V2H2z"></path>
</symbol>
<symbol id="ic-redo" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" opacity=".5" fill="none" stroke="none"></path>
    <path stroke="none" fill="inherit"
			d="M21 6H9a6 6 0 1 0 0 12h12v1H9A7 7 0 0 1 9 5h12v1z"></path>
    <path fill="none" stroke="inherit" stroke-linecap="square"
			d="M19 3l2.5 2.5L19 8"></path>
</symbol>
<symbol id="ic-reset" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" opacity=".5" stroke="none" fill="none"></path>
    <path stroke="none" fill="inherit"
			d="M2 13v-1a7 7 0 0 1 7-7h13v1h-1v5h1v1a7 7 0 0 1-7 7H2v-1h1v-5H2zm7-7a6 6 0 0 0-6 6v6h12a6 6 0 0 0 6-6V6H9z"></path>
    <path fill="none" stroke="inherit" stroke-linecap="square"
			d="M19 3l2.5 2.5L19 8M5 16l-2.5 2.5L5 21"></path>
</symbol>
<symbol id="ic-rotate-clockwise" viewBox="0 0 32 32">
    <path stroke="none" fill="inherit"
			d="M29 17h-.924c0 6.627-5.373 12-12 12-6.628 0-12-5.373-12-12C4.076 10.398 9.407 5.041 16 5V4C8.82 4 3 9.82 3 17s5.82 13 13 13 13-5.82 13-13z"></path>
    <path fill="none" stroke="inherit" stroke-linecap="square"
			d="M16 1.5l4 3-4 3"></path>
    <path stroke="none" fill="inherit" fill-rule="nonzero"
			d="M16 4h4v1h-4z"></path>
</symbol>
<symbol id="ic-rotate-counterclockwise" viewBox="0 0 32 32">
    <path stroke="none"
			d="M3 17h.924c0 6.627 5.373 12 12 12 6.628 0 12-5.373 12-12 0-6.602-5.331-11.96-11.924-12V4c7.18 0 13 5.82 13 13s-5.82 13-13 13S3 24.18 3 17z"></path>
    <path stroke="none" fill="inherit" fill-rule="nonzero"
			d="M12 4h4v1h-4z"></path>
    <path fill="none" stroke="inherit" stroke-linecap="square"
			d="M16 1.5l-4 3 4 3"></path>
</symbol>
<symbol id="ic-rotate" viewBox="0 0 24 24">
    <path d="M0 0h24v24H0z" fill="none" stroke="none"></path>
    <path fill="inherit" stroke="none"
			d="M8.349 22.254a10.002 10.002 0 0 1-2.778-1.719l.65-.76a9.002 9.002 0 0 0 2.495 1.548l-.367.931zm2.873.704l.078-.997a9 9 0 1 0-.557-17.852l-.14-.99A10.076 10.076 0 0 1 12.145 3c5.523 0 10 4.477 10 10s-4.477 10-10 10c-.312 0-.62-.014-.924-.042zm-7.556-4.655a9.942 9.942 0 0 1-1.253-2.996l.973-.234a8.948 8.948 0 0 0 1.124 2.693l-.844.537zm-1.502-5.91A9.949 9.949 0 0 1 2.88 9.23l.925.382a8.954 8.954 0 0 0-.644 2.844l-.998-.062zm2.21-5.686c.687-.848 1.51-1.58 2.436-2.166l.523.852a9.048 9.048 0 0 0-2.188 1.95l-.771-.636z"></path>
    <path stroke="inherit" fill="none" stroke-linecap="square"
			d="M13 1l-2.5 2.5L13 6"></path>
</symbol>
<symbol id="ic-shape-circle" viewBox="0 0 32 32">
    <circle cx="16" cy="16" r="14.5" fill="none" stroke="inherit"></circle>
</symbol>
<symbol id="ic-shape-rectangle" viewBox="0 0 32 32">
    <rect width="27" height="27" x="2.5" y="2.5" fill="none"
			stroke="inherit" rx="1"></rect>
</symbol>
<symbol id="ic-shape-triangle" viewBox="0 0 32 32">
    <path fill="none" stroke-linecap="round" stroke-linejoin="round"
			d="M16 2.5l15.5 27H.5z"></path>
</symbol>
<symbol id="ic-shape" viewBox="0 0 24 24">
    <path stroke="none" fill="inherit"
			d="M14.706 8H21a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H9a1 1 0 0 1-1-1v-4h1v4h12V9h-5.706l-.588-1z"></path>
    <path fill="none" stroke="inherit" stroke-linecap="round"
			stroke-linejoin="round" d="M8.5 1.5l7.5 13H1z"></path>
</symbol>
<symbol id="ic-text-align-center" viewBox="0 0 32 32">
    <path stroke="none" fill="none" d="M0 0h32v32H0z"></path>
    <path stroke="none" fill="inherit"
			d="M2 5h28v1H2zM8 12h16v1H8zM2 19h28v1H2zM8 26h16v1H8z"></path>
</symbol>
<symbol id="ic-text-align-left" viewBox="0 0 32 32">
    <path stroke="none" fill="none" d="M0 0h32v32H0z"></path>
    <path stroke="none" fill="inherit"
			d="M2 5h28v1H2zM2 12h16v1H2zM2 19h28v1H2zM2 26h16v1H2z"></path>
</symbol>
<symbol id="ic-text-align-right" viewBox="0 0 32 32">
    <path stroke="none" fill="none" d="M0 0h32v32H0z"></path>
    <path stroke="none" fill="inherit"
			d="M2 5h28v1H2zM14 12h16v1H14zM2 19h28v1H2zM14 26h16v1H14z"></path>
</symbol>
<symbol id="ic-text-bold" viewBox="0 0 32 32">
    <path fill="none" stroke="none" d="M0 0h32v32H0z"></path>
    <path stroke="none" fill="inherit" d="M7 2h2v2H7zM7 28h2v2H7z"></path>
    <path fill="none" stroke="inherit" stroke-width="2"
			d="M9 3v12h9a6 6 0 1 0 0-12H9zM9 15v14h10a7 7 0 0 0 0-14H9z"></path>
</symbol>
<symbol id="ic-text-italic" viewBox="0 0 32 32">
    <path fill="none" stroke="none" d="M0 0h32v32H0z"></path>
    <path stroke="none" fill="inherit"
			d="M15 2h5v1h-5zM11 29h5v1h-5zM17 3h1l-4 26h-1z"></path>
</symbol>
<symbol id="ic-text-underline" viewBox="0 0 32 32">
    <path stroke="none" fill="none" d="M0 0h32v32H0z"></path>
    <path stroke="none" fill="inherit"
			d="M8 2v14a8 8 0 1 0 16 0V2h1v14a9 9 0 0 1-18 0V2h1zM3 29h26v1H3z"></path>
    <path stroke="none" fill="inherit" d="M5 2h5v1H5zM22 2h5v1h-5z"></path>
</symbol>
<symbol id="ic-text" viewBox="0 0 24 24">
    <path stroke="none" fill="inherit"
			d="M4 3h15a1 1 0 0 1 1 1H3a1 1 0 0 1 1-1zM3 4h1v1H3zM19 4h1v1h-1z"></path>
    <path stroke="none" fill="inherit" d="M11 3h1v18h-1z"></path>
    <path stroke="none" fill="inherit" d="M10 20h3v1h-3z"></path>
</symbol>
<symbol id="ic-undo" viewBox="0 0 24 24">
    <path d="M24 0H0v24h24z" opacity=".5" fill="none" stroke="none"></path>
    <path stroke="none" fill="inherit"
			d="M3 6h12a6 6 0 1 1 0 12H3v1h12a7 7 0 0 0 0-14H3v1z"></path>
    <path fill="none" stroke="inherit" stroke-linecap="square"
			d="M5 3L2.5 5.5 5 8"></path>
</symbol>
<symbol id="ic-zoom-in" viewBox="0 0 24 24">
    <g transform="translate(-229 -290) translate(229 290)">
        <circle cx="10.5" cy="10.5" r="9" stroke="inherit" fill="none"></circle>
        <path fill="inherit" d="M18.828 15.828H19.828V22.828H18.828z"
			transform="rotate(-45 19.328 19.328)"></path>
        <path fill="inherit" d="M7 10H14V11H7z"></path>
        <path fill="inherit" d="M10 7H11V14H10z"></path>
    </g>
</symbol>
<symbol id="ic-zoom-out" viewBox="0 0 24 24">
    <g transform="translate(-263 -290) translate(263 290)">
        <circle cx="10.5" cy="10.5" r="9" stroke="inherit" fill="none"></circle>
        <path fill="inherit" d="M18.828 15.828H19.828V22.828H18.828z"
			transform="rotate(-45 19.328 19.328)"></path>
        <path fill="inherit" d="M7 10H14V11H7z"></path>
    </g>
</symbol>
<symbol id="ic-hand" viewBox="0 0 24 24">
    <g fill="none" fill-rule="evenodd" stroke-linejoin="round">
        <path fill="inherit" fill-rule="nonzero"
			d="M8.672 3.36c1.328 0 2.114.78 2.29 1.869l.014.101.023.006v1.042l-.638-.185c-.187-.055-.323-.211-.354-.399L10 5.713c0-.825-.42-1.353-1.328-1.353C7.695 4.36 7 5.041 7 5.713v7.941c0 .439-.524.665-.843.364l-1.868-1.761c-.595-.528-1.316-.617-1.918-.216-.522.348-.562 1.203-.18 1.8L7.738 22h11.013l.285-.518c1.247-2.326 1.897-4.259 1.96-5.785l.004-.239V8.035c0-.656-.5-1.17-1-1.17-.503 0-1 .456-1 1.17 0 .333-.32.573-.64.48L18 8.41V7.368l.086.026.042-.136c.279-.805.978-1.332 1.738-1.388L20 5.865c1.057 0 2 .967 2 2.17v7.423c0 1.929-.845 4.352-2.521 7.29-.09.156-.255.252-.435.252H7.474c-.166 0-.321-.082-.414-.219l-5.704-8.39c-.653-1.019-.584-2.486.46-3.182 1-.666 2.216-.516 3.148.31L6 12.495V5.713c0-1.18 1.058-2.263 2.49-2.348z"
			transform="translate(-297 -290) translate(297 290)"></path>
        <path fill="inherit" fill-rule="nonzero"
			d="M12.5 1.5c1.325 0 2.41 1.032 2.495 2.336L15 4v7.22h-1V4c0-.828-.672-1.5-1.5-1.5-.78 0-1.42.595-1.493 1.356L11 4v7.22h-1V4c0-1.38 1.12-2.5 2.5-2.5z"
			transform="translate(-297 -290) translate(297 290)"></path>
        <path fill="inherit" fill-rule="nonzero"
			d="M16.5 3.5c1.325 0 2.41 1.032 2.495 2.336L19 6v6.3h-1V6c0-.828-.672-1.5-1.5-1.5-.78 0-1.42.595-1.493 1.356L15 6v2.44h-1V6c0-1.38 1.12-2.5 2.5-2.5z"
			transform="translate(-297 -290) translate(297 290)"></path>
    </g>
</symbol>
</defs>
</svg>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>