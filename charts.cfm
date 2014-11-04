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
          var container_chartAtaFleetAvg = new Highcharts.Chart({
    chart: {
        renderTo: 'container1',
            
            type: 'bar',
            height: 285
            
          },
          title: {
            text: 'Fleet Average'
          },
          subtitle: {
            text: 'ATA (20)'
          },
          xAxis: {
            categories: ['Fleet Average'],
            title: {
              text: ''
            },
            labels: {
                            style: {
                                width: '12000px'
                            }
                        }
          },
          yAxis: {
            min: 0,
            title: {
              text: 'Average',
              align: 'high'
            },
            labels: {
              overflow: 'justify'
            }
          },
          tooltip: {
            formatter: function() {
              return ''+ this.series.name +': '+ this.y +' Average';
            }
          },
          plotOptions: {
            bar: {
              dataLabels: {
                enabled: true
              }
            },
            series: {
              pointWidth:10,
                            groupPadding: .05,
              shadow: true
            }
          },
          legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false,
            borderWidth: 1,
            backgroundColor: '#FFFFFF',
            shadow: true,
            labelFormatter: function() {
              return '<div class="' + this.name + '-arrow"></div><span style="font-family: \'Advent Pro\', sans-serif; font-size:12px">' + this.name +'</span><br/><span style="font-size:10px; color:#ababaa">   Total: ' + this.options.total + '</span>';
            }
          },
          credits: {
            enabled: false
          },
          exporting: { 
            enabled: true 
          },
          series: [{
        name: 'Intermediate',
        total: '0.35',
        data: [0.35]
        },{
        name: 'Lite',
        total: '0.3',
        data: [0.30]
        },{
        name: 'Heavy',
        total: '0.1',
        data: [0.10]
        }]
        });
  

      $('#container').highcharts({
          chart: {
              renderTo: 'container',
              type: 'column'
          },
          title: {
              text: 'Forgot Password per Month per User'
          },
          subtitle: {
              text: 'Fake text'
          },
          xAxis: {
              categories: [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                  'Aug',
                  'Sep',
                  'Oct',
                  'Nov',
                  'Dec'
              ]
          },
          yAxis: {
              min: 0,
              title: {
                  text: 'Times'
              }
          },
          tooltip: {
              headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
              pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                  '<td style="padding:0"><b>{point.y:.0f} time(s)</b></td></tr>',
              footerFormat: '</table>',
              shared: true,
              useHTML: true
          },
          plotOptions: {
              column: {
                  pointPadding: 0.2,
                  borderWidth: 0
              }
          },
          series: displayData
      });
  });
      </script>
  <body>
    <div >
    Hello Charts
    </div>

<div class="container">
    <div class="row">
        <div class="col-md-11"><div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
    </div>
    <div class="row" style="margin-top:10px;">
        <div class="col-md-6">
          <div id="container1" style="min-width: 310px; height: 600px; margin: 0 auto"></div>
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
    <script src="assets/js/highcharts/modules/exporting.js"></script>
    <!-- <script src="docs/assets/js/application.js"></script> -->

    <script>
      videojs.options.flash.swf = "assets/js/vendors/video-js.swf"
    </script>
  </body>
</html>
