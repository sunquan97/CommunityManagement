package com.pojo;

import java.util.Date;

public class ReplyPost {
    private Integer replypostid;

    private Integer postid;

    private String content;

    private Date createtime;

    private Integer flag;
    
    private String username;
    
    private String img;

    public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getReplypostid() {
        return replypostid;
    }

    public void setReplypostid(Integer replypostid) {
        this.replypostid = replypostid;
    }

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
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
}