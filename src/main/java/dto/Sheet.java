package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Sheet  implements Serializable {
    private String sheetId;
    private String name;
    private String filePath;
    private String category;
    private String instrumentType; // 악기 종류 (기타, 드럼)
}
