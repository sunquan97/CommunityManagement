package com.pojo;

import java.util.Date;

public class HealthInfo {
    private Integer id;

    private String name;

    private String idnumber;

    private String phonenumber;

    private String physicalcondition;

    private String temperature;

    private String iscontact;

    private Date filltime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber == null ? null : idnumber.trim();
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber == null ? null : phonenumber.trim();
    }

    public String getPhysicalcondition() {
        return physicalcondition;
    }

    public void setPhysicalcondition(String physicalcondition) {
        this.physicalcondition = physicalcondition == null ? null : physicalcondition.trim();
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature == null ? null : temperature.trim();
    }

    public String getIscontact() {
        return iscontact;
    }

    public void setIscontact(String iscontact) {
        this.iscontact = iscontact == null ? null : iscontact.trim();
    }

    public Date getFilltime() {
        return filltime;
    }

    public void setFilltime(Date filltime) {
        this.filltime = filltime;
    }
}