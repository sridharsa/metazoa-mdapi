<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Snapshot_Push_executed_successfully</fullName>
        <description>Snapshot Push executed successfully</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Snapshot_Templates/New_Snapshot_Deployment</template>
    </alerts>
    <rules>
        <fullName>Snapshot Push Executed</fullName>
        <actions>
            <name>Snapshot_Push_executed_successfully</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>snapshot_push__c.successful_push__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
