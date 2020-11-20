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
            <!--***** CONTENT *****--!>     
            <div class="row">
                <div class="col-md-12">
                    <!--***** USER INFO *****-->
                    <div class="card form" id="form1">
                        <form action="CourseScheduleManger" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">学生分数查询</h3>
                                </div>
                            </div>
                            
                            <!--***** TABLE *****-->
                        <table class="table table-hover" id="coltab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>学生编号</th>
                                <th>学生姓名</th>
                                <th>开课编号</th>
                                <th>所选课程</th>
                                <th>课程学期</th>
                                <th>平时分数</th>
                                <th>作业分数</th>
                                <th>考核分数</th>
                                <th>总分数</th>
                              </tr>
                            </thead>
                            <tbody>
                              
                              
                            </tbody>
                          </table>
                    

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
			 $.ajax({
				url:"courseSchedule/CourseScheduleShow",
				type:"post",
				dataType:"json",
				success:function(data){
					$("#coltab tbody").html("");
				     var trhtml="";
				     var num=1;
				     for(var i=0;i<data.length;i++){
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
						trhtml+=data[i].student.stuID;
						trhtml+="</th><td>";
						trhtml+=data[i].student.name;
						trhtml+="</th><td>";
						trhtml+=data[i].teachTask.teachTaskID;
						trhtml+="</th><td>";
						trhtml+=data[i].teachTask.course.course;
						trhtml+="</td><td>";
						trhtml+=data[i].teachTask.curricula;
						trhtml+="</td><td>";
						trhtml+=data[i].scoreOne;
						trhtml+="</td><td>";
						trhtml+=data[i].scoreTwo;
						trhtml+="</td><td>";
						trhtml+=data[i].scoreThree;
						trhtml+="</td><td>";
						trhtml+=data[i].totalScore;
						trhtml+="</td></tr>"
					} 					
					$("#coltab tbody").append(trhtml);
				},
				error:function(){
					alert(id);
				}
			}); 
		}
			function rowselect(index) {
				var tb = document.getElementById("coltab");				
				$("#StuID").val(tb.rows[index].cells[0].innerHTML);
				$("#Name").val(tb.rows[index].cells[1].innerHTML);
				$("#TeachTaskID").val(tb.rows[index].cells[2].innerHTML);
				$("#Course").val(tb.rows[index].cells[3].innerHTML);
				$("#StuID").attr("readOnly",true);
			}
			function inputreset() {
				$("#StuID").attr("readOnly", false);
			}
    </script> 
  </body>
</html>
