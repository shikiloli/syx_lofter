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
  		if(request.getSession().getAttribute("admin")==null){
  			response.sendRedirect("admin/login");
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
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">教师开课信息审核</h3>
                                </div>
                            </div>
                            <!-- <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp学院</label>
                                        <select class="form-control" id="colselect" name="CollegeID" onchange="loadtea()">																		
										
									</select>
                                    </div>                               
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp教师名字</label>
                                        <select class="form-control" id="teaselect" name="TeacherID" onchange="loaddep()">																		
										
									</select>
                                    </div>                               
                                </div>
                            </div> -->
                            
                            <input type="hidden" value="search" name="arg" id="arg">
                            <%--<button type="submit" class="btn btn-general btn-white">搜索</button>  
                            <button type="reset" class="btn btn-general btn-white" onclick="clk()">重置</button>--%>
                        </form>
                        <!--***** TABLE *****-->
                        <table class="table table-hover" id="coltab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>教师编号</th>
                                <th>教师名字</th>
                                <th>课程编号</th>
                                <th>开课课程</th>
                                <th>学时</th>
                                <th>学分</th>
                                <th>开课学期</th>
                                <th>审核状态</th>
                                <th>审核操作</th>
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
        new Chart(document.getElementById("myChart-nav").getContext('2d'), {
          type: 'doughnut',
          data: {
            labels: ["M", "T", "W", "T", "F", "S", "S"],
            datasets: [{
              backgroundColor: [
                "#2ecc71",
                "#3498db",
                "#95a5a6",
                "#9b59b6",
                "#f1c40f",
                "#e74c3c",
                "#34495e"
              ],
              data: [12, 19, 3, 17, 28, 24, 7]
            }]
          },
          options: {
              legend: { display: false },
              title: {
                display: true,
                text: ''
               } 
            }
        });
		</script> 
        <script>
        $(document).ready(loaddep());
		    function loaddep(){    
			 $.ajax({
				url:"teachTask/TeachTaskSelect2",
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
						trhtml+=data[i].course.courseID;
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
						trhtml+="</td><td><a href='teachTask/AuditingT?CourseID="
						trhtml+=data[i].course.courseID;
						trhtml+="&TeacherID=";
						trhtml+=data[i].teacher.teacherID;
						trhtml+="'>审核通过&nbsp&nbsp&nbsp&nbsp</a>";
						trhtml+="<a href='teachTask/AuditingF?CourseID="
						trhtml+=data[i].course.courseID;
						trhtml+="&TeacherID=";
						trhtml+=data[i].teacher.teacherID;
						trhtml+="'>驳回</a></td></tr>";
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
