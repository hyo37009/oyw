<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <%@ include file="menu.jsp"%>

    <main class="container py-5">
        <h1>오늘 연습 완료!!</h1>
        <p> 오늘의 기초연습을 시작해보세요!</p>
        <a class="btn" href="sheets.jsp">시작하기</a>
    <%@ include file="footer.jsp"%>
</div>
</body>
</html>
