<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>test_me</fullName>
        <description>test me</description>
        <protected>false</protected>
        <recipients>
            <recipient>newss@df.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Field_Trip__Field_Trip_Postcards/Field_Trip__Processing_Completed</template>
    </alerts>
    <rules>
        <fullName>Sridhar Test Workflow</fullName>
        <actions>
            <name>test_me</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Field_Trip__Field_Analysis__c.Sridhar_Test_field__c</field>
            <operation>equals</operation>
            <value>true</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
