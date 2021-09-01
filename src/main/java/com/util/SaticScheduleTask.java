package com.util;

import com.pojo.outinfor;
import com.service.OutinforService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Component
// 2.开启定时任务
public class SaticScheduleTask {
    //3.添加定时任务

    //或直接指定时间间隔，例如：每1小时执行一次
    private static ApplicationContext context;

    @Scheduled(cron = "0 0 0 0/1 * ?")
//    @Scheduled(fixedRate = 10000)
    private void delFile(){
        if (deleteDir(new File("C:\\images\\faceLogin") )){
            System.out.println("删除完毕");
        }
    }

    private boolean  deleteDir(File dir) {
        if (!dir.exists()) return false;
        if (dir.isDirectory()) {
            String[] childrens = dir.list();
            // 递归删除目录中的子目录下
            for (String child : childrens) {
                File file = new File(child);
                if (!file.delete()){
                    return false;
                }
            }
        }
        return true;
    }
}
