package com.smartcampus.controller;

import com.smartcampus.entity.Goods;
import com.smartcampus.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 这是商品管理的Controller层
 *
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsController {

    /**
     * 注入service层
     * 使用@Resource和@Autowired都可以实现Bean的自动注入
     */
    @Autowired
    private GoodsService goodsService;

    /**
     * 跳转到添加商品功能页面
     */
    @RequestMapping("/toSavePage")
    public String toSavePage() {
        return "save";
    }

    /**
     * 跳转到商品列表页面
     */
    @RequestMapping(value = "/toListPage")
    public String toListPage() {
        return "redirect:findByPage.do";
    }

    /**
     * 商品信息保存的方法
     */
    @RequestMapping(value = "/save")
    public String save(Goods goods, Model model) {
        goodsService.save(goods);
        model.addAttribute("message", "保存商品信息成功");
        return "info";
    }

    /**
     * 商品信息列表（分页查询功能）
     */
    @RequestMapping(value="/findByPage")
    public String findByPage(@RequestParam(value="pageCode",defaultValue = "1",required = false)int pageCode,
                             @RequestParam(value="pageSize",defaultValue = "2",required = false)int pageSize,
                             HttpServletRequest request,
                             Model model){
        // 封装分页数据
        String g_name = request.getParameter("g_name");
        String g_price = request.getParameter("g_price");
        Map<String,Object> conMap = new HashMap<String,Object>();
        conMap.put("g_name",g_name);
        conMap.put("g_price",g_price);

        // 回显数据
        model.addAttribute("main",goodsService.findByPage(pageCode,pageSize,conMap));
        return "list";
    }

    /**
     * 商品信息删除的方法
     */
    @RequestMapping(value="/delete")
    public String delete(@RequestParam int id,Model model){
        if(goodsService.delete(id) > 0){
            model.addAttribute("message","删除商品信息成功");
            return "info";
        }else{
            model.addAttribute("message","删除商品信息失败");
            return "info";
        }
    }

    /**
     * 根据id查询商品信息方法
     */
    @ResponseBody
    @RequestMapping(value="/findById")
    public Goods findById(@RequestBody Goods goods){
        Goods goods_info = goodsService.findById(goods.getId());
        if(goods_info != null){
            return goods_info;
        }else{
            return null;
        }
    }

    /**
     * 更新商品信息的方法
     */
    @RequestMapping(value="/update")
    public String update(Goods goods,Model model){
        int rows = goodsService.update(goods);
        System.out.println("111111111111111111");
        if(rows > 0){
            model.addAttribute("message","更新商品信息成功");
            return "info";
        }else{
            model.addAttribute("message","更新商品信息失败");
            return "info";
        }

    }

}
