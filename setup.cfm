<cfif APPLICATION.setup eq true>
    <cflocation url="index.cfm">
</cfif>

<cfinvoke component="components.config" method="getConfig" returnvariable="config">
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

        function checkSubmit(e)
        {
           if(e && e.keyCode == 13)
              {
                    $('.btn-lg')[0].click()
               }
        }

        function submit()
        {
            window.location="setupFinished.cfm";
        }
        </script>
    </head>
    <body>
        <div class="login-screen">
            <div class="login-form">
                <p>
                    Welcome to use Security Analysis Tool<br>
                    Here is your configuration<br>
                    Sourcename: 
                    <cfif config.sourcename neq "">
                        <cfoutput>#config.sourcename#</cfoutput>
                    <cfelse>
                        <cfoutput>[empty]</cfoutput>
                    </cfif><br>
                    Database: 
                    <cfif config.sourcename neq "">
                        <cfoutput>#config.database#</cfoutput>
                    <cfelse>
                        <cfoutput>[empty]</cfoutput>
                    </cfif><br>
                    Sender Email address:
                    <cfif config.emailAddr neq "">
                        <cfoutput>#config.database#</cfoutput>
                    <cfelse>
                        <cfoutput>[empty]</cfoutput>
                    </cfif><br>
                    We have detected the database you config in the file has missing tables,<br>
                    by clicking the button, the component would create necessary tables using the information above<br>
                    If you want to change the information, please go to /coldfusionComponent/components/config.cfc
                </p>

                <div id="submit" class="btn btn-primary btn-lg btn-block" onClick="return submit()">Submit</div>
            </div>
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
