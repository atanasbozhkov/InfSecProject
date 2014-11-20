<cfinvoke component="components.forgotten" method="resetInit">
    <cfinvokeargument name="token" value="#url['token']#">
</cfinvoke>

<cfajaxproxy cfc="components.forgotten" jsclassname="forgotten">
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
            var pass = $("#new-pass").val(),
                pass_re = $("#retype-pass").val(),
                instance = new forgotten();

            if (pass.length === 0 || pass_re.length === 0)
            {
                $("#message").html("<h4>You must enter your password in both fields.</h4>");
                return;
            }

            instance.setCallbackHandler(function(res)
            {
                var result = "";

                if (res) {
                    result = 'Password reset. Redirect to the index page in 5 seconds';
                    setTimeout(function() {
                        window.location.href = "index.cfm";
                    }, 5000);
                }
                else {
                    result = 'There was an error while resetting the password. Please require another reset password email again.';
                }
                $("#message").html('<center>' + result + '</center>');
            });
            instance.resetPassword(pass, pass_re, "<cfoutput>#url['token']#</cfoutput>");
        }
        </script>
    </head>
    <body>
        <div class="login-screen">
            <div class="login-form" onKeyPress="return checkSubmit(event)">
                <div class="form-group">
                    <input name="password" type="password" class="form-control login-field" value="" placeholder="Enter your new password" id="new-pass" />
                    <label class="login-field-icon fui-lock" for="new-pass"></label>
                </div>

                <div class="form-group">
                    <input name="retypedPassword" type="password" class="form-control login-field" value="" placeholder="Retype your password" id="retype-pass" />
                    <label class="login-field-icon fui-lock" for="retype-pass"></label>
                </div>

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
