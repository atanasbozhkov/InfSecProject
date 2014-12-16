<cfajaxproxy cfc="components.auth" jsclassname="auth">
<script type="text/javascript">
function logoutSubmit() {
    var instance = new auth();
    instance.setCallbackHandler(function() {
        setTimeout(function() {location.reload();}, 0);
    });
    instance.logout();
}
</script>
Hello, Here is the first page of regular user.
<div onClick="return logoutSubmit()"><a href="#">Logout</a></div>
