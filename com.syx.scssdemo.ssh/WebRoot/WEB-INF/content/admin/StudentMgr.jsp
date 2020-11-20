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
    <style>
        .nan1{
            position: relative;
            top: 20px;
            left: 50px;
        }
        .nan{
            position: relative;
            left: 100px;
        }

        .nv1{
            display: inline;
            position: relative;
            top: -18px;
            left: 200px;
        }
        .nv{
            display: inline-block;
            position: relative;
            top: -38px;
            left: 250px;
        }
    </style>
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
                        <form action="student/StudentInsert" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">学生信息管理</h3>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp学生编号</label>
                                        <input type="text" class="form-control" name="StuID" id="StuID">
                                    </div> 
                                    <div class="form-group">
                                      <div class="form-group">
                                        <label for="state">&nbsp&nbsp学生性别

                                        <div class="nan1"><input type="radio" class="form-control" name="Sex" id="Sexm" value="男" checked="checked"></div>
                                        <span class="nan">男</span>
                                        <div class="nv1"><input type="radio" class="form-control" name="Sex" id="Sexw" value="女"></div>
                                        <div class="nv">女</div>

                                        </label>  
                                    </div>
                                    </div>
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp学生名字</label>
                                        <input type="text" class="form-control" name="Name" id="Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp所属班级</label>
                                        <select class="form-control" id="claselect" name="ClassID" onchange="loadst()">																		
										
                                        </select>
                                    </div>  
                                </div>
                            </div> 
                            <button type="submit" class="btn btn-general btn-white" onclick="ok()">提交</button>  
                            <button type="reset" class="btn btn-general btn-white">重置</button>
                        </form>
                        <!--***** TABLE *****-->
                        <table class="table table-hover" id="stutab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>序号</th>
                                <th>学生编号</th>
                                <th>学生名字</th>
                                <th>性别</th>
                                <th>生日</th>
                                <th>所属班级</th>
                                <th>联系电话</th>
                                <th>家庭住址</th>
                                <th>照片</th>
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
        $(document).ready(loadclas());
        $(document).ready(sex());
        $(document).ready(date());
        
        function sex(){
        	var sex=$('input:radio:checked').val();
        	$.ajax({
        		url:"StudentManger",
				type:"post",
				dataType:"text",
				data:{"Sex":sex},
				success:function(data){
				}
        	})
        }
        
        function date(){
        	var date=$("#example-date-input").val();
        	$.ajax({
        		url:"StudentManger",
				type:"post",
				dataType:"text",
				data:{"Birth":date},
				success:function(data){
				}
        	})
        }
        
        
        function loadst(){
        	var id=$("#claselect").find("option:selected").val();		    
			 $.ajax({
				url:"student/StudentShow",
				type:"post",
				dataType:"json",
				data:{"ClassID":id},
				success:function(data){
					$("#stutab tbody").html("");
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
						trhtml+=data[i].students[i].stuID;
						trhtml+="</td><td>";
						trhtml+=data[i].students[i].name;
						trhtml+="</td><td>";
						trhtml+=data[i].students[i].sex;
						trhtml+="</td><td>";
						trhtml+=data[i].students[i].birth;
						trhtml+="</td><td>";
						trhtml+=$("#claselect").find("option:selected").text();
						trhtml+="</td><td>";
						trhtml+=data[i].students[i].phone
						trhtml+="</td><td>";
						trhtml+=data[i].students[i].family;
						trhtml+="</td><td>";
						trhtml+=data[i].students[i].photo;
						trhtml+="</td><td>";
						trhtml+=data[i].students[i].remark;
						trhtml+="</td><td><a href='javascript:void(0)' onclick='rowselect("+(i+1)+")'>选择</a>&nbsp;&nbsp;<a onclick='del()' href='student/StudentDelete?StuID="
						trhtml+=data[i].students[i].stuID;
						trhtml+="' class='del'>删除</a>";
						trhtml+="<a href='student/PwdReset?StuID=";
						trhtml+=data[i].students[i].stuID;
						trhtml+="'>&nbsp&nbsp&nbsp&nbsp重置密码</a></td></tr>";
					} 					
					$("#stutab tbody").append(trhtml);
				},
				error:function(){
					alert(id);
				}
			}); 
        }
        
        function loadclas(){	
			$.ajax({
				url:"classa/ClassaShowAll",
				type:"post",
				dataType:"json",
				success:function(data){
					for(var i=0;i<data.length;i++){
						$("#claselect").append("<option value='"+data[i].classID+"'>"+data[i].className+"</option>");
					}
					loadst();
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
		function rowselect(index) {
			var tb = document.getElementById("stutab");				
			$("#StuID").val(tb.rows[index].cells[1].innerHTML);
			$("#Name").val(tb.rows[index].cells[2].innerHTML);
			if(tb.rows[index].cells[3].innerHTML=="男"){
				$("input[name='Sex']").get(0).checked=true;
			}
			else{
				$("input[name='Sex']").get(1).checked=true;
			}
			$("#PassWord").val(tb.rows[index].cells[8].innerHTML);
			$("#example-date-input").val(tb.rows[index].cells[4].innerHTML);
			$("#StudentID").attr("readOnly",true);
			$("form").attr('action',"student/StudentUpdate");
		}
		function inputreset() {
			$("#StudentID").attr("readOnly", false);
		}
    </script>
    <script type="text/javascript">
           function del(){
                 var res = confirm("您确认要删除吗?");
                  if(res == true){
             		
                   }else{
                   		$(".del").attr("href", "admin/StudentMgr");
                   }
            }
            function ok(){
            	alert("操作成功!")
            }
    </script> 
  </body>
</html>
