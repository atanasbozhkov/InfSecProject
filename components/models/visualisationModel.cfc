<cfcomponent displayname="visualisationModel" hint="visualisation model">
    <cffunction name="getUsername" access="public" output="false" returntype="query">
        <cfquery name="getNames">
            SELECT email FROM users
        </cfquery>

        <cfreturn getNames/>
    </cffunction>

    <cffunction name="getForgotten" access="public" output="false" returntype="any">
        <cfargument name="fromDate" type="string" required="true">
        <cfargument name="toDate" type="string" required="true">
        <cfquery datasource="#config.sourceName#" name='forg'>
            SELECT * FROM `forgotten_attempts` WHERE `timestamp` < "#toDate#" and `timestamp` > "#fromDate#" LIMIT 0,1000;
        </cfquery>
        <cfscript>
            data  = SerializeJSON(forg, true);
        </cfscript>
        <cfreturn data>
    </cffunction>

    <cffunction name="getLoginAttempts" access="public" output="false" returntype="query">
        <!--- format yyyy-mm-dd hh:mm:ss --->
        <cfargument name="from" type="string">
        <cfargument name="to" type="string">

        <cftry>
            <cfquery name="attempts">
                SELECT u.user_id, u.email, la.success, la.IP_addr, la.device_type, la.comment, la.timestamp
                FROM login_attempts AS la LEFT JOIN users AS u ON la.user_id = u.user_id
                WHERE la.timestamp >= <cfqueryparam value="#from#" cfsqltype="CF_SQL_TIMESTAMP">
                AND la.timestamp <= <cfqueryparam value="#to#" cfsqltype="CF_SQL_TIMESTAMP">
            </cfquery>
            <cfcatch type="any">
                <cfreturn>
            </cfcatch>
        </cftry>

        <cfreturn attempts/>
    </cffunction>

    <cffunction name="getForgotAttempts" access="public" output="false" returntype="query">
        <cfargument name="from" type="string">
        <cfargument name="to" type="string">

        <cftry>
            <cfquery name="attempts">
                SELECT u.user_id, u.email, fa.success, fa.IP_addr, fa.device_type, fa.valid, fa.timestamp
                FROM forgotten_attempts AS fa LEFT JOIN users AS u ON fa.user_id = u.user_id
                WHERE fa.timestamp >= <cfqueryparam value="#from#" cfsqltype="CF_SQL_TIMESTAMP">
                AND fa.timestamp <= <cfqueryparam value="#to#" cfsqltype="CF_SQL_TIMESTAMP">
            </cfquery>
            <cfcatch type="any">
                <cfreturn>
            </cfcatch>
        </cftry>

        <cfreturn attempts/>
    </cffunction>

    <cffunction name="getForgotCount" access="public" output="false" returntype="query">
        <cfargument name="from" type="string">
        <cfargument name="to" type="string">

        <cfquery name="forgotCount">
            SELECT
            (SELECT COUNT(forgot_id) FROM forgotten_attempts AS fa 
                WHERE fa.success = 1 
                AND fa.timestamp >= <cfqueryparam value="#from#" cfsqltype="CF_SQL_TIMESTAMP">
                AND fa.timestamp <= <cfqueryparam value="#to#" cfsqltype="CF_SQL_TIMESTAMP">
            ) as successCount,
            (SELECT COUNT(forgot_id) FROM forgotten_attempts AS fa
                WHERE fa.success = 0 
                AND fa.timestamp >= <cfqueryparam value="#from#" cfsqltype="CF_SQL_TIMESTAMP"> 
                AND fa.timestamp <= <cfqueryparam value="#to#" cfsqltype="CF_SQL_TIMESTAMP">
            ) as failCount
        </cfquery>
        <cfreturn forgotCount>
    </cffunction>

    <cffunction name="getLoginCount" access="public" output="false" returntype="query">
        <cfargument name="from" type="string">
        <cfargument name="to" type="string">

        <cfquery name="loginCount">
            SELECT
            (SELECT COUNT(attempt_id) FROM login_attempts AS la
                WHERE la.success = 1
                AND la.timestamp >= <cfqueryparam value="#from#" cfsqltype="CF_SQL_TIMESTAMP">
                AND la.timestamp <= <cfqueryparam value="#to#" cfsqltype="CF_SQL_TIMESTAMP">
            ) as successCount,
            (SELECT COUNT(attempt_id) FROM login_attempts AS la
                WHERE la.success = 0
                AND la.timestamp >= <cfqueryparam value="#from#" cfsqltype="CF_SQL_TIMESTAMP"> 
                AND la.timestamp <= <cfqueryparam value="#to#" cfsqltype="CF_SQL_TIMESTAMP">
            ) as failCount
        </cfquery>
        <cfreturn loginCount>
    </cffunction>

    <cffunction name="getPWChangedCount" access="public" output="false" returntype="query">
        <cfargument name="from" type="string">
        <cfargument name="to" type="string">

        <cfquery name="pwChangedCount">
            SELECT SUM(changes.count) AS changed_amount FROM
            (SELECT user_id, COUNT(pass_id)-1 AS count
                FROM passwords
                WHERE timestamp >= <cfqueryparam value="#from#" cfsqltype="CF_SQL_TIMESTAMP"> 
                AND timestamp <= <cfqueryparam value="#to#" cfsqltype="CF_SQL_TIMESTAMP">
                GROUP BY user_id
            ) AS changes
        </cfquery>
        <cfreturn pwChangedCount>
    </cffunction>
</cfcomponent>