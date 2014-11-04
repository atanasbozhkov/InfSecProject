<cfcomponent displayname="config" hint="global setting">
    <cfset variables.sourceName = "PGT_TEAM_D_2014_TEST">

    <cffunction name="getConfig" access="public" returntype="Any">
        <cfreturn variables>
    </cffunction>
</cfcomponent>
