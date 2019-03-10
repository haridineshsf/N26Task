/*
    Component Type : Apex Controller
    Description : This controller used to update the contacs for which the survy notification is sent.
    Date : 09-03-2019,
    Author:Haridinesh.K
*/

global class SurveryNotificationN26Updatebackend implements Database.Batchable<sObject>
{

    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,lastname,firstname,language__c,survey_date__c,Email_sent__c FROM contact where Email_sent__c = true';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<contact> lstContact)
    {
       for ( Contact objcon : lstContact)
        {
           objcon.survey_date__c= null;
            objcon.Email_sent__c = false;
        }
        update lstContact;
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}