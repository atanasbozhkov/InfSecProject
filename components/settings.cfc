<cfcomponent displayname="settingController" hint="operation in settings">

    <cffunction name="changeAdminPassword" access="remote" returntype="any">
        <cfargument name="oldPw" type="string" required="true">
        <cfargument name="newPw" type="string" required="true">
        <cfargument name="retypePw" type="string" required="true">

        <cfif compare(newPw, retypePw) neq 0>
            <cfreturn false>
        </cfif>

        <cfinvoke component="auth" method="checkPw" returnvariable="userRoleId">
            <cfinvokeargument name="email" value="#SESSION.email#">
            <cfinvokeargument name="password" value="#oldPw#">
        </cfinvoke>

        <cfif userRoleId neq 2>
            <cfreturn false>
        </cfif>

        <cfinvoke component="models.passwordModel" method="updatePassword" returnvariable="passwordID">
            <cfinvokeargument name="userid" value="#SESSION.user_id#">
            <cfinvokeargument name="password" value="#newPw#">
        </cfinvoke>

        <cfif isBoolean(passwordID) AND passwordID eq false>
            <cfreturn false>
        </cfif>

        <cfreturn true>
    </cffunction>

</cfcomponent>