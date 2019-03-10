/*
    Component Type : Apex Controller
    Description : This controller is the Test controller for "SurveryNotificationN26".
    Date : 09-03-2019,
    Author:Haridinesh.K
*/


@isTest
private class SurveryNotificationN26_test{


  /*
   *   Method    : setup
   *   Parametes  : NA
   *   Description  : Test setup method used to prepare the test data for all the methods.
   * */
  
  @testSetup static void setup() {
        
        // Create common test account
        Account objacc = new Account(name='testacc');
        insert objacc;
        system.assertNotEquals(null,objacc.ID);    
        
        
        //Create the Contact
        Contact objcon = new Contact(lastname = 'testcon',Accountid = objacc.ID,Language__c='DE',survey_date__c=Date.today());       
        Insert objcon;
        
        system.assertNotEquals(null,objcon.ID);    
              
    }
    
    /*
   *   Method       : Surverynotifcation_withdata
   *   Parametes    : NA
   *   Description  : Method to test method: batch with proper data.
   * */
  @isTest 
  static void Surverynotifcation_withdata() {
        
        List<Contact> lstcon = [SELECT Id,lastname,firstname,language__c,survey_date__c,Email_sent__c FROM contact where survey_date__c= TODAY];
        if(lstcon != null && lstcon.size()>0 ){
            SurveryNotificationN26  proceesscon = new SurveryNotificationN26 ();
            ID batchprocessid = Database.executeBatch(proceesscon);
    
            Test.StartTest();
            SurveryNotificationN26  objsn = new SurveryNotificationN26  ();
            String sch = '0 0 23 * * ?'; 
            system.schedule('Test Leadcheck', sch, objsn); 
            Test.stopTest(); 
        }
    }
    
     /*
   *   Method       : fetchproducuts_withoutdata
   *   Parametes    : NA
   *   Description  : Method to test method: batch without data.
   * */
  @isTest 
  static void Surverynotifcation_withoutdata() {
        
            SurveryNotificationN26  proceesscon = new SurveryNotificationN26 ();
            ID batchprocessid = Database.executeBatch(proceesscon);
    
            Test.StartTest();
            SurveryNotificationN26  objsn = new SurveryNotificationN26  ();
            String sch = '0 0 23 * * ?'; 
            system.schedule('Test Leadcheck', sch, objsn); 
            Test.stopTest(); 
        
    }

}