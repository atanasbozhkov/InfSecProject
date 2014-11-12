
<cfcomponent displayname="ForgottenPass" hint="Forgotten Password">
    <cfset dbManager = createObject("component","dbManager").init()>
    <cfinvoke component="#dbManager#" method="getUsername" returnvariable="userName">
    <cfinvoke component="config" method="getConfig" returnVariable="config">
    <cffunction name="sendLink" output="false" access="public" returntype="any">
        <cfargument name="userid" type="string" required="true">
        <cfset token=hash(RandRange(0,1000000),'SHA-1')>
        <!--- <cfhttp method="Get" url="" getAsBinary = "no" result="bla" /> --->
        <cfset home="http://127.0.0.1/forgottenPass">
        <cfset qr="http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=#home#/#token#">

        <cfmail to="bozhkov.atanas@gmail.com"
        from="barney@bedrock.com"
        subject="Your password reset link."
        type="html">
        <html>
            <body>
        Dear User, <br/>

        You requested a reset link for your password. <br/>
        Please follow the link. <br/>
        <a href="#home#&/&#token#"> Reset Password </a> <br/>

        Or scan the QR Code with your mobile: <br/>

                <img src="#qr#"/>
            </body>
        </html>

        </cfmail>

        <!--- <cfabort> --->
        <cfreturn 1>
    </cffunction>
</cfcomponent>
