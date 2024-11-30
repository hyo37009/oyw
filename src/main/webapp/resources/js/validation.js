function CheckAddSheet(){
    var sheetName = document.getElementById("sheetName");
    var category = document.getElementById("category");
    var file = document.getElementById("file");

    if (sheetName.value.length === 0) {
        alert("악보 이름을 입력해주세요.");
        sheetName.focus();
        return false;
    }
    if(category.value.length === 0){
        alert("카테고리를 입력해주세요.");
        category.focus();
        return false;
    }

    if(document.getElementById("optionsRadios1") === false
        || document.getElementById("optionsRadios2") === false){
        alert("악기를 선택해주세요.");
        document.getElementById("instrumentDiv").focus();
        return false
    }

    if(!file.value){
        alert("파일을 첨부해주세요.");
        file.focus();
        return false
    }


    document.newSheet.submit();
}