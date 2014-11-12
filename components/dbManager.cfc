<cfcomponent displayname="DBManager" hint="datasource reader">
    <!--- variable initialize --->
    <cfinvoke component="config" method="getConfig" returnVariable="config">

    <!--- init function --->
    <cffunction name="init" access="public" returntype="dbManager">
        <cfreturn this />
    </cffunction>

	<cffunction name="getUsername" access="public" output="false" returntype="string">
        <cfquery name="getNames" datasource="#config.sourceName#">
            SELECT email FROM users
        </cfquery>

        <cfset json=arrayNew(1)>
        <cfloop query="getNames">
            <cfset arrayAppend(json, #email#)>
        </cfloop>

        <cfreturn SerializeJSON(json)/>
    </cffunction>

    <cffunction name="getAuthData" access="public" output="false" returntype="query">
        <cfargument name="username" type="string">

        <cfquery name="loginQuery" dataSource="#config.sourceName#">
            SELECT users.email, passwords.password, passwords.salt FROM users, passwords
            WHERE users.email = '#username#' AND passwords.pass_id = users.pass_id
        </cfquery>
        <cfreturn loginQuery/>
    </cffunction>

    <cffunction name="isUserExist" access="public" output="false" returntype="boolean">
        <cfargument name="email" type="string">

        <cfquery name="searchUser" dataSource="#config.sourceName#">
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
            <cfquery name="createUser" dataSource="#config.sourceName#" result="insertUserResult">
                INSERT INTO users (email, pass_id, first_name, last_name, role_id, secret_question)
                    VALUES ('#email#', '0', '#firstname#', '#lastname#', '1', 'test_text')
            </cfquery>
            <cfcatch type="any">
                <cfreturn result>
            </cfcatch>
        </cftry>

        <cfset result.userid = insertUserResult.generated_Key>

        <cftry>
            <cfquery name="createPassword" dataSource="#config.sourceName#" result="insertPwResult">
                INSERT INTO passwords (user_id, password, salt, type, active)
                    VALUES ('#insertUserResult.generated_Key#', '#hash#', '#salt#', '1', '0')
            </cfquery>
            <cfcatch type="any">
                <cfreturn result>
            </cfcatch>
        </cftry>

        <cfset result.pwid = insertPwResult.generated_Key>

        <cftry>
            <cfquery name="updatePwID" dataSource="#config.sourceName#">
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

</cfcomponent>