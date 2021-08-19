package com.pojo;

public class VehicleRole {
    private Integer vehicleroleid;

    private String vehiclerolename;

    public Integer getVehicleroleid() {
        return vehicleroleid;
    }

    public void setVehicleroleid(Integer vehicleroleid) {
        this.vehicleroleid = vehicleroleid;
    }

    public String getVehiclerolename() {
        return vehiclerolename;
    }

    public void setVehiclerolename(String vehiclerolename) {
        this.vehiclerolename = vehiclerolename == null ? null : vehiclerolename.trim();
    }
}