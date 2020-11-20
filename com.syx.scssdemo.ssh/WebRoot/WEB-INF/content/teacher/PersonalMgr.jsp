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
    <link rel="stylesheet" href="css/form.css">
	
	<style>
        .nan1{
            position: relative; 
            top:15px;         
        }
        .nan{
            position: relative;
            top:-4px;
            left: 50px;
        }

        .nv1{
            position: relative;
            top:15px;
        }
        .nv{
            position: relative;
            top:-4px;
            left: 50px;
        }
    </style>
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
            <div class="content-inner chart-cont" style="height: 100%">
			<div class="card form" id="form2" style="padding:10px 20px 20px 40px;">
				<div class="card-header">
					<h4>个人信息维护</h4>
				</div>
				<br>
				<form action="teacher/Update" method="post">
					<div class="row" style="padding:10px 20px 20px 40px;">
						<div class="col-md-6">
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;" class=" col-form-label">教师ID:</label>
								<div class="col-9">
								<input class="form-control" type="text" value="<%=tea.getTeacherID() %>" readonly="readonly" id="TeacherID" name="TeacherID">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;" class=" col-form-label">真实姓名:</label>
								<div class="col-9">
									<input class="form-control" type="text" value="<%=tea.getName() %>" id="Name" name="Name">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-search-input" style="width: 85px;" class=" col-form-label">性别:</label>
								<div class="col-9">
									<div class="nan1"><input type="radio" class="form-control" name="Sex" id="Sexm" value="男" checked="checked"></div>
                                    <span class="nan">男</span>
                                    <div class="nv1"><input type="radio" class="form-control" name="Sex" id="Sexw" value="女"></div>
                                    <span class="nv">女</span>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-search-input" style="width: 85px;" class=" col-form-label">生日:</label>
								<div class="col-9">
									<input class="form-control" type="date" value="<%=tea.getBirth()%>" id="example-date-input" name="Birth">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;" class=" col-form-label">所属学院:</label>
								<div class="col-9">
									<select class="form-control" id="claselect" name="CollegeID" disabled="disabled">																		
										
                                    </select>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;" class=" col-form-label">学历:</label>
								<div class="col-9">
									<input class="form-control" type="text" value="<%=tea.getKulture() %>" id="Kulture" name="Kulture">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;" class=" col-form-label">家庭住址:</label>
								<div class="col-9">
									<input class="form-control" type="text" value="<%=tea.getHome() %>" id="Home" name="Home">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" style="width: 85px;" class=" col-form-label">备注:</label>
								<div class="col-9">
									<input class="form-control" type="text" value="<%=tea.getRemark() %>" id="Remark" name="Remark">
								</div>
							</div>
							<div class="form-group row">
								<button type="submit" class="btn btn-general btn-white" onclick="ok()">保存</button>
							</div>

						</div>
				</form>
				
				<form class="col-md-6" action="teacher/TeacherPhoto" enctype="multipart/form-data" method="post">					
						<div class="form-group row">
							<label for="example-datetime-local-input" style="width:85px;" class=" col-form-label"></label>
							<div class="card hovercard">
								<div class="avatar">
									<img id="pic" alt="" src="teacherphoto/<%=tea.getPhoto()%>.jpg" style="width:40mm;height: 52mm;">
								</div>
							</div>
						</div>
						<div class="form-group row">

							<div class="col-9">
								<div class="input-group image-preview">
									<input placeholder="" type="text" id="filename" class="form-control image-preview-filename" readonly="readonly"> <span class="input-group-btn">
										<div class="btn btn-default image-preview-input">
											<span class="glyphicon glyphicon-folder-open"></span>
											<span class="image-preview-input-title">打开</span> 
												<input type="file" accept=" image/jpg" name="image" onchange="ImgShowPreview(this)" />
										</div>
									</span> 
									&nbsp<input type="submit" value="上传照片" onclick="ok()"/>
								</div>
							</div>	
						</form>
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
    
    <script>
    $(document).ready(loadclas());
    $(document).ready(sex());
    function cla(){
    	$("#claselect").val("<%=tea.getCollege().getCollegeID()%>");
    }
    function sex(){
    if("<%=tea.getSex()%>"=="男"){
    	$("input[name='Sex']").get(0).checked=true;
    }
    else if("<%=tea.getSex()%>"=="女"){
    	$("input[name='Sex']").get(1).checked=true;	
    }	
    }
    
    	function loadclas(){	
			$.ajax({
				url:"college/CollegeShow",
				type:"post",
				dataType:"json",
				success:function(data){
					for(var i=0;i<data.length;i++){
						$("#claselect").append("<option value='"+data[i].collegeID+"'>"+data[i].collegeName+"</option>");
					}
					cla();
				},
				error:function(){
					alert("分院数据请求失败！");
				}
			});
		}
    </script>
    <script type="text/javascript">

		function ImgShowPreview(source) {
			var file = source.files[0];
			if (window.FileReader) {
				var fr = new FileReader();
				console.log(fr);
				var pic = document.getElementById('pic');
				var filename = document.getElementById('filename');
				fr.onloadend = function(e) {
					pic.src = e.target.result;
				};
				fr.readAsDataURL(file);
				pic.style.display = 'block';
				filename.value = file.name;
			}
		}
	</script>
    <script type="text/javascript">
    	function ok(){
            	alert("操作成功!")
            }
    </script>
  </body>
</html>
