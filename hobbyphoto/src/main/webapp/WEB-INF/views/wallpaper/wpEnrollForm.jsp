<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link type="text/css" href="${path}/resources/css/tui-color-picker.css" rel="stylesheet">
	<link type="text/css" href="${path}/resources/css/tui-image-editor.css"	rel="stylesheet">
	<script>
		var errorLogs = [];
		window.onerror = function (o, r, e, n) {
			errorLogs.push({
				message: o,
				source: r,
				lineno: e,
				colno: n
			})
		};
	</script>
	<link rel="stylesheet" type="text/css"
		href="data:text/css;charset=UTF-8,%0A%20%20%20%20.tie-icon-add-button.icon-bubble%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-bubble%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-heart%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-heart%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-location%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-location%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-polygon%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-polygon%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-star%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-star%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-star-2%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-star-2%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-arrow-3%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-arrow-3%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-arrow-2%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-arrow-2%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-arrow%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-arrow%22%5D%20label%2C%0A%20%20%20%20.tie-icon-add-button.icon-bubble%20.tui-image-editor-button%5Bdata-icontype%3D%22icon-bubble%22%5D%20label%2C%0A%20%20%20%20.tie-draw-line-select-button.line%20.tui-image-editor-button.line%20label%2C%0A%20%20%20%20.tie-draw-line-select-button.free%20.tui-image-editor-button.free%20label%2C%0A%20%20%20%20.tie-flip-button.flipX%20.tui-image-editor-button.flipX%20label%2C%0A%20%20%20%20.tie-flip-button.flipY%20.tui-image-editor-button.flipY%20label%2C%0A%20%20%20%20.tie-flip-button.resetFlip%20.tui-image-editor-button.resetFlip%20label%2C%0A%20%20%20%20.tie-crop-button%20.tui-image-editor-button.apply.active%20label%2C%0A%20%20%20%20.tie-crop-preset-button%20.tui-image-editor-button.preset.active%20label%2C%0A%20%20%20%20.tie-resize-button%20.tui-image-editor-button.apply.active%20label%2C%0A%20%20%20%20.tie-resize-preset-button%20.tui-image-editor-button.preset.active%20label%2C%0A%20%20%20%20.tie-shape-button.rect%20.tui-image-editor-button.rect%20label%2C%0A%20%20%20%20.tie-shape-button.circle%20.tui-image-editor-button.circle%20label%2C%0A%20%20%20%20.tie-shape-button.triangle%20.tui-image-editor-button.triangle%20label%2C%0A%20%20%20%20.tie-text-effect-button%20.tui-image-editor-button.active%20label%2C%0A%20%20%20%20.tie-text-align-button.tie-text-align-left%20.tui-image-editor-button.left%20label%2C%0A%20%20%20%20.tie-text-align-button.tie-text-align-center%20.tui-image-editor-button.center%20label%2C%0A%20%20%20%20.tie-text-align-button.tie-text-align-right%20.tui-image-editor-button.right%20label%2C%0A%20%20%20%20.tie-mask-apply.apply.active%20.tui-image-editor-button.apply%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%3Ahover%20%3E%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-checkbox%20label%20%3E%20span%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bfont-weight%3A%20lighter%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%20%3E%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-wrap.tui-image-editor-newline.short%20label%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-wrap.tui-image-editor-newline.short%20label%20%3E%20span%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%238a8a8a%3Bfont-weight%3A%20lighter%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-wrap%20label%20%3E%20span%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bfont-weight%3A%20lighter%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-partition%20%3E%20div%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%233c3c3c%3Bborder-left%3A%201px%20solid%20%233c3c3c%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container.left%20.tui-image-editor-submenu%20.tui-image-editor-partition%20%3E%20div%2C%0A%20%20%20%20.tui-image-editor-container.right%20.tui-image-editor-submenu%20.tui-image-editor-partition%20%3E%20div%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%233c3c3c%3Bborder-bottom%3A%201px%20solid%20%233c3c3c%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-checkbox%20label%20%3E%20span%3Abefore%20%7B%0A%20%20%20%20%20%20%20%20border%3A%200px%3Bbackground-color%3A%20%23fff%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-checkbox%20label%20%3E%20input%3Achecked%20%2B%20span%3Abefore%20%7B%0A%20%20%20%20%20%20%20%20border%3A%200%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-virtual-range-pointer%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bbackground-color%3A%20%23fff%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-virtual-range-bar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23666%3Bbackground-color%3A%20%23666%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-virtual-range-subbar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23d1d1d1%3Bbackground-color%3A%20%23d1d1d1%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-disabled%20.tui-image-editor-virtual-range-pointer%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23414141%3Bbackground-color%3A%20%23414141%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-disabled%20.tui-image-editor-virtual-range-subbar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23414141%3Bbackground-color%3A%20%23414141%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-disabled%20.tui-image-editor-virtual-range-bar%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23282828%3Bbackground-color%3A%20%23282828%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-range-value%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%3Bfont-weight%3A%20lighter%3Bfont-size%3A%2011px%3Bborder%3A%201px%20solid%20%23353535%3Bbackground-color%3A%20%23151515%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%20.color-picker-value%20%2B%20label%20%7B%0A%20%20%20%20%20%20%20%20color%3A%20%23fff%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-submenu%20.tui-image-editor-button%20.color-picker-value%20%7B%0A%20%20%20%20%20%20%20%20border%3A%201px%20solid%20%231e1e1e%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.svg_ic-menu%20%7B%0A%20%20%20%20%20%20%20%20width%3A%2024px%3Bheight%3A%2024px%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.svg_ic-submenu%20%7B%0A%20%20%20%20%20%20%20%20width%3A%2032px%3Bheight%3A%2032px%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-controls-logo%20%3E%20img%2C%0A%20%20%20%20.tui-image-editor-container%20.tui-image-editor-header-logo%20%3E%20img%20%7B%0A%20%20%20%20%20%20%20%20width%3A%20251px%3Bheight%3A%2021px%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.normal.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.normal.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%238a8a8a%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%238a8a8a%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.active.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.active.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23555555%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23555555%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.hover.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.hover.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23e9e9e9%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23e9e9e9%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-menu%20use.disabled.use-default%2C%0A%20%20%20%20.tui-image-editor-help-menu%20use.disabled.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23434343%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23434343%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-submenu%20use.normal.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%238a8a8a%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%238a8a8a%3B%0A%20%20%20%20%7D%0A%20%20%20%20.tui-image-editor-submenu%20use.active.use-default%20%7B%0A%20%20%20%20%20%20%20%20fill-rule%3A%20evenodd%3B%0A%20%20%20%20%20%20%20%20fill%3A%20%23e9e9e9%3B%0A%20%20%20%20%20%20%20%20stroke%3A%20%23e9e9e9%3B%0A%20%20%20%20%7D%0A">

<style>
    .content{
        width: 1370px;
        margin: auto;
    }

    .wallpaper{
        border-bottom: 1px solid lightgray;
    }

    #contentArea th{
        border-right: 1px solid lightgray;
    }

    .wallpaper-file{
        width: 1370px;
        height: 800px;
        border: 5px double gray;
    }

    .rc-btn>button{margin-left: 10px;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="content">
        <br><br>
        <div align="center">
            <h2>배경 화면 공유</h2>
            <h6 style="color: gray;">예쁘고 다양한 배경화면 공유하기!</h6>
        </div>
        <br>
        <div class="wallpaper">
            
			<form action="insertWallPaper.wp" method="post" enctype="multipart/form-data">

				<input type="hidden" name="img" id="changeName">
				<input type="hidden" name="userNo" value="${ loginMember.userNo}">
				<input type="hidden" name="boardType" value="4">
				
                <table id="contentArea" align="center" class="table">
					<tr>
						<th width="100">제목</th>
                        <td colspan=""><input name="bgTitle" type="text" style="width: 1200px;"></td>
                    </tr>
                    <tr>
						<td colspan="2">
							<div class="wallpaper-file" align="center">
								<div id="tui-image-editor-container" class="tui-image-editor-container bottom">
									
								</div>
                            </div>
                        </td>
                    </tr>
                </table>
				<div class="rc-btn" align="right" style="width: 1300px;" >
					<button class="btn btn-dark" id="realSubmit" type="submit">작성</button>
					<button class="btn btn-dark" type="reset">취소</button>
				</div>
				
			</form>
        </div>
        <br>
    </div>
    <script type="text/javascript"
				src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.4.0/fabric.js"></script>
			<script type="text/javascript"
				src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.min.js"></script>
			<script type="text/javascript"
				src="https://uicdn.toast.com/tui-color-picker/v2.2.6/tui-color-picker.js"></script>
			<script type="text/javascript"
				src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
			<script type="text/javascript" src="${path}/resources/js/tui-image-editor.js"></script>
			<script type="text/javascript" src="${path}/resources/js/black-theme.js"></script>
			<script>
				// Image editor
				var imageEditor = new tui.ImageEditor('#tui-image-editor-container', {
					includeUI: {
						theme: blackTheme, // or whiteTheme
						initMenu: 'filter',
						menuBarPosition: 'bottom',
					},
					cssMaxWidth: 700,
					cssMaxHeight: 500,
					usageStatistics: false,
				});
				window.onresize = function () {
					imageEditor.ui.resizeEditor();
				};
			</script>
        <script>
        $(".tui-image-editor-canvas-container").click(function () {
            console.log($("#changeName").val());
            var dataURL = imageEditor.toDataURL();
            $.ajax({
                type: 'POST',
                url: "${path}/base64.wp",
                data: {
                    pngData: dataURL
                },
            }).done(function (data) {
                console.log(data);
                $("#changeName").val(data);
            });
        });

        </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>