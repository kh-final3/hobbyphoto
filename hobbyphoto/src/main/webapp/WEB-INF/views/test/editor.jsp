<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- TOAST UI Editor CDN URL(CSS)-->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <h2 style="text-align: center;">TOAST UI Editor 글쓰기 페이지</h2>

    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div id="content">

    </div>
    

    <!-- TOAST UI Editor CDN URL(JS) -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

    <!-- TOAST UI Editor 생성 JavaScript 코드 -->
    <script>

    const editor = new toastui.Editor({
        el: document.querySelector('#content'),      // 에디터를 적용할 요소 (컨테이너)
        height: '500px',                             // 에디터 영역의 높이 값 (OOOpx || auto)
        initialEditType: 'markdown',                 // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
        initialValue: '',                            // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
        previewStyle: 'vertical',                    // 마크다운 프리뷰 스타일 (tab || vertical)
        placeholder: '내용을 입력해 주세요.',
        /* start of hooks */
        hooks: {
            async addImageBlobHook(blob, callback) { // 이미지 업로드 로직 커스텀
                try {
                    /*
                    * 1. 에디터에 업로드한 이미지를 FormData 객체에 저장
                    *    (이때, 컨트롤러 uploadEditorImage 메서드의 파라미터인 'image'와 formData에 append 하는 key('image')값은 동일해야 함)
                    */
                    const formData = new FormData();
                    formData.append('image', blob);
                    
                    // 2. FileApiController - uploadEditorImage 메서드 호출
                    const response = await fetch('tui-editor/image-upload', {
                        method : 'POST',
                        body : formData,
                    });

                    // 3. 컨트롤러에서 전달받은 디스크에 저장된 파일명
                    const filename = await response.text();
                    console.log('서버에 저장된 파일명 : ', filename);
                    console.log(filename);
                    // 4. addImageBlobHook의 callback 함수를 통해, 디스크에 저장된 이미지를 에디터에 렌더링
                    const imageUrl = `tui-editor/image-print?filename=`+filename;
                    console.log(imageUrl);
                    callback(imageUrl, 'image alt attribute');

                } catch (error) {
                    console.error('업로드 실패 : ', error);
                }
            }
        }
        /* end of hooks */
    });
    </script>
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>