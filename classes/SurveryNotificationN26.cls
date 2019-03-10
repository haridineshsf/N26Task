/*
    Component Type : Apex Controller
    Description : This controller used to send survery notification on suervy date to the the contact on the schedule time and date.
    Date : 09-03-2019,
    Author:Haridinesh.K
*/

global class SurveryNotificationN26 implements Database.Batchable<sObject>,Schedulable
{

    global void execute(schedulablecontext sc){
        SurveryNotificationN26  proceeCon = new SurveryNotificationN26  ();
        ID batchprocessid = Database.executeBatch(proceeCon);
    }

    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator([SELECT Id,lastname,firstname,language__c,survey_date__c,Email_sent__c FROM contact where survey_date__c= TODAY]);
    }

    global void execute(Database.BatchableContext BC, List<contact> lstContact)
    {
       system.debug('lstContact--->'+lstContact);
       for ( Contact objcon : lstContact)
        {
           objcon.Email_sent__c = True;
        }
        update lstContact;
    }  
    global void finish(Database.BatchableContext BC)
    {
      
      SurveryNotificationN26Updatebackend batchint = new SurveryNotificationN26Updatebackend();
      Id batchId = Database.executeBatch(batchint , 200);
       
    }
}