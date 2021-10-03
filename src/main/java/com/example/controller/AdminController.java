package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author LianJunhong
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @RequestMapping({"/", "index"})
    public String index() {
        return "admin/index";
    }
}
