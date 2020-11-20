<%@page import="model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!--***** SIDE NAVBAR *****-->
<%
  		if(request.getSession().getAttribute("tea")==null){
  			response.sendRedirect("login.jsp");
  		}
  		Teacher tea=(Teacher)request.getSession().getAttribute("tea");
	%>
	    
        <nav class="side-navbar">
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="teacherphoto/<%=tea.getPhoto()%>.jpg" alt="..." class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4"><%=(((Teacher)request.getSession().getAttribute("tea"))).getName()%></h1>
                </div>
            </div>
            <hr>
            <!-- Sidebar Navidation Menus-->
            <ul class="list-unstyled">
                <li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>个人信息维护 </a>
                    <ul id="elements" class="collapse list-unstyled">
                        <li><a href="teacher/PersonalMgr">个人信息维护</a></li> 
                        <li><a href="teacher/PasswordMgr">账户密码更改</a></li>   
                    </ul>
                </li>
                <li><a href="#forms" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-building-o"></i>课程信息管理 </a>
                    <ul id="forms" class="collapse list-unstyled">
                        <li><a href="teacher/TeachTaskMgr">开课信息管理</a></li> 
                        <li><a href="teacher/TeachTask">开课信息预览</a></li>
                        <li><a href="teacher/ScheduleMgr">课程表编制</a></li>
                        <li><a href="teacher/CourseScheduleMgr">学生分数录入</a></li> 
                    </ul>
                </li>
                <li class="active"><a href="#pages" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-o"></i>公告</a>
                    <ul id="pages" class="collapse list-unstyled">
                        <li><a href="teacher/NoticeInfo">最近公告</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="content-inner chart-cont">
