<cfajaxproxy cfc="components.register" jsclassname="register">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
    <title>TeamD InfSec Project Register</title>
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
</head>

<body>


<div>
      <div class="login-screen">
        <div class="login-icon">
          <h4><small>Register </small></h4>
        </div>

        <div class="login-form">
          <!--- <div class="form-group">
            <input name="username" type="text" class="form-control login-field" value="" placeholder="Username" id="reg-name" />
            <label class="login-field-icon fui-user" for="reg-name"></label>
          </div> --->

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

          <!--- specfic function --->
          <!--- <input type="Hidden" name="method" value="register"> --->
          <!-----<a class="btn btn-primary btn-lg btn-block" href="charts.html">Log in</a> --->
          <!--- <input class="btn btn-primary btn-lg btn-block" type="submit" name="reg_submit" value="Register"/> --->
          <div class="btn btn-primary btn-lg btn-block" onClick="submitRegister()">Register</div>

        </div>
      </div>
    </div>

    <div><h4 id="message"></h4></div>


    <script src="assets/js/vendor/jquery.min.js"></script>
    <script src="assets/js/flat-ui.min.js"></script>
    <!-- <script src="docs/assets/js/application.js"></script> -->
    <script type="text/javascript">
        function formSubmissionHandler(data)
        {
            console.log(data);
            data = data || {};
            if (data.STATUS)
            {
                $("#message").html("Account Created. Redirect to the index page in 5 seconds");
                setTimeout(function() {
                    window.location.href = "index.cfm";
                }, 5000);
            }
            else
            {
                $("#message").html(data.MSG);
            }
        }

        function submitRegister()
        {
            var instance = new register();
            instance.setCallbackHandler(formSubmissionHandler);
            instance.register($("#reg-email").val(), $("#reg-pass").val(), $("#reg-firstname").val(), $("#reg-lastname").val());
        }
    </script>

    <script>
      videojs.options.flash.swf = "assets/js/vendors/video-js.swf"
    </script>
</body>
</html>
