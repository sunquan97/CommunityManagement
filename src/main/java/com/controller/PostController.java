package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.PostService;
import com.service.ReplyPostService;
import com.service.ReplyService;
import com.pojo.PageUtil;
import com.pojo.Post;
import com.pojo.Reply;
import com.pojo.ReplyPost;
import com.pojo.UploadedFile;
import com.pojo.User;


@Controller
public class PostController {
	@Autowired 
	private PostService ser;
	@Autowired 
	private ReplyPostService ser1;
	@Autowired 
	private ReplyService ser2;
	
	//获取全部帖子，并分页
	@RequestMapping("/getPosts.action")
	public String getPosts(Model model,Integer currentPage,HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		Integer curPage=1;
		if(currentPage!=null) {
			curPage=currentPage;
		}
		PageUtil page=new PageUtil(20, ser.countByPosts(), curPage);
		List<Post> posts=ser.getPosts(page);
		model.addAttribute("posts",posts);
		model.addAttribute("page",page);
		model.addAttribute("user",user);
		return "jsp/question";
	}
	
	//根据id查询帖子
	@RequestMapping("/getPostById.action")
	public String getPostById(Model model,int postid,HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		Post post=ser.selectByPrimaryKey(postid);
		List<ReplyPost> replyposts=ser1.getReplyPostByPostId(postid);
		List<Post> posts=ser.getBestPostByPost();
		List<Reply> replys=ser2.getAllReplys();
		model.addAttribute("replys",replys);
		model.addAttribute("posts",posts);
		model.addAttribute("post",post);
		model.addAttribute("user",user);
		model.addAttribute("replyposts",replyposts);
		return "jsp/questiondetail";
	}
	
	@RequestMapping("/addjsp.action")
	public String addjsp(HttpServletRequest request) {
		return "jsp/addquestion";
	}
	
	//发布帖子
	@RequestMapping("/addPost.action")
	public String addPost(Post post, UploadedFile file,HttpServletRequest request) throws IllegalStateException, IOException {
		Date date=new Date();
		post.setCreatetime(date);
		String fileName = System.currentTimeMillis() + ".png";
		File newFile = new File(("C:\\images\\post\\"), fileName);
        newFile.getParentFile().mkdirs();
        file.getFile().transferTo(newFile);
        post.setImg(("/images/post/")+fileName);
		ser.insertSelective(post);
		return "forward:getPosts.action";
	}
	
	//回帖
	@RequestMapping("/addReplyPost.action")
	public String addReplyPost(ReplyPost replypost,HttpServletRequest request,int postid, UploadedFile file) throws IllegalStateException, IOException {
		String fileName = System.currentTimeMillis() + ".png";
		File newFile = new File(("C:\\images\\post\\"), fileName);
        newFile.getParentFile().mkdirs();
        file.getFile().transferTo(newFile);
        replypost.setImg(("/images/post/")+fileName);
		Date date=new Date();
		replypost.setCreatetime(date);
		replypost.setPostid(postid);
		ser1.insertSelective(replypost);
		int count=ser1.getReplyPostCount(postid);
		ser.insertCount(count,postid);
		return "forward:getPostById.action?postid="+postid+"";
	}
	
	//采纳
	@RequestMapping("/accept.action")
	public String accept(int replypostid,HttpServletRequest request,int postid) {
		ser1.accept(replypostid);
		ser.accept(postid);
		return "forward:getPostById.action?postid="+postid+"";
	}
	
	//编辑页面
	@RequestMapping("/editor.action")
	public String editor(Model model,int postid,HttpServletRequest request) {
		Post post=ser.selectByPrimaryKey(postid);
		model.addAttribute("post",post);
		return "jsp/EditorPost";
	}
	
	//修改帖子
	@RequestMapping("/UpdatePost.action")
	public String UpdatePost(Post post, UploadedFile file,HttpServletRequest request) throws IllegalStateException, IOException {
		Date date=new Date();
		post.setCreatetime(date);
		String fileName = System.currentTimeMillis() + ".png";
		File newFile = new File(("C:\\images\\post\\"), fileName);
        newFile.getParentFile().mkdirs();
        file.getFile().transferTo(newFile);
        post.setImg(("/images/post/")+fileName);
		ser.updateByPrimaryKeySelective(post);
		return "forward:getPosts.action";
	}
	
	//删除回帖
	@RequestMapping("/delReplyPost.action")
	public String delReplyPost(int postid,int replypostid,HttpServletRequest request) {
		ser1.deleteByPrimaryKey(replypostid);
		int count=ser1.getReplyPostCount(postid);
		ser.insertCount(count,postid);
		return "forward:getPostById.action?postid="+postid+"";
	}
	
	//删除帖子
	@RequestMapping("/delPost.action")
	public String delPost(int postid,HttpServletRequest request) {
		ser.deleteByPrimaryKey(postid);
		return "forward:getPosts.action";
	}
	
	//搜索帖子
	@RequestMapping("/searchPost.action")
	public String searchPost(String title,Model model,Integer currentPage,HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		Integer curPage=1;
		if(currentPage!=null) {
			curPage=currentPage;
		}
		PageUtil page=new PageUtil(20, ser.countBySearchPost(title), curPage);
		List<Post> posts=ser.searchPost(page,title);
		model.addAttribute("posts",posts);
		model.addAttribute("page",page);
		model.addAttribute("user",user);
		model.addAttribute("title",title);
		return "jsp/SearchPost";
	}
	
	
	
	@RequestMapping("/addReply.action")
	public String addReply(int replypostid,String replycontent,int postid,String username,String replyname,HttpServletRequest request) {
		Reply reply = new Reply();
		reply.setReplycontent(replycontent);
		Date date=new Date();
		reply.setCreatetime(date);
		reply.setUsername(username);
		reply.setReplypostid(replypostid);
		reply.setReplyname(replyname);
		ser2.insertSelective(reply);
		return "forward:getPostById.action?postid="+postid+"";
	}
	
	@RequestMapping("/addReplys.action")
	public String addReplys(int replypostid,String replycontent,int postid,String username,String replyname,HttpServletRequest request) {
		Reply reply = new Reply();
		reply.setReplycontent(replycontent);
		Date date=new Date();
		reply.setCreatetime(date);
		reply.setUsername(username);
		reply.setReplyname(replyname);
		reply.setReplypostid(replypostid);
		ser2.insertSelective(reply);
		return "forward:getPostById.action?postid="+postid+"";
	}
	
}
