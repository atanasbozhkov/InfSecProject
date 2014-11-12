<!--- cf function --->
<cfset dbManager = createObject("component","components.dbManager").init()>
<cfinvoke component="#dbManager#" method="getData" returnvariable="data">
<cfinvoke component="#dbManager#" method="getUsername" returnvariable="userName">
<cfinvoke component="components.forgotten" method="sendLink" returnvariable="forgottenResult">
    <cfinvokeargument name="userid" value="0">
</cfinvoke>
<cfif #forgottenResult# is 1>
    <cfoutput>
        <script type="text/javascript">
        var result = 'Email link sent successfully. Please check your email in a few minutes.';
        </script>
    </cfoutput>
    <cfelse>
        <script type="text/javascript">
        var result = 'There was an error while sending the reset link. Please contact the administrators';
        </script>
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
    function checkSubmit(e)
    {
       if(e && e.keyCode == 13)
          {
                $('.btn-lg')[0].click()
           }
    }

    function submitLogin()
    {
        var username = $("#login-name").val(),
            password = $("#login-pass").val();

        if (username.length === 0 || password.length === 0)
        {
            $("#message").html("<h4>You must enter text in both the User Name and Password fields.</h4>");
            return;
        }

        $.ajax({
            url: "http://localhost:8500/rest/securitycfc/api/login",
            contentType: "application/json",
            beforeSend: function(xhr) {
               xhr.setRequestHeader("Authorization", "Basic"+btoa(username+":"+password));
            }
        }).done(function(data){
            if (data)
            {
                location.reload();
            }
            else
            {
                $("#message").html("<h4>Your login information is not valid.<br>Please Try again</h4>");
            }
        });
    }
    $( document ).ready(function() {
        document.getElementById('result').innerHTML = '<center>' + result + '</center>'
    });
    </script>


  </head>
  <body>
    <div id="result" style="color:#fff;">

    </div>


    <script src="assets/js/vendor/jquery.min.js"></script>
    <script src="assets/js/flat-ui.min.js"></script>
    <!-- <script src="docs/assets/js/application.js"></script> -->

    <script>
      videojs.options.flash.swf = "assets/js/vendors/video-js.swf"
    </script>
  </body>
</html>
