package com.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Vehicle {
    private Integer vehicleid;

    private String owner;

    private String phonenumber;

    private Integer vehicleroleid;

    private String vehiclenumber;
    
    private VehicleRole vehiclerole;
    
    private Integer flag;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createtime;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date finite_time;

    public Date getFinite_time() {
		return finite_time;
	}

	public void setFinite_time(Date finite_time) {
		this.finite_time = finite_time;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Integer getVehicleid() {
        return vehicleid;
    }


	public VehicleRole getVehiclerole() {
		return vehiclerole;
	}

	public void setVehiclerole(VehicleRole vehiclerole) {
		this.vehiclerole = vehiclerole;
	}

	public void setVehicleid(Integer vehicleid) {
        this.vehicleid = vehicleid;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner == null ? null : owner.trim();
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber == null ? null : phonenumber.trim();
    }

    public Integer getVehicleroleid() {
        return vehicleroleid;
    }

    public void setVehicleroleid(Integer vehicleroleid) {
        this.vehicleroleid = vehicleroleid;
    }

    public String getVehiclenumber() {
        return vehiclenumber;
    }

    public void setVehiclenumber(String vehiclenumber) {
        this.vehiclenumber = vehiclenumber == null ? null : vehiclenumber.trim();
    }
}