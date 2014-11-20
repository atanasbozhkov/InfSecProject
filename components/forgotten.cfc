<cfcomponent displayname="ForgottenPass" hint="Forgotten Password">

    <cffunction name="sendLink" output="false" access="remote" returntype="boolean">
        <cfargument name="username" type="string" required="true">
        <cfargument name="answer" type="string" required="true">

        <cfinvoke component="auth" method="secQues" returnvariable="auth">
            <cfinvokeargument name="username" value="#username#">
            <cfinvokeargument name="answer" value="#answer#">
        </cfinvoke>

        <cfif NOT auth>
            <!--- return true here prevent hacker try username and answer, but no email sent --->
            <cfreturn true>
        </cfif>
        
        <cfset token=hash(RandRange(0,1000000),'SHA-1')>

        <cfquery>
            INSERT INTO forgotten_attempts (user_id, token, valid, answer, success, device_type, IP_addr)
                VALUES ('#userid#', '#token#', 1, 0, 1, "", "")
        </cfquery>

        <cfset home="http://localhost:8500/coldfusionComponent/reset.cfm">
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
                <a href="#home#?token=#token#"> Reset Password </a> <br/>

                Or scan the QR Code with your mobile: <br/>

                <img src="#qr#"/>
            </body>
        </html>

        </cfmail>

        <cfreturn true>
    </cffunction>
</cfcomponent>
