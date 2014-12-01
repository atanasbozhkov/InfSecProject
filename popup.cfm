<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
// Debug
console.clear();
</script>


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
    table {
        width:100%;
    }
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    th, td {
        padding: 5px;
        text-align: left;

    }
    table#t01 tr:nth-child(even) {
        background-color: #eee;
    }
    table#t01 tr:nth-child(odd) {
       background-color:#fff;
    }
    table#t01 th  {

        background-color: gray;
        color: white;
    }
    table#t02 tr:nth-child(even) {
        background-color: #eee;
    }
    table#t02 tr:nth-child(odd) {
       background-color:#fff;
    }
    table#t02 th  {

        background-color: gray;
        color: white;
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
    // Activate the side menu


$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("active");
});
function logoutSubmit() {
    var instance = new auth();
    instance.setCallbackHandler(function() {
        location.reload();
    });
    instance.logout();
}
$(document).ready(function() {
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
      <cfif IsUserLoggedIn()>
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
        <div class="col-md-12"><div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div></div>
    </div>
    <div class="row" style="margin-top:10px;">
        <div class="col-md-6">
          <table id="t01">
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Attempts</th>
            </tr>
            <tr>
               <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>36</td>
            </tr>
            <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>32</td>
            </tr>
            <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>30</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>28</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>28</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>24</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>20</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>17</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>6</td>
            </tr>
          </table>

        </div>
        <div class="col-md-6">
          <table id="t02">
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Attempts</th>
            </tr>
            <tr>
               <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>36</td>
            </tr>
            <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>32</td>
            </tr>
            <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>30</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>28</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>28</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>24</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>20</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>17</td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>6</td>
            </tr>
          </table>
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



<br>

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
 <script>
var chart1;

$(document).ready(function () {
    $('#container').highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text: 'User detail for the last 24 hours'
        },

        xAxis: {
            title: {
        enabled: true,
        text: 'Hours of the Day'
    },
    type: 'datetime',

    dateTimeLabelFormats : {
        hour: '%I %p',
        minute: '%I:%M %p'
    }
        },
        yAxis: {
            title: {
                text: 'Number of attempts'
            },
            min: 0
        },
        tooltip: {
            headerFormat: '<b>{series.name}</b><br>',
            pointFormat: '{point.x:%e. %b}: {point.y:.2f} m'
        },

        series: [{
            name: 'Fail attempts',
            // Define the data points. All series have a dummy year
            // of 1970/71 in order to be compared on the same x axis. Note
            // that in JavaScript, months start at 0 for January, 1 for February etc.
            data: [
                [Date.UTC(1970,  9, 27), 0   ],
                [Date.UTC(1970, 10, 10), 0.6 ],
                [Date.UTC(1970, 10, 18), 0.7 ],
                [Date.UTC(1970, 11,  2), 0.8 ],
                [Date.UTC(1970, 11,  9), 0.6 ],
                [Date.UTC(1970, 11, 16), 0.6 ],
                [Date.UTC(1970, 11, 28), 0.67],
                [Date.UTC(1971,  0,  1), 0.81],
                [Date.UTC(1971,  0,  8), 0.78],
                [Date.UTC(1971,  0, 12), 0.98],
                [Date.UTC(1971,  0, 27), 1.84],
                [Date.UTC(1971,  1, 10), 1.80],
                [Date.UTC(1971,  1, 18), 1.80],
                [Date.UTC(1971,  1, 24), 1.92],
                [Date.UTC(1971,  2,  4), 2.49],
                [Date.UTC(1971,  2, 11), 2.79],
                [Date.UTC(1971,  2, 15), 2.73],
                [Date.UTC(1971,  2, 25), 2.61],
                [Date.UTC(1971,  3,  2), 2.76],
                [Date.UTC(1971,  3,  6), 2.82],
                [Date.UTC(1971,  3, 13), 2.8 ],
                [Date.UTC(1971,  4,  3), 2.1 ],
                [Date.UTC(1971,  4, 26), 1.1 ],
                [Date.UTC(1971,  5,  9), 0.25],
                [Date.UTC(1971,  5, 12), 0   ]
            ]
        }, {
            name: 'Forgotten',
            data: [
                [Date.UTC(1970,  9, 18), 0   ],
                [Date.UTC(1970,  9, 26), 0.2 ],
                [Date.UTC(1970, 11,  1), 0.47],
                [Date.UTC(1970, 11, 11), 0.55],
                [Date.UTC(1970, 11, 25), 1.38],
                [Date.UTC(1971,  0,  8), 1.38],
                [Date.UTC(1971,  0, 15), 1.38],
                [Date.UTC(1971,  1,  1), 1.38],
                [Date.UTC(1971,  1,  8), 1.48],
                [Date.UTC(1971,  1, 21), 1.5 ],
                [Date.UTC(1971,  2, 12), 1.89],
                [Date.UTC(1971,  2, 25), 2.0 ],
                [Date.UTC(1971,  3,  4), 1.94],
                [Date.UTC(1971,  3,  9), 1.91],
                [Date.UTC(1971,  3, 13), 1.75],
                [Date.UTC(1971,  3, 19), 1.6 ],
                [Date.UTC(1971,  4, 25), 0.6 ],
                [Date.UTC(1971,  4, 31), 0.35],
                [Date.UTC(1971,  5,  7), 0   ]
            ]
        }, {
            name: 'Changed',
            data: [
                [Date.UTC(1970,  9,  9), 0   ],
                [Date.UTC(1970,  9, 14), 0.15],
                [Date.UTC(1970, 10, 28), 0.35],
                [Date.UTC(1970, 11, 12), 0.46],
                [Date.UTC(1971,  0,  1), 0.59],
                [Date.UTC(1971,  0, 24), 0.58],
                [Date.UTC(1971,  1,  1), 0.62],
                [Date.UTC(1971,  1,  7), 0.65],
                [Date.UTC(1971,  1, 23), 0.77],
                [Date.UTC(1971,  2,  8), 0.77],
                [Date.UTC(1971,  2, 14), 0.79],
                [Date.UTC(1971,  2, 24), 0.86],
                [Date.UTC(1971,  3,  4), 0.8 ],
                [Date.UTC(1971,  3, 18), 0.94],
                [Date.UTC(1971,  3, 24), 0.9 ],
                [Date.UTC(1971,  4, 16), 0.39],
                [Date.UTC(1971,  4, 21), 0   ]
            ]
        }]
    });
});
</script>





  </body>
</html>

