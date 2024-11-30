<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Sheet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
        integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"
        async></script>
<html>
<head>
    <title>Practice List</title>
    <script type="text/javascript">
        function removeFromList(id) {
            if (confirm("악보를 연습 목록에서 삭제하시겠습니까?")) {
                document.getElementById("removeForm" + id.toString()).submit();
                console.log("removeForm" + id.toString())
            } else {
                document.getElementById("removeForm" + id.toString()).reset();
            }
        }
    </script>
</head>
<body>
<%@ include file="menu.jsp" %>

<div class="container py-4">
    <div class="py-5 mb-4 bg-body rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">연습 목록</h1>
            <p class="col-md-8 fs-4">Practice List</p>
        </div>
    </div>

    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <%
                ArrayList<Sheet> list = (ArrayList<Sheet>) session.getAttribute("practiceList");
                if (list == null) {
                    list = new ArrayList<Sheet>();
                }

                for (Sheet sheet : list) {
            %>
            <div class="col">
                <form id="removeForm<%=sheet.getSheetId()%>" action="./removeList.jsp?id=<%=sheet.getSheetId()%>"
                      method="post">
                    <div class="card shadow-sm">
                        <img src="<%=sheet.getFilePath()%>"
                             onclick="location.href = './sheet.jsp?id=<%=sheet.getSheetId()%>'"/>
                        <div class="card-body">
                            <p class="card-text"><%=sheet.getName()%>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <%--                                <button type="button" class="btn btn-sm btn-outline-secondary">자세히</button>--%>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="removeFromList(<%=sheet.getSheetId()%>)">삭제하기</button>
                                </div>
                                <small class="text-body-secondary">9 mins</small>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <a class="btn btn-lg btn-primary" href="practice.jsp" role="button">연습 시작하기!</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
