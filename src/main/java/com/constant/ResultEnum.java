package com.constant;

public enum ResultEnum {

    SUCCESS("1","成功"),
    FAIL("0","失败"),
    BUSY("1-","系统繁忙");

    private final String code;
    private final String desc;

    ResultEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    /**
     * 获取枚举值
     */
    public static String getDesc(String code) {
        String desc = code;
        for (ResultEnum bn : values()) {
            if (bn.getCode().equals(code)) {
                desc = bn.desc;
                break;
            }
        }
        return desc;
    }
}
