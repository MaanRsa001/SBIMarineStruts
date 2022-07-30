<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link href="css/table-design.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript">
		function datealert(dtdiff,flag) {
			if(flag==0) {
				if(dtdiff>=-10 & dtdiff<=-1) {
				 alert("You Must Change Your Password After  "+(Math.abs(dtdiff)-1)+" Days");;
				}
			}
		}
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/highcharts.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/highcharts-3d.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/exporting.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/export-data.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/accessibility.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		#container {
		  height: 400px; 
		}
		
		.highcharts-figure, .highcharts-data-table table {
		  min-width: 310px; 
		  max-width: 800px;
		  margin: 1em auto;
		}
		
		.highcharts-data-table table {
		  font-family: Verdana, sans-serif;
		  border-collapse: collapse;
		  border: 1px solid #EBEBEB;
		  margin: 10px auto;
		  text-align: center;
		  width: 100%;
		  max-width: 500px;
		}
		.highcharts-data-table caption {
		  padding: 1em 0;
		  font-size: 1.2em;
		  color: #555;
		}
		.highcharts-data-table th {
		  font-weight: 600;
		  padding: 0.5em;
		}
		.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
		  padding: 0.5em;
		}
		.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
		  background: #f8f8f8;
		}
		.highcharts-data-table tr:hover {
		  background: #f1f7ff;
		}
		#sliders td input[type=range] {
		    display: inline;
		}
		#sliders td {
		    padding-right: 1em;
		    white-space: nowrap;
		}
		.slidershape {
		  -webkit-appearance: none;
		  width: 100%;
		  height: 15px;
		  border-radius: 5px;  
		  background: #d3d3d3;
		  outline: none;
		  opacity: 0.7;
		  -webkit-transition: .2s;
		  transition: opacity .2s;
		}
		
		.slidershape::-webkit-slider-thumb {
		  -webkit-appearance: none;
		  appearance: none;
		  width: 25px;
		  height: 25px;
		  border-radius: 50%; 
		  background: #0C3965;
		  cursor: pointer;
		}
		
		.slidershape::-moz-range-thumb {
		  width: 25px;
		  height: 25px;
		  border-radius: 50%;
		  background: #0C3965;
		  cursor: pointer;
		}
		div.polaroid {
		  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		  width: 98%;
		}
		/* Customize website's scrollbar like Mac OS
Not supports in Firefox and IE */

/* total width */
.scrollbar::-webkit-scrollbar {
    background-color:#fff;
    width:18px
}

/* background of the scrollbar except button or resizer */
.scrollbar::-webkit-scrollbar-track {
    background-color:#fff
}
.scrollbar::-webkit-scrollbar-track:hover {
    background-color:#f4f4f4
}

/* scrollbar itself */
.scrollbar::-webkit-scrollbar-thumb {
    background-color:#babac0;
    border-radius:16px;
    border:5px solid #fff
}
.scrollbar::-webkit-scrollbar-thumb:hover {
    background-color:#a0a0a5;
}

/* set button(top and bottom of the scrollbar) */
.scrollbar::-webkit-scrollbar-button {display:none}

/* div box */

.scrollbar {
    height: 250px;
    background: #fff;
    overflow-y: scroll;
	overflow-x: hidden;
	}
.overflow{min-height: 100px;}
@media only screen and (max-width: 600px) {
  .padd {
    text-align:center;
  }
}
.table {
    width: 100%;
    max-width: 100%;
     margin-bottom: 0px; 
}
		</style>
</head>
<%
int flag=0;

String dtdiff=request.getParameter("dtdiff")==null?"":request.getParameter("dtdiff");
if(session.getAttribute("collections")!=null)
	session.removeAttribute("collections");
%>
<body onLoad="datealert('<%=dtdiff%>','<%=flag%>')">
	<s:form name="form1" method="post" action="" theme="simple">
		<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
		<div class="row" style="padding:13px;">
				<s:iterator value="dashBoard"></s:iterator>
		<div class="panel panel-primary">			
			<div class="panel-body">
				<s:if test='("40".equalsIgnoreCase(#session.product_id) || "42".equalsIgnoreCase(#session.product_id) || "3".equalsIgnoreCase(#session.product_id) || "11".equalsIgnoreCase(#session.product_id)) '>
				<div class="">
					<div class="row">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							<ul class="nav nav-pills">
							    <li><a data-toggle="pill" href="#pieCharts" onclick="barAdj('pie','barAngleAdjustId')" >Pie Chart</a></li>
							    <li  class="active"><a data-toggle="pill" href="#barCharts" onclick="barAdj('bar','barAngleAdjustId')">Bar Chart</a></li>
							</ul>
						</div>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="display:block;" id="barAngleAdjustId" >
							<div id="sliders">
								<div class="textfield33">
							 		<div class="text">
							 			Alpha Angle
							 		</div>
							 		<div class="tbox">
							 			<input id="alpha" type="range" min="0" max="45" class="slidershape" value="0"/> <span id="alpha-value" class="value"></span>
							 		</div>	
						 		</div>
						 		<div class="textfield33">
							 		<div class="text">
							 			Beta Angle
							 		</div>
							 		<div class="tbox">
							 			<input id="beta" type="range" min="-45" max="45" class="slidershape" value="0"/> <span id="beta-value" class="value"></span>
							 		</div>	
						 		</div>
						 		<div class="textfield33">
							 		<div class="text">
							 			Depth
							 		</div>
							 		<div class="tbox">
							 			<input id="depth" type="range" min="0" max="100" class="slidershape" value="0"/> <span id="depth-value" class="value"></span>
							 		</div>	
						 		</div>
						    </div>
						</div>
					</div>
					<div class="tab-content">
						<div id="pieCharts" class="tab-pane fade">
							<div class="row">
							<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
								</div>
								
								
								<s:if test='"Yes".equalsIgnoreCase(dcPolicyProdShow)'>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<div id="containerPolicyProd"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerPolicyProd', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'PRODUCTION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Policies : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Policies',
											        data: [
												        <s:property value="dcPolicyProdValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
								</div>
								<s:if test='"Yes".equalsIgnoreCase(dcQuoteProdShow) '>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<div id="containerQuoteProd"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerQuoteProd', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'QUOTATION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Quotes : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Quotes',
											        data: [
											            <s:property value="dcQuoteProdValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								
								<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
								</div>
							</div>
							<br/>
							<br/>
							<br/>
							
							<div class="row">
							<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
								</div>
								
								
								<s:if test='"Yes".equalsIgnoreCase(dcPolicyShow)'>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<div id="containerPolicy"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerPolicy', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'BROKER PRODUCTION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Policies : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Policies',
											        data: [
												        <s:property value="dcPolicyValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
								</div>
								<s:if test='"Yes".equalsIgnoreCase(dcQuoteShow)'>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<div id="containerQuote"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerQuote', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'BROKER QUOTATION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Quotes : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Quotes',
											        data: [
											            <s:property value="dcQuoteValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
								</div>
							</div>
							<br/>
							<br/>
							<br/>
							<div class="row">
							<div class="col-md-12">
							<div class="ChartPageHeadingStript">
								<h3>REFERRAL REQUEST OF USER</h3>					
							</div>
							</div>
							
							</div>
							<br>
							<div class="row">
								<s:if test='"Yes".equalsIgnoreCase(dcRefCompShow)'>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<div id="containerRa"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerRa', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'Referral - Approved'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Referrals : <b>{point.y}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            depth: 0,
											            innerSize: 100,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Referrals',
											        data: [
											            <s:property value="dcRefCompValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								<s:if test='"Yes".equalsIgnoreCase(dcRefPendShow)'>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<div id="containerRp"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerRp', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'Referral - Pending'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Referrals : <b>{point.y}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            depth: 0,
											            innerSize: 100,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Referrals',
											        data: [
											            <s:property value="dcRefPendValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								<s:if test='"Yes".equalsIgnoreCase(dcRefRejectShow)'>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										<div id="containerRr"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerRr', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'Referral - Rejected'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Referrals : <b>{point.y}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            depth: 0,
											            innerSize: 100,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Referrals',
											        data: [
											            <s:property value="dcRefRejectValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
							</div>
						</div>
						<div id="barCharts" class="tab-pane fade  in active">
							
								
								<s:if test='"Yes".equalsIgnoreCase(dcBPolicyProdShow)'>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div id="containerBPolicyProd"></div>
										<script language="JavaScript" type="text/javascript">
											var chartpP = new Highcharts.chart('containerBPolicyProd', {
												    chart: {
												        type: 'column',
												        options3d: {
												            enabled: true,
												            alpha: 0,
												            beta: 0,
												            depth: 0
												        }
												    },
												    title: {
												        text: 'PRODUCTION'
												    },
												    subtitle: {
												        text: '(Current Year)'
												    },
												    plotOptions: {
												        column: {
												            depth: 25
												        }
												    },
												    xAxis: {
												        categories: <s:property value="dcBPolicyProdValues"/>,
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },
												    yAxis: [{
												        title: {
												            text: 'No Of Policies'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },{
												    	opposite: true,
												    	title: {
												            text: 'Total Premium'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    }],
												    series: [{
												        name: 'No Of Policies',
												        data: <s:property value="dcBPolicyProdCountValues"/>
												    },{
												    	name: 'Total Premium',
												        data: <s:property value="dcBPolicyProdPremiumValues"/>,
												        yAxis: 1
												    }],
												    exporting: {
												        enabled: false
												    }
												});
										</script>
									</div>
								</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBQuoteProdShow)'>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div id="containerBQuoteProd"></div>
										<script language="JavaScript" type="text/javascript">
											var chartqP = new Highcharts.chart('containerBQuoteProd', {
												    chart: {
												        type: 'column',
												        options3d: {
												            enabled: true,
												            alpha: 0,
												            beta: 0,
												            depth: 0
												        }
												    },
												    title: {
												        text: 'QUOTATION'
												    },
												    subtitle: {
												        text: '(Current Year)'
												    },
												    plotOptions: {
												        column: {
												            depth: 25
												        }
												    },
												    xAxis: {
												        categories: <s:property value="dcBQuoteProdValues"/>,
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },
												    yAxis: [{
												        title: {
												            text: 'No Of Quotes'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },{
												    	opposite: true,
												    	title: {
												            text: 'Total Premium'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    }],
												    series: [{
												        name: 'Count',
												        data: <s:property value="dcBQuoteProdCountValues"/>
												    },{
												    	name: 'Premium',
												        data: <s:property value="dcBQuoteProdPremiumValues"/>,
												        yAxis: 1
												    }],
												    exporting: {
												        enabled: false
												    }
												});
										</script>
									</div>
								</s:if>
							
							<s:if test='"Yes".equalsIgnoreCase(dcBPolicyShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBPolicy"></div>
									<script language="JavaScript" type="text/javascript">
										var chartp = new Highcharts.chart('containerBPolicy', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'BROKER PRODUCTION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBPolicyBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Policies'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },{
											    	opposite: true,
											    	title: {
											            text: 'Total Premium'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'No Of Policies',
											        data: <s:property value="dcBPolicyCountValues"/>
											    },{
											    	name: 'Total Premium',
											        data: <s:property value="dcBPolicyPremiumValues"/>,
											        yAxis: 1
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBQuoteShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBQuote"></div>
									<script language="JavaScript" type="text/javascript">
										var chartq = new Highcharts.chart('containerBQuote', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'BROKER QUOTATION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBQuoteBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Quotes'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },{
											    	opposite: true,
											    	title: {
											            text: 'Total Premium'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'Count',
											        data: <s:property value="dcBQuoteCountValues"/>
											    },{
											    	name: 'Premium',
											        data: <s:property value="dcBQuotePremiumValues"/>,
											        yAxis: 1
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class=" " style="background-color:#007ec1;color:white" align="center">
								<h3 class="" >REFERRAL REQUEST OF USER</h3>					
							</div>
							</div>
							<s:if test='"Yes".equalsIgnoreCase(dcBRefPendShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBRefPend"></div>
									<script language="JavaScript" type="text/javascript">
										var chartrp = new Highcharts.chart('containerBRefPend', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'Referral - Pending'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBRefPendBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Referrals'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'No Of Referrals',
											        data: <s:property value="dcBRefPendCountValues"/>
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBRefCompShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBRefComp"></div>
									<script language="JavaScript" type="text/javascript">
										var chartrc = new Highcharts.chart('containerBRefComp', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'Referral - Approved'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBRefCompBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Referrals'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'No Of Referrals',
											        data: <s:property value="dcBRefCompCountValues"/>
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBRefRejectShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBRefReject"></div>
									<script language="JavaScript" type="text/javascript">
										var chartrr = new Highcharts.chart('containerBRefReject', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'Referral - Rejected'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBRefRejectBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Referrals'
											        }
											    }],
											    series: [{
											        name: 'No Of Referrals',
											        data: <s:property value="dcBRefRejectCountValues"/>
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
						    <script language="JavaScript" type="text/javascript">
								function showValues() {
									try{
									    $('#alpha-value').html(chartqP.options.chart.options3d.alpha);
									    $('#beta-value').html(chartqP.options.chart.options3d.beta);
									    $('#depth-value').html(chartqP.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartpP.options.chart.options3d.alpha);
									    $('#beta-value').html(chartpP.options.chart.options3d.beta);
									    $('#depth-value').html(chartpP.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartq.options.chart.options3d.alpha);
									    $('#beta-value').html(chartq.options.chart.options3d.beta);
									    $('#depth-value').html(chartq.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartp.options.chart.options3d.alpha);
									    $('#beta-value').html(chartp.options.chart.options3d.beta);
									    $('#depth-value').html(chartp.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartrp.options.chart.options3d.alpha);
									    $('#beta-value').html(chartrp.options.chart.options3d.beta);
									    $('#depth-value').html(chartrp.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartrc.options.chart.options3d.alpha);
									    $('#beta-value').html(chartrc.options.chart.options3d.beta);
									    $('#depth-value').html(chartrc.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartrr.options.chart.options3d.alpha);
									    $('#beta-value').html(chartrr.options.chart.options3d.beta);
									    $('#depth-value').html(chartrr.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
								}
	
								// Activate the sliders
								$('#sliders input').on('input change', function () {
									try{
									    chartqP.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartqP.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartpP.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartpP.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartq.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartq.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartp.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartp.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartrp.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartrp.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartrc.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartrc.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartrr.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartrr.redraw(false);
									}catch(err){ console.log(err)}
								});
	
								showValues();
						    </script>
						</div>
 					</div>
				</div>
				
		    
				 </s:if>
				 </div>
		</div>
				<s:if test='("40".equalsIgnoreCase(#session.product_id) || "42".equalsIgnoreCase(#session.product_id) || "3".equalsIgnoreCase(#session.product_id) || "11".equalsIgnoreCase(#session.product_id))'>
		
			<s:if test="topBrokerList.size()>0"> 
			<s:set var="format" value="%{'number.format.2'}"/>
			<div class="row" style="padding:13px;">
			<div class="panel panel-primary">			
			<div class="panel-body">
			<div class="col-sm-12" style="background-color:white;">
			<div class=" " style="">
				<h3 class="panel-head"><s:if test='"User".equalsIgnoreCase(#session.usertype)'>TOP 10 CUSTOMER PRODUCTION</s:if><s:else>TOP 10 BROKER PRODUCTION</s:else></h3>					
			</div>
			<!-- <h4 class="nav-colr" style="padding-top: 5px;">TOP 10 BROKER PRODUCTION<h4> -->
			<div class="scrollbar">
		    <div class="overflow">
		     <table class="table table-striped table-bordered" >
				  <thead>
					<tr style="background-color:#007ec1;color:white">
					  <th width="10%"></th>
					  <th width="45%">Broker Name</th>
					  <th width="25%">Total Policy</th>
					  <th align="right" width="15%">Total Amount</th>
					</tr>
				  </thead>
				  <tbody>
				  	<s:iterator value="topBrokerList" status="stat" var="detail">
				  	<s:if test='%{#detail.Code==0}'>
				  	<table class="table table-striped table-bordered">
						<tr>
						  <th scope="row" width="10%">
						  <div  id="plus<s:property value="%{#stat.count}"/>" onclick="normalForm('1','<s:property value="%{#stat.count}"/>');" style="display: block; cursor: pointer;">
							<span data-target="#menuInfo_0<s:property value="%{#stat.count}"/>" data-toggle="collapse" aria-expanded="true" style="cursor: pointer" title="Click here to view the Sub cover-> Buttons for <s:property value='#detail.SUB_COVER_DESC'/>">
							<i class="more-less glyphicon glyphicon-plus"></i></span>
							</div>
							<div  id="miuns<s:property value="%{#stat.count}"/>" onclick="normalForm('2','<s:property value="%{#stat.count}"/>');" style="display: none; cursor: pointer;">
							<span data-target="#menuInfo_0<s:property value="%{#stat.count}"/>" data-toggle="collapse" aria-expanded="true" style="cursor: pointer" title="Click here to view the Sub cover-> Buttons for <s:property value='#detail.SUB_COVER_DESC'/>">
							<i class="more-less glyphicon glyphicon-minus"></i></span>
							</div>
						  </th>
						  <td width="45%"><s:property value="Name" /></td>
						 <td width="25%"><s:property value="Count" /></td>
						  <td align="right" width="15%"><s:property value="%{getText(#format,{@java.lang.Double@parseDouble(Premium)})}" /></td>
						</tr>
						</table>
						<div class="collapse" id="menuInfo_0<s:property value="%{#stat.count}"/>">
								<table class="table table-striped table-bordered" id='<s:property value='#detail.CODE'/>'>
									<s:iterator value="topBrokerList" var="subdetail" status="stat">
									<s:if test="(#subdetail.OaCode == #detail.OaCode) && #subdetail.Code!=0">
									<tr>
										  <th scope="row" width="10%"></th>
										  <td width="45%"><s:property value="Name" /></td>
										 <td width="25%"><s:property value="Count" /></td>
										  <td align="right" width="15%"><s:property value="%{getText(#format,{@java.lang.Double@parseDouble(Premium)})}" /></td>
										</tr>
									</s:if>
									</s:iterator>
								</table>
							</div>
					</s:if>
					</s:iterator>
				  </tbody>
				</table>
				</div>
				</div>
				<br>
		    </div>
		    </div>
		    </div>
			</div>
			 </s:if>
			<s:if test='topReferralsList.size()>0'> 
			<div class="row" style="padding:13px;">
			<div class="panel panel-primary">			
			<div class="panel-body">
			<div class="col-sm-12" style="background-color:white;">
			<div class=" " style="">
				<h3 class="panel-head">LAST 10 REFERRAL REQUEST OF USER</h3>
			</div>
			<!-- <h4 class="nav-colr" style="padding-top: 5px;">TOP 10 BROKER PRODUCTION<h4> -->
			<div class="scrollbar">
		    <div class="overflow">
		     <table class="table table-striped table-bordered" id="record" width="100%" cellspacing="0">
				  <thead>
					<tr style="background-color:#007ec1;color:white">
					  <th width="2%"></th>
					  <s:if test='!("User".equalsIgnoreCase(#session.usertype) || "Broker".equalsIgnoreCase(#session.usertype))'>
					  <th width="15%">Broker Name</th>
					  </s:if>
					  <th width="15%">User Name</th>
					  <th width="15%">Insured Name</th>
					  <th width="10%">Product Name</th>
					  <th width="15%">Quote No</th>
					  <th width="10%">Referred Date and Time</th>
					  <th width="5%">Status</th>
					  <th width="10%">TAT</th>
					</tr>
				  </thead>
				  <tbody>
				  	<s:iterator value="topReferralsList" status="stat" var="record">
						<tr>
						  <th scope="row"><s:property value="%{#stat.index+1}" /></th>
						  <s:if test='!("User".equalsIgnoreCase(#session.usertype) || "Broker".equalsIgnoreCase(#session.usertype))'>
						  <td><s:property value="Name" /></td>
						  </s:if>
						  <td><s:property value="LoginId" /></td>
						  <td><s:property value="CustomerName" /></td>
						  <td><s:property value="ProductName" /></td>
						  <td><s:property value="QuoteNo" /></td>
						  <td><s:property value="ReferralUpdate" /></td>
						  <td><s:property value="ReferralStatus" /></td>
						  <td><s:property value="TimeDifference" /></td>
						</tr>
					</s:iterator>
				  </tbody>
				</table>
				</div>
				</div>
				<br>
		    </div>
		    </div>
		    </div>
			</div>
			 </s:if>
		
				</s:if>
			
		</div>
		</s:if>			
	</s:form>
</body>
<script type="text/javascript">
function barAdj(id,id1){
	if(id == 'bar'){
		document.getElementById(''+id1+'').style.display = 'block';
	}else{
		document.getElementById(''+id1+'').style.display = 'none';
	}
	
}
</script>
</html>
