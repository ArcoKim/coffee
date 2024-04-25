<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        a:nth-child(5) {
            text-decoration: underline;
        }
    </style>
    <title>Home</title>
</head>

<body>

<header><jsp:include page="parts/header.jsp" /></header>
<nav><jsp:include page="parts/nav.jsp" /></nav>

<section>
    <h3> 매장별 커피 판매관리 프로그램 </h3>
    <pre style="text-align: left">
        매장별 커피 판매를 관리하기 위한 프로그램이다.

        1. 상품테이블, 매장테이블, 판매테이블을 추가한다.
        2. 판매등록, 판매현황 매장별판매액, 상품별판매액 페이지를 작성한다.
        3. 올바르게 구현되었는지 확인한다.

    </pre>
</section>

<footer> <jsp:include page="parts/footer.jsp" /> </footer>

</body>
</html>