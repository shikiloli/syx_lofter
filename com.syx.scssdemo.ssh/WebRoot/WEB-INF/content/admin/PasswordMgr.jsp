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
  		if(request.getSession().getAttribute("admin")==null){
  			response.sendRedirect("admin/login");
  			return;
  		}
	%>
	<%
	Admin ad=(Admin)request.getSession().getAttribute("user");
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
                        <form action="admin/PwdUpdate" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">密码信息管理</h3>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp账户ID</label>
                                        <input type="text" class="form-control" name="AdminID" id="AdminID" readonly="readonly" value="<%=admin.getAdminID()%>">
                                    </div> 
                                    <div class="form-group">
                                      <div class="form-group">
                                        <label for="state">&nbsp&nbsp新密码</label>
                                        <input type="password" class="form-control" name="newpwd" id="newpwd">
                                    </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">&nbsp&nbsp原密码</label>
                                        <input type="password" class="form-control" name="oldpwd" id="oldpwd">
                                    </div> 
                                    <div class="form-group">
                                      <div class="form-group">
                                        <label for="state">&nbsp&nbsp确认新密码</label>
                                        <input type="password" class="form-control" name="newpwd2" id="newpwd2">
                                    </div>
                                    </div>
                                </div>
                            </div> 
                            <button type="submit" class="btn btn-general btn-white" onclick="ok()">提交</button>  
                            <button type="reset" class="btn btn-general btn-white">重置</button>
                            <div><%=util.concerNull(request.getAttribute("errorpwd"))%></div>
                        </form>
                        <!--***** TABLE *****-->
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
    <script type="text/javascript">
    	function ok(){
            	alert("操作成功!")
            }
    </script> 
  </body>
</html>
