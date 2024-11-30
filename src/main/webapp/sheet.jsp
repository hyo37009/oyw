<%@ page import="dto.Sheet" %>
<%@ page import="dto.SheetRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
        integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"
        async></script>
<%--<jsp:useBean id="sheetDAO" class="dto.SheetRepository" scope="session"/>--%>
<html>
<head>
    <title>Sheet</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">악보 정보</h1>
            <p class="col-md-8 fs-4">Sheet Info</p>
        </div>
    </div>

    <%
        String id = request.getParameter("id");
        SheetRepository dao = SheetRepository.getSheetRepository();
        Sheet sheet = dao.getSheetById(id);
    %>
    <div class="row align-items-center">
        <div class="col-md-10">
            <img src="<%=sheet.getFilePath()%>" width="700px"/>
        </div>
        <div class="col-md-2 text-center">
            <h4><b><%=sheet.getName()%></b></h4>
            <p>카테고리 : <%=sheet.getCategory()%></p>
            <p>악기 : <%=sheet.getInstrumentType()%></p>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
