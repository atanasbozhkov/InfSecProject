<cfcomponent displayname="initModel" hint="initial checking">
    
    <cffunction name="getSchema" access="public" output="false" returntype="query">
        <cfquery name="checkTablesQuery">
            SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = "PGT_D_14_TEST"
        </cfquery>
        <cfreturn checkTablesQuery/>
    </cffunction>

    <cffunction name="createSchema" access="public" output="false" returntype="boolean">
        <cftry>
            <cfquery>
                CREATE DATABASE IF NOT EXISTS PGT_D_14_TEST
            </cfquery>

            <cfquery>
                SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";    
            </cfquery>

            <cfquery>
                SET time_zone = "+00:00";
            </cfquery>
            
            <cfquery>
                CREATE TABLE IF NOT EXISTS `forgotten_attempts` (
                    `forgot_id` int(40) unsigned NOT NULL,
                    `user_id` int(11) NOT NULL,
                    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    `token` varchar(40) NOT NULL,
                    `valid` int(11) NOT NULL,
                    `answer` tinyint(1) NOT NULL,
                    `success` tinyint(1) NOT NULL,
                    `device_type` varchar(40) NOT NULL,
                    `IP_addr` varchar(40) NOT NULL
                ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
            </cfquery>

            <cfquery>
                CREATE TABLE IF NOT EXISTS `login_attempts` (
                    `attempt_id` int(11) NOT NULL,
                    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    `user_id` int(11) NOT NULL,
                    `success` tinyint(1) NOT NULL,
                    `IP_addr` varchar(40) NOT NULL,
                    `device_type` varchar(40) NOT NULL,
                    `comment` varchar(100) NOT NULL
                ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
            </cfquery>

            <cfquery>
                CREATE TABLE IF NOT EXISTS `passwords` (
                    `pass_id` int(11) NOT NULL,
                    `user_id` int(11) NOT NULL,
                    `password` varchar(128) NOT NULL DEFAULT '',
                    `salt` varchar(128) NOT NULL,
                    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    `type` varchar(40) NOT NULL,
                    `active` int(1) DEFAULT '1'
                ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
            </cfquery>

            <cfquery>
                CREATE TABLE IF NOT EXISTS `users` (
                    `user_id` int(11) NOT NULL,
                    `email` varchar(100) NOT NULL,
                    `pass_id` int(11) NOT NULL,
                    `first_name` varchar(40) NOT NULL,
                    `last_name` varchar(40) NOT NULL,
                    `secret_question` varchar(100) NOT NULL,
                    `date_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                    `role_id` int(11) NOT NULL
                ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
            </cfquery>

            <cfquery>
                CREATE TABLE IF NOT EXISTS `user_roles` (
            `role_id` int(11) NOT NULL,
              `role_desc` varchar(40) NOT NULL
            ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
            </cfquery>

            <cfquery>
                ALTER TABLE `forgotten_attempts`
                ADD PRIMARY KEY (`forgot_id`);
            </cfquery>
            <cfquery>
                ALTER TABLE `login_attempts`
                ADD PRIMARY KEY (`attempt_id`);
            </cfquery>
            <cfquery>
                ALTER TABLE `passwords`
                ADD PRIMARY KEY (`pass_id`);
            </cfquery>
            <cfquery>
                ALTER TABLE `users`
                ADD PRIMARY KEY (`user_id`);
            </cfquery>
            <cfquery>
                ALTER TABLE `user_roles`
                ADD PRIMARY KEY (`role_id`);
            </cfquery>

            <cfquery>
                ALTER TABLE `forgotten_attempts`
                MODIFY `forgot_id` int(40) unsigned NOT NULL AUTO_INCREMENT;
            </cfquery>
            <cfquery>
                ALTER TABLE `login_attempts`
                MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;
            </cfquery>
            <cfquery>
                ALTER TABLE `passwords`
                MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT;
            </cfquery>
            <cfquery>
                ALTER TABLE `users`
                MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
            </cfquery>
            <cfquery>
                ALTER TABLE `user_roles`
                MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;
            </cfquery>

            <cfcatch type="any">
                <cfquery>
                    DROP TABLE forgotten_attempts, login_attempts, passwords, users, user_roles;
                </cfquery>
                <cfreturn false>
            </cfcatch>
        </cftry>

        <cfreturn true>
    </cffunction>
</cfcomponent>
