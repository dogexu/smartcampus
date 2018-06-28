package com.smartcampus.dao;

import com.smartcampus.entity.Orders;

public interface OrdersMapper {
    int insert(Orders record);

    int insertSelective(Orders record);
}