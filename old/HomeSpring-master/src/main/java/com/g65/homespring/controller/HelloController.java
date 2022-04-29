package com.g65.homespring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author LianJunhong
 */
@Controller
public class HelloController {
    @RequestMapping("/index")
    public String sayHello(){
        return "hello";
    }
}
