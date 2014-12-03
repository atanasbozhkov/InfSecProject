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


<!DOCTYPE html>
<html lang="en">
<script src="assets/js/jquery8.js"></script>
<script type="text/javascript">
$(document).ready(function() {

  // Debug
  // console.clear();

  var mainChartData = function() {
      var db = new this();

      db.setCallbackHandler(function(data) {
          // console.log(data)
          var chart = [];
          for (var i = 0; i < data.length; i++) {
              var attempts = data[i]['COUNT(1)'];
              var users = data[i]['USER_ID'];
              var newArr = [attempts, users];
              chart.push(newArr);
          };
          console.log(chart)
          mainChart(chart.sort());
      })
    db.getFailedByUser('1999-01-01', '2015-01-01');
  }.bind(db)

  //Call the function
  mainChartData();
});
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
    <!--- add DataTables --->
    <link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <script type="text/javascript" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
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
              <th>Username</th>
              <th>Frequency</th>
              <th>Growth since last week</th>
              <th>% of system average</th>
            </tr>
            <tr>
               <td>Nikolaos Hadjis</td>
                  <td>36</td>
                  <td>150%</td>
                  <td>112%</td>
            </tr>
            <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>32</td>
                  <td></td>
            </tr>
            <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>30</td>
                  <td></td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>28</td>
                  <td></td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>28</td>
                  <td></td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>24</td>
                  <td></td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>20</td>
                  <td></td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>17</td>
                  <td></td>
            </tr>
             <tr>
              <td>Nikolaos Hadjis</td>
                  <td>hadjis.doe@example.com</td>
                  <td>6</td>
                  <td></td>
            </tr>
          </table>

        </div>
        <div class="col-md-6">
          <table id="t02">
            <tr>
              <th>IP Address</th>
              <th>Attempts</th>
              <th>Growth</th>
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

  function mainChart(data) {
  $(function (){
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Distribution of the failed attempts over the past week'
        },

        xAxis: {
            title: {
        enabled: true,
        text: 'Number of attempts'
    },
    type: 'string',

    dateTimeLabelFormats : {
        hour: '%I %p',
        minute: '%I:%M %p'
    }
        },
        yAxis: {
            title: {
                text: 'Number of users'
            },
            min: 0
        },
        tooltip: {
            headerFormat: '<b>Info</b><br>',
            pointFormat: 'Failed attempts: <b> {point.x} </b> <br/> Number of users: <b>{point.y} </b>'
        },

        series: [{
            name: 'Failed attempts',
            data: data
        }]
    });
  });
}
</script>





  </body>
</html>

