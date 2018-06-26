package com.smartcampus.serviceImpl;

import com.smartcampus.dao.GoodsMapper;
import com.smartcampus.entity.Goods;
import com.smartcampus.entity.PageBean;
import com.smartcampus.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {
    /**
     * 注入
     */
    @Autowired
    private GoodsMapper goodsMapper;
    /**
     * 商品信息保存的方法
     */
    public void save(Goods goods) {
        goodsMapper.save(goods);
    }

    /**
     * 分页查询的方法
     */
    public PageBean<Goods> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Goods> pageBean = new PageBean<Goods>();

        //封装当前页
        pageBean.setPageCode(pageCode);
        pageBean.setPageSize(pageSize);

        // 封装总记录数（从数据库中查询）
        int totalCount = goodsMapper.selectCount();
        System.out.println("查询到的总记录数："+totalCount);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);
        pageBean.setTotalPage(num.intValue());

        // 设置limit分页查询的起始位置和终止位置
        map.put("start",(pageCode - 1) * pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<Goods> list = goodsMapper.findByPage(map);
        pageBean.setBeanList(list);

        // 分页查询功能也要封装显示起始页和终止页
        conMap.put("start",(pageCode - 1) * pageSize);
        conMap.put("size",pageBean.getPageSize());

        // 封装
        List<Goods> listCondition = goodsMapper.findCondition(conMap);
        pageBean.setBeanList(listCondition);

        return pageBean;
    }

    /**
     * 根据id删除信息的方法
     */
    public int delete(int id) {
        return goodsMapper.delete(id);
    }

    /**
     * 根据商品id查询商品信息的方法
     */
    public Goods findById(int id) {
        return goodsMapper.findById(id);
    }

    /**
     * 更新商品信息的方法
     */
    public int update(Goods goods) {
        return goodsMapper.update(goods);
    }
}

