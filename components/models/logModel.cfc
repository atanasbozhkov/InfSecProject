<cfcomponent displayname="logModel" hint="log every login and forgotten attempts">
    <cffunction name="loginAttempt" access="public" output="false" returntype="any">
        <cfargument name="user_id" type="string">
        <cfargument name="success" type="boolean">

        <cfif isBoolean(success)>
            <cfif success>
                <cfset success = 1>
            <cfelse>
                <cfset success = 0>
            </cfif>
        </cfif>

        <cftry>
            <cfquery name="insertAttempt" result="insertedResult">
                INSERT INTO login_attempts (user_id, success, IP_addr, device_type, comment)
                        VALUES ("#user_id#", "#success#", "", "", "")
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn insertedResult.generated_Key>
    </cffunction>

    <cffunction name="forgottenAttempt" access="public" output="false" returntype="any">
        <cfargument name="user_id" type="string">
        <cfargument name="success" type="boolean">
        <cfargument name="token" type="string">
        <cfargument name="valid" type="numeric">
        <cfargument name="answer" type="boolean">

        <cfif isBoolean(success)>
            <cfif success>
                <cfset success = 1>
            <cfelse>
                <cfset success = 0>
            </cfif>
        </cfif>

        <cftry>
            <cfquery name="insertAttempt" result="insertedResult">
                INSERT INTO forgotten_attempts (user_id, token, valid, answer, success, IP_addr, device_type)
                        VALUES ("#user_id#", "#token#", "#valid#", "#answer#", "#success#", "", "")
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn insertedResult.generated_Key>
    </cffunction>

</cfcomponent>