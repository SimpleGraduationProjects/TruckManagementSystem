<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="advise/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ADVISE_ID" id="ADVISE_ID" value="${pd.ADVISE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="ADVISE_TITLE" id="ADVISE_TITLE" value="${pd.ADVISE_TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">具体建议内容:</td>
								<td><input type="text" name="ADVISE_CONTENT" id="ADVISE_CONTENT" value="${pd.ADVISE_CONTENT}" maxlength="255" placeholder="这里输入具体建议内容" title="具体建议内容" style="width:98%;"/></td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->

<c:if test="${'edit' == msg }">
	<div>
		<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/advisemx/list.do?ADVISE_ID=${pd.ADVISE_ID}" style="margin:0 auto;width:805px;height:368px;;"></iframe>
	</div>
</c:if>

<footer>
<div style="width: 100%;padding-bottom: 2px;" class="center">
	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
	<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
</div>
</footer>

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#ADVISE_TITLE").val()==""){
				$("#ADVISE_TITLE").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADVISE_TITLE").focus();
			return false;
			}
			if($("#ADVISE_CONTENT").val()==""){
				$("#ADVISE_CONTENT").tips({
					side:3,
		            msg:'请输入具体建议内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADVISE_CONTENT").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>