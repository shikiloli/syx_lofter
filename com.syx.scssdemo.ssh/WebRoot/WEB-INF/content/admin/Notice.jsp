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
                        <form action="notice/NoticeInsert" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <h3 style="border-bottom: 1px solid #ddd;" align="center">公告发布</h3>
                                </div>
                            </div>
                            <!--***** TABLE *****-->
                        <label for="example-text-input" style="width: 85px;" class=" col-form-label">公告标题：</label>
						<input class="form-control" type="text"  id="NoticeTitle" name="NoticeTitle">
                        <textarea name="NoticeContent" id="NoticeContent"/></textarea>
                        <script type="text/javascript">
    						window.onload = function()
    						{
        					CKEDITOR.replace( 'NoticeContent',
        					{
							filebrowserImageUploadUrl : '/com.syx.scss/NoticeManger?arg=upload',
							image_previewText : '&nbsp;',
									});
    						};
    						//com.syx.scss/NoticeManger?arg=upload
						</script>
                            <input type="hidden" value="insert" name="arg" id="arg">
                            <button type="submit" class="btn btn-general btn-white" onclick="ok()">发布</button>  
                            <button type="reset" class="btn btn-general btn-white" onclick="clk()">重置</button>
                        </form>
                    
                    
                    

    <!--Global Javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper/popper.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/jquery.validate.min.js"></script> 
    <script src="js/chart.min.js"></script> 
    <script src="js/front.js"></script>
    <script src="ckeditor/ckeditor.js"></script> 
    
    <!--Core Javascript -->
    <script type="text/javascript">
    	function ok(){
            	alert("操作成功!")
            }
    </script>
  </body>
</html>
