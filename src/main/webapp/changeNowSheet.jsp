<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.SheetRepository" %>
<%@ page import="dto.Sheet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SheetRepository dao = SheetRepository.getSheetRepository();
    String targetSheetId = (String) request.getParameter("id");
    Sheet newSheet = dao.getSheetById(targetSheetId);
    session.setAttribute("nowSheet", newSheet);
    response.sendRedirect("./practice.jsp");
%>