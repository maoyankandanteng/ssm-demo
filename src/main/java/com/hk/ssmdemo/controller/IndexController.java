package com.hk.ssmdemo.controller;

import com.hk.ssmdemo.domain.User;
import com.hk.ssmdemo.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private IUserService userService;

    @RequestMapping("/show")
    public String index(){
        return "index";
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<User> list(){
        List<User> list = userService.list();
        return list;
    }
}
