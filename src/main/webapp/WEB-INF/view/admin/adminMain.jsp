<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/Chart.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/utils.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.4.0/dist/chartjs-plugin-datalabels.min.js"></script>
<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	
	div#container {
	    margin-bottom: 100px;
	    margin-top: 40px;
	}
		
	div#container1 {
    	display: inline-block;
    	vertical-align: top;
    	margin-bottom: 100px;
	}
	
	div#container2 {
    	display: inline-block;
    	vertical-align: top;
	}
</style>

</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<c:if test="${empty authInfo2}"> 
			<jsp:include page="/WEB-INF/view/myPage/include/loginplz.jsp"/>
		</c:if>
	</header>
	<!-- end header -->
	
	<c:if test="${!empty authInfo2}">
		<section class="adminSection">
			<div class="d-flex" id="wrapper">
				<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
			    <!-- Page content wrapper-->
			    <div id="page-content-wrapper">
			        
			        <!-- Page content-->
			        <div class="container-fluid">
				        <div id="table">
				        	<table id="ordertable" style="width: 90%; text-align: center">
								<thead>
							        <fmt:parseNumber var="i" type="number" value="${fn:length(orderListByMontyPay)}"/>
									<c:if test = "${i < 12}">
										<c:forEach items="${orderListByMontyPay}" var="orderListByMontyPay">
											<tr>
												<th>${orderListByMontyPay.orderDate}</th>
												<td>${orderListByMontyPay.paymentAmount}</td>
												
											</tr>
										</c:forEach>
									</c:if>
									
									<c:if test = "${i >= 12}">
										<c:forEach items="${orderListByMontyPay}" var="orderListByMontyPay" begin="${i - 12}" end="${fn:length(orderListByMontyPay)}">
											<tr>
												<th>${orderListByMontyPay.orderDate}</th>
												<td>${orderListByMontyPay.paymentAmount}</td>
												
											</tr>
										</c:forEach>
									</c:if>		
									
								</thead>
							</table>
							
							<table id="ordertable1" style="width: 90%; text-align: center">
								<thead>
									<c:forEach items="${memberListByAges}" var="memberListByAges">
										<tr>
											<th>${memberListByAges.ages}</th>
											<td>${memberListByAges.total}</td>
											
										</tr>
									</c:forEach>									
								</thead>
							</table>
							
							<table id="ordertable2" style="width: 90%; text-align: center">
								<thead>
									<c:forEach items="${memberListByGender}" var="memberListByGender">
										<tr>
											<th>${memberListByGender.gender}</th>
											<td>${memberListByGender.total}</td>
											
										</tr>
									</c:forEach>									
								</thead>
							</table>
				        </div>
				        
				        <div id="container" style="width: 90%;">
							<canvas id="myChart" height="100"></canvas>
						</div>
						
						<div id="container1" style="width: 45%;">
							<canvas id="myChart1" height="200"></canvas>
						</div>
						
						<div id="container2" style="width: 45%;">
							<canvas id="myChart2" height="160"></canvas>
						</div>

			        </div>
			    </div>		    
			</div>
		</section>
	</c:if>
	

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>

<script>
	$("#table").hide();	
	
	function generateLabelsFromTable()
	{                       
	    var labels = [];
	
	    var rows = $("#ordertable tr");
	    rows.each(function(index){
	        
	        {
	            var cols = $(this).find("th");      
	            labels.push(cols.first().text());                           
	        }
	    });
	    return labels;
	}
	
	function generatedataFromTable()
	{                       
	    var data = [];
	
	    var rows = $("#ordertable tr");
	    rows.each(function(index){
	        
	        {
	            var cols = $(this).find("td");      
	            data.push(cols.first().text());                           
	        }
	    });
	    return data;
	}

	// 우선 컨텍스트를 가져옵니다. 
	var ctx = document.getElementById("myChart").getContext('2d');
	var ctx1 = document.getElementById("myChart1").getContext('2d');
	var ctx2 = document.getElementById("myChart2").getContext('2d');
	/*
	- Chart를 생성하면서, 
	- ctx를 첫번째 argument로 넘겨주고, 
	- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
	*/

	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: generateLabelsFromTable(),
	        datasets: [{
	            label: '월별 판매금액',
	            data: generatedataFromTable(),
	            fill: false,
	            borderColor: ['rgb(75, 192, 192)'],
	            tension: 0,
	        }]
	    },
	    options: {
	        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			tooltips: {
				enabled: false
			},
			hover: {
				animationDuration: 0
			},	        
	        animation: {
	        	duration: 1,
	        	onComplete: function () {
					var chartInstance = this.chart,
						ctx = chartInstance.ctx;
					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize = "15", Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
					ctx.fillStyle = 'black';
					ctx.textAlign = 'center';
					ctx.textBaseline = 'bottom';

					this.data.datasets.forEach(function (dataset, i) {
						var meta = chartInstance.controller.getDatasetMeta(i);
						meta.data.forEach(function (bar, index) {
							var data = dataset.data[index];							
							ctx.fillText("₩" + data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","), bar._model.x - 15, bar._model.y - 5);

						});
					});
				}
	        },
	        legend: {
	            display: false
	        },
	        title: {
                display: true,
                text: '월별 판매금액',
                fontStyle: 'bold',
                fontSize: 30
            },
	        scales: {
				yAxes: [{
	                ticks: {
	                    beginAtZero:true,
	                    fontSize : 15,
	                    callback: function(value, index, values) {
	                        return value.toLocaleString("kr-KR",{style:"currency", currency:"KRW"});
	                    }
	                }
	            }],
	            xAxes: [{
					displayFormats: {
						'day': 'MM/DD/YYYY'
					},
	            	ticks: {
	            		fontSize : 15,
	                    callback: function(value, index, values) {
	                        return value;
	                      }
	                }
				}]
			},
			plugins: {
				datalabels: {
					formatter: (value, ctx) => {
						let datasets = ctx.chart.data.datasets;
						if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
							return "";
						} else {
							return "";
						}
					},
				}
			},
	    }
	});
	
	
	function generateLabelsFromTable1()
	{                       
	    var labels = [];
	
	    var rows = $("#ordertable1 tr");
	    rows.each(function(index){
	        
	        {
	            var cols = $(this).find("th");      
	            labels.push(cols.first().text());                           
	        }
	    });
	    return labels;
	}
	
	function generatedataFromTable1()
	{                       
	    var data = [];
	
	    var rows = $("#ordertable1 tr");
	    rows.each(function(index){
	        
	        {
	            var cols = $(this).find("td");      
	            data.push(cols.first().text());                           
	        }
	    });
	    return data;
	}
	
	var myChart = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	        labels: generateLabelsFromTable1(),
	        datasets: [{
	            label: '회원수',
	            data: generatedataFromTable1(),
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 159, 64, 0.2)',
	                'rgba(255, 205, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(201, 203, 207, 0.2)'
	              ],
	        }]
	    },
	    options: {
	        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			tooltips: {
				enabled: false
			},
			hover: {
				animationDuration: 0
			},	        
	        animation: {
	        	duration: 1,
	        	onComplete: function () {
					var chartInstance = this.chart,
						ctx = chartInstance.ctx;
					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize = "15", Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
					ctx.fillStyle = 'black';
					ctx.textAlign = 'center';
					ctx.textBaseline = 'bottom';

					this.data.datasets.forEach(function (dataset, i) {
						var meta = chartInstance.controller.getDatasetMeta(i);
						meta.data.forEach(function (bar, index) {
							var data = dataset.data[index];							
							ctx.fillText(data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "명", bar._model.x, bar._model.y + 25);

						});
					});
				}
	        },
	        legend: {
	            display: false
	        },
	        title: {
                display: true,
                text: '연령대별 회원수',
                fontStyle: 'bold',
                fontSize: 30
            },
	        scales: {
				yAxes: [{
	                ticks: {
	                	fontSize : 15,
	                    beginAtZero:true,
	                    callback: function(value, index, values) {
	                        return value + "명";
	                    }
	                }
				}],
	            xAxes: [{
	            	ticks: {
	            		fontSize : 15,
	                    callback: function(value, index, values) {
	                        return value + "대";
	                      }
	                }
				}]
			},
			plugins: {
				datalabels: {
					formatter: (value, ctx) => {
						let datasets = ctx.chart.data.datasets;
						if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
							return "";
						} else {
							return "";
						}
					},
				}
			},
	    }
	});
	
	function generateLabelsFromTable2()
	{                       
	    var labels = [];
	
	    var rows = $("#ordertable2 tr");
	    rows.each(function(index){
	        
	        {
	            var cols = $(this).find("th");      
	            labels.push(cols.first().text());                           
	        }
	    });
	    return labels;
	}
	
	function generatedataFromTable2()
	{                       
	    var data = [];
	
	    var rows = $("#ordertable2 tr");
	    rows.each(function(index){
	        
	        {
	            var cols = $(this).find("td");      
	            data.push(cols.first().text());                           
	        }
	    });
	    return data;
	}
	
	var myChart = new Chart(ctx2, {
	    type: 'pie',
	    data: {
	        labels: generateLabelsFromTable2(),
	        datasets: [{
	            label: '성별',
	            data: generatedataFromTable2(),
	            backgroundColor: [
	                "#ffd4d4",
	                "#d4e3ff",
	            ],
	            borderColor: "#fff"
	        }]
	    },
	    options: {
	        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	        tooltips: {
				enabled: false
			},
			hover: {
				animationDuration: 0
			},
	        animation: {
	        	duration: 1,
	        	onComplete: function () {
					var chartInstance = this.chart,
						ctx = chartInstance.ctx;
					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize = "17", Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
					ctx.fillStyle = 'black';
					ctx.textAlign = 'center';
					ctx.textBaseline = 'bottom';

					this.data.datasets.forEach(function (dataset, i) {
						var meta = chartInstance.controller.getDatasetMeta(i);
						meta.data.forEach(function (bar, index) {
							var data = dataset.data[0];							
							ctx.fillText("여성 " + data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "명", bar._model.x + 130, bar._model.y - 140);
							var data = dataset.data[1];							
							ctx.fillText("남성 " + data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "명", bar._model.x - 130, bar._model.y - 140);

						});
					});
				}
	        },
	        plugins: {
				datalabels: {
					formatter: (value, ctx) => {
						let datasets = ctx.chart.data.datasets;
						if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
							let a = ${memberListByGender[0].total};
							let b = ${memberListByGender[1].total};
							let sum = a + b ;							
							let percentage = Math.round((value / sum) * 100) + '%';
							return percentage;
						} else {
							return datasets;
						}
					},
					color: '#000',
					font: {
						size: 20
					}
				}
			},
	        legend: {
	            display: false
	        },
	        title: {
                display: true,
                text: '회원 성별비율',
                fontStyle: 'bold',
                fontSize: 30,
            }
	    }
	});
</script>
</html>