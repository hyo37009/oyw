package dto;

import lombok.Getter;

import java.util.ArrayList;

public class SheetRepository {
    @Getter
    private ArrayList<Sheet> listOfSheets = new ArrayList<>();
    @Getter
    private static SheetRepository sheetRepository = new SheetRepository();

    public SheetRepository() {
        Sheet sheet1 = new Sheet("1", "the solo 1", "./resources/images/1.jpg", "the solo", "drum");
        Sheet sheet2 = new Sheet("2", "the solo 2", "./resources/images/2.jpg", "the solo", "drum");
        Sheet sheet3 = new Sheet("3", "the solo 3", "./resources/images/3.jpg", "the solo", "drum");
        Sheet sheet4 = new Sheet("4", "the solo 4", "./resources/images/4.jpg", "the solo", "drum");
        Sheet sheet5 = new Sheet("5", "the solo 5", "./resources/images/5.jpg", "the solo", "drum");

        listOfSheets.add(sheet1);
        listOfSheets.add(sheet2);
        listOfSheets.add(sheet3);
        listOfSheets.add(sheet4);
        listOfSheets.add(sheet5);
    }


    public Sheet getSheetById(String sheetId) {
        Sheet sheet = null;
        for (Sheet s : listOfSheets) {
            if(s.getSheetId().equals(sheetId)){
                sheet = s;
            }
        }
        return sheet;
    }

    public void addSheet(Sheet sheet){
        listOfSheets.add(sheet);
    }
}
