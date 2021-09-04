package com.pojo;

import java.util.Date;

public class HouseService {
    private Integer id;

    private String serviecName;

    private Date appointmentTime;

    private String address;

    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getServiecName() {
        return serviecName;
    }

    public void setServiecName(String serviecName) {
        this.serviecName = serviecName == null ? null : serviecName.trim();
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }
}