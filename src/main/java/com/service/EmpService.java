package com.service;


import com.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpService {
    void insert(Emp emp);
    void delete(String id);
    void update(Emp emp);
    Emp queryOne(String id);
    List<Emp> findPage(Integer page,Integer rows);
    long findTotals();
}
