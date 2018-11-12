package com.controller;

import com.entity.Emp;
import com.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("emp")
public class EmpController {
    @Autowired
    private EmpService empService;
    @RequestMapping("/insert")
    @ResponseBody
    public void insertEmp(Emp emp){
        empService.insert(emp);
    }
    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        Map<String,Object>  map=new HashMap<String,Object>();
        //当前条数
        List<Emp> emps=empService.findPage(page,rows);
        //总条数
        long totals=empService.findTotals();
        map.put("total",totals);
        map.put("rows",emps);
        return map;
    }

    //删除一条数据
    @RequestMapping("/delete")
    @ResponseBody
    public void  delete(String id){
        empService.delete(id);
    }
    @RequestMapping("/update")
    public @ResponseBody void  update(Emp emp){
        empService.update(emp);
    }
    //查找一条数据
    @RequestMapping("/queryOne")
    public @ResponseBody Emp  queryOne(String id){
        Emp emp = empService.queryOne(id);
        return emp;
    }
    //批量删除
    @RequestMapping("deleteList")
    @ResponseBody
    public  void delete(String[] id){
        for (String s : id) {
            empService.delete(s);
        }

    }
}
