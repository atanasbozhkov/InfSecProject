<cfcomponent displayname="config" hint="global setting">
    <!--- enter the pair of datasource and database name --->
    <cfset variables.sourcename = "PGT_TEAM_D_2014_TEST">
    <cfset variables.database = "PGT_D_14_TEST">
    <!--- enter pages which need authentication by seperator ",", eg. "index.cfm,demo.cfm" --->
    <cfset variables.protectList = "">
    <!--- enter the email sender address --->
    <cfset variables.emailAddr = "2126086h@student.gla.ac.uk">

    <cffunction name="getConfig" access="public" returntype="Struct">
        <cfreturn variables>
    </cffunction>
</cfcomponent>
