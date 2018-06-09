package com.group54.applicationInterceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ApplicationInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        ModelAndView modelAndView=new ModelAndView();
        String url=httpServletRequest.getRequestURI();
        HttpSession session=httpServletRequest.getSession();
        if(url.indexOf("login.do")>=0){
            return true;
        }


        if(session.getAttribute("role")!=null){
            //对非admin角色的修改表单行为进行拦截，只能对表单进行查看操作
            if(url.contains("add")||url.contains("edit")||url.contains("delete")){
                if((session.getAttribute("role").toString().equals("admin"))){
                    return true;
                }else{
                     //由于前端页面edit，add，delete均为异步操作，所以并不会跳转到指定页面。response重定向的url为空即可，前端就会进入error函数　
                    httpServletResponse.sendRedirect("");
                    return false;
                }
            }return true;
        }
        //如果session里没有值就跳转回登陆页面
        else {
            httpServletRequest.getRequestDispatcher("/admin/login.jsp").forward(httpServletRequest,httpServletResponse);
        }


        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
