package com.test;

import com.entity.Emp;
import com.service.EmpService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;


public class EmpServiceTest  extends BasicTest{
    @Autowired
    private EmpService empService;
    @Test
    public void insert(){
        Emp emp=new Emp();
        emp.setName("sdsfsdf");
        emp.setAge(23);
        emp.setSex("man");
        emp.setBirthday(new Date());
        empService.insert(emp);
    }
    @Test
    public void totals(){
        List<Emp> page = empService.findPage(1, 2);
        for (Emp emp : page) {
            System.out.print(emp);
        }

    }
    @Test
    public void  delete(){
        empService.delete("");
    }


    @Test
    public void findAll(){
        Emp emp = empService.queryOne("04b6e5aa-306c-4f4d-898e-95a2365b8899");
        System.out.println(emp);
    }

    @Test
    public void update(){
        Emp emp =new Emp();
        emp.setName("zhanglijuan");
        emp.setSex("wuman");
        emp.setAge(6);
        emp.setId("16bcdcad-3b1a-40b9-8832-85891bcf1fb2");
        emp.setBirthday(new Date());
        empService.update(emp);
    }
}
