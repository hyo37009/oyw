<%@ page import="dto.PracticeRecord" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalDate" %>
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
    <title>Finish!</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<%
    LocalDateTime startTime = (LocalDateTime) session.getAttribute("startTime");
    LocalDateTime endTime = LocalDateTime.now();

    String startTimeStr;
    String endTimeStr;

    String am_pm;
    int hour = startTime.getHour();
    int minute = startTime.getMinute();

    if (hour / 12 == 0) {
        am_pm = "오전";
    } else {
        am_pm = "오후";
        hour -= 12;
    }

    startTimeStr = am_pm + " " + hour + "시 " + minute + "분";

    hour = endTime.getHour();
    minute = endTime.getMinute();

    if (hour / 12 == 0) {
        am_pm = "오전";
    } else {
        am_pm = "오후";
        hour -= 12;
    }
    endTimeStr = am_pm + " " + hour + "시 " + minute + "분";

%>
<div class="container">
    <div class="row p-4">
        <h1 class="text-success">연습 끝!</h1>
    </div>
    <div class="row py-4">
        <h4>~~ 오늘의 연습 ~~</h4>
    </div>
    <div class="row py-2">
        <b>시작한 시간</b> <%=startTimeStr%>
    </div>
    <div class="row py-2">
        <b>끝난 시간</b> <%=endTimeStr%>
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

                    for (int i = 0; i < records.size(); i++) {
                        PracticeRecord nowRecord = records.get(i);
                %>
                <tr>
                    <td><%=i + 1%>
                    </td>
                    <td><%=nowRecord.getSheet().getName()%>
                    </td>
                    <td><%=nowRecord.getBpm()%>
                    </td>
                    <td><%=nowRecord.getParsedTime()%>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <%
        // TODO 여기서 DB 넣기

        session.setAttribute("records", new ArrayList<PracticeRecord>());
    %>
    <div class="row">
        <a class="btn btn-outline-danger btn-sm" role="button" onclick="location.href='sheets.jsp'">돌아가기</a>
    </div>


</div>
<%@ include file="footer.jsp" %>
</body>
</html>
