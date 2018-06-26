package com.smartcampus.dao;

import com.smartcampus.entity.Goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface GoodsMapper {
    void save(Goods goods);

    int selectCount();

    List<Goods> findByPage(HashMap<String,Object> map);

    List<Goods> findCondition(Map<String,Object> conMap);

    int delete(int id);

    Goods findById(int id);

    int update(Goods goods);
}