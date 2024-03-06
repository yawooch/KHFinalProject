package com.kr.pawpawtrip.map.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kr.pawpawtrip.map.model.mapper.MapMapper;
import com.kr.pawpawtrip.map.model.vo.Position;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MapServiceImpl implements MapService
{
    private final MapMapper mapMapper; 
    @Override
    public List<Position> getPoisitions()
    {
        return mapMapper.selectAllPositions();
    }

}
