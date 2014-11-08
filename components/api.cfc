<cfcomponent rest="true" restPath="/api" displayname="API" hint="api interface">
    <cfset dbManager = createObject("component","dbManager").init()>
    <cfinvoke component="#dbManager#" method="getUsername" returnvariable="userName">

    <cffunction name="testJSON"
        access="remote"
        httpmethod="GET"
        restpath="asdf"
        returntype="string"
        produces="application/json">
        <cfreturn userName>
    </cffunction>
</cfcomponent>