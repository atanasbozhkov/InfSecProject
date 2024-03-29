<cfcomponent displayname="userModel" hint="user data operation model">

    <cffunction name="getUser" access="public" output="false" returntype="query">
        <cfargument name="email" type="string">

        <cfquery name="userQuery">
            SELECT users.email, users.user_id FROM users
            WHERE users.email = '#email#'
        </cfquery>
        <cfreturn userQuery/>
    </cffunction>

    <cffunction name="getUsername" access="public" output="false" returntype="query">
        <cfargument name="id" type="string">

        <cfquery name="userQuery">
            SELECT users.email FROM users
            WHERE users.user_id = '#id#'
        </cfquery>
        <cfreturn userQuery/>
    </cffunction>

    <cffunction name="createUser" access="public" output="false" returntype="any">
        <cfargument name="email" type="string">
        <cfargument name="firstname" type="string">
        <cfargument name="lastname" type="string">

        <cftry>
            <cfquery name="createUser" result="insertUserResult">
                INSERT INTO users (email, pass_id, first_name, last_name, role_id, secret_question)
                    VALUES ('#email#', '0', '#firstname#', '#lastname#', '1', 'test_text')
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn insertUserResult.generated_Key>
    </cffunction>

    <cffunction name="removeUser" access="public" output="false" returntype="void">
        <cfargument name="userid" type="numeric">

        <cfquery>
            DELETE FROM users WHERE user_id = "#userid#"
        </cfquery>
    </cffunction>

    <cffunction name="changeRoleToAdmin" access="public" output="false" returntype="boolean">
        <cfargument name="email" type="string">

        <cftry>
            <cfquery name="createUser" result="insertUserResult">
                UPDATE users SET role_id = '2'
                    WHERE email = '#email#'
            </cfquery>
            <cfcatch type="any">
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn true>
    </cffunction>

</cfcomponent>