package com.smartcampus.dao;

import com.smartcampus.entity.User;

public interface UserMapper {
    User login(String username);
}
