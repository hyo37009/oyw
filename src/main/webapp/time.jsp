<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LocalDateTime now = LocalDateTime.now();
    String am_pm;
    int hour = now.getHour();
    int minute = now.getMinute();
    int second = now.getSecond();

    if(hour / 12 == 0){
        am_pm = "오전";
    }else{
        am_pm = "오후";
        hour -= 12;
    }

    String CT = am_pm + " " + hour + "시 " + minute + "분";
%>
<%=CT%>