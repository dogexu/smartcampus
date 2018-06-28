package com.smartcampus.dao;

import com.smartcampus.entity.Card;

public interface CardMapper {
    int insert(Card record);

    int insertSelective(Card record);
}