<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Sheet" %>
<%@ page import="dto.SheetRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<%--<jsp:useBean id="sheetDAO" class="dto.SheetRepository" scope="session"/>--%>
<html>
<script type="text/javascript">
    function addToList(id) {
        if (confirm("악보를 연습 목록에 추가하시겠습니까?")) {
            document.getElementById("addForm" + id.toString()).submit();
        } else {
            document.getElementById("addForm" + id.toString()).reset();
        }
    }
</script>
<head>
    <title>악보 목록</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">악보 목록</h1>
            <p class="col-md-8 fs-4">Sheet List</p>
        </div>
    </div>

    <%
        SheetRepository dao = SheetRepository.getSheetRepository();
        ArrayList<Sheet> sheets = dao.getListOfSheets();
    %>
    <div class="row" data-masonry="{&quot;percentPosition&quot;: true }" style="position: relative; height: 1068px;">
        <%
            for (int i = 0; i < sheets.size(); i++) {
                Sheet sheet = sheets.get(i);

        %>

        <div class="col-sm-6 col-lg-4 mb-4" style="position: absolute; left: 0%; top: 0px;">
            <form id="addForm<%=sheet.getSheetId()%>" action="./addList.jsp?id=<%=sheet.getSheetId()%>" method="post">
                <div class="card">
                    <img src="<%=sheet.getFilePath()%>"
                         onclick="location.href = './sheet.jsp?id=<%=sheet.getSheetId()%>'"/>
                    <div class="card-body" onclick="location.href = './sheet.jsp?id=<%=sheet.getSheetId()%>'">
                        <h5 class="card-title"><%=sheet.getName()%>
                        </h5>
                        <p class="card-text"><%=sheet.getInstrumentType()%>
                        </p>
                    </div>
                    <a class="btn-outline-primary btn" onclick="addToList(<%=sheet.getSheetId()%>)">연습 목록에 추가하기</a>
                </div>
            </form>
        </div>

        <%
            }
        %>

    </div>


</div>
<%@ include file="footer.jsp" %>

</body>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
        integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"
        async></script>
</html>
