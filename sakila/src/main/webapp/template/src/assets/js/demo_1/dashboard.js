(function ($) {
  'use strict';
  $(function () {
    
    var lineStatsOptions = {
      scales: {
        yAxes: [{
          display: false
        }],
        xAxes: [{
          display: false
        }]
      },
      legend: {
        display: false
      },
      elements: {
        point: {
          radius: 0
        },
        line: {
          tension: 0
        }
      },
      stepsize: 100
    }
    if ($('#sales-statistics-overview').length) {
    
      var salesChartCanvas = $("#sales-statistics-overview").get(0).getContext("2d");
      var gradientStrokeFill_1 = salesChartCanvas.createLinearGradient(0, 0, 0, 450);
      
      gradientStrokeFill_1.addColorStop(1, 'rgba(255,255,255, 0.0)');
      gradientStrokeFill_1.addColorStop(0, 'rgba(102,78,235, 0.2)');
      
      var gradientStrokeFill_2 = salesChartCanvas.createLinearGradient(0, 0, 0, 400);
      gradientStrokeFill_2.addColorStop(1, 'rgba(255, 255, 255, 0.01)');
      gradientStrokeFill_2.addColorStop(0, '#14c671');
      
      // store 1
      var data_1_1 = [0,0,0,0,0,0,0,0,0,0,0,0]; //2005
      var data_1_2 = [0,0,0,0,0,0,0,0,0,0,0,0]; //2006
      var data_1_3 = [0,0,0,0,0,0,0,0,0,0,0,0]; //2021
	  
	  // store 2
      var data_2_1 = [0,0,0,0,0,0,0,0,0,0,0,0]; //2005
      var data_2_2 = [0,0,0,0,0,0,0,0,0,0,0,0]; //2006
      var data_2_3 = [0,0,0,0,0,0,0,0,0,0,0,0]; //2021

      var areaData = {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"],
        datasets: [{
          label: 'Store 1',
          data: data_1_1,
          borderColor: infoColor,
          backgroundColor: gradientStrokeFill_1,
          borderWidth: 2
        }, {
          label: 'Store 2',
          data: data_2_1,
          borderColor: successColor,
          backgroundColor: gradientStrokeFill_2,
          borderWidth: 2
        }]
      };
      var areaOptions = {
        responsive: true,
        animation: {
          animateScale: true,
          animateRotate: true
        },
        elements: {
          point: {
            radius: 3,
            backgroundColor: "#fff"
          },
          line: {
            tension: 0
          }
        },
        layout: {
          padding: {
            left: 0,
            right: 0,
            top: 0,
            bottom: 0
          }
        },
        legend: false,
        legendCallback: function (chart) {
          var text = [];
          text.push('<div class="chartjs-legend"><ul>');
          for (var i = 0; i < chart.data.datasets.length; i++) {
            console.log(chart.data.datasets[i]); // see what's inside the obj.
            text.push('<li>');
            text.push('<span style="background-color:' + chart.data.datasets[i].borderColor + '">' + '</span>');
            text.push(chart.data.datasets[i].label);
            text.push('</li>');
          }
          text.push('</ul></div>');
          return text.join("");
        },
        scales: {
          xAxes: [{
            display: false,
            ticks: {
              display: false,
              beginAtZero: false
            },
            gridLines: {
              drawBorder: false
            }
          }],
          yAxes: [{
            ticks: {
              max: 15000,
              min: 0,
              stepSize: 5000,
              fontColor: "#858585",
              beginAtZero: false
            },
            gridLines: {
              color: '#e2e6ec',
              display: true,
              drawBorder: false
            }
          }]
        }
      }
      
      var salesChart = new Chart(salesChartCanvas, {
	    type: 'bar',
	    data: areaData,
	    options: areaOptions
	  });
      
      console.log('getSalesByCategoryList RestApi request');
		$.ajax({
			type:'get',
			url:'/getmonthlySalesList',
			success: function(jsonData) {
				$(jsonData).each(function(index, item) {
					if((item.YEAR == 2005) && (item.storeId == 1) ){
						data_1_1.splice(item.MONTH-1, 1, item.total_sales);
					}
					if((item.YEAR == 2006) && (item.storeId == 1) ){
						data_1_2.splice(item.MONTH-1, 1, item.total_sales);
					}
					if((item.YEAR == 2021) && (item.storeId == 1) ){
						data_1_3.splice(item.MONTH-1, 1, item.total_sales);
					}
					
					if((item.YEAR == 2005) && (item.storeId == 2) ){
						data_2_1.splice(item.MONTH-1, 1, item.total_sales);
					}
					if((item.YEAR == 2006) && (item.storeId == 2) ){
						data_2_2.splice(item.MONTH-1, 1, item.total_sales);
					}
					if((item.YEAR == 2021) && (item.storeId == 2) ){
						data_2_3.splice(item.MONTH-1, 1, item.total_sales);
					}
				});
				
				console.log(data_1_1);
      			console.log(data_1_2);
      			console.log(data_1_3);
      			
      			console.log(data_2_1);
      			console.log(data_2_2);
      			console.log(data_2_3);
				
				 salesChart = new Chart(salesChartCanvas, {
			      type: 'bar',
			      data: areaData,
			      options: areaOptions
			    });
			    document.getElementById('sales-statistics-legend').innerHTML = salesChart.generateLegend();
			    
			}
		});


      $("#sales-statistics_switch_1").click(function () {
        var data = salesChart.data;
        data.datasets[0].data = data_1_1;
        data.datasets[1].data = data_2_1;
        salesChart.update();
      });
      $("#sales-statistics_switch_2").click(function () {
        var data = salesChart.data;
        data.datasets[0].data = data_1_2;
        data.datasets[1].data = data_2_2;
        salesChart.update();
      });
      $("#sales-statistics_switch_3").click(function () {
        var data = salesChart.data;
        data.datasets[0].data = data_1_3;
        data.datasets[1].data = data_2_3;
        salesChart.update();
      });
    }
    
    if ($("#net-profit").length) {
    	
      var marksCanvas = document.getElementById("net-profit");
      var marksData = {
        labels: [],
        datasets: [{
          label: "Sales",
          backgroundColor: 'rgba(88, 208, 222,0.8)',
          borderColor: 'rgba(88, 208, 222,0.8)',
          borderWidth: 0,
          fill: true,
          radius: 0,
          pointRadius: 0,
          pointBorderWidth: 0,
          pointBackgroundColor: 'rgba(88, 208, 222,0.8)',
          pointHoverRadius: 10,
          pointHitRadius: 5,
          data: []
        }]
      };
      
      var chartOptions = {
        scale: {
          ticks: {
            beginAtZero: true,
            min: 0,
            max: 8000,
            stepSize: 2000,
            display: false,
          },
          pointLabels: {
            fontSize: 14
          },
          angleLines: {
            color: '#e9ebf1'
          },
          gridLines: {
            color: "#e9ebf1"
          }
        },
        legend: false,
        legendCallback: function (chart) {
          var text = [];
          text.push('<div class="chartjs-legend"><ul>');
          for (var i = 0; i < chart.data.datasets.length; i++) {
            console.log(chart.data.datasets[i]); // see what's inside the obj.
            text.push('<li>');
            text.push('<span style="background-color:' + chart.data.datasets[i].backgroundColor + '">' + '</span>');
            text.push(chart.data.datasets[i].label);
            text.push('</li>');
          }
          text.push('</ul></div>');
          return text.join("");
        },
      };

    	console.log('getSalesByCategoryList RestApi request');
		$.ajax({
			type:'get',
			url:'/getSalesByCategoryList',
			success: function(jsonData) {
				$(jsonData).each(function(index, item) {
      				marksData.labels.push(item.category);
      				marksData.datasets[0].data.push(item.total_sales);
				});
				
				console.log(marksData);
				
				var radarChart = new Chart(marksCanvas, {
			    	type: 'radar',
			        data: marksData,
			        options: chartOptions
			    });
			    document.getElementById('net-profit-legend').innerHTML = radarChart.generateLegend();
			    
			}
		});
	  
    }

    if ($('#stats-line-graph-1').length) {
      var lineChartCanvas = $("#stats-line-graph-1").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [7, 6, 9, 7, 8, 6, 8, 5, 7, 8, 6, 7, 7],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    if ($('#stats-line-graph-2').length) {
      var lineChartCanvas = $("#stats-line-graph-2").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [7, 6, 8, 5, 7, 8, 6, 7, 7, 6, 9, 7, 8],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    if ($('#stats-line-graph-3').length) {
      var lineChartCanvas = $("#stats-line-graph-3").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [8, 6, 7, 8, 5, 7, 9, 7, 8, 7, 6, 7, 6],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    if ($('#stats-line-graph-4').length) {
      var lineChartCanvas = $("#stats-line-graph-4").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [7, 6, 8, 5, 8, 6, 8, 7, 8, 6, 9, 7, 7],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    
  });
})(jQuery);