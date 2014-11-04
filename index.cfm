<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>TeamD InfSec Project Login</title>
    <meta name="description" content=""/>

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
    .login-form {
      max-width: 50vw;
    }
    </style>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="assets/js/vendor/html5shiv.js"></script>
      <script src="assets/js/vendor/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    function checkSubmit(e)
    {
       if(e && e.keyCode == 13)
          {
                $('.btn-lg')[0].click()
           }
     }
            
    </script>


  </head>
  <body>
    <div>
      <div class="login-screen">
        <div class="login-icon">
          <h4><small>MSc Information Security Project </small> TeamD</h4>
        </div>

        <div class="login-form" onKeyPress="return checkSubmit(event)">
          <!--- <form action=<cfoutput>#CGI.script_name#?#CGI.query_string#</cfoutput> method="Post">  --->
          <form action="" method="Post"> 
            <div class="form-group">
              <input name="j_username" type="text" class="form-control login-field" value="" placeholder="Enter your name" id="login-name" />
              <label class="login-field-icon fui-user" for="login-name"></label>
            </div>

            <div class="form-group">
              <input name="j_password" type="password" class="form-control login-field" value="" placeholder="Password" id="login-pass" />
              <label class="login-field-icon fui-lock" for="login-pass"></label>
            </div>

            <!--- <a class="btn btn-primary btn-lg btn-block" href="charts.cfm">Log in</a> --->
            <input type="submit" value="Log In" class="btn btn-primary btn-lg btn-block">
            <a class="login-link" href="#">Forgot your password?</a>
          </form>
        </div>
      </div>
    </div>


    <script src="assets/js/vendor/jquery.min.js"></script>
    <script src="assets/js/flat-ui.min.js"></script>
    <!-- <script src="docs/assets/js/application.js"></script> -->

    <script>
      videojs.options.flash.swf = "assets/js/vendors/video-js.swf"
    </script>
  </body>
</html>
