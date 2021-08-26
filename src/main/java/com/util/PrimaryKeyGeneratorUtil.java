package com.util;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Component
public class PrimaryKeyGeneratorUtil {
    public String getPrimaryKeyGenerator(){
        String replace = UUID.randomUUID().toString().replace("-", "").substring(0,20);
        return replace;
    }
    public static String getPrimaryKeyGeneratorStatic(){
        SimpleDateFormat formatter= new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date(System.currentTimeMillis());
        String dateTime = formatter.format(date);
        String replace = UUID.randomUUID().toString().replace("-", "").substring(0,8);
        return dateTime+replace;
    }
}
