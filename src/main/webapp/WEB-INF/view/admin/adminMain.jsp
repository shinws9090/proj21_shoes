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
<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
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
		<section>
			<div class="d-flex" id="wrapper">
				<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
			    <!-- Page content wrapper-->
			    <div id="page-content-wrapper">
			        
			        <!-- Page content-->
			        <div class="container-fluid">
			            <h1 class="mt-4">관리자 페이지</h1>
			            <p>관리자 페이지 첫화면</p>
				        <div id="table">
				        	<table id="ordertable" style="width: 90%; text-align: center">
								<thead>
							        <fmt:parseNumber var="i" type="number" value="${fn:length(orderListByMontyPay)}"/>
									<c:forEach items="${orderListByMontyPay}" var="orderListByMontyPay" begin="${i + -12}" end="${fn:length(orderListByMontyPay)}">
										<tr>
											<th>${orderListByMontyPay.orderDate}</th>
											<td>${orderListByMontyPay.paymentAmount}</td>
											
										</tr>
									</c:forEach>
								</thead>
							</table>
				        </div>
				        				        
				        <div id="container" style="width: 90%;">
							<canvas id="myChart"></canvas>
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
	
	    var rows = $("tr");
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
	
	    var rows = $("tr");
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
	                    callback: function(value, index, values) {
	                        return value;
	                      }
	                }
				}]
			}
	    }
	});
</script>
</html>