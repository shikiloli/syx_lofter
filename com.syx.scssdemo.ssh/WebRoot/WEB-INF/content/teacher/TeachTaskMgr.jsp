<%@page import="util.util"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

  </head>
  
  <body>
   <%
  		if(request.getSession().getAttribute("tea")==null){
  			response.sendRedirect("teacher/login");
  			return;
  		}
  		int num=0;
	%>
   <!--====================================================
                         MAIN NAVBAR
======================================================-->        
    <%@ include file="head.jsp"%>

<!--====================================================
                        PAGE CONTENT
======================================================-->
    <div class="page-content d-flex align-items-stretch">

        <%@ include file="side.jsp"%>

            <!--***** CONTENT *****-->     
            <div class="row">
                <div class="col-md-12">

                    <!--***** USER INFO *****-->
                    <div class="card form" id="form1">
                        <form action="ClassManger" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">开课信息管理</h3>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp所属分院</label>
                                        <select class="form-control" id="colselect" name="CollegeID" onchange="loadde()">																		
										
									</select>
                                    </div> 
                                    <div class="form-group">
                                      <div class="form-group">
                                        <label for="state">&nbsp&nbsp所属专业</label>
                                        <select class="form-control" id="proselect" name="ProfessionID" onchange="loadcla()">																		
										
									</select>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp所属系</label>
                                        <select class="form-control" id="deselect" name="DepartmentID" onchange="loadpro()">																		
										
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp开课学期</label>
                                        <input type="text" class="form-control" value="<%=util.getNowXue() %>" name="Curricula" id="Curricula" readonly="readonly">
                                    </div>  
                                </div>
                            </div> 
                            <input type="hidden" value="<%=tea.getTeacherID() %>" name="arg" id="arg">
                        <!--***** TABLE *****-->
                        <table class="table table-hover" id="clatab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>课程编号</th>
                                <th>开课课程</th>
                                <th>所属分院</th>
                                <th>所属系</th>
                                <th>所属专业</th>
                                <th>学时</th>
                                <th>学分</th>
                                <th>开课状态</th>
                                <th>操作</th>
                              </tr>
                            </thead>
                            <tbody>
                              
                              
                            </tbody>
                          </table>
                    </div>
                    

    <!--Global Javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper/popper.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/jquery.validate.min.js"></script> 
    <script src="js/chart.min.js"></script> 
    <script src="js/front.js"></script> 
    
    <!--Core Javascript -->
        <script>
        $(document).ready(loadcols());
        $(document).ready(da());
		function loadcols(){			
			$.ajax({
				url:"college/CollegeShow",
				type:"post",
				dataType:"json",
				success:function(data){
					for(var i=0;i<data.length;i++){
						$("#colselect").append("<option value='"+data[i].collegeID+"'>"+data[i].collegeName+"</option>");
					}
					loadde();
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
		
		function loadde(){
			var id=$("#colselect").find("option:selected").val();
			$.ajax({
				url:"department/DepartmentShow",
				type:"post",
				dataType:"json",
				data:{"CollegeID":id},
				success:function(data){
				$("#deselect").html("");
					for(var i=0;i<data.length;i++){
						$("#deselect").append("<option value='"+data[i].departments[i].departmentID+"'>"+data[i].departments[i].departmentName+"</option>");
					}
					loadpro();
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
		
		function loadpro(){
			var id=$("#deselect").find("option:selected").val();
			$.ajax({
				url:"profession/ProfessionShow",
				type:"post",
				dataType:"json",
				data:{"DepartmentID":id},
				success:function(data){
				$("#proselect").html("");
					for(var i=0;i<data.length;i++){
						$("#proselect").append("<option value='"+data[i].professions[i].professionID+"'>"+data[i].professions[i].professionName+"</option>");
					}
					loadcla();
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
		function loadcla(){
			var cour = new Array();
			var tid=$("#arg").val();
			var id=$("#proselect").find("option:selected").val();
			$.ajax({
				url:"teachTask/TeachTaskShow",
				type:"post",
				dataType:"json",
				data:{"TeacherID":tid},
				success:function(data){
					for(var i=0;i<data.length;i++){
						cour[i]=data[i].course.courseID;
					}
					
				$.ajax({
				url:"course/CourseShow",
				type:"post",
				dataType:"json",
				data:{"ProfessionID":id},
				success:function(data){
					$("#clatab tbody").html("");
				     var trhtml="";
				     var num=1;
				     for(var i=0;i<data.length;i++){
				     var x=0;
				     var j = i + 1;
							if (j % 2 == 0 && num == 1) {
								trhtml+="<tr class='table-warning'><th scope='row'>";
								num++;
							} else if (j % 2 == 0 && num == 2) {
								trhtml+="<tr class='table-success'><th scope='row'>";
								num++;
							} else if (j % 2 == 0 && num == 3) {
								trhtml+="<tr class='table-danger'><th scope='row'>";
								num++;
							} else if (j % 2 == 0 && num == 4) {
								trhtml+="<tr class='table-info'><th scope='row'>";
								num = 1;
							} else {
								trhtml+="<tr><th scope='row'>";
								}   
						trhtml+=data[i].courses[i].courseID;
						trhtml+="</th><td>";
						trhtml+=data[i].courses[i].course;
						trhtml+="</td><td>";
						trhtml+=$("#colselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=$("#deselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=$("#proselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=data[i].courses[i].studyTime;
						trhtml+="</td><td>";
						trhtml+=data[i].courses[i].crediy;
						trhtml+="</td>";
						for(var k=0;k<10;k++){
						if(data[i].courses[i].courseID==cour[k]){
						trhtml+="<td>已开课</td>";
						trhtml+="<td><a href='JavaScript:void(0)'>开课</a>&nbsp;&nbsp;"
						x=1;
						}
						}
						if(x==0){
						trhtml+="<td>未开课</td>";
						trhtml+="<td><a href='teachTask/TeachTaskInsert?CourseID="
						trhtml+=data[i].courses[i].courseID;
						trhtml+="'>开课</a>&nbsp;&nbsp;"
						}
						
						trhtml+="<a href='teachTask/TeachTaskDelete?CourseID="
						trhtml+=data[i].courses[i].courseID;
						trhtml+="'>取消</a></td></tr>";
					} 					
					$("#clatab tbody").append(trhtml);
				},
				error:function(){
					alert(id);
				}
			});
					
				},
				error:function(){
					alert("没收到");
				}
			});
		
		   
		 
		}
    </script> 
  </body>
</html>
