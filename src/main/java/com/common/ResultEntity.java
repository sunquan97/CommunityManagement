package com.common;

import net.sf.json.JSONObject;

public class ResultEntity {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 状态取自ResultEnum
     */
    private String status;
    private String msg; /*字符形式结果*/
    private Object data;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String toString() {
        return JSONObject.fromObject(this).toString();
    }
}
