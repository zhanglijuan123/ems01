package com.controller;

import com.entity.Sys;
import com.service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/sys")
public class SysController {
    @Autowired
    private SysService sysService;

    @RequestMapping("/query")
    @ResponseBody
    public List<Sys> query(){
        List<Sys> sys=sysService.query();
        return sys;
    }

}
