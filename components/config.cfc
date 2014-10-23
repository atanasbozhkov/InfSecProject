<cfcomponent displayname="config" hint="global setting">
    <cfset variables.sourceName = "teamD">

    <cffunction name="getConfig" access="public" returntype="Any">
        <cfreturn variables>
    </cffunction>
</cfcomponent>