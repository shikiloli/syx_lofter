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
                        <form action="classa/ClassaInsert" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">班级信息管理</h3>
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
                                        <label for="state">&nbsp&nbsp班级编号</label>
                                        <input type="text" class="form-control" name="ClassID" id="ClassID">
                                    </div>  
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp班级名称</label>
                                        <input type="text" class="form-control" name="ClassName" id="ClassName">
                                    </div> 
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp年级名称</label>
                                        <input type="text" class="form-control" name="YearName" id="YearName">
                                    </div> 
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp备注</label>
                                        <input type="text" class="form-control" name="Remark" id="Remark">
                                    </div> 
                                </div>
                            </div> 
                            <input type="hidden" value="insert" name="arg" id="arg">
                            <button type="submit" class="btn btn-general btn-white" onclick="ok()">提交</button>  
                            <button type="reset" class="btn btn-general btn-white">重置</button>
                        </form>
                        <!--***** TABLE *****-->
                        <table class="table table-hover" id="clatab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>序号</th>
                                <th>班级编号</th>
                                <th>班级名字</th>
                                <th>所属分院</th>
                                <th>所属系</th>
                                <th>所属专业</th>
                                <th>所属年级</th>
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
        $(document).ready(loadcols());
		
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
		    var id=$("#proselect").find("option:selected").val();		    
			 $.ajax({
				url:"classa/ClassaShow",
				type:"post",
				dataType:"json",
				data:{"ProfessionID":id},
				success:function(data){
					$("#clatab tbody").html("");
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
						trhtml+=data[i].classas[i].classID;
						trhtml+="</td><td>";
						trhtml+=data[i].classas[i].className;
						trhtml+="</td><td>";
						trhtml+=$("#colselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=$("#deselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=$("#proselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=data[i].classas[i].yearName
						trhtml+="</td><td>";
						trhtml+=data[i].classas[i].remark;;
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>选择</a>&nbsp;&nbsp;<a onclick='del()' href='classa/ClassaDelete?ClassID="
						trhtml+=data[i].classas[i].classID;
						trhtml+="' class='del'>删除</a></td></tr>";
					} 					
					$("#clatab tbody").append(trhtml);
				},
				error:function(){
					alert(id);
				}
			}); 
		}
			function rowselect(index) {
			var tb = document.getElementById("clatab");				
			$("#ClassID").val(tb.rows[index].cells[1].innerHTML);
			$("#ClassName").val(tb.rows[index].cells[2].innerHTML);
			$("#YearName").val(tb.rows[index].cells[6].innerHTML);
			$("#Remark").val(tb.rows[index].cells[7].innerHTML);
			$("#ClassID").attr("readOnly",true);
			$("form").attr('action',"classa/ClassaUpdate");
		}
		function inputreset() {
			$("#DepartmentID").attr("readOnly", false);
		}
    </script>
    <script type="text/javascript">
           function del(){
                 var res = confirm("您确认要删除吗?");
                  if(res == true){
             		
                   }else{
                   		$(".del").attr("href", "admin/ClassMgr");
                   }
            }
            function ok(){
            	alert("操作成功!")
            }
    </script> 
  </body>
</html>
