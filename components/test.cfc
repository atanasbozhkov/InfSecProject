<cfcomponent>
    <!--- variable initialize --->
    <cfset variables.sourceName = ""/>
    
    <!--- init function --->
    <cffunction name="init" access="public" returntype="test">
        <cfset variables.sourceName = "teamD"/>
        <cfreturn this />
    </cffunction>

    <cffunction name="allUser" access="public" output="false" returntype="query">
        <cfquery name="getAll" datasource="#variables.sourceName#">
            SELECT * FROM users
        </cfquery>
        <cfreturn getAll/>
    </cffunction>

	<cffunction name="getUsername" access="public" output="false" returntype="string">
        <cfquery name="getNames" datasource="#variables.sourceName#">
            SELECT username, email FROM users
        </cfquery>
		<cfreturn SerializeJSON(getNames)/>
    </cffunction>
</cfcomponent>