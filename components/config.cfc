<cfcomponent displayname="config" hint="global setting">
    <cfset variables.sourcename = "PGT_TEAM_D_2014_TEST">
    <cfset variables.database = "PGT_D_14_TEST">
    <cfset variables.protectList = "charts.cfm,settings.cfm,popup.cfm">

    <cffunction name="getConfig" access="public" returntype="Struct">
        <cfreturn variables>
    </cffunction>
</cfcomponent>
