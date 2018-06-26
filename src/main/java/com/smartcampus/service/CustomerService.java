package com.smartcampus.service;

import com.smartcampus.entity.Customer;
import com.smartcampus.entity.PageBean;

import java.util.Map;

public interface CustomerService {

    void save(Customer customer);

    // 这里要手动设置为pageBean
//    Object findByPage(int pageCode, int pageSize, Map<String,Object> conMap);
    PageBean<Customer> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);

    int delete(int c_id);

    Customer findById(int c_id);

    int update(Customer customer);
}
