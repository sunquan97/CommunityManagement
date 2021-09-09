package com.controller;

import com.common.ResultEntity;
import com.constant.ResultEnum;
import com.pojo.Asistant;
import com.pojo.User;
import com.service.AppointmentService;
import com.service.AssistantService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

@Controller
@RequestMapping(value = "/appointment", produces = "application/json;charset=UTF-8")
public class AppointmentController {


    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private AssistantService assistantService;

    @ResponseBody
    @PostMapping(value = "/getProvinces")
    public String getProvinces(){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getProvinces());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }

    @ResponseBody
    @PostMapping(value = "/getCitys")
    public String getCitys(@RequestBody String json){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getCitys(json));
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }

    @ResponseBody
    @PostMapping(value = "/getHospital")
    public String getHospital(){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getHospital());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }

    @ResponseBody
    @PostMapping(value = "/getDepartment")
    public String getDepartment(){
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getDepartment());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }

    @RequestMapping(value = "/confirm")
    public String confirm(Model model, String province,String city,String hospital,String department){
        model.addAttribute("province",province);
        model.addAttribute("city",city);
        model.addAttribute("hospital",hospital);
        model.addAttribute("department",department);
        return "jsp/schedulInfo";
    }

    @ResponseBody
    @PostMapping(value = "/addAppointment")
    public String addAppointment(@RequestBody String json, HttpServletRequest request){
        ResultEntity resultEntity = new ResultEntity();
        try {
            appointmentService.addAppointment(json,request);
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        }catch (Exception e){
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }



    @ResponseBody
    @PostMapping(value = "/getProjects")
    public String getProjects() {
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getProjects());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        } catch (Exception e) {
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }


    @ResponseBody
    @PostMapping(value = "/getCares")
    public String getCares() {
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getCares());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        } catch (Exception e) {
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }


    @ResponseBody
    @PostMapping(value = "/getAssistant")
    public String getAssistant() {
        ResultEntity resultEntity = new ResultEntity();
        try {
            resultEntity.setData(appointmentService.getAssistant());
            resultEntity.setMsg("操作成功");
            resultEntity.setStatus(ResultEnum.SUCCESS.getCode());
        } catch (Exception e) {
            resultEntity.setMsg("操作失败");
            resultEntity.setStatus(ResultEnum.FAIL.getCode());
        }
        JSONObject resultJson = JSONObject.fromObject(resultEntity);
        return resultJson.toString();
    }



    @RequestMapping(value = "/addAssistant")
    public String addAssistant(Model model,Asistant asistant,MultipartFile allFile, HttpServletRequest request) throws IOException {
        Path path = Paths.get(  "C:\\images\\assistantFile\\" + allFile.getOriginalFilename());
        allFile.transferTo(path);
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        Date date = new Date();
        asistant.setApplyUser(user.getUsername());
        asistant.setApplyTime(date);
        asistant.setFile("images\\assistantFile\\" + allFile.getOriginalFilename());
        assistantService.insertSelective(asistant);
        model.addAttribute("result","申请成功");
        return "jsp/actingAssistant";
    }
}
