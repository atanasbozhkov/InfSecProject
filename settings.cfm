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
    .login-form{
      width:30vw;
      margin: 0 auto;
      margin-top: 5vh;
    }
    .adminlogin-form{
      width:30vw;
      margin: 0 auto;
      margin-top: 5vh;
    }
    </style>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="assets/js/vendor/html5shiv.js"></script>
      <script src="assets/js/vendor/respond.min.js"></script>
    <![endif]-->
    <script src="assets/js/jquery8.js"></script>
    <script>

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
        mainChartData();
        getForgotten();
    });
          </script>
  </head>

  <body>
    <div id="wrapper" class="active">

  <!-- Sidebar -->
  <div id="sidebar-wrapper">
  <ul id="sidebar_menu" class="sidebar-nav">
       <li class="sidebar-brand"><a id="menu-toggle" href="#">Menu</a></li>
  </ul>
    <ul class="sidebar-nav" id="sidebar">
      <li><a href='charts.cfm'>Dashboard</a></li>
      <li>
      <cfif IsUserLoggedIn()>
          <cfoutput>
              <a href="settings.cfm">Settings</a>
              <a onClick="logoutSubmit()">Logout</a>


          </cfoutput>
      </cfif>
      </li>
    </ul>
  </div>

    <div class="row">
        <div class="col-md-12">
                  <div class="login-form">
                    <p> Change current password </p>

<!---                     <div class="form-group">
                      <input name="email" type="text" class="form-control login-field" value="" placeholder="Enter your email" id="reg-email" />
                      <label class="login-field-icon fui-mail" for="reg-email"></label>
                    </div>
 --->

                    <div class="form-group">
                      <input name="password" type="password" class="form-control login-field" value="" placeholder="Old password" id="reg-pass" />
                      <label class="login-field-icon fui-lock" for="reg-pass"></label>
                    </div>


          <div class="form-group">
                      <input name="password" type="password" class="form-control login-field" value="" placeholder="New password" id="reg-newpass" />
                      <label class="login-field-icon fui-lock" for="reg-newpass"></label>
                    </div>

                 <div class="form-group">
                      <input name="password" type="password" class="form-control login-field" value="" placeholder="Re-enter new password" id="reg-newpass" />
                      <label class="login-field-icon fui-lock" for="reg-newpass"></label>
                    </div>



                    <div class="btn btn-primary btn-lg btn-block" onClick="submitNewpass()">Change Password</div>

                  </div>


        </div>
    </div>
    <div class="row" style="margin-top:10px;">
        <div class="col-md-12">
          <div class="adminlogin-form">
            <p> Register a new admin </p>
           <div class="form-group">
              <input name="email" type="text" class="form-control login-field" value="" placeholder="Email" id="reg-email" />
              <label class="login-field-icon fui-mail" for="reg-email"></label>
            </div>


            <div class="form-group">
              <input name="password" type="password" class="form-control login-field" value="" placeholder="Password" id="reg-pass" />
              <label class="login-field-icon fui-lock" for="reg-pass"></label>
            </div>

            <div class="form-group">
              <input name="firstname" type="text" class="form-control login-field" value="" placeholder="Firstname" id="reg-firstname" />
              <label class="login-field-icon fui-user" for="reg-firstname"></label>
            </div>


            <div class="form-group">
              <input name="lastname" type="text" class="form-control login-field" value="" placeholder="Lastname" id="reg-lastname" />
              <label class="login-field-icon fui-user" for="reg-lastname"></label>
            </div>

            <div class="btn btn-primary btn-lg btn-block" onClick="submitRegister()">Register</div>



          </div>
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

