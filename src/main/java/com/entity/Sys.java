package com.entity;

public class Sys {
private  String sysid;
private String sysname;
private String admid;
private String admname;

    public Sys() {
        super();
    }

    public String getSysid() {
        return sysid;
    }

    public void setSysid(String sysid) {
        this.sysid = sysid;
    }

    public String getSysname() {
        return sysname;
    }

    public void setSysname(String sysname) {
        this.sysname = sysname;
    }

    public String getAdmid() {
        return admid;
    }

    public void setAdmid(String admid) {
        this.admid = admid;
    }

    public String getAdmname() {
        return admname;
    }

    public void setAdmname(String admname) {
        this.admname = admname;
    }

    public Sys(String sysid) {

        this.sysid = sysid;
    }

    public Sys(String sysid, String sysname, String admid, String admname) {
        this.sysid = sysid;
        this.sysname = sysname;
        this.admid = admid;
        this.admname = admname;
    }

    @Override
    public String toString() {
        return "Sys{" +
                "sysid='" + sysid + '\'' +
                ", sysname='" + sysname + '\'' +
                ", admid='" + admid + '\'' +
                ", admname='" + admname + '\'' +
                '}';
    }
}
