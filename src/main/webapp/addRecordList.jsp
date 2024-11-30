<%@ page import="dto.PracticeRecord" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.SheetRepository" %>
<%@ page import="dto.Sheet" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    int bpm = Integer.parseInt(request.getParameter("bpm"));

    ArrayList<PracticeRecord> records = (ArrayList<PracticeRecord>) session.getAttribute("records");

    if (records == null) {
        records = new ArrayList<>();
        session.setAttribute("records", records);
    }

    SheetRepository sheetDao = SheetRepository.getSheetRepository();
    Sheet sheet = sheetDao.getSheetById(id);

    PracticeRecord record = new PracticeRecord(sheet, bpm, LocalDateTime.now());
    records.add(record);

    response.sendRedirect("practice.jsp");
%>
