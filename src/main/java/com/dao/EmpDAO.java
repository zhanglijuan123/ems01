package com.dao;

import com.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpDAO {
    void insert(Emp emp);
    void delete(String id);
    void update(Emp emp);
    Emp queryOne(String id);
    List<Emp> findPage(@Param("start") Integer start, @Param("rows") Integer rows);
    long findTotals();

}
