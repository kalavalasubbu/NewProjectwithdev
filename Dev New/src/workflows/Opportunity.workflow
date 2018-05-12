<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>amount_more_than_10L</fullName>
        <ccEmails>kalavalasubbu@gmail.com</ccEmails>
        <description>amount more than 10L</description>
        <protected>false</protected>
        <recipients>
            <recipient>subbu.kalavala@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_Amount_More_than_10L</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_amount_in_Account</fullName>
        <field>Opportunity_Amount__c</field>
        <formula>TEXT(Amount)</formula>
        <name>Update amount in Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_company_profit</fullName>
        <field>Company_Profit__c</field>
        <formula>TEXT(Amount  * 0.4)</formula>
        <name>update company profit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opp Amount More than 10L</fullName>
        <actions>
            <name>amount_more_than_10L</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_amount_in_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterOrEqual</operation>
            <value>1000000</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
