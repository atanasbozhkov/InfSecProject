<cfcomponent displayname="ForgottenPass" hint="Forgotten Password">

    <cffunction name="sendLink" output="false" access="remote" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="answer" type="string" required="true">

        <cfinvoke component="auth" method="secQues" returnvariable="auth">
            <cfinvokeargument name="email" value="#email#">
            <cfinvokeargument name="answer" value="#answer#">
        </cfinvoke>

        <cfif NOT auth>
            <!--- return true here prevent hacker try email and answer, but no email sent --->
            <cfinvoke component="models.logModel" method="forgottenAttempt">
                <cfinvokeargument name="email" value="#email#">
                <cfinvokeargument name="success" value="#auth#">
                <cfinvokeargument name="token" value="0">
                <cfinvokeargument name="valid" value="0">
                <cfinvokeargument name="answer" value="0">
            </cfinvoke>
            <cfreturn true>
        </cfif>
        
        <cfset token=hash(RandRange(0,1000000),'SHA-1')>
        <cfset valid = 1>
        <cfset answer = 0>

        <cfinvoke component="models.logModel" method="forgottenAttempt">
            <cfinvokeargument name="email" value="#email#">
            <cfinvokeargument name="success" value="#auth#">
            <cfinvokeargument name="token" value="#token#">
            <cfinvokeargument name="valid" value="#valid#">
            <cfinvokeargument name="answer" value="#answer#">
        </cfinvoke>

        <cfset home="http://localhost:8500/coldfusionComponent/reset.cfm">
        <cfset link=#home#&"?token="&#token#>
        <cfset qr="http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=#link#">

        <cfmail to="bozhkov.atanas@gmail.com"
        from="barney@bedrock.com"
        subject="Your password reset link."
        type="html">
        <html>
            <body>
                Dear User, <br/>

                You requested a reset link for your password. <br/>
                Please follow the link. <br/>
                <a href="#link#"> Reset Password </a> <br/>

                Or scan the QR Code with your mobile: <br/>

                <img src="#qr#"/>
            </body>
        </html>

        </cfmail>

        <cfreturn true>
    </cffunction>
</cfcomponent>
