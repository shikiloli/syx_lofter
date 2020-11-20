<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">

	<title>分院信息管理</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="shortcut icon" href="img/favicon.ico">

	<!-- global stylesheets -->

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/font-icon-style.css">
	<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

	<!-- Core stylesheets -->
	<link rel="stylesheet" href="css/form.css">
</head>

<body>
     <%
  		if(request.getSession().getAttribute("tea")==null){
  			response.sendRedirect("teacher/login");
  			return;
  		}
	%>
	<%@ include file="head.jsp"%>

	<div class="page-content d-flex align-items-stretch">
		<%@ include file="side.jsp"%>


		<div class="content-inner chart-cont">
			<div class="card form" id="form2" style="padding:10px 20px 20px 40px;">
				<div class="card-header">
					<h4>系统公告</h4>
				</div>
				<br>				
			</div>


			<div class="card form" id="form2" style="padding:20px 30px 20px 30px;">
				<div class="row">
					
					<table class="table table-hover" style="width:100%;" id="noticetab">
						<thead>
							<tr class="bg-info text-white">
								<th style="width: 10%;">序号</th>
								<th style="width: 15%;">公告标题</th>
								<th style="width: 30%;">发布者</th>
								<th>发布时间</th>
								<th style="width: 15%;">操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
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
		<script type="text/javascript">
		    $(document).ready(tableload());
		    function tableload(){				
				$.ajax({
					url:"notice/NoticeShow",
					type:"post",
					dataType:"json",
					success:function(json){
						$("#noticetab tbody").html("");						
						var trhtml="";
						for(var i=0;i<json.length;i++){						
						trhtml+="<tr><th scope='row'>"+(i+1)+"</th>";
						trhtml+="<td>"+json[i].noticeTitle+"</td><td>"+json[i].admin.adminID+"</td><td>"+json[i].releaseTime+"</td>";
						trhtml+="<td><a href='teacher/NoticeFind?id="+json[i].ID+"'>查看</a></td></tr>";	
											
						}						
						$("#noticetab tbody").append(trhtml);						
					},
					error:function(){
						alert("error");
					}					
				});
			}
			
			function rowselect(index) {
				var tb = document.getElementById("coltab");				
				$("#CollegeID").val(tb.rows[index].cells[1].innerHTML);
				$("#CollegeName").val(tb.rows[index].cells[2].innerHTML);
				$("#Remark").val(tb.rows[index].cells[3].innerHTML);
				$("#CollegeID").attr("readOnly",true);
				$("#mg").val("up");
			}
			
			function inputreset() {
				$("#CollegeID").attr("readOnly", false);
			}
		</script>
</body>

</html>