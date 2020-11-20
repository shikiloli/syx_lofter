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
                        <form action="TeachTaskManger?TeacherID=<%=tea.getTeacherID()%>" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">开课信息预览</h3>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                     <div class="form-group">
                                        <label for="city">&nbsp&nbsp关键字</label>
                                        <input type="text" class="form-control" name="Curricula" id="Curricula">
                                    </div>                             
                                </div>
                            </div>
                            <input type="hidden" value="search" name="arg" id="arg">
                        </form>
                        <!--***** TABLE *****-->
                        <table class="table table-hover" id="coltab">
                            <thead id="theader">
                              <tr class="bg-info text-white">
                                <th>教师编号</th>
                                <th>教师名字</th>
                                <th>开课课程</th>
                                <th>学时</th>
                                <th>学分</th>
                                <th>开课学期</th>
                                <th>审核状态</th>
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
    <script type="text/javascript">   
    $().ready(function(){  
      $("#Curricula").keyup(  
        function(){            
          $("table tr:gt(0)").hide();  
          var $d = $("table tr:gt(0)").filter(":contains('"+$.trim($("#Curricula").val())+"')");  
          $d.show();            
        }  
      )  
    })    
  </script>
		<script type="text/javascript">
		 $(document).ready(loaddep());
			 function loaddep(){	    
			 $.ajax({
				url:"teachTask/TeachTaskSelect",
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
						trhtml+=data[i].teacher.teacherID;
						trhtml+="</th><td>";
						trhtml+=data[i].teacher.name;
						trhtml+="</td><td>";
						trhtml+=data[i].course.course;
						trhtml+="</td><td>";
						trhtml+=data[i].course.studyTime;
						trhtml+="</td><td>";
						trhtml+=data[i].course.crediy;
						trhtml+="</td><td>";
						trhtml+=data[i].curricula;
						trhtml+="</td><td>";
						trhtml+=data[i].auditing;
						trhtml+="</td></tr>";
					} 					
					$("#coltab tbody").append(trhtml);
				},
				error:function(){
					alert(id);
				}
			}); 
			}
		</script>  
  </body>
</html>
