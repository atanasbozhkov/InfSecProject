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
    </style>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="assets/js/vendor/html5shiv.js"></script>
      <script src="assets/js/vendor/respond.min.js"></script>
    <![endif]-->
    <script src="assets/js/jquery8.js"></script>

  </head>




<script type="text/javascript">
  //Get the data from the db

  var db = new db();

  var forgotenCount;

  db.setCallbackHandler(function  (data) {
    console.log(data)
    window.data = data;
  })
  db.statNumber('1999-01-01','2015-01-01');


  $(function () {


    <!--- Graph Per Week --->
    $(function () {
    $('#container2').highcharts('StockChart',{
        title: {
            text: 'Number of forgotten attempts',
            x: 0 //center
        },
        subtitle: {
            //text: 'Source: WorldClimate.com',
            x: 0
        },
        xAxis: {
            categories: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat',
                'Sun']

        },
        yAxis: {
      min: 0,
            title: {
                text: 'Attempt ()'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Failed Attempt',
            data: [3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2,3, 5, 3, 6, 7, 4, 2]

        }]


    });
});

    <!--- Graph Per Week --->
    $(function () {
    $('#container1').highcharts('StockChart',{

	hart: {
                events: {
                    load: function () {
                        this.setTitle(null, {
                            text: 'Built chart in ' + (new Date() - start) + 'ms'
                        });
                    }
                },
                zoomType: 'x'
            },





        title: {
            text: 'Number of failed attempt',
            x: 0 //center
        },
        subtitle: {
            //text: 'Source: WorldClimate.com',
            x: 0
        },
        xAxis: {
            categories: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat',
                'Sun']

        },

		rangeSelector: {

                buttons: [{
                    type: 'day',
                    count: 1,
                    text: '1d'
                }, {
                    type: 'day',
                    count: 3,
                    text: '3d'
                },

                {

                    type: 'week',
                    count: 1,
                    text: '1w'
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
                selected: 3
            },





        yAxis: {
      min: 0,
            title: {
                text: 'Attempt ()'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueDecimals: 1
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
		/*
        series: [{
            name: 'Failed Attempt',
            data: [4, 2, 1, 2, 1, 0, 0,4, 10, 10, 10, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,]



        }]*/
		series: [{
               name: 'Failed Attempt',
                 data: [4, 2, 1, 2, 1, 0, 0,4, 10, 10, 10, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,4, 2, 1, 2, 1, 0, 0,]
,

                pointStart: Date.UTC(2004, 3, 1),
                pointInterval: 3600 * 1000,
                tooltip: {
                    valueDecimals: 1,
                    //valueSuffix: '°C'
                }
            }]


    });
});



// Main graph

var options = {


	chart: {
              renderTo: 'container',
              type: 'column'
    },

	title: {
              text: 'Results for the last 24h'
    },

    subtitle: {
              text: 'Forgotten-Fail-changed'
    },
    legend: {
            enabled: false
    },

	xAxis: {

        categories: ['Forgotten', 'Failed', 'Changed'],
		title: {
            text: null
        }
    },
	 plotOptions: {
            series: {
                cursor: 'pointer',
                point: {
                    events: {
                        click:

						
					
						
						function (event) {
						if (this.options.id != "Forgotten"){
                            open_popup();
						}
                        
                    }
                }
            }}
        },



		series: [{

              colorByPoint: true,
              data: [{
                  name: 'Forgotten',
                  color: '#e67e22',
                  y: data.FORGOTTEN.FAILCOUNT + data.FORGOTTEN.SUCCESSCOUNT,
                  drilldown: 'forgotten'
              }, {
                  name: 'Failed',
                  y: data.LOGIN.FAILCOUNT,
                  color: '#e74c3c',
                  //drilldown: 'failed'
              }, {
                  name: 'Changed',
                  y: data.PASSWORDCHANGED.CHANGED_AMOUNT,
                  color: '#9b59b6',
                  //drilldown: 'changed'
              }]
          }]


		  
		  ,
          drilldown: {
              series: [{
                  id: 'forgotten',
                  data: [
                      ['Fail Forgotten Password attempts', data.FORGOTTEN.FAILCOUNT],
                      ['Successful Forgotten Password attempts', data.FORGOTTEN.SUCCESSCOUNT]
                  ]
              }]
          }




};

//Column chart
//options.chart.renderTo = 'container';
//options.chart.type = 'column';
//var chart1 = new Highcharts.Chart(options);

// Pie
options.chart.renderTo = 'container';
options.chart.type = 'pie';
var chart2 = new Highcharts.Chart(options);



// Activate the side menu
  $("#menu-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("active");
  });
  });

      function logoutSubmit()
      {
          var instance = new auth();
          instance.setCallbackHandler(function(){
              location.reload();
          });
          instance.logout();
      }
      </script>

  <body>
    <div id="wrapper" class="active">

  <!-- Sidebar -->
  <div id="sidebar-wrapper">
  <ul id="sidebar_menu" class="sidebar-nav">
       <li class="sidebar-brand"><a id="menu-toggle" href="#">Menu</a></li>
  </ul>
    <ul class="sidebar-nav" id="sidebar">
      <li><a href='forgotten.cfm'>Forgotten</a></li>
      <li><a>link2</a></li>
      <li>
      <cfif IsUserLoggedIn()>
          <cfoutput>
              <a onClick="logoutSubmit()">Logout</a>
          </cfoutput>
      </cfif>
      </li>
    </ul>
  </div>

    <div class="row">
        <div class="col-md-12"><div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
    </div>
    <div class="row" style="margin-top:10px;">
        <div class="col-md-6">
          <div id="container1" style="min-width: 310px; height: 350px; margin: 0 auto"></div>
        </div>
        <div class="col-md-6">
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
    function open_popup() {
        window.open('popup.html', 'chart title', 'width=1680px height=1050px');
    }
</script>


  </body>
</html>

