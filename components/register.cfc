<cfcomponent displayname="registerController" hint="register">
    
    <cffunction name="register" access="remote" returntype="string">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="firstname" type="string" required="true">
        <cfargument name="lastname" type="string" required="true">

        <cfset result.status = false>
        <cfset result.msg = "unknown">

        <cfif len(email) eq 0 OR len(password) eq 0 OR len(firstname) eq 0 OR len(lastname) eq 0>
            <cfset result.msg = "missing field">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfinvoke component="models.userModel" method="getUser" returnvariable="userData">
            <cfinvokeargument name="email" value="#email#">
        </cfinvoke>

        <cfif userData.RecordCount neq 0>
            <cfset result.msg = "email registered">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfinvoke component="models.userModel" method="createUser" returnvariable="userID">
            <cfinvokeargument name="email" value="#email#">
            <cfinvokeargument name="firstname" value="#firstname#">
            <cfinvokeargument name="lastname" value="#lastname#">
        </cfinvoke>

        <cfif userID eq false>
            <cfset result.msg = "Error Occur">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfinvoke component="models.passwordModel" method="updatePassword" returnvariable="passwordID">
            <cfinvokeargument name="userid" value="#userID#">
            <cfinvokeargument name="password" value="#password#">
        </cfinvoke>

        <cfif passwordID eq false>
            <cfinvoke component="models.userModel" method="removeUser">
                <cfinvokeargument name="userid" value="#userID#">
            </cfinvoke>
            <cfset result.msg = "Error Occur">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfset result.status = true>
        <cfset result.msg = "success created account">
        <cfreturn serializeJSON(result)>
    </cffunction>
</cfcomponent>