<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<header class="header">
<%
  		//if(request.getSession().getAttribute("user")==null){
  			//response.sendRedirect("login.jsp");
  		//}
	%>
	<nav class="navbar navbar-expand-lg ">
		<div class="search-box">
			<button class="dismiss">
				<i class="icon-close"></i>
			</button>
			<form id="searchForm" action="#" role="search">
				<input type="search" placeholder="Search Now" class="form-control">
			</form>
		</div>
		<div class="container-fluid ">
			<div
				class="navbar-holder d-flex align-items-center justify-content-between">
				<div class="navbar-header">
					<a href="index.html" class="navbar-brand">
						<div class="brand-text brand-big hidden-lg-down">
							<img src="img/studentxuanke.png" alt="" class="img-fluid">&nbsp&nbsp&nbsp&nbsp--管理端--
						</div>
						<div class="brand-text brand-small">
							<img src="img/logo-icon.png" alt="Logo" class="img-fluid">--管理端--
						</div>
					</a> <a id="toggle-btn" href="#" class="menu-btn active"> <span></span>
						<span></span> <span></span>
					</a>
				</div>
			</div>
			<div>
				<span id=localtime></span>
			<script type="text/javascript">
				function showLocale(objD) {
					var str, colorhead, colorfoot;
					var yy = objD.getYear();
					if (yy < 1900)
						yy = yy + 1900;
					var MM = objD.getMonth() + 1;
					if (MM < 10)
						MM = '0' + MM;
					var dd = objD.getDate();
					if (dd < 10)
						dd = '0' + dd;
					var hh = objD.getHours();
					if (hh < 10)
						hh = '0' + hh;
					var mm = objD.getMinutes();
					if (mm < 10)
						mm = '0' + mm;
					var ss = objD.getSeconds();
					if (ss < 10)
						ss = '0' + ss;
					var ww = objD.getDay();
					if (ww == 0)
						colorhead = "<font color=\"#FFFFFF\">";
					if (ww > 0 && ww < 6)
						colorhead = "<font color=\"#FFFFFF\">";
					if (ww == 6)
						colorhead = "<font color=\"#FFFFFF\">";
					if (ww == 0)
						ww = "星期日";
					if (ww == 1)
						ww = "星期一";
					if (ww == 2)
						ww = "星期二";
					if (ww == 3)
						ww = "星期三";
					if (ww == 4)
						ww = "星期四";
					if (ww == 5)
						ww = "星期五";
					if (ww == 6)
						ww = "星期六";
					colorfoot = "</font>"
					str = colorhead + yy + "-" + MM + "-" + dd + " " + hh + ":"
							+ mm + ":" + ss + " " + ww + colorfoot;
					return (str);
				}
				function tick() {
					var today;
					today = new Date();
					document.getElementById("localtime").innerHTML = showLocale(today);
					window.setTimeout("tick()", 1000);
				}
				tick();
			</script>
			&nbsp  &nbsp  &nbsp  &nbsp<a href="admin/Exit">退出</a>
			</div>
		</div>
	</nav>
</header>
