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
                        <form action="course/CourseInsert" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">课程信息管理</h3>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp课程编号</label>
                                        <input type="text" class="form-control" name="CourseID" id="CourseID">
                                    </div> 
                                    <div class="form-group">
                                      <div class="form-group">
                                        <label for="state">&nbsp&nbsp学时</label>
                                        <input type="text" class="form-control" name="StudyTime" id="StudyTime">
                                    </div>
                                    </div>
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp课程名称</label>
                                        <input type="text" class="form-control" name="Course" id="Course">
                                    </div>
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp所属专业</label>
                                         <select class="form-control" id="proselect" name="ProfessionID" onchange="loadcour()">																		
										
									</select>
                                    </div>  
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp课程时间</label>
                                        <input type="text" class="form-control" name="CurriculumTime" id="CurriculumTime">
                                    </div>
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp备注</label>
                                        <input type="text" class="form-control" name="Remark" id="Remark">
                                    </div>  
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp学分</label>
                                        <input type="text" class="form-control" name="Crediy" id="Crediy">
                                    </div>  
                                </div>
                            </div> 
                            <button type="submit" class="btn btn-general btn-white" onclick="ok()">提交</button>  
                            <button type="reset" class="btn btn-general btn-white">重置</button>
                        </form>
                        <!--***** TABLE *****-->
                        <table class="table table-hover" id="deptab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>序号</th>
                                <th>课程编号</th>
                                <th>课程名称</th>
                                <th>学时</th>
                                <th>所属专业</th>
                                <th>课程时间</th>
                                <th>学分</th>
                                <th>备注</th>
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
		<%
           String[] color={"table-warning","table-success","table-danger","table-info"};
           int cnt=0;
        %>
        <script>
        $(document).ready(loadpro());
		
		function loadpro(){
			$.ajax({
				url:"profession/ProfessionShowAll",
				type:"post",
				dataType:"json",
				success:function(data){
				//$("#proselect").html("");
					for(var i=0;i<data.length;i++){
						$("#proselect").append("<option value='"+data[i].professionID+"'>"+data[i].professionName+"</option>");
					}
					loadcour();
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
		function loadcour(){
		    var id=$("#proselect").find("option:selected").val();		    
			 $.ajax({
				url:"course/CourseShow",
				type:"post",
				dataType:"json",
				data:{"ProfessionID":id},
				success:function(data){
					$("#deptab tbody").html("");
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
								trhtml+="<tr class=''><th scope='row'>"+(i+1)+"</th>";
								}   
						trhtml+=i+1;
						trhtml+="</th><td>";
						trhtml+=data[i].courses[i].courseID;
						trhtml+="</td><td>";
						trhtml+=data[i].courses[i].course;
						trhtml+="</td><td>";
						trhtml+=data[i].courses[i].studyTime;
						trhtml+="</td><td>";
						trhtml+=$("#proselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=data[i].courses[i].curriculumTime;
						trhtml+="</td><td>";
						trhtml+=data[i].courses[i].crediy;
						trhtml+="</td><td>";
						trhtml+=data[i].courses[i].remark;;
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>选择</a>&nbsp;&nbsp;<a onclick='del()' href='course/CourseDelete?CourseID="
						trhtml+=data[i].courses[i].courseID;
						trhtml+="' class='del'>删除</a></td></tr>";
					} 					
					$("#deptab tbody").append(trhtml);
				},
				error:function(){
					alert(id);
				}
			}); 
		}
			function rowselect(index) {
			var tb = document.getElementById("deptab");				
			$("#CourseID").val(tb.rows[index].cells[1].innerHTML);
			$("#Course").val(tb.rows[index].cells[2].innerHTML);
			$("#StudyTime").val(tb.rows[index].cells[3].innerHTML);
			$("#Crediy").val(tb.rows[index].cells[6].innerHTML);
			$("#CurriculumTime").val(tb.rows[index].cells[5].innerHTML);
			$("#Remark").val(tb.rows[index].cells[7].innerHTML);
			$("#CourseID").attr("readOnly",true);
			$("form").attr('action',"course/CourseUpdate");
		}
		function inputreset() {
			$("#CourseID").attr("readOnly", false);
		}
    </script>
    <script type="text/javascript">
           function del(){
                 var res = confirm("您确认要删除吗?");
                  if(res == true){
             		
                   }else{
                   		$(".del").attr("href", "admin/CourseMgr");
                   }
            }
            function ok(){
            	alert("操作成功!")
            }
    </script> 
  </body>
</html>
