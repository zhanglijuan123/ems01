package com.service;

import com.dao.SysDAO;
import com.entity.Sys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class SysServiceImp implements SysService {
    @Autowired
    private SysDAO sysDAO;
    @Override
    public List<Sys> query() {
        List<Sys> sys=sysDAO.query();
        return null;
    }
}
