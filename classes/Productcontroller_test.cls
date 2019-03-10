/*
    Component Type : Apex Controller
    Description : This controller is the Test controller for "Productcontroller".
    Date : 09-03-2019,
    Author:Haridinesh.K
*/


@istest
Private class Productcontroller_test{

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
        
        
        //Create a Product of type Black
        Product2 objpro = new Product2(Name = 'Black', Family = 'ATM Fee');
        Insert objpro;
        system.assertNotEquals(null,objpro.ID);

        //Get standardPricebook nad add product.
        Id pricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(
        Pricebook2Id = pricebookId, Product2Id = objpro.Id,
        UnitPrice = 10000, IsActive = true);
        insert standardPrice;
         
        system.assertNotEquals(null,objpro.ID);    
        system.assertEquals(10000,standardPrice.UnitPrice); 
        
        // Create a custom price book
        Pricebook2 objcustomPB = new Pricebook2(Name='DE', isActive=true);
        insert objcustomPB;
       
        system.assertNotEquals(null,objcustomPB.ID);    
        system.assertEquals('DE',objcustomPB.Name);
              
        //Create the PricebookEntry
        PricebookEntry objpbe = new PricebookEntry(
            Pricebook2Id = objcustomPB.Id,
            Product2Id = objpro.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert objpbe;
        system.assertNotEquals(null,objpbe.ID);    
        system.assertEquals(1020,objpbe.UnitPrice ); 
        
        //Create the Contact
        Contact objcon = new Contact(lastname = 'testcon',Accountid = objacc.ID,Home_Country__c=objcustomPB.ID,Product__c=objpro.ID);       
        Insert objcon;
        
        system.assertNotEquals(null,objcon.ID);    
       
        //Create the Case
        Case objcase = new Case();
        objcase.contactid = objcon.ID;
        insert objcase;
        
        system.assertNotEquals(null,objcase.ID);    
        
    }
  
  /*
   *   Method       : fetchproducuts_withdata
   *   Parametes    : NA
   *   Description  : Method to test method: "fetchproducuts" of  Productcontroller with proper data.
   * */
  @isTest 
  static void fetchproducuts_withdata() {
        
        Case objCase = [SELECT Id FROM Case LIMIT 1];
        if(objCase != null){
            Productcontroller.fetchproducuts(objCase.ID);
        }
    }
    
     /*
   *   Method       : fetchproducuts_withoutdata
   *   Parametes    : NA
   *   Description  : Method to test method: "fetchproducuts" of  Productcontroller without matching data.
   * */
    @isTest 
  static void fetchproducuts_withoutdata() {
        
        Case objcase = new Case();
        insert objcase;
        if(objCase != null){
            Productcontroller.fetchproducuts(objCase.ID);
        }
        
    }



}