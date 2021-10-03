package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author LianJunhong
 */
@Controller
@RequestMapping("device")
public class DeviceController {

    @RequestMapping("light")
    public String light() {
        return "device/light";
    }

    @RequestMapping("door")
    public String door() {
        return "device/door";
    }

    @RequestMapping("sensor")
    public String sensor() {
        return "device/sensor";
    }

    @RequestMapping("fans")
    public String fans() {
        return "device/fans";
    }

    @RequestMapping("factory")
    public String factory() {
        return "device/factory";
    }
}
