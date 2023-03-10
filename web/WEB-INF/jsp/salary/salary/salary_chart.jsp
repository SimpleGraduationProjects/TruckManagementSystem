<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String strXML = "";

	strXML += "<graph caption='对比表' xAxisName='月份' yAxisName='值' decimalPrecision='0' formatNumberScale='0'>";
	strXML += "<set name='1' value='462' color='AFD8F8'/>";
	strXML += "<set name='2' value='857' color='F6BD0F'/>";
	strXML += "<set name='3' value='671' color='8BBA00'/>";
	strXML += "<set name='4' value='494' color='FF8E46'/>";
	strXML += "<set name='5' value='761' color='008E8E'/>";
	strXML += "<set name='6' value='960' color='D64646'/>";
	strXML += "<set name='7' value='629' color='8E468E'/>";
	strXML += "<set name='8' value='622' color='588526'/>";
	strXML += "<set name='9' value='376' color='B3AA00'/>";
	strXML += "<set name='10' value='494' color='008ED6'/>";
	strXML += "<set name='11' value='761' color='9D080D'/>";
	strXML += "<set name='12' value='960' color='A186BE'/>";
	strXML += "</graph>";
	//Create the chart - Column 3D Chart with data from strXML variable using dataXML method
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="./top.jsp"%>

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

							<div class="span6" style="padding-top: 13px;">
								<div class="tabbable">
									<ul class="nav nav-tabs" id="myTab">
										<li class="active"><a data-toggle="tab" href="#home"><i
												class="green icon-home bigger-110"></i>柱状图</a></li>
									</ul>
									<div class="tab-content">
										<div id="home" class="tab-pane in active">
											<table id="table_report"
												class="table table-striped table-bordered table-hover">
												<tr>
													<td><c:choose>
															<c:when test="${not empty xmlStrList}">
																<c:forEach items="${xmlStrList}" var="strXML"
																	varStatus="vs">
																	<div style="float: left;">
																		<table border="0" width="50%">
																			<tr>
																				<td><jsp:include
																						page="../../FusionChartsHTMLRenderer.jsp"
																						flush="true">
																						<jsp:param name="chartSWF"
																							value="static/FusionCharts/Column3D.swf" />
																						<jsp:param name="strURL" value="" />
																						<jsp:param name="strXML" value="${strXML}" />
																						<jsp:param name="chartId" value="myNext" />
																						<jsp:param name="chartWidth" value="500" />
																						<jsp:param name="chartHeight" value="300" />
																						<jsp:param name="debugMode" value="false" />
																					</jsp:include></td>
																			</tr>
																		</table>
																	</div>


																</c:forEach>


															</c:when>
															<c:otherwise>
																<tr class="main_info">
																	<td colspan="100" class="center">没有相关数据</td>
																</tr>
															</c:otherwise>
														</c:choose></td>
												</tr>
											</table>
										</div>

										<div style="display: none;" id="fhsmsobjsys"></div>

									</div>
								</div>
							</div>
							<!--/span-->
						</div>

					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->


	<!-- 返回顶部 -->
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="./foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>


</body>
</html>