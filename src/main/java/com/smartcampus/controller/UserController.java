package com.smartcampus.controller;

import com.smartcampus.entity.User;
import com.smartcampus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 用户的控制层
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

    //注入service
    @Autowired
    private UserService userService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login")
    public String login(@RequestParam String id, @RequestParam String password, Model model) {
        User user = userService.login(id);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                //登录成功
                return "page";
            } else {
                model.addAttribute("message", "登录失败");
                return "login";
            }
        } else {
            model.addAttribute("message", "你输入的用户名或密码有误");
            return "login";
        }
    }
}

