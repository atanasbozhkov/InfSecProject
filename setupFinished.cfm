<cfif APPLICATION.setup eq false>
    <cfinvoke component="components.init" method="finishedSetup" returnvariable="setupSuccess">
<cfelse>
    <cflocation url="index.cfm">
</cfif>

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
        <script src="assets/js/jquery8.js"></script>

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
            setTimeout(function() {
                window.location.href = "index.cfm";
            }, 5000);
        </script>
    </head>
    <body>
        <div class="login-screen">
            <cfif setupSuccess eq true>
                Setup is done.<br>
                The page will be redirected in 5 seconds.
            <cfelse>
                Setup failed.
            </cfif>

            <div id="message" style="color:#fff;width:650px;"></div>
        </div>


        <script src="assets/js/vendor/jquery.min.js"></script>
        <script src="assets/js/flat-ui.min.js"></script>
        <!-- <script src="docs/assets/js/application.js"></script> -->

        <script>
            videojs.options.flash.swf = "assets/js/vendors/video-js.swf";
        </script>
    </body>
</html>
