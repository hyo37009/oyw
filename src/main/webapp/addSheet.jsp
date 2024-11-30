<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
        integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"
        async></script>
<script type="text/javascript" src="resources/js/validation.js"></script>
<html>
<head>
    <title>악보 추가</title>
</head>
<body>
<%@ include file="menu.jsp"%>
<div class="container py-4">
  <div class="p-5 mb-4 bg-body rounded-3">
    <div class="container-fluid py-5">
      <h1>악보 등룍</h1>
      <p class="col-md-8 fs-4">Sheet Addition</p>
    </div>
  </div>

  <div class="row align-items-md-stretch">
    <form name="newSheet" action="./processAddSheet.jsp" method="post" enctype="multipart/form-data">
      <div class="mb-3 row">
        <label class="col-sm-2">악보 이름</label>
        <div class="col-sm-3">
          <input type="text" name="name" id="sheetName" class="form-control">
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-2">카테고리</label>
        <div class="col-sm-3">
          <input type="text" name="category" id="category" class="form-control">
        </div>
      </div>

      <div class="mb-3 row" id="instrumentDiv">
        <label class="col-sm-2">악기 유형</label>
        <div class="col-sm-5 form-check">
          <input class="form-check-input" type="radio" name="instrument" id="optionsRadios1" value="guitar" checked="">
          <label class="form-check-label" for="optionsRadios1">
            기타
          </label>
        </div><div class="col-sm-5 form-check">
          <input class="form-check-input" type="radio" name="instrument" id="optionsRadios2" value="drum" checked="">
          <label class="form-check-label" for="optionsRadios2">
            드럼
          </label>
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-2">악보 이미지</label>
        <div class="col-sm-5">
          <input type="file" id="file" name="sheetImage" class="form-control">
        </div>
      </div>

      <div class="mb-3 row">
        <div class="col-sm-10">
          <input type="button" class="btn btn-primary" value="등록" onclick="CheckAddSheet()">
        </div>
      </div>


    </form>
  </div>

</div>
<%@ include file="footer.jsp"%>
</body>
</html>
