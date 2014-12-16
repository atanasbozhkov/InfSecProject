<cfcomponent displayname="config" hint="global setting">
    <!--- enter the pair of the datasource name and the database name --->
    <cfset variables.sourcename = "">
    <cfset variables.database = "">
    <!--- enter pages which need authentication by seperator ",", eg. "index.cfm,demo.cfm" --->
    <cfset variables.protectList = "">
    <!--- enter the email sender address you config in ColdFusion admin page --->
    <cfset variables.emailAddr = "">

    <cffunction name="getConfig" access="public" returntype="Struct">
        <cfreturn variables>
    </cffunction>
</cfcomponent>
