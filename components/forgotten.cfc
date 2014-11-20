<cfcomponent displayname="ForgottenPass" hint="Forgotten Password">

    <cffunction name="sendLink" output="false" access="remote" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="answer" type="string" required="true">

        <cfinvoke component="models.userModel" method="getUser" returnvariable="userData">
            <cfinvokeargument name="email" value="#email#">
        </cfinvoke>

        <!--- user not exist --->
        <cfif userData.RecordCount eq 0>
            <cfinvoke component="models.logModel" method="forgottenAttempt">
                <cfinvokeargument name="user_id" value="0">
                <cfinvokeargument name="success" value="0">
                <cfinvokeargument name="token" value="0">
                <cfinvokeargument name="valid" value="0">
                <cfinvokeargument name="answer" value="0">
            </cfinvoke>
            <cfreturn true>
        </cfif>

        <cfinvoke component="auth" method="secQues" returnvariable="auth">
            <cfinvokeargument name="user_id" value="#userData.user_id#">
            <cfinvokeargument name="answer" value="#answer#">
        </cfinvoke>

        <cfif NOT auth>
            <!--- return true here prevent hacker try email and answer, but no email sent --->
            <cfinvoke component="models.logModel" method="forgottenAttempt">
                <cfinvokeargument name="user_id" value="#userData.user_id#">
                <cfinvokeargument name="success" value="#auth#">
                <cfinvokeargument name="token" value="0">
                <cfinvokeargument name="valid" value="0">
                <cfinvokeargument name="answer" value="0">
            </cfinvoke>
            <cfreturn true>
        </cfif>

        <!--- check forgot frequency, reject if token is valid and issued with 12 hours --->
        <cfinvoke component="models.passwordModel" method="getForgottenAttemptsByUserId" returnvariable="attempts">
            <cfinvokeargument name="user_id" value="#userData.user_id#">
        </cfinvoke>
        
        <cfif attempts.RecordCount gt 0>
            <cfinvoke component="models.logModel" method="forgottenAttempt">
                <cfinvokeargument name="user_id" value="#userData.user_id#">
                <cfinvokeargument name="success" value="#auth#">
                <cfinvokeargument name="token" value="0">
                <cfinvokeargument name="valid" value="0">
                <cfinvokeargument name="answer" value="0">
            </cfinvoke>
            <cfreturn false>
        </cfif>
        
        <cfset token=hash(RandRange(0,1000000),'SHA-1')>
        <cfset valid = 1>
        <cfset answer = 0>

        <!--- revoke the previous tokens --->
        <cfinvoke component="models.passwordModel" method="revokeToken">
            <cfinvokeargument name="user_id" value="#userData.user_id#">
        </cfinvoke>

        <cfinvoke component="models.logModel" method="forgottenAttempt">
            <cfinvokeargument name="user_id" value="#userData.user_id#">
            <cfinvokeargument name="success" value="#auth#">
            <cfinvokeargument name="token" value="#token#">
            <cfinvokeargument name="valid" value="#valid#">
            <cfinvokeargument name="answer" value="#answer#">
        </cfinvoke>

        <cfset home="http://localhost:8500/coldfusionComponent/reset.cfm">
        <cfset link=#home#&"?token="&#token#>
        <cfset qr="http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=#link#">

        <cfmail to="#email#"
        from="2126086h@student.gla.ac.uk"
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

    <cffunction name="resetInit" output="false" access="remote" returntype="void">
        <cfargument name="token" type="string" required="true">

        <cfinvoke component="models.passwordModel" method="getForgottenAttempt" returnvariable="record">
            <cfinvokeargument name="token" value="#token#">
        </cfinvoke>

        <cfif record.RecordCount neq 1>
            <cfset SESSION.tokenValid = 0>
        <cfelse>
            <cfset SESSION.tokenValid = 1>
            <cfset SESSION.user_id = record.user_id>
         </cfif>

         <cfinvoke component="models.passwordModel" method="revokeToken">
            <cfinvokeargument name="user_id" value="#record.user_id#">
        </cfinvoke>

    </cffunction>

    <cffunction name="resetPassword" output="false" access="remote" returntype="any">
        <cfargument name="pass" type="string" required="true">
        <cfargument name="pass_re" type="string" required="true">
        <cfargument name="token" type="string" required="true">

        <cfif compare(pass, pass_re) neq 0>
            <cfreturn false>
        </cfif>

        <cfif SESSION.tokenValid eq 0>
            <!--- someone reset password using invalid token --->
            <cfinvoke component="models.logModel" method="forgottenAttempt">
                <cfinvokeargument name="user_id" value="0">
                <cfinvokeargument name="success" value="0">
                <cfinvokeargument name="token" value="#token#">
                <cfinvokeargument name="valid" value="0">
                <cfinvokeargument name="answer" value="0">
            </cfinvoke>
            <cfreturn false>
        </cfif>

        <cfinvoke component="models.passwordModel" method="updatePassword" returnvariable="passwordID">
            <cfinvokeargument name="userid" value="#SESSION.user_id#">
            <cfinvokeargument name="password" value="#pass#">
        </cfinvoke>

        <cfif isBoolean(passwordID) AND passwordID eq false>
            <cfreturn false>
        </cfif>

        <cfset SESSION.tokenValid = 0>
        <cfset SESSION.user_id = 0>

        <cfreturn true>
    </cffunction>
</cfcomponent>
