package com.kr.pawpawtrip.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Position
{
    private int    contentId;
    private String titleName;
    private String mapX;
    private String mapY;
    private String mapLevel;
}
