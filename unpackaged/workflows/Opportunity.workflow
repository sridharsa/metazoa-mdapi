<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Set_Record_ID_to_Closed_2</fullName>
        <description>Set Record ID to Closed #2</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_is_closed</template>
    </alerts>
    <alerts>
        <fullName>Tell_Sales_Ops_that_Opp_is_Won</fullName>
        <description>Tell Sales Ops that Opp is Won</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>newss@df.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_is_closed</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_Closed_Opp_when_Stage_is_Closed_Won</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Closed_Opp</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set Closed Opp when Stage is Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Delete_Me_to_a_new_Formula_value</fullName>
        <field>Delete_Me__c</field>
        <formula>Name &amp; &quot;belongs to &quot; &amp; Account.Name &amp; &quot; and managed by &quot; &amp; $User.FirstName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;. Pls followup in &quot; &amp; Text(Today() + 7)</formula>
        <name>Set Delete Me to a new Formula value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Delete_Me_to_false</fullName>
        <field>Delete_Me__c</field>
        <formula>&quot;false&quot;</formula>
        <name>Set Delete Me to false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Record_ID_to_Closed</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Closed_Opp</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set Record ID to Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Stage_to_Purchased</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Set Stage to Purchased</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Test_Field_Update</fullName>
        <field>Description</field>
        <name>Test Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>My_Outbound_message</fullName>
        <apiVersion>29.0</apiVersion>
        <endpointUrl>http://www.microsoft.com/saveme</endpointUrl>
        <fields>Amount</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Type</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>newss@df.com</integrationUser>
        <name>My Outbound message</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Another Test Rule</fullName>
        <actions>
            <name>Test_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>My_Outbound_message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>ISPICKVAL(StageName, &quot;Closed Won&quot;) &amp;&amp; (Amount &gt;= 10000)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Change Opp Page Layout When Closed</fullName>
        <actions>
            <name>Tell_Sales_Ops_that_Opp_is_Won</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Set_Closed_Opp_when_Stage_is_Closed_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Delete_Me_to_false</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Test Rule %232</fullName>
        <actions>
            <name>Set_Delete_Me_to_a_new_Formula_value</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Record_ID_to_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>100000</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Opportunity.CloseDate</offsetFromField>
            <timeLength>-30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Record_ID_to_Closed_2</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Stage_to_Purchased</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Opportunity.CloseDate</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Pending_Close</fullName>
        <assignedTo>newss@df.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Pending close for this Opp</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Opportunity.CloseDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Pending Close</subject>
    </tasks>
</Workflow>
