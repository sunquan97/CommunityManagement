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
        registry.addViewController("/").setViewName("jsp/login");
        registry.addViewController("/login").setViewName("jsp/login");
        registry.addViewController("/password").setViewName("jsp/password");
        registry.addViewController("/carLogin").setViewName("jsp/carlogin");
        registry.addViewController("/userLogin").setViewName("jsp/userlogin");
        registry.addViewController("/faceLogin").setViewName("jsp/facelogin");
        registry.addViewController("/registe").setViewName("jsp/registe");
        registry.addViewController("/index").setViewName("jsp/index");
        registry.addViewController("/addQuestion").setViewName("jsp/addquestion");
        registry.addViewController("/ConcurrentQuery").setViewName("jsp/Concurrent_Query");
        registry.addViewController("/EditorPost").setViewName("jsp/EditorPost");
        registry.addViewController("/EpidemicDetails").setViewName("jsp/Epidemic_Details");
        registry.addViewController("/EpidemicInformation").setViewName("jsp/Epidemic_Information");
        registry.addViewController("/ForeignEpidemic").setViewName("jsp/Foreign_epidemic");
        registry.addViewController("/home").setViewName("jsp/home");
        registry.addViewController("/myOrder").setViewName("jsp/myOrder");
        registry.addViewController("/necessities").setViewName("jsp/necessities");
        registry.addViewController("/Order").setViewName("jsp/Order");
        registry.addViewController("/page").setViewName("jsp/page");
        registry.addViewController("/PerimeterOutbreak").setViewName("jsp/Perimeter_outbreak");
        registry.addViewController("/question").setViewName("jsp/question");
        registry.addViewController("/questionDetail").setViewName("jsp/questiondetail");
        registry.addViewController("/release").setViewName("jsp/release");
        registry.addViewController("/SearchPost").setViewName("jsp/SearchPost");
        registry.addViewController("/security").setViewName("jsp/security");
        registry.addViewController("/userList").setViewName("jsp/user_list");
        registry.addViewController("/UserInfo").setViewName("jsp/UserInfo");
        registry.addViewController("/userLogin").setViewName("jsp/userlogin");
        registry.addViewController("/VehicleList").setViewName("jsp/Vehicle_List");

        //super.addViewControllers(registry);
    }

}