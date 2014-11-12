<cfcomponent displayname="register_component" hint="register">

    <cffunction name="isUserExist" access="public" output="false" returntype="boolean">
        <cfargument name="email" type="string">

        <cfquery name="searchUser">
            SELECT email FROM users WHERE email = "#email#"
        </cfquery>
        <cfif searchUser.RecordCount neq 0>
            <cfreturn true>
        </cfif>
        <cfreturn false>
    </cffunction>

    <cffunction name="addUser" access="public" output="false" returntype="Struct">
        <cfargument name="email" type="string">
        <cfargument name="firstname" type="string">
        <cfargument name="lastname" type="string">
        <cfargument name="hash" type="string">
        <cfargument name="salt" type="string">

        <cfset result.success = false>
        <cfset result.userid = "undefined">
        <cfset result.pwid = "undefined">
        <cftry>
            <cfquery name="createUser" result="insertUserResult">
                INSERT INTO users (email, pass_id, first_name, last_name, role_id, secret_question)
                    VALUES ('#email#', '0', '#firstname#', '#lastname#', '1', 'test_text')
            </cfquery>
            <cfcatch type="any">
                <cfreturn result>
            </cfcatch>
        </cftry>

        <cfset result.userid = insertUserResult.generated_Key>

        <cftry>
            <cfquery name="createPassword" result="insertPwResult">
                INSERT INTO passwords (user_id, password, salt, type, active)
                    VALUES ('#insertUserResult.generated_Key#', '#hash#', '#salt#', '1', '0')
            </cfquery>
            <cfcatch type="any">
                <cfreturn result>
            </cfcatch>
        </cftry>

        <cfset result.pwid = insertPwResult.generated_Key>

        <cftry>
            <cfquery name="updatePwID">
                UPDATE users SET pass_id = '#insertPwResult.generated_Key#'
                    WHERE user_id = '#insertUserResult.generated_Key#'
            </cfquery>
            <cfcatch type="any">
                <cfreturn result>
            </cfcatch>
        </cftry>

        <cfset result.success = true>
        <cfreturn result>
    </cffunction>

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

        <cfset salt = hash(rand("SHA1PRNG"), "SHA-512")>
        <cfset hash = hash(password&salt, "SHA-512")>

        <cfinvoke component="register" method="isUserExist" returnvariable="userExist">
            <cfinvokeargument name="email" value="#email#">
        </cfinvoke>

        <cfif userExist>
            <cfset result.msg = "email registered">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfinvoke component="register" method="addUser" returnvariable="userResult">
            <cfinvokeargument name="email" value="#email#">
            <cfinvokeargument name="firstname" value="#firstname#">
            <cfinvokeargument name="lastname" value="#lastname#">
            <cfinvokeargument name="hash" value="#hash#">
            <cfinvokeargument name="salt" value="#salt#">
        </cfinvoke>

        <cfif NOT userResult.success>
            <!--- remove error data (userResult.userid userResult.pwid) --->
            <cfset result.msg = "Error Occur">
            <cfreturn serializeJSON(result)>
        </cfif>

        <cfset result.status = true>
        <cfset result.msg = "success created account">
        <cfreturn serializeJSON(result)>
    </cffunction>
</cfcomponent>