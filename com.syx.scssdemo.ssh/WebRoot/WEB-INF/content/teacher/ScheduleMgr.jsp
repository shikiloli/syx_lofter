<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin.jsp' starting pageaa</title>
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
            <!--***** CONTENT *****--!>     
            <div class="row">
                <div class="col-md-12">
                    <!--***** USER INFO *****-->
                    <div class="card form" id="form1">
                        <form action="schedule/ScheduleInsert" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">课程表编制</h3>
                                </div>
                            </div>
                            
                            <!--***** TABLE *****-->
                        <table class="table table-hover" id="coltab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>教师编号</th>
                                <th>教师名字</th>
                                <th>开课编号</th>
                                <th>开课课程</th>
                                <th>学时</th>
                                <th>学分</th>
                                <th>开课学期</th>
                                <th>审核状态</th>
                                <th>操作</th>
                              </tr>
                            </thead>
                            <tbody>
                              
                              
                            </tbody>
                          </table>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp课程名称</label>
                                        <input type="text" class="form-control" name="Course" id="Course" readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp开课星期</label>
                                        <select class="form-control" id="ClassTime" name="ClassTime">																		
										<option value="一">星期一</option>
										<option value="二">星期二</option>
										<option value="三">星期三</option>
										<option value="四">星期四</option>
										<option value="五">星期五</option>
									</select>
                                    </div> 
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp开课教室</label>
                                        <select class="form-control" id="crmselect" name="ClassRoomID">
                                        
									</select>
                                    </div>                            
                                </div>
                                <div class="col-md-6">
                                <div class="form-group">
                                        <label for="city">&nbsp&nbsp开课编号</label>
                                        <input type="text" class="form-control" name="TeachTaskID" id="TeachTaskID" readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp开课节数</label>
                                        <select class="form-control" id="Classfestival" name="Classfestival">																		
										<option value="一二">第一二节</option>
										<option value="三四">第三四节</option>
										<option value="五六">第五六节</option>
										<option value="七八">第七八节</option>
										<option value="九十">第九十节</option>
										<option value="十一十二">第十一十二节</option>
									</select>
                                    </div>                             
                                </div>
                            </div>
                            <button type="submit" class="btn btn-general btn-white">提交</button>  
                            <button type="reset" class="btn btn-general btn-white" onclick="clk()">重置</button>
                        </form>
                        <div>
                        	 <table class="table table-hover" id="tab">
                            <thead>
                              <tr class="bg-info text-white">
                              	<th>节次<div align="right">星期</div></th>
                                <th align="center">星期一</th>
                                <th align="center">星期二</th>
                                <th align="center">星期三</th>
                                <th align="center">星期四</th>
                                <th align="center">星期五</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                              	<td>第一二节</td>
                              	<td id="一一二"></td>
                              	<td id="二一二"></td>
                              	<td id="三一二"></td>
                              	<td id="四一二"></td>
                              	<td id="五一二"></td>
                              </tr>
                              
                              <tr>
                              	<td>第三四节</td>
                              	<td id="一三四"></td>
                              	<td id="二三四"></td>
                              	<td id="三三四"></td>
                              	<td id="四三四"></td>
                              	<td id="五三四"></td>
                              </tr>
                              
                              <tr>
                              	<td>第五六节</td>
                              	<td id="一五六"></td>
                              	<td id="二五六"></td>
                              	<td id="三五六"></td>
                              	<td id="四五六"></td>
                              	<td id="五五六"></td>
                              </tr>
                              
                              <tr>
                              	<td>第七八节</td>
                              	<td id="一七八"></td>
                              	<td id="二七八"></td>
                              	<td id="三七八"></td>
                              	<td id="四七八"></td>
                              	<td id="五七八"></td>
                              </tr>
                              
                              <tr>
                              	<td>第九十节</td>
                              	<td id="一九十"></td>
                              	<td id="二九十"></td>
                              	<td id="三九十"></td>
                              	<td id="四九十"></td>
                              	<td id="五九十"></td>
                              </tr>
                              
                              <tr>
                              	<td>第十一十二节</td>
                              	<td id="一十一十二"></td>
                              	<td id="二十一十二"></td>
                              	<td id="三十一十二"></td>
                              	<td id="四十一十二"></td>
                              	<td id="五十一十二"></td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
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
       $(document).ready(crm());
       function crm(){
        $.ajax({
				url:"classRoom/ClassRoomShow",
				type:"post",
				dataType:"json",
				success:function(data){
					for(var i=0;i<data.length;i++){
						$("#crmselect").append("<option value='"+data[i].classRoomID+"'>"+data[i].classRoomName+"</option>");
					}
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
			}
		</script> 
        <script>
        $(document).ready(loaddep());
			var cur=$("#Curricula").val();
		    function loaddep(){	    
			 $.ajax({
				url:"teachTask/TeachTaskSelect",
				type:"post",
				dataType:"json",
				data:{"Curricula":cur},
				success:function(data){
					$("#coltab tbody").html("");
				     var trhtml="";
				     var num=1;
				     for(var i=0;i<data.length;i++){
				     if(data[i].auditing=="已通过"){
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
						trhtml+="</th><td>";
						trhtml+=data[i].teachTaskID;
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
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>制作课表</a></td></tr>"
					}
					} 					
					$("#coltab tbody").append(trhtml);
					loadcols();
				},
				error:function(){
					alert(id);
				}
			}); 
		}
			function loadcols(){
			$.ajax({
				url:"schedule/ScheduleShow",
				type:"post" ,
				dataType:"json",
				success:function(data){
					var trhtml="";
					for(var i=0;i<data.length;i++){
					var rua=data[i].classTime+data[i].classfestival;
					trhtml+="<a href='teachTask/TeachTaskDelete?CourseID="
					trhtml+=data[i].scheduleID;
					trhtml+="'>取消</a></td></tr>";
					$("#"+rua).append(data[i].teachTask.course.course+"  ♦♦  ("+data[i].classRoom.classRoomName+")"+"<a href='schedule/ScheduleDelete?ScheduleID="+data[i].scheduleID+"'>取消</a>");
					}
				},
				error:function(){
					alert("失败！");
				}
			});
		}
			
			function rowselect(index) {
				var tb = document.getElementById("coltab");				
				$("#Course").val(tb.rows[index].cells[3].innerHTML);
				$("#TeachTaskID").val(tb.rows[index].cells[2].innerHTML);
				$("#Course").attr("readOnly",true);
			}
			function inputreset() {
				$("#Course").attr("readOnly", false);
			}
    </script> 
  </body>
</html>
