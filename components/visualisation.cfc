<cfcomponent displayname="visualisationController" hint="">

    <cffunction name="queryParseToJSON" access="public" returntype="string">
        <cfargument name="rawQuery" type="query" required="true">

        <cfif ListFindNoCase(rawQuery.columnList, "success")>
            <cfset result = structNew()>
            <cfset result.success=arrayNew(1)>
            <cfset result.fail=arrayNew(1)>
        <cfelse>
            <cfset result = []>
        </cfif>

        <cfloop query="rawQuery">
            <cfset record = structNew()>

            <cfloop list="#rawQuery.columnList#" index="col">
                <cfset record[col] = rawQuery[col][currentrow]>
            </cfloop>

            <cfif ListFindNoCase(rawQuery.columnList, "success")>
                <cfif #success# eq 0>
                    <cfset arrayAppend(result.fail, record)>
                <cfelse>
                    <cfset arrayAppend(result.success, record)>
                </cfif>
            <cfelse>
                <cfset arrayAppend(result, record)>
            </cfif>
        </cfloop>

        <cfif ListFindNoCase(rawQuery.columnList, "success")>
            <cfset result.totalSuccess = ArrayLen(result.success)>
            <cfset result.totalFail = ArrayLen(result.fail)>
        </cfif>

        <cfif isArray(result) AND arrayLen(result) eq 1>
            <cfreturn SerializeJSON(result[1])/>
        </cfif>

        <cfreturn SerializeJSON(result)/>
    </cffunction>

    <cffunction name="checkTime" access="public" returntype="boolean">
        <cfargument name="from" type="string" required="true">
        <cfargument name="to" type="string" required="true">

        <cfif dateCompare(to, from, "s") lte 0>
            <cfreturn false>
        </cfif>
        <cfreturn true>
    </cffunction>

    <!--- get all email --->
    <cffunction name="getUsername" access="remote" returntype="string">
        <cfinvoke component="models.visualisationModel" method="getUsername" returnvariable="usernames">

        <cfset json=arrayNew(1)>
        <cfloop query="usernames">
            <cfset arrayAppend(json, #email#)>
        </cfloop>

        <cfreturn SerializeJSON(json)/>
    </cffunction>

    <!--- get login attempts with success and fail with detail --->
    <cffunction name="getLoginAttempts" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getLoginAttempts" returnvariable="attempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#attempts#">
        </cfinvoke>
        <cfreturn json>
    </cffunction>

    <!--- get forgotten attempts with success and fail with detail --->
    <cffunction name="getForgotAttempts" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getForgotAttempts" returnvariable="attempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#attempts#">
        </cfinvoke>
        <cfreturn json>
    </cffunction>

    <cffunction name="getForgotAttemptsPerDay" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getForgotAttemptsPerDay" returnvariable="attempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#attempts#">
        </cfinvoke>
        <cfreturn json>
    </cffunction>

    <cffunction name="getFailedAttemptsPerDay" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getFailedAttemptsPerDay" returnvariable="attempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#attempts#">
        </cfinvoke>
        <cfreturn json>
    </cffunction>



    <cffunction name="getFailedByUser" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getFailedByUser" returnvariable="attempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#attempts#">
        </cfinvoke>
        <cfreturn json>
    </cffunction>


    <!--- get the statistic number of login, password changes and forgotten --->
    <cffunction name="statNumber" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getForgotCount" returnvariable="forgotAttempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="forgotten">
            <cfinvokeargument name="rawQuery" value="#forgotAttempts#">
        </cfinvoke>

        <cfinvoke component="models.visualisationModel" method="getLoginCount" returnvariable="loginAttempts">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="login">
            <cfinvokeargument name="rawQuery" value="#loginAttempts#">
        </cfinvoke>

        <cfinvoke component="models.visualisationModel" method="getPWChangedCount" returnvariable="changedPWCount">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="pw">
            <cfinvokeargument name="rawQuery" value="#changedPWCount#">
        </cfinvoke>

        <cfset counts = structNew()>
        <cfset counts.forgotten = DeserializeJSON(forgotten)>
        <cfset counts.login = DeserializeJSON(login)>
        <cfset counts.passwordChanged = DeserializeJSON(pw)>

        <cfreturn SerializeJSON(counts)>
    </cffunction>

    <!--- get the fail attempts group by user_id and sort descreaing --->
    <cffunction name="getLoginFailDetail" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getFailAttemptsDetail" returnvariable="failQuery">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#failQuery#">
        </cfinvoke>

        <cfreturn json>
    </cffunction>

    <!--- get the forgoteen fail attempts group by user_id and sort descreaing --->
    <cffunction name="getForgottenFailDetail" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getForgottenAttemptsDetail" returnvariable="failQuery">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#failQuery#">
        </cfinvoke>

        <cfreturn json>
    </cffunction>

    <!--- get the amount of password changes group by user_id and sort descreaing --->
    <cffunction name="getPwChangedDetail" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke component="models.visualisationModel" method="getPasswordChangedDetail" returnvariable="query">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="queryParseToJSON" returnvariable="json">
            <cfinvokeargument name="rawQuery" value="#query#">
        </cfinvoke>

        <cfreturn json>
    </cffunction>

    <cffunction name="getFailLoginExpectedValue" access="public" returntype="struct">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke component="models.visualisationModel" method="getFailedAttemptsPerDay" returnvariable="query">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfset i = 0>
        <cfset total = 0>

        <cfloop query = "query"> 
            <cfset groupdate = lsDateFormat(timestamp, "yyyy-mm-dd")>
            <cfinvoke component="models.visualisationModel" method="getUserAmount" returnvariable="amountQuery">
                <cfinvokeargument name="date" value="#groupdate#">
            </cfinvoke>
            <cfset temp = structNew()>
            <cfset temp.totalCount = totalCount>
            <cfset temp.amount = amountQuery.amount>
            <cfset total = total+totalCount/amountQuery.amount>
            <cfset i = i+1>
        </cfloop> 

        <cfset value = structNew()>
        <cfif i eq 0>
            <cfset value.expectedValue = 0>
        <cfelse>
            <cfset value.expectedValue = total/i>
        </cfif>
        <cfset value.sampleSize = i>

        <cfreturn value>
    </cffunction>

    <cffunction name="getForgottenExpectedValue" access="public" returntype="Struct">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke component="models.visualisationModel" method="getForgotAttemptsPerDay" returnvariable="query">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfset i = 0>
        <cfset total = 0>

        <cfloop query = "query"> 
            <cfset groupdate = lsDateFormat(timestamp, "yyyy-mm-dd")>
            <cfinvoke component="models.visualisationModel" method="getUserAmount" returnvariable="amountQuery">
                <cfinvokeargument name="date" value="#groupdate#">
            </cfinvoke>
            <cfset temp = structNew()>
            <cfset temp.totalCount = dayCount>
            <cfset temp.amount = amountQuery.amount>
            <cfset total = total+dayCount/amountQuery.amount>
            <cfset i = i+1>
        </cfloop> 

        <cfset value = structNew()>
        <cfif i eq 0>
            <cfset value.expectedValue = 0>
        <cfelse>
            <cfset value.expectedValue = total/i>
        </cfif>
        <cfset value.sampleSize = i>

        <cfreturn value>
    </cffunction>

    <cffunction name="getPwChangedExpectedValue" access="public" returntype="Struct">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke component="models.visualisationModel" method="getPWChangedCountPerDay" returnvariable="query">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>

        <cfset i = 0>
        <cfset total = 0>

        <cfloop query = "query"> 
            <cfset groupdate = lsDateFormat(timestamp, "yyyy-mm-dd")>
            <cfinvoke component="models.visualisationModel" method="getUserAmount" returnvariable="amountQuery">
                <cfinvokeargument name="date" value="#groupdate#">
            </cfinvoke>
            <cfset temp = structNew()>
            <cfset temp.totalCount = count>
            <cfset temp.amount = amountQuery.amount>
            <cfset total = total+count/amountQuery.amount>
            <cfset i = i+1>
        </cfloop> 

        <cfset value = structNew()>
        <cfif i eq 0>
            <cfset value.expectedValue = 0>
        <cfelse>
            <cfset value.expectedValue = total/i>
        </cfif>
        <cfset value.sampleSize = i>

        <cfreturn value>
    </cffunction>

    <cffunction name="getExpectedValues" access="remote" returntype="string">
        <!--- time format: yyyy-mm-dd hh:mm:ss --->
        <cfargument name="timeFrom" type="string" required="true">
        <cfargument name="timeTo" type="string" required="true">

        <cfinvoke method="checkTime" returnvariable="validTime">
            <cfinvokeargument name="from" value="#timeFrom#">
            <cfinvokeargument name="to" value="#timeTo#">
        </cfinvoke>
        <cfif NOT validTime>
            <cfreturn "{}">
        </cfif>

        <cfinvoke method="getFailLoginExpectedValue" returnvariable="failExpect">
            <cfinvokeargument name="timeFrom" value="#timeFrom#">
            <cfinvokeargument name="timeTo" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="getForgottenExpectedValue" returnvariable="forgottenExpected">
            <cfinvokeargument name="timeFrom" value="#timeFrom#">
            <cfinvokeargument name="timeTo" value="#timeTo#">
        </cfinvoke>

        <cfinvoke method="getPwChangedExpectedValue" returnvariable="pwChangeExpected">
            <cfinvokeargument name="timeFrom" value="#timeFrom#">
            <cfinvokeargument name="timeTo" value="#timeTo#">
        </cfinvoke>

        <cfinvoke component="models.visualisationModel" method="getUserAmount" returnvariable="amountQuery">
            <cfinvokeargument name="date" value="#dateTimeFormat(Now(), "yyyy-mm-dd hh:nn:ss")#">
        </cfinvoke>

        <cfset result = structNew()>
        <cfset result.fail = failExpect>
        <cfset result.forgotten = forgottenExpected>
        <cfset result.pwChange = pwChangeExpected>
        <cfset result.todayUsers = amountQuery.amount>

        <cfreturn serializeJSON(result)>
    </cffunction>
</cfcomponent>