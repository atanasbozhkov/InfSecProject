<cfcomponent displayname="SecureComponent" output="true" hint="handle the application">
<cfset This.name = "SecureComponent">
<cfset This.sessionManagement=true>
<!--- <cfset This.clientmanagement=true>
<cfset This.clientStorage=true> --->
<cfset This.Sessiontimeout="#createtimespan(0,0,10,0)#">
<cfset This.applicationtimeout="#createtimespan(5,0,0,0)#">

<!--- while trying access, it checks authentication --->
<cffunction name="OnRequestStart"> 
    <cfargument name = "request" required="true"/> 
    <cfif IsDefined("Form.logout")> 
        <cflogout> 
    </cfif> 
 
    <cflogin> 
        <cfif NOT IsDefined("cflogin")> 
            <cfinclude template="loginform.cfm"> 
            <cfabort> 
        <cfelse> 
            <cfif cflogin.name IS "" OR cflogin.password IS ""> 
                <cfoutput> 
                    <h2>You must enter text in both the User Name and Password fields. 
                    </h2> 
                </cfoutput> 
                <cfinclude template="loginform.cfm"> 
                <cfabort> 
            <cfelse> 
                <!--- <cfquery name="loginQuery" dataSource="cfdocexamples"> 
                SELECT UserID, Roles 
                FROM LoginInfo 
                WHERE 
                    UserID = '#cflogin.name#' 
                    AND Password = '#cflogin.password#' 
                </cfquery> 
                <cfif loginQuery.Roles NEQ ""> 
                    <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" 
                        roles="#loginQuery.Roles#">  --->
                <cfif cflogin.name eq "kelvin" and cflogin.password eq "password">
                    <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" 
                        roles="admin">
                <cfelse> 
                    <cfoutput> 
                        <H2>Your login information is not valid.<br> 
                        Please Try again</H2> 
                    </cfoutput>     
                    <cfinclude template="loginform.cfm"> 
                    <cfabort> 
                </cfif> 
            </cfif>     
        </cfif> 
    </cflogin> 
 
    <cfif GetAuthUser() NEQ ""> 
        <cfoutput> 
            <form action="charts.cfm" method="Post"> 
                <input type="submit" Name="Logout" value="Logout"> 
            </form> 
        </cfoutput> 
    </cfif> 
 
</cffunction> 

</cfcomponent>