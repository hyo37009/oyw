<%@ page import="dto.SheetRepository" %>
<%@ page import="dto.Sheet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    if(id == null || id.trim().isEmpty()){
        response.sendRedirect("sheets.jsp");
        return;
    }

    SheetRepository dao = SheetRepository.getSheetRepository();

    Sheet sheet = dao.getSheetById(id);
    if (sheet == null) {
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<Sheet> list = (ArrayList<Sheet>) session.getAttribute("practiceList");
    list.remove(sheet);

    response.sendRedirect("practiceList.jsp");
%>