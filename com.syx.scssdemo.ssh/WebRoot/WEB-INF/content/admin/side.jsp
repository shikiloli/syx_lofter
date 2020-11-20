<%@page import="model.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!--***** SIDE NAVBAR *****-->
<%
  		//if(request.getSession().getAttribute("user")==null){
  			//response.sendRedirect("login.jsp");
  		//}
  		Admin admin=(Admin)request.getSession().getAttribute("admin");
	%>
        <nav class="side-navbar">
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="adminphoto/<%=admin.getAdminID()%>.jpg" alt="..." class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4"><%=(((Admin)request.getSession().getAttribute("admin"))).getAdminName()%></h1>
                </div>
            </div>
            <hr>
            <!-- Sidebar Navidation Menus-->
            <ul class="list-unstyled">
                <li><a href="#apps" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>基本信息管理</a>
                    <ul id="apps" class="collapse list-unstyled">
                    
                    	<% 
						if(admin!=null){
						if(admin.getRole().equals("超级管理员")){%>
                    	<li><a href="admin/AdminMgr">账户基本信息管理</a></li>
                    	<%
                    		}}
                    	%>
                        <li><a href="admin/CollegeMgr">学院基本信息管理</a></li> 
                        <li><a href="admin/DepartmentMgr">系基本信息管理</a></li> 
                        <li><a href="admin/ProfessionMgr">专业基本信息管理</a></li> 
                        <li><a href="admin/ClassMgr">班级基本信息管理</a></li>
                        <li><a href="admin/ClassRoomMgr">教室基本信息管理</a></li>
                        <li><a href="admin/CourseMgr">课程基本信息管理</a></li>  
                        <li><a href="admin/TeacherMgr">教师基本信息管理</a></li> 
                        <li><a href="admin/StudentMgr">学生基本信息管理</a></li> 
                    </ul>
                </li>
                <li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>个人信息维护 </a>
                    <ul id="elements" class="collapse list-unstyled">
                        <li><a href="admin/PersonalMgr">管理员信息维护</a></li> 
                        <li><a href="admin/PasswordMgr">账户密码更改</a></li>  
                    </ul>
                </li>
                <li><a href="#forms" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-building-o"></i>审核管理 </a>
                    <ul id="forms" class="collapse list-unstyled">
                        <li><a href="admin/AuditingMgr">教师开课审核</a></li> 
                    </ul>
                </li>
                <li class="active"><a href="#pages" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-o"></i>公告管理</a>
                    <ul id="pages" class="collapse list-unstyled">
                        <li><a href="admin/Notice">公告添加</a></li> 
                        <li><a href="admin/NoticeInfo">公告管理</a></li> 
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="content-inner chart-cont">
