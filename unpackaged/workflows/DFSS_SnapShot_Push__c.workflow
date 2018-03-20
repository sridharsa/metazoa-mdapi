<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_when_migration_fails</fullName>
        <description>Send email when migration fails</description>
        <protected>false</protected>
        <recipients>
            <recipient>newss@df.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Notify_upon_failed_migration</template>
    </alerts>
    <rules>
        <fullName>Notify upon failed migration</fullName>
        <actions>
            <name>Send_email_when_migration_fails</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>DFSS_SnapShot_Push__c.Success__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>DFSS_SnapShot_Push__c.Type__c</field>
            <operation>equals</operation>
            <value>Roll Back All Changes If There Is An Error</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
