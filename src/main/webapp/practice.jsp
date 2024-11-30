<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Sheet" %>
<%@ page import="dto.PracticeRecord" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
        integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"
        async></script>
<script type="text/javascript">
    function finishPractice(){
        if (confirm("진짜 끝?")) {
            location.href = './finishPractice.jsp';
        }
    }
</script>
<html>
<head>
    <title>Practice</title>
</head>
<body>
<div>
    <%@ include file="menu.jsp" %>
    <%
        ArrayList<Sheet> list = (ArrayList<Sheet>) session.getAttribute("practiceList");
        if (list == null || list.isEmpty()) {
            list = new ArrayList<Sheet>();
            response.sendRedirect("practiceList.jsp");
        }

        Sheet nowSheet = (Sheet) session.getAttribute("nowSheet");
        if (nowSheet == null) {
            nowSheet = list.getFirst();
            session.setAttribute("nowSheet", nowSheet);
        }
    %>

    <div class="container py-4 justify-content-center">
        <h1>연습 하자!</h1>
        <% session.setAttribute("startTime", LocalDateTime.now());%>
        <p>
            <%@ include file="time.jsp" %>
            에 시작함!</p>
        <div class="container justify-content-center">
            <div class="row align-items-center">
                <img src="<%=nowSheet.getFilePath()%>" width="700px"/>
            </div>
            <div class="row align-items-center">
                <form id="recordForm" method="post" action="./addRecordList.jsp?id=<%=nowSheet.getSheetId()%>">
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-2">
                            <h4><b>기록하기!</b></h4>
                        </div>
                        <div class="col-md-auto text-center">
                            <%=nowSheet.getName()%>
                        </div>
                        <div class="col col-lg-2 text-center">
                            <b>연습 BPM</b>
                        </div>
                        <div class="col col-lg-2">
                            <input type="number" class="form-control" value="80" step="5" name="bpm">
                        </div>
                        <div class="col col-lg-2">
                            <input type="submit" class="btn btn-success" value="이렇게 기록!" onclick="addRecord(id)">
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <hr width="70%"/>
            </div>


            <div class="row">
                <div class="table-responsive small">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">악보 이름</th>
                            <th scope="col">연습 BPM</th>
                            <th scope="col">연습 일시</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<PracticeRecord> records = (ArrayList<PracticeRecord>) session.getAttribute("records");

                            if (records == null) {
                                records = new ArrayList<>();
                                session.setAttribute("records", records);
                            }

                            for(int i = 0; i < records.size(); i++){
                                PracticeRecord nowRecord = records.get(i);
                        %>
                        <tr>
                            <td><%=i + 1%></td>
                            <td><%=nowRecord.getSheet().getName()%></td>
                            <td><%=nowRecord.getBpm()%></td>
                            <td><%=nowRecord.getParsedTime()%></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <a class="btn btn-outline-danger" role="button" onclick="finishPractice()">연습 끝내기!</a>
            </div>


        </div>
    </div>




    <div class="row" data-masonry="{&quot;percentPosition&quot;: true }" style="position: relative; height: 1068px;">
        <%
            for (Sheet sheet : list) {
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
                    <a class="btn-outline-primary btn"
                       onclick="location.href = './changeNowSheet.jsp?id=<%=sheet.getSheetId()%>'">이거 하기!</a>
                    <%--                    <input name="addForm" type="button" class="btn-outline-primary btn" onclick="addToList()" value="연습 목록에 추가하기"></input>--%>
                </div>
            </form>
        </div>

        <%
            }
        %>

    </div>

    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
