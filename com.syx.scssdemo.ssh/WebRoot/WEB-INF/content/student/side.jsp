<%@page import="model.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!--***** SIDE NAVBAR *****-->
<%
  		Student stu=(Student)request.getSession().getAttribute("stu");
	%>
	    
        <nav class="side-navbar">
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="stydentphoto/<%=stu.getStuID()%>.jpg" alt="..." class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4"><%=(((Student)request.getSession().getAttribute("stu"))).getName()%></h1>
                </div>
            </div>
            <hr>
            <!-- Sidebar Navidation Menus-->
            <ul class="list-unstyled">
                <li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>个人信息维护 </a>
                    <ul id="elements" class="collapse list-unstyled">
                        <li><a href="student/PersonalMgr">个人信息维护</a></li> 
                        <li><a href="student/PasswordMgr">账户密码更改</a></li>   
                    </ul>
                </li>
                <li><a href="#forms" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-building-o"></i>学生选课管理 </a>
                    <ul id="forms" class="collapse list-unstyled">
                        <li><a href="student/XueKeMgr">学生选课</a></li> 
                        <li><a href="student/CourseScheduleMgr">学生选课分数查询</a></li> 
                    </ul>
                </li>
                <li class="active"><a href="#pages" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-o"></i>公告</a>
                    <ul id="pages" class="collapse list-unstyled">
                        <li><a href="student/NoticeInfo">最近公告</a></li> 
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="content-inner chart-cont">
