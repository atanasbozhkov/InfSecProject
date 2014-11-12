<cfcomponent displayname="authenticationModel" hint="auth model">
    <cffunction name="getAuthData" access="public" output="false" returntype="query">
        <cfargument name="email" type="string">

        <cfquery name="loginQuery">
            SELECT users.email, passwords.password, passwords.salt FROM users, passwords
            WHERE users.email = '#email#' AND passwords.pass_id = users.pass_id
        </cfquery>
        <cfreturn loginQuery/>
    </cffunction>
</cfcomponent>