<!--- cf function --->
<cfset dbManager = createObject("component","components.dbManager").init()>
<cfinvoke component="#dbManager#" method="getData" returnvariable="data">
<cfinvoke component="#dbManager#" method="getUsername" returnvariable="userName">

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
  $(function () {
      var displayData = [], userNames = <cfoutput>#userName#</cfoutput>;
      for (var name in userNames) {
          var obj = {};
          obj.name = userNames[name];
          obj.data = [];
          for (var i=0; i<12; i++) {
            obj.data.push(Math.random()*10);
          }
          displayData.push(obj);
      };
	  
	  



		
<!--- Graph Per Week 
		$(function () {
    $('#container1').highcharts({
        title: {
            text: 'Average failed attempt per week',
            x: -20 //center
        },
        subtitle: {
            //text: 'Source: WorldClimate.com',
            x: -20
        },
        xAxis: {
            categories: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat',
                'Sun']
        },
        yAxis: {
            title: {
                text: 'Attempt (%)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '%'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Failed Attempt',
            data: [4, 2, 1, 2, 1, 0, 0]
      
        }]
    });
}); --->


<!--- Graph Per Month ---> 	
		$(function () {
    $('#container5').highcharts({
        title: {
            text: 'Total number of failed attempt',
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
            data: [4, 2, 1, 2, 1, 0, 0]
      
        }]
		
		
    });
}); 



















<!--- Heat map 

$(function () {

    $('#container2').highcharts({

        data: {
            csv: document.getElementById('csv').innerHTML
        },

        chart: {
            type: 'heatmap',
            inverted: true
        },


        title: {
            text: 'Highcharts heat map study',
            align: 'left'
        },

        subtitle: {
            text: 'Temperature variation by day and hour through April 2013',
            align: 'left'
        },

        xAxis: {
            tickPixelInterval: 50,
            min: Date.UTC(2013, 3, 1),
            max: Date.UTC(2013, 3, 30)
        },

        yAxis: {
            title: {
                text: null
            },
            labels: {
                format: '{value}:00'
            },
            minPadding: 0,
            maxPadding: 0,
            startOnTick: false,
            endOnTick: false,
            tickPositions: [0, 6, 12, 18, 24],
            tickWidth: 1,
            min: 0,
            max: 23
        },

        colorAxis: {
            stops: [
                [0, '#3060cf'],
                [0.5, '#fffbbc'],
                [0.9, '#c4463a']
            ],
            min: -5
        },

        series: [{
            borderWidth: 0,
            colsize: 24 * 36e5, // one day
            tooltip: {
                headerFormat: 'Temperature<br/>',
                pointFormat: '{point.x:%e %b, %Y} {point.y}:00: <b>{point.value} ℃</b>'
            }
        }]

    });
}); --->













      $('#container').highcharts({
          chart: {
              renderTo: 'container',
              type: 'column'
          },
          title: {
              text: 'Graph of the Day'
          },
          subtitle: {
              //text: 'Fake text'
			  
          },
          series: [{
              name: 'Total number of people',
              colorByPoint: true,
              data: [{
				  // name: 'Number of people',
				   color: 'red',
                  name: 'Failed attempt',
                  y: 3,
                  drilldown: 'failed attempt'
              }, {
				  color: 'blue',
                  name: 'Forgotten password',
                  y: 2,
                  drilldown: 'forgotten password'
              }, {
				  color: 'green',
                  name: 'Success',
                  y: 4,
                  drilldown: 'success'
              }]
          }],
          drilldown: {
              series: [{
                  id: 'failed attempt',
                  data: [
                      ['Nasco', 4],
                      ['Sam', 1]
				  ]
              }, {
                  id: 'forgotten password',
                  data: [
                      ['Karen', 4],
                      ['Jack', 2]
                  ]
              }, {
                  id: 'success',
                  data: [
                      ['Jake', 4],
                      ['Marina', 2],
                      ['Ivan', 2],
					  ['Jospeph', 2],
                      ['Kelvin', 1],
                      ['Nicolas', 2]
                  ]
              }]
          }

      });

// Activate the side menu
  $("#menu-toggle").click(function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("active");
  });
  });
      </script>

  <body>
    <div id="wrapper" class="active">

  <!-- Sidebar -->
  <div id="sidebar-wrapper">
  <ul id="sidebar_menu" class="sidebar-nav">
  
  
  <!--- QR Code --->
  <img src="chart.png" alt="QR Image" style="width:150px;height:150px">
  
  
  
  
  
       <li class="sidebar-brand"><a id="menu-toggle" href="#">Menu</a></li>
  </ul>
    <ul class="sidebar-nav" id="sidebar">
      <li><a>Link1</a></li>
      <li><a>link2</a></li>
      <li>
      <cfif GetAuthUser() NEQ "">
          <cfoutput>
             <a onclick="document.getElementById('logout').submit()" style="{color: ##999999} :hover {color: ##fff} "><li> <form id="logout" action="" method="Post">
                  <input type="hidden" Name="logout" value="Logout">
                  Logout
              </form></li></a>
          </cfoutput>
      </cfif>
      
    </ul>
  </div>

    <div class="row">
        <div class="col-md-11"><div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
    </div>
    
        <div class="row" style="margin-top:10px;">
        <div class="col-md-6">
          <div id="container5" style="min-width: 310px; height: 350px; margin: 0 auto"></div>
    
    <div class="row" style="margin-top:10px;">
        <div class="col-md-6">
          <div id="container1" style="min-width: 310px; height: 350px; margin: 0 auto"></div>
             <div class="row" style="margin-top:50px;">
        <div class="col-md-6">
          <div id="container2" style="min-width: 310px; height: 350px; margin: 0 auto"></div>
          
        </div>
        <div class="col-md-5"></div>
        
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
    <script src="assets/js/highcharts/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/drilldown.js"></script>
    <script src="assets/js/highcharts/modules/exporting.js"></script>
    <!-- <script src="docs/assets/js/application.js"></script> -->

    <script>
      videojs.options.flash.swf = "assets/js/vendors/video-js.swf"
    </script>
  </body>
</html>
