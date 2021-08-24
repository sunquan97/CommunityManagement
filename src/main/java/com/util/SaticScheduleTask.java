package com.util;

import com.pojo.outinfor;
import com.service.OutinforService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Component
// 2.开启定时任务
public class SaticScheduleTask {
    //3.添加定时任务

    @Autowired
    private OutinforService ser;
    //或直接指定时间间隔，例如：每1小时执行一次
    private static ApplicationContext context;

    @Scheduled(cron = "0 0 0/1 * * ?")
    //@Scheduled(fixedRate = 10000)
    private void configureTasks() throws Exception {
        Map map=new HashMap();
        map.put("key","7dcef006b46a8fc296af6b3266cf6a10");
        SendData.Response response = SendData.doPost("https://api.tianapi.com/txapi/ncov/index?key=7dcef006b46a8fc296af6b3266cf6a10", null,map.toString(), false);
        String result=response.getResultStr();
        JSONObject obejcts=JSONObject.fromObject(result);
        JSONArray newslist = (JSONArray) obejcts.get("newslist");
        JSONObject news= (JSONObject) newslist.get(0);
        JSONArray news1= (JSONArray) news.get("news");
        for(int i=0;i<news1.size();i++){
            JSONObject object= (JSONObject) news1.get(i);
            Integer id = (Integer) object.get("id");
            String title = (String) object.get("title");
            String summary = (String) object.get("summary");
            String infosource = (String) object.get("infoSource");
            String sourceurl = (String) object.get("sourceUrl");
            outinfor outinfor= new outinfor();
            outinfor.setId(id);
            outinfor.setTitle(title);
            Date date=new Date();
            outinfor.setPubdatestr(date);
            outinfor.setInfosource(infosource);
            outinfor.setSummary(summary);
            outinfor.setSourceurl(sourceurl);
            if(ser.selectByPrimaryKey(outinfor.getId())==null) {
                ser.insertSelective(outinfor);
            }
        }
    }

}
