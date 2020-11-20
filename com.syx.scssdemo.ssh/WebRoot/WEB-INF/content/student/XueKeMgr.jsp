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
  		if(request.getSession().getAttribute("stu")==null){
  			response.sendRedirect("student/login");
  			return;
  		}
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
                        <form action="" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">学生选课课程列表</h3>
                                </div>
                            </div>
                            <!-- <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp学期时间</label>
                                        <input type="text" class="form-control" name="Curricula" id="Curricula">
                                    </div>                               
                                </div>
                            </div> -->
                            <input type="hidden" value="<%=stu.getStuID() %>>" name="arg" id="arg">
                            <%--<button type="submit" class="btn btn-general btn-white">搜索</button>  
                            <button type="reset" class="btn btn-general btn-white" onclick="clk()">重置</button>--%>
                        </form>
                        <!--***** TABLE *****-->
                        <table class="table table-hover" id="coltab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>选课编号</th>
                                <th>课程名称</th>
                                <th>教学老师</th>
                                <th>课程教室</th>
                                <th>课程星期</th>
                                <th>课程节次</th>
                                <th>学时</th>
                                <th>学分</th>
                                <th>课程学期</th>
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
        $(document).ready(loaddep());
		    function loaddep(){	    	        
		   var tid=new Array();
		   $.ajax({
				url:"courseSchedule/CourseScheduleShow",
				type:"post",
				dataType:"json",
				success:function(data){
					for(var i=0;i<data.length;i++){
						tid[i]=data[i].teachTask.teachTaskID;
					}
					
					$.ajax({
				url:"schedule/ScheduleShowAll",
				type:"post",
				dataType:"json",
				success:function(data){
					$("#coltab tbody").html("");
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
								trhtml+="<tr class=''><th scope='row'>";
								}   
						trhtml+=data[i].teachTask.teachTaskID;
						trhtml+="</th><td>";
						trhtml+=data[i].teachTask.course.course;
						trhtml+="</td><td>";
						trhtml+=data[i].teachTask.teacher.name;
						trhtml+="</td><td>";
						trhtml+=data[i].classRoom.classRoomName;
						trhtml+="</td><td>";
						trhtml+=data[i].classTime;
						trhtml+="</td><td>";
						trhtml+=data[i].classfestival;
						trhtml+="</td><td>";
						trhtml+=data[i].teachTask.course.studyTime;
						trhtml+="</td><td>";
						trhtml+=data[i].teachTask.course.crediy;
						trhtml+="</td><td>";
						trhtml+=data[i].teachTask.curricula;
						trhtml+="</td>";
						for(var k=0;k<data.length;k++){
						if(data[i].teachTask.teachTaskID==tid[k]){
							trhtml+="<td><a href='JavaScript:void(0)"
							trhtml+="'>已选</a>";
							x=1;	
						}
						}
						if(x==0){
							trhtml+="<td><a href='courseSchedule/CourseScheduleInsert?TeachTaskID="
							trhtml+=data[i].teachTask.teachTaskID;
							trhtml+="'>选课</a>";
						}
						trhtml+="<a href='courseSchedule/CourseScheduleDelete?TeachTaskID="
						trhtml+=data[i].teachTask.teachTaskID;
						trhtml+="'>&nbsp&nbsp&nbsp&nbsp取消</a></td></tr>";
					} 					
					$("#coltab tbody").append(trhtml);
				},
				error:function(){
					alert("error");
				}
			});
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			}); 
		}
			function rowselect(index) {
				var tb = document.getElementById("coltab");				
				$("#CollegeID").val(tb.rows[index].cells[1].innerHTML);
				$("#CollegeName").val(tb.rows[index].cells[2].innerHTML);
				$("#Remark").val(tb.rows[index].cells[3].innerHTML);
				$("#CollegeID").attr("readOnly",true);
				$("#arg").val("update");
			}
			function inputreset() {
				$("#CollegeID").attr("readOnly", false);
			}
    </script> 
  </body>
</html>
