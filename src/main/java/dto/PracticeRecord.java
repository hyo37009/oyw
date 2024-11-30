package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@AllArgsConstructor
@Getter
public class PracticeRecord {
    private Sheet sheet;
    private int bpm;
    private LocalDateTime time;

    public String getParsedTime(){
        String am_pm;
        int hour = time.getHour();
        int minute = time.getMinute();

        if(hour / 12 == 0){
            am_pm = "오전";
        }else{
            am_pm = "오후";
            hour -= 12;
        }

        return am_pm + " " + hour + "시 " + minute + "분";
    }
}
