<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Field_Trip__Send_Processing_Complete_Notification</fullName>
        <description>Send Processing Complete Notification</description>
        <protected>true</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Field_Trip__Field_Trip_Postcards/Field_Trip__Processing_Completed</template>
    </alerts>
    <alerts>
        <fullName>Test_me_2</fullName>
        <description>Test me 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>newss@df.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Field_Trip__Field_Trip_Postcards/Field_Trip__Processing_Completed</template>
    </alerts>
    <rules>
        <fullName>Field Trip Workflow</fullName>
        <actions>
            <name>Test_me_2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Field_Trip__Object_Analysis__c.Name</field>
            <operation>equals</operation>
            <value>Test</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Field_Trip__Processing Complete</fullName>
        <actions>
            <name>Field_Trip__Send_Processing_Complete_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Field_Trip__Last_Analyzed__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
