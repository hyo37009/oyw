<%@ page import="dto.SheetRepository" %>
<%@ page import="dto.Sheet" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");

  String filename = "";
  String filePath = "C:\\Users\\hyo37\\Documents\\github\\OYW\\src\\main\\webapp\\resources\\images\\";
  String encType = "utf-8";

  MultipartRequest multi = new MultipartRequest(request, filePath, 20 * 1024 * 1024, encType, new DefaultFileRenamePolicy());

  String sheetName = multi.getParameter("name");
  String category = multi.getParameter("category");
  String instrument = multi.getParameter("instrument");
  SheetRepository sheetRepository = SheetRepository.getSheetRepository();
  int sheetId = sheetRepository.getListOfSheets().size() + 1;

  Enumeration fileNames = multi.getFileNames();
  String fname = (String) fileNames.nextElement();
  filename = multi.getFilesystemName(fname);
  System.out.println(filename);


  Sheet sheet = new Sheet(String.valueOf(sheetId), sheetName, "./resources/images/" + filename , category, instrument);
  sheetRepository.addSheet(sheet);

  response.sendRedirect("sheets.jsp");

%>
