package com.smartcampus.dao;

import com.smartcampus.entity.ShopInfo;

public interface ShopInfoMapper {
    int insert(ShopInfo record);

    int insertSelective(ShopInfo record);
}