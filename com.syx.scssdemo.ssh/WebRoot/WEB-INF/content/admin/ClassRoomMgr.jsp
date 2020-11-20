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
                        <form action="classRoom/ClassRoomInsert" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">教室信息管理</h3>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp教室编号</label>
                                        <input type="text" class="form-control" name="ClassRoomID" id="ClassRoomID">
                                    </div> 
                                    <div class="form-group">
                                      <div class="form-group">
                                        <label for="state">&nbsp&nbsp教室类型</label>
                                        <select class="form-control" id="ClassRoomCategory" name="ClassRoomCategory">																		
										<option value="实训室">实训室</option>
										<option value="实验室">实验室</option>
										<option value="普通教室">普通教室</option>
										<option value="多媒体教室">多媒体教室</option>
									</select>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="state">&nbsp&nbsp教室名称</label>
                                        <input type="text" class="form-control" name="ClassRoomName" id="ClassRoomName">
                                    </div>  
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
                        <table class="table table-hover" id="coltab">
                            <thead>
                              <tr class="bg-info text-white">
                                <th>序号</th>
                                <th>教室编号</th>
                                <th>教室名称</th>
                                <th>教室类型</th>
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
        $(document).ready(tableload());
		    function tableload(){				
				$.ajax({
					url:"classRoom/ClassRoomShow",
					type:"post",
					dataType:"json",
					success:function(json){
						$("#coltab tbody").html("");						
						var trhtml="";
						var num=1;
						for(var i=0;i<json.length;i++){
						var j = i + 1;
							if (j % 2 == 0 && num == 1) {
								trhtml+="<tr class='table-warning'><th scope='row'>"+(i+1)+"</th>";
								num++;
							} else if (j % 2 == 0 && num == 2) {
								trhtml+="<tr class='table-success'><th scope='row'>"+(i+1)+"</th>";
								num++;
							} else if (j % 2 == 0 && num == 3) {
								trhtml+="<tr class='table-danger'><th scope='row'>"+(i+1)+"</th>";
								num++;
							} else if (j % 2 == 0 && num == 4) {
								trhtml+="<tr class='table-info'><th scope='row'>"+(i+1)+"</th>";
								num = 1;
							} else {
								trhtml+="<tr class=''><th scope='row'>"+(i+1)+"</th>";
								}
						trhtml+="<td>"+json[i].classRoomID+"</td><td>"+json[i].classRoomName+"</td><td>"+json[i].classRoomCategory+"</td><td>"+json[i].remark+"</td>";
						trhtml+="<td><a href='javascript:void(0);' onclick='rowselect("+(i+1)+")'>选择</a>&nbsp;&nbsp;";
						trhtml+="<a onclick='del()' href='classRoom/ClassRoomDelete?ClassRoomID="+json[i].classRoomID+"' class='del'>删除</a></td></tr>";										
						}						
						$("#coltab tbody").append(trhtml);						
					},
					error:function(){
						alert("error");
					}					
				});
			}
			function rowselect(index) {
				var tb = document.getElementById("coltab");				
				$("#ClassRoomID").val(tb.rows[index].cells[1].innerHTML);
				$("#ClassRoomName").val(tb.rows[index].cells[2].innerHTML);
				$("#ClassRoomCategory").val(tb.rows[index].cells[3].innerHTML);
				$("#Remark").val(tb.rows[index].cells[4].innerHTML);
				$("#ClassRoomID").attr("readOnly",true);
				$("form").attr('action',"classRoom/ClassRoomUpdate");
			}
			function inputreset() {
				$("#ClassRoomID").attr("readOnly", false);
			}
    </script>
    <script type="text/javascript">
           function del(){
                 var res = confirm("您确认要删除吗?");
                  if(res == true){
             		
                   }else{
                   		$(".del").attr("href", "admin/ClassRoomMgr");
                   }
            }
            function ok(){
            	alert("操作成功!")
            }
    </script> 
  </body>
</html>
