package com.service;

import com.dao.EmpDAO;
import com.entity.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class EmpServiceImp implements EmpService {


    @Autowired
    private EmpDAO empDAO;

    @Override
    //插入
    public void insert(Emp emp) {
        emp.setId(UUID.randomUUID().toString());
        empDAO.insert(emp);
    }

    @Override
    public void delete(String id) {
        empDAO.delete(id);
    }

    @Override
    //修改
    public void update(Emp emp) {
        empDAO.update(emp);
    }

    @Override
    //查询一条
    public Emp queryOne(String id) {
        return empDAO.queryOne(id);
    }

    @Override
    //查询所有
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> findPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return empDAO.findPage(start,rows);
    }

    @Override
    //查询总条数
    public long findTotals() {
        return empDAO.findTotals();
    }


}
