package com.service;


import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

public interface DoctorRoomService {
    void addAppointment(String json, HttpServletRequest request) throws ParseException;
}
