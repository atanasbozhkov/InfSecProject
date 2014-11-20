<cfajaxproxy cfc="components.visualisation" jsclassname="dataModel">
<script type="text/javascript">
    var dataModel1 = new dataModel();
    dataModel1.setCallbackHandler(function(data) {
        var obj = data;
        document.getElementById("result1").innerHTML = JSON.stringify(obj);
    });
    dataModel1.getLoginFailDetail("2010-01-01 00:00:00", "2015-01-01 00:00:00");

    var dataModel2 = new dataModel();
    dataModel2.setCallbackHandler(function(data) {
        var obj = data;
        document.getElementById("result2").innerHTML = JSON.stringify(obj);
    });
    dataModel2.getForgottenFailDetail("2010-01-01 00:00:00", "2015-01-01 00:00:00");

    var dataModel3 = new dataModel();
    dataModel3.setCallbackHandler(function(data) {
        var obj = data;
        document.getElementById("result3").innerHTML = JSON.stringify(obj);
    });
    dataModel3.getPwChangedDetail("2010-01-01 00:00:00", "2015-01-01 00:00:00");
</script>

<div>Login Fail</div>
<div id="result1"></div>
<div>Forgotten Fail</div>
<div id="result2"></div>
<div>Password Changed</div>
<div id="result3"></div>