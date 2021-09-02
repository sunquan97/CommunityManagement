package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;



@Configuration
@EnableWebMvc
@ComponentScan
public class WebViewConfig implements WebMvcConfigurer {
    /**
     * @Description: 注册jsp视图解析器
     */
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/"); //配置放置jsp文件夹
        resolver.setSuffix(".jsp");
        resolver.setViewNames("jsp/*");  //重要 setViewNames 通过它识别为jsp页面引擎
        resolver.setOrder(1);
        return resolver;
    }

    /**
     * @Description: 配置静态文件映射
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("jsp/login");//登录页面
        registry.addViewController("/login").setViewName("jsp/login");//登录页面
        registry.addViewController("/appointment").setViewName("jsp/appointment");//预约挂号页面
        registry.addViewController("/schedulInfo").setViewName("jsp/schedulInfo");//医生排班信息页面
        registry.addViewController("/carLogin").setViewName("jsp/carlogin");//车牌识别页面
        registry.addViewController("/userLogin").setViewName("jsp/userlogin");//人脸识别页面
        registry.addViewController("/faceLogin").setViewName("jsp/facelogin");//人脸识别页面
        registry.addViewController("/registe").setViewName("jsp/registe");//注册页面
        registry.addViewController("/index").setViewName("jsp/index");//首页
        registry.addViewController("/addQuestion").setViewName("jsp/addquestion");//发表帖子页面
        registry.addViewController("/ConcurrentQuery").setViewName("jsp/Concurrent_Query");
        registry.addViewController("/EditorPost").setViewName("jsp/EditorPost");//编辑帖子页面
        registry.addViewController("/ForeignEpidemic").setViewName("jsp/Foreign_epidemic");//国外疫情信息页面
        registry.addViewController("/home").setViewName("jsp/home");//首页子页面
        registry.addViewController("/myOrder").setViewName("jsp/myOrder");//我的订单页面
        registry.addViewController("/necessities").setViewName("jsp/necessities");//生活必需品页面
        registry.addViewController("/Order").setViewName("jsp/Order");//全部订单页面
        registry.addViewController("/page").setViewName("jsp/page");//公告页面
        registry.addViewController("/question").setViewName("jsp/question");//贴吧首页
        registry.addViewController("/questionDetail").setViewName("jsp/questiondetail");//帖子详情页面
        registry.addViewController("/release").setViewName("jsp/release");//发布公告页面
        registry.addViewController("/SearchPost").setViewName("jsp/SearchPost");//搜索帖子页面
        registry.addViewController("/security").setViewName("jsp/security");//管理安保人员页面
        registry.addViewController("/userList").setViewName("jsp/user_list");//管理社区居民页面
        registry.addViewController("/UserInfo").setViewName("jsp/UserInfo");//个人信息页面
        registry.addViewController("/userLogin").setViewName("jsp/userlogin");//用户登录页面
        registry.addViewController("/VehicleList").setViewName("jsp/Vehicle_List");//车辆管理页面
        registry.addViewController("/schedulInfo").setViewName("jsp/schedulInfo");//车辆管理页面
        registry.addViewController("/sendDoctors").setViewName("jsp/sendDoctors");//上门服务页面
        registry.addViewController("/healthInfo").setViewName("jsp/healthInfo");//健康信息填报页面


        //super.addViewControllers(registry);
    }

}