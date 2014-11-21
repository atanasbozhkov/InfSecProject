<cfcomponent displayname="userModel" hint="user data operation model">

    <cffunction name="updatePassword" access="public" output="false" returntype="any">
        <cfargument name="userid" type="string">
        <cfargument name="password" type="string">

        <cfset salt = hash(rand("SHA1PRNG"), "SHA-512")>
        <cfset hash = hash(password&salt, "SHA-512")>

        <cftry>
            <cfquery name="createPassword" result="insertPwResult">
                INSERT INTO passwords (user_id, password, salt, type, active)
                    VALUES ('#userid#', '#hash#', '#salt#', '1', '0')
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>
        
        <cftry>
            <cfquery name="updatePwID">
                UPDATE users SET pass_id = '#insertPwResult.generated_Key#'
                    WHERE user_id = '#userid#'
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn insertPwResult.generated_Key>
        
    </cffunction>

    <cffunction name="getForgottenAttemptsByUserId" access="public" output="false" returntype="query">
        <cfargument name="user_id" type="string">

        <cfquery name="forgottenRecord">
            SELECT forgot_id, user_id FROM forgotten_attempts
            WHERE user_id = "#user_id#" 
            AND timestamp > current_timestamp() - INTERVAL 12 HOUR
            AND timestamp < current_timestamp()
            AND valid = 1
        </cfquery>

        <cfreturn forgottenRecord>
    </cffunction>

    <cffunction name="getForgottenAttempt" access="public" output="false" returntype="query">
        <cfargument name="token" type="string">
        <cfargument name="requireValid" type="boolean">

        <cfif requireValid>
            <cfquery name="forgottenRecord">
                SELECT forgot_id, user_id FROM forgotten_attempts
                WHERE token = "#token#" 
                AND timestamp > current_timestamp() - INTERVAL 24 HOUR
                AND timestamp < current_timestamp()
                AND valid = 1
            </cfquery>
        <cfelse>
            <cfquery name="forgottenRecord">
                SELECT forgot_id, user_id FROM forgotten_attempts
                WHERE token = "#token#" 
            </cfquery>
        </cfif>

        <cfreturn forgottenRecord>
    </cffunction>

    <cffunction name="revokeToken" access="public" output="false" returntype="boolean">
        <cfargument name="user_id" type="string">

        <cftry>
            <cfquery>
                UPDATE forgotten_attempts SET valid = '0'
                    WHERE user_id = '#user_id#'
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn true>
    </cffunction>

    <cffunction name="markSuccess" access="public" output="false" returntype="boolean">
        <cfargument name="forgot_id" type="string">

        <cftry>
            <cfquery>
                UPDATE forgotten_attempts SET success = '1'
                    WHERE forgot_id = '#forgot_id#'
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn true>
    </cffunction>

</cfcomponent>