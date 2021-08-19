package com.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class outinfor {
    private Integer id;

    private String title;

    private String summary;

    private String infosource;

    private String sourceurl;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date pubdatestr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    public String getInfosource() {
        return infosource;
    }

    public void setInfosource(String infosource) {
        this.infosource = infosource == null ? null : infosource.trim();
    }

    public String getSourceurl() {
        return sourceurl;
    }

    public void setSourceurl(String sourceurl) {
        this.sourceurl = sourceurl == null ? null : sourceurl.trim();
    }

    public Date getPubdatestr() {
        return pubdatestr;
    }

    public void setPubdatestr(Date pubdatestr) {
        this.pubdatestr = pubdatestr;
    }
}