<%@ page import="dto.Sheet" %>
<%@ page import="dto.SheetRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");

    if (id == null || id.trim().equals("")) {
        response.sendRedirect("sheets.jsp");
        return;
    }

    SheetRepository dao = SheetRepository.getSheetRepository();

    Sheet sheet = dao.getSheetById(id);
    if(sheet == null){
        response.sendRedirect("exceptionNoSheetId.jsp");
    }

    ArrayList<Sheet> list = (ArrayList<Sheet>) session.getAttribute("practiceList");
    if (list == null) {
        list = new ArrayList<Sheet>();
        session.setAttribute("practiceList", list);
    }

    if(!list.contains(sheet)){
        list.add(sheet);
    }

    response.sendRedirect("sheets.jsp");
%>