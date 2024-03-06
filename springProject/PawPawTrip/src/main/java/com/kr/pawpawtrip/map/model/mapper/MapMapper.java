package com.kr.pawpawtrip.map.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kr.pawpawtrip.map.model.vo.Position;

@Mapper
public interface MapMapper
{
    List<Position> selectAllPositions();
}
