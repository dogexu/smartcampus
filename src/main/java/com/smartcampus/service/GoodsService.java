package com.smartcampus.service;

import com.smartcampus.entity.Goods;
import com.smartcampus.entity.PageBean;

import java.util.Map;

public interface GoodsService {
    void save(Goods goods);

    // 这里要手动设置为pageBean
//    Object findByPage(int pageCode, int pageSize, Map<String,Object> conMap);
    PageBean<Goods> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);

    int delete(int id);

    Goods findById(int id);

    int update(Goods goods);
}
