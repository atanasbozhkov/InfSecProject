<!--- cf function --->
<cfajaxproxy cfc="components.auth" jsclassname="auth">
<cfajaxproxy cfc="components.visualisation" jsclassname="db">




<!--- Get Fail Successful and Fail attempts for a specific time interval --->

<cfinvoke component="components.visualisation" method="getLoginAttempts" returnVariable="testReturn">
	<cfinvokeargument name="timeFrom" value="2013-01-01 00:00:00">
	<cfinvokeargument name="timeTo" value="2014-01-01 00:00:00">
</cfinvoke>


<!-- <cfoutput>#testReturn#</cfoutput> -->

<cfscript>
	writeOutput("<script> var dataa= "&testReturn&";</script>");
</cfscript>



<!---------------------------------------------------->




<!DOCTYPE html>
<html lang="en">



  <head>
    <meta charset="utf-8">
    <title>Charts</title>
    <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

    <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="assets/css/flat-ui.css" rel="stylesheet">
    <!-- <link href="docs/assets/css/demo.css" rel="stylesheet"> -->

    <!--- Load the css for the side menu  --->
    <link href="assets/css/menu.css" rel="stylesheet">

    <link rel="shortcut icon" href="img/favicon.ico">
    <style type="text/css">
    body {
      background-color: #1abc9c;
    }
    .loading {
        background-image: url(./assets/img/icons/loading.gif);
        background-repeat: no-repeat;
        background-size: contain;
        background-position: center;
    }
    </style>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="assets/js/vendor/html5shiv.js"></script>
      <script src="assets/js/vendor/respond.min.js"></script>
    <![endif]-->
    <script src="assets/js/jquery8.js"></script>

  </head>


 <script type="text/javascript">
 
 function getCurrentDate() {

 
  var d = new Date();
    var curr_date = d.getDate();
    var curr_month = d.getMonth() + 1; //Months are zero based
    var curr_year = d.getFullYear();
    var curr_hour = d.getHours(),
        curr_minute = d.getMinutes(),
        curr_second = d.getSeconds();
	var currentDate = curr_year + "-" + curr_month + "-" + curr_date + " "+curr_hour+":"+curr_minute+":"+curr_second;
	
	
	
	return currentDate;
 
}


 function getDaysAgo(day) {

 
	var oneWeekAgo = new Date();
	oneWeekAgo.setDate(oneWeekAgo.getDate() - day);
	var pre_date = oneWeekAgo.getDate();
    var pre_month = oneWeekAgo.getMonth() + 1; //Months are zero based
    var pre_year = oneWeekAgo.getFullYear();
    var curr_hour = oneWeekAgo.getHours(),
        curr_minute = oneWeekAgo.getMinutes(),
        curr_second = oneWeekAgo.getSeconds();
	
	var beforeOneWeek=pre_year  + "-" + pre_month + "-" + pre_date + " "+curr_hour+":"+curr_minute+":"+curr_second;
	
	
	
	return beforeOneWeek;
	
 
}
 
</script>



<script type="text/javascript">

//document.write(getCurrentDate()+ "  -----------------------------");
//document.write( getDaysAgo(7)+ "---*******----------");
var counter = 0,
    dataArr = {};
function mainChartCounter(name, data) {
    dataArr[name] = data;
    counter++;
    if (counter === 2) {
        chart(dataArr.stat, dataArr.expected);
    }
}

var mainChartData = function() {
    var dbModel1 = new this(),
        dbModel2 = new this();
	
    dbModel1.setCallbackHandler(function(data) {
        mainChartCounter("stat", data);
    })
    // db.statNumber('1999-01-01', '2015-01-01');
	dbModel1.statNumber(getDaysAgo(7) , getCurrentDate());

    dbModel2.setCallbackHandler(function(data) {
        mainChartCounter("expected", data);
    })
    // db.statNumber('1999-01-01', '2015-01-01');
    dbModel2.getExpectedValues(getDaysAgo(3) , getDaysAgo(1));
}.bind(db)

//
var getForgotten = function() {
    var dbModel2 = new this();
    dbModel2.setCallbackHandler(function(forgotten) {
      // console.log()
        var array = [];
        for (var i = 0; i < forgotten.length; i++) {
            array.push([Date.parse(forgotten[i].DATE), forgotten[i].DAYCOUNT]);
        };
        
		var db2 = new db();
	
		db2.setCallbackHandler(function(data){
		
			forgottenChart(array, data.FORGOTTEN.FAILCOUNT + data.FORGOTTEN.SUCCESSCOUNT);
		});
		db2.statNumber(getDaysAgo(7), getCurrentDate());
    })
    dbModel2.getForgotAttemptsPerDay('1999-01-01', getCurrentDate());
}.bind(db)
//
var getFailed = function() {
    var dbModel = new this();
	
    dbModel.setCallbackHandler(function(failed) {
        console.log(failed)
        // var forgot = failed.SUCCESS.concat(failed.FAIL)
        var array = [];
        for (var i = 0; i < failed.length; i++) {
            array.push([Date.parse(failed[i].DATE), failed[i].TOTALCOUNT]);
        };
        console.log(array);
        console.log('deba');
		
		var db1 = new db();
	
		db1.setCallbackHandler(function(data){
			failedChart(array, data.LOGIN.FAILCOUNT);
		});
		db1.statNumber(getDaysAgo(7), getCurrentDate());
    })
    dbModel.getFailedAttemptsPerDay('1999-01-01', getCurrentDate());
}.bind(db)
//
getFailed();
//
function chart(data, expectedData) {
        // Main graph

        var options = {
            chart: {
                renderTo: 'container',
                type: 'column'
            },
            title: {
                text: 'Total number of attempts in the last 7 days'
            },
            subtitle: {
                text: 'Forgotten-Fail-changed'
            },
            legend: {
                enabled: false
            },
            xAxis: {
                categories: ['Forgotten', 'Failed', 'Changed']
                
            },
            plotOptions: {
                series: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function(event) {
                                if (this.options.id != "Forgotten") {
                                    open_link();
                                }
                            }
                        }
                    }
                }
            },
			
			tooltip: {
				formatter: function () {
					return 'Now <b>'+ this.point.myData +'<br/>'+ 'Expected value: <b>' + this.point.expected + '</b>';
					
				}
			},
			
            series: [{
				name: 'Last 7 days',
		
                colorByPoint: true,
                data: [{
                    name: 'Forgotten',
                    color: '#e67e22',
                    y: data.FORGOTTEN.FAILCOUNT + data.FORGOTTEN.SUCCESSCOUNT,
					 myData: data.FORGOTTEN.FAILCOUNT + data.FORGOTTEN.SUCCESSCOUNT,
                    drilldown: 'forgotten',
                    expected: Math.round(expectedData.FORGOTTEN.EXPECTEDVALUE * expectedData.TODAYUSERS)
                }, {
                    name: 'Failed',
                    y: data.LOGIN.FAILCOUNT,
					myData: data.LOGIN.FAILCOUNT,
                    color: '#e74c3c',
                    //drilldown: 'failed',
                    expected: Math.round(expectedData.FAIL.EXPECTEDVALUE * expectedData.TODAYUSERS)
                }, {
                    name: 'Changed',
                    y: data.PASSWORDCHANGED.CHANGED_AMOUNT,
					myData: data.PASSWORDCHANGED.CHANGED_AMOUNT,
                    color: '#9b59b6',
                    //drilldown: 'changed',
                    expected: Math.round(expectedData.PWCHANGE.EXPECTEDVALUE * expectedData.TODAYUSERS)
                }]
            }
			
			
			
			
			],
            drilldown: {
                series: [{
					name: 'Last 7 days',
                    id: 'forgotten',
             
						
			data: [{
                    name: 'Fail-Forgotten Password attempts',
                    color: '#e67e22',
                    y: data.FORGOTTEN.FAILCOUNT,
					 myData: data.FORGOTTEN.FAILCOUNT
                }, {
                    name: 'Successful-Forgotten attempts',
                    y: data.FORGOTTEN.SUCCESSCOUNT,
					myData: data.FORGOTTEN.SUCCESSCOUNT,
                    color: '#e74c3c'
                   
                }
							
					]
                }]
            }
        };
        // options end
        options.chart.renderTo = 'container';
        options.chart.type = 'pie';
        var chart2 = new Highcharts.Chart(options);
    }
    //^ chart function end
    <!--- Graph Per Week --->
function forgottenChart(data, totalForgotenCount){
  <!--- Graph Per Week --->
  $(function() {
      $('#container2').highcharts('StockChart', {
          title: {
              text: 'Number of forgotten attempts',
              x: 0 //center
          },
          yAxis: {
             min: 0,
            title: {
                text: 'Attempt Count'
            },
            plotLines:[{
                    value:totalForgotenCount/7,
                    color: '#ff0000',
                    width: 3,
                    zIndex:4,
                    label:{text:'Average of the last 7 days'}
                }]
          },
		   rangeSelector: {
                
                buttons: [{
                    type: 'week',
                    count: 1,
                    text: '1w'
                }, {
                    type: 'week',
                    count: 2,
                    text: '2w'
                }, {
                    type: 'month',
                    count: 1,
                    text: '1m'
                }, {
                    type: 'month',
                    count: 6,
                    text: '6m'
                }, {
                    type: 'year',
                    count: 1,
                    text: '1y'
                }, {
                    type: 'all',
                    text: 'All'
                }],
                selected: 2
            },
         
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'middle',
              borderWidth: 0
          },
          series: [{
              name: 'Forgotten attempt',
              data: data
          }]
      });
  });
}


function failedChart(data, totalFail) {
  $(function() {
    console.log(data)
    console.log('waat')
    $('#container1').highcharts('StockChart', {
        title: {
            text: 'Number of failed attempts',
            x: 0 //center
        },
        
	
        yAxis: {
            min: 0,
            title: {
                text: 'Attempt Count'
            },
            plotLines:[{
                    value:totalFail/7,
                    color: '#ff0000',
                    width: 3,
                    zIndex:4,
                    label:{text:'Average of the last 7 days'}
                }]
        },
		 rangeSelector: {
                
                buttons: [{
                    type: 'week',
                    count: 1,
                    text: '1w'
                }, {
                    type: 'week',
                    count: 2,
                    text: '2w'
                }, {
                    type: 'month',
                    count: 1,
                    text: '1m'
                }, {
                    type: 'month',
                    count: 6,
                    text: '6m'
                }, {
                    type: 'year',
                    count: 1,
                    text: '1y'
                }, {
                    type: 'all',
                    text: 'All'
                }],
                selected: 2
            },
       
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Failed attempt',
            data: data
        }]
    });
  });
}

    // Pie
    // Activate the side menu


$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("active");
});
function logoutSubmit() {
    var instance = new auth();
    instance.setCallbackHandler(function() {
        setTimeout(function() {location.reload();}, 0);
    });
    instance.logout();
}
$(document).ready(function() {
    mainChartData();
    getForgotten();
});
      </script>

  <body>
    <div id="wrapper" class="active">

  <!-- Sidebar -->
  <div id="sidebar-wrapper">
  <ul id="sidebar_menu" class="sidebar-nav">
       <li class="sidebar-brand"><a id="menu-toggle" href="#">Menu</a></li>
  </ul>
    <ul class="sidebar-nav" id="sidebar">
      <li><a href='charts.cfm'>Dashboard</a></li>
      <!--- <li><a>link2</a></li> --->
      <li>
      <!--- <cfif IsUserLoggedIn()> --->
      <cfif GetAuthUser() neq "">
          <cfoutput>
              <a href="settings.cfm">Settings</a>
              <a onClick="logoutSubmit()">Logout</a>
              <!--- <a href="createAdmin.cfm">Admin</a> --->


          </cfoutput>
      </cfif>
      </li>
    </ul>
  </div>

    <div class="row">
        <div class="col-md-12 loading"><div id="container" style="min-width: 310px; height: 400px; margin: 0 auto;"></div></div>
    </div>
    <div class="row" style="margin-top:10px;">
        <div class="col-md-6 loading">
          <div id="container1" style="min-width: 310px; height: 350px; margin: 0 auto"></div>
        </div>
        <div class="col-md-6 loading">
          <div id="container2" style="min-width: 310px; height: 350px; margin: 0 auto"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
    </div>
    <div class="row"></div>
</div>









    <script src="assets/js/vendor/jquery.min.js"></script>
    <script src="assets/js/flat-ui.min.js"></script>
    <!-- Load the charts -->
    <script src="http://code.highcharts.com/stock/highstock.js"></script>
    <script src="http://code.highcharts.com/modules/drilldown.js"></script>
    <script src="assets/js/highcharts/modules/exporting.js"></script>
    <!-- <script src="docs/assets/js/application.js"></script> -->

    <script>
      videojs.options.flash.swf = "assets/js/vendors/video-js.swf"
    </script>





	<script>
    function open_link() {
        // window.open('popup.html', 'chart title', 'width=1680px height=1050px');
        window.location.href = 'popup.cfm';
    }
</script>


  </body>
</html>

